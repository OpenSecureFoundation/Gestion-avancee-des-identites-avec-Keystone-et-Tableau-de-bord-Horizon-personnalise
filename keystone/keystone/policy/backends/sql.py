# Copyright 2012 OpenStack Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

from keystone.common import sql
from keystone import exception
from keystone.policy.backends import rules

# --- AJOUTS POUR ABAC ---
import uuid
from sqlalchemy import orm
# ------------------------


class PolicyModel(sql.ModelBase, sql.ModelDictMixinWithExtras):
    __tablename__ = 'policy'
    attributes = ['id', 'blob', 'type']
    id = sql.Column(sql.String(64), primary_key=True)
    blob = sql.Column(sql.JsonBlob(), nullable=False)
    type = sql.Column(sql.String(255), nullable=False)
    extra = sql.Column(sql.JsonBlob())

# ==========================================
# DÉBUT DES MODÈLES ABAC 
# ==========================================

class ContextDefinitionModel(sql.ModelBase, sql.ModelDictMixin):
    __tablename__ = 'abac_context_definition'
    attributes = ['id', 'name', 'data_type', 'extraction_key', 'description']

    id = sql.Column(sql.String(64), primary_key=True, default=lambda: uuid.uuid4().hex)
    name = sql.Column(sql.String(255), nullable=False, unique=True)
    data_type = sql.Column(sql.String(64), nullable=False)
    extraction_key = sql.Column(sql.String(255), nullable=False)
    description = sql.Column(sql.String(255))

class AbacPolicyModel(sql.ModelBase, sql.ModelDictMixin):
    __tablename__ = 'abac_policy'
    attributes = ['id', 'name', 'target_action', 'effect', 'description']

    id = sql.Column(sql.String(64), primary_key=True, default=lambda: uuid.uuid4().hex)
    name = sql.Column(sql.String(255), nullable=False, unique=True)
    target_action = sql.Column(sql.String(255), nullable=False)
    effect = sql.Column(sql.String(64), nullable=False)
    description = sql.Column(sql.String(255))

    # Relation pour charger automatiquement les conditions liées à cette politique
    conditions = orm.relationship('PolicyConditionModel', backref='policy', cascade='all, delete-orphan')

class PolicyConditionModel(sql.ModelBase, sql.ModelDictMixin):
    __tablename__ = 'abac_policy_condition'
    attributes = ['id', 'policy_id', 'context_def_id', 'operator', 'value']

    id = sql.Column(sql.String(64), primary_key=True, default=lambda: uuid.uuid4().hex)
    policy_id = sql.Column(sql.String(64), sql.ForeignKey('abac_policy.id'), nullable=False)
    context_def_id = sql.Column(sql.String(64), sql.ForeignKey('abac_context_definition.id'), nullable=False)

    operator = sql.Column(sql.String(64), nullable=False)
    value = sql.Column(sql.String(255), nullable=False)

    # Permet d'accéder à la définition du contexte directement depuis la condition
    context_definition = orm.relationship('ContextDefinitionModel')

# ==========================================
# FIN DES MODÈLES ABAC
# ==========================================


