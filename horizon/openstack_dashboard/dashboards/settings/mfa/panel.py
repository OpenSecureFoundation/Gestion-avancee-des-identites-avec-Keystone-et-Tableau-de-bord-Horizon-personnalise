from django.utils.translation import gettext_lazy as _
import horizon
from openstack_dashboard.dashboards.settings import dashboard

class Mfa(horizon.Panel):
    name = _("Configuration MFA")
    slug = 'mfa'

    permissions = tuple()
    policy_rules = tuple()

dashboard.Settings.register(Mfa)