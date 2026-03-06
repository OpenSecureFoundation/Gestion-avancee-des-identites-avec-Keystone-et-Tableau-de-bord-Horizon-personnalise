from django.utils.translation import gettext_lazy as _
from horizon import tables

class AbacAuditTable(tables.DataTable):
    # Les colonnes de notre tableau d'audit
    timestamp = tables.Column("timestamp", verbose_name=_("Date & Heure"))
    user_id = tables.Column("user_id", verbose_name=_("ID Utilisateur"))
    target_action = tables.Column("target_action", verbose_name=_("Action Ciblée"))
    policy_name = tables.Column("policy_name", verbose_name=_("Règle Appliquée"))
    
    # On met l'effet en couleur (Deny en rouge, Allow en vert)
    effect = tables.Column("effect", verbose_name=_("Décision"))
    
    details = tables.Column("details", verbose_name=_("Détails du Contexte"))

    class Meta(object):
        name = "abac_audit_logs"
        verbose_name = _("Historique des accès")