class Policy(rules.Policy):
    @sql.handle_conflicts(conflict_type='policy')
    def create_policy(self, policy_id, policy):
        with sql.session_for_write() as session:
            ref = PolicyModel.from_dict(policy)
            session.add(ref)

            return ref.to_dict()

    def list_policies(self):
        with sql.session_for_read() as session:
            refs = session.query(PolicyModel).all()
            return [ref.to_dict() for ref in refs]

    def _get_policy(self, session, policy_id):
        """Private method to get a policy model object (NOT a dictionary)."""
        ref = session.get(PolicyModel, policy_id)
        if not ref:
            raise exception.PolicyNotFound(policy_id=policy_id)
        return ref

    def get_policy(self, policy_id):
        with sql.session_for_read() as session:
            return self._get_policy(session, policy_id).to_dict()

    @sql.handle_conflicts(conflict_type='policy')
    def update_policy(self, policy_id, policy):
        with sql.session_for_write() as session:
            ref = self._get_policy(session, policy_id)
            old_dict = ref.to_dict()
            old_dict.update(policy)
            new_policy = PolicyModel.from_dict(old_dict)
            ref.blob = new_policy.blob
            ref.type = new_policy.type
            ref.extra = new_policy.extra

        return ref.to_dict()

    def delete_policy(self, policy_id):
        with sql.session_for_write() as session:
            ref = self._get_policy(session, policy_id)
            session.delete(ref)

    # ==========================================
    # MÉTHODES CRUD POUR L'ABAC 
    # ==========================================

    # --- Gestion des Définitions de Contextes (ContextDefinition) ---

    def create_context_definition(self, context_dict):
        """Créer un nouveau contexte dynamique (ex: Ville, IP, Heure)."""
        with sql.session_for_write() as session:
            ref = ContextDefinitionModel.from_dict(context_dict)
            session.add(ref)
            return ref.to_dict()

    def list_context_definitions(self):
        """Lister tous les contextes disponibles."""
        with sql.session_for_read() as session:
            refs = session.query(ContextDefinitionModel).all()
            return [ref.to_dict() for ref in refs]

    def get_context_definition(self, context_id):
        """Récupérer un contexte spécifique."""
        with sql.session_for_read() as session:
            ref = session.get(ContextDefinitionModel, context_id)
            if not ref:
                # Utilise l'exception générique de Keystone si non trouvé
                raise exception.NotFound(target_id=context_id)
            return ref.to_dict()

    def delete_context_definition(self, context_id):
        """Supprimer un contexte dynamique."""
        with sql.session_for_write() as session:
            ref = session.get(ContextDefinitionModel, context_id)
            if not ref:
                raise exception.NotFound(target_id=context_id)
            session.delete(ref)

    # --- Gestion des Politiques ABAC et leurs Conditions ---

    def _get_abac_policy_dict(self, session, policy_id):
        """Méthode interne pour récupérer une politique AVEC ses conditions."""
        ref = session.get(AbacPolicyModel, policy_id)
        if not ref:
            raise exception.NotFound(target_id=policy_id)
        
        policy_dict = ref.to_dict()
        # On récupère toutes les conditions liées à cette politique
        conditions = session.query(PolicyConditionModel).filter_by(policy_id=policy_id).all()
        policy_dict['conditions'] = [cond.to_dict() for cond in conditions]
        return policy_dict

    def create_abac_policy(self, policy_dict):
        """Créer une politique ABAC avec ses multiples conditions."""
        with sql.session_for_write() as session:
            # On extrait les conditions du dictionnaire envoyé par l'API
            conditions_data = policy_dict.pop('conditions', [])
            
            # 1. On crée la politique parent
            ref = AbacPolicyModel.from_dict(policy_dict)
            session.add(ref)
            session.flush() # Pour générer l'ID de la politique parent
            
            # 2. On crée les conditions enfants liées à cette politique
            for cond_data in conditions_data:
                cond_data['policy_id'] = ref.id
                cond_ref = PolicyConditionModel.from_dict(cond_data)
                session.add(cond_ref)
                
            return self._get_abac_policy_dict(session, ref.id)

    def list_abac_policies(self):
        """Lister toutes les politiques ABAC."""
        with sql.session_for_read() as session:
            refs = session.query(AbacPolicyModel).all()
            return [self._get_abac_policy_dict(session, ref.id) for ref in refs]

    def get_abac_policy(self, policy_id):
        """Récupérer une politique ABAC spécifique."""
        with sql.session_for_read() as session:
            return self._get_abac_policy_dict(session, policy_id)

    def delete_abac_policy(self, policy_id):
        """Supprimer une politique ABAC (et ses conditions en cascade)."""
        with sql.session_for_write() as session:
            ref = session.get(AbacPolicyModel, policy_id)
            if not ref:
                raise exception.NotFound(target_id=policy_id)
            # Grâce au paramètre cascade='all, delete-orphan' dans nos modèles,
            # supprimer la politique va automatiquement nettoyer la table des conditions.
            session.delete(ref)
