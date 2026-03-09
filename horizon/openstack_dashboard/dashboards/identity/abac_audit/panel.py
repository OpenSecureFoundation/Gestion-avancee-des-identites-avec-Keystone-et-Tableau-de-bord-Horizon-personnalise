from django.utils.translation import gettext_lazy as _
import horizon
from openstack_dashboard.dashboards.identity import dashboard

class AbacAuditPanel(horizon.Panel):
    name = _("Logs")
    slug = 'abac_audit'

dashboard.Identity.register(AbacAuditPanel)