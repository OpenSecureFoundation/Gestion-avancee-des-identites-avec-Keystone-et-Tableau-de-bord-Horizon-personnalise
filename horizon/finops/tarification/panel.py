from django.utils.translation import gettext_lazy as _
import horizon

class Tarification(horizon.Panel):
    name = _("Configuration Budgétaire")
    slug = 'tarification'
    permissions = ('openstack.roles.admin',) # Réserve ce menu aux admins 