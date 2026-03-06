from django.utils.translation import gettext_lazy as _
from horizon import tables
from openstack_dashboard import api

# --- 1. On crée l'action (Le bouton) ---
class CreateAbacPolicy(tables.LinkAction):
    name = "create"
    verbose_name = _("Ajouter une règle ABAC")
    url = "horizon:identity:abac_policies:create"
    classes = ("ajax-modal",)
    icon = "plus"
    

class CreateContext(tables.LinkAction):
    name = "create_context"
    verbose_name = _("Nouveau Contexte")
    url = "horizon:identity:abac_policies:create_context"
    classes = ("ajax-modal",)
    icon = "plus"

class DeleteAbacPolicy(tables.DeleteAction):
    name = "delete"
    # Ceci met le bouton en rouge
    action_type = "danger" 

    @staticmethod
    def action_present(count):
        return _("Supprimer"), _("Supprimer")

    @staticmethod
    def action_past(count):
        return _("Supprimée"), _("Supprimées")

    def delete(self, request, obj_id):
        # On appelle notre fonction API
        api.keystone.abac_policy_delete(request, obj_id)

class DeleteContext(tables.DeleteAction):
    name = "delete_context"
    action_type = "danger"

    @staticmethod
    def action_present(count):
        return _("Supprimer Contexte"), _("Supprimer Contextes")

    @staticmethod
    def action_past(count):
        return _("Contexte supprimé"), _("Contextes supprimés")

    def delete(self, request, obj_id):
        api.keystone.abac_context_delete(request, obj_id)

class AbacPoliciesTable(tables.DataTable):
    name = tables.Column('name', verbose_name=_("Nom de la Règle"))
    target_action = tables.Column('target_action', verbose_name=_("Action Cible"))
    effect = tables.Column('effect', verbose_name=_("Effet"), filters=(lambda v: v.upper(),))
    description = tables.Column('description', verbose_name=_("Description"))

    
    class Meta(object):
        name = "abac_policies"
        verbose_name = _("Règles d'accès contextuelles")
        # Les boutons en haut du tableau
        table_actions = (CreateAbacPolicy, CreateContext, DeleteAbacPolicy)
        # Les boutons sur chaque ligne
        row_actions = (DeleteAbacPolicy,)
