from django.utils.translation import gettext_lazy as _
import horizon
from openstack_dashboard.dashboards.identity import dashboard

class AbacPolicies(horizon.Panel):
    name = _("ABAC Configurations")
    slug = 'abac_policies'
    # Optionnel: on peut limiter l'accès de cet onglet aux admins uniquement
    permissions = ('openstack.roles.admin',)

# On enregistre ce panel dans le dashboard "Identity"
dashboard.Identity.register(AbacPolicies)
