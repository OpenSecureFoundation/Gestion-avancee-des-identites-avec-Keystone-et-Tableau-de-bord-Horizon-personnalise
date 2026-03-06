"""add abac models

Revision ID: add_abac_models
Revises: 27e647c0fad4
Create Date: 2026-03-05 12:00:00.000000
"""

from alembic import op
import sqlalchemy as sql

# revision identifiers, used by Alembic.
revision = 'add_abac_models'
down_revision = '47147121'  # ID du fichier précédent
depends_on = None

def upgrade():
    # 1. Création de la table des Définitions de Contextes
    op.create_table(
        'abac_context_definition',
        sql.Column('id', sql.String(length=64), primary_key=True, nullable=False),
        sql.Column('name', sql.String(length=255), nullable=False, unique=True),
        sql.Column('data_type', sql.String(length=64), nullable=False),
        sql.Column('extraction_key', sql.String(length=255), nullable=False),
        sql.Column('description', sql.String(length=255), nullable=True),
        mysql_engine='InnoDB',
        mysql_charset='utf8',
    )

    # 2. Création de la table des Politiques (l'enveloppe de la règle)
    op.create_table(
        'abac_policy',
        sql.Column('id', sql.String(length=64), primary_key=True, nullable=False),
        sql.Column('name', sql.String(length=255), nullable=False, unique=True),
        sql.Column('target_action', sql.String(length=255), nullable=False),
        sql.Column('effect', sql.String(length=64), nullable=False),
        sql.Column('description', sql.String(length=255), nullable=True),
        mysql_engine='InnoDB',
        mysql_charset='utf8',
    )

    # 3. Création de la table des Conditions (Le lien entre Politique et Contexte)
    op.create_table(
        'abac_policy_condition',
        sql.Column('id', sql.String(length=64), primary_key=True, nullable=False),
        sql.Column('policy_id', sql.String(length=64), nullable=False),
        sql.Column('context_def_id', sql.String(length=64), nullable=False),
        sql.Column('operator', sql.String(length=64), nullable=False),
        sql.Column('value', sql.String(length=255), nullable=False),
        sql.ForeignKeyConstraint(['context_def_id'], ['abac_context_definition.id']),
        sql.ForeignKeyConstraint(['policy_id'], ['abac_policy.id']),
        mysql_engine='InnoDB',
        mysql_charset='utf8',
    )