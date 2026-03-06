from horizon import tables
from horizon import exceptions
from django.utils.translation import gettext_lazy as _
from openstack_dashboard import api
from openstack_dashboard.dashboards.identity.abac_audit import tables as audit_tables

# Cette petite classe transforme un dictionnaire en objet
# pour qu'Horizon puisse faire "log.timestamp" au lieu de "log['timestamp']"
class AuditLog(object):
    def __init__(self, data):
        self.id = data.get('id')
        self.timestamp = data.get('timestamp')
        self.user_id = data.get('user_id')
        self.target_action = data.get('target_action')
        self.policy_name = data.get('policy_name')
        self.effect = data.get('effect')
        self.details = data.get('details')

class IndexView(tables.DataTableView):
    table_class = audit_tables.AbacAuditTable
    template_name = 'identity/abac_audit/index.html' # Vérifie bien ce chemin
    page_title = _("Audit de Sécurité ABAC")

    def get_data(self):
        logs = []
        try:
            # Récupération des données brutes (liste de dicts)
            raw_logs = api.keystone.abac_audit_log_list(self.request)
            # Transformation en liste d'objets AuditLog
            logs = [AuditLog(l) for l in raw_logs]
        except Exception:
            exceptions.handle(self.request, _('Impossible de récupérer les journaux d\'audit.'))
        return logs