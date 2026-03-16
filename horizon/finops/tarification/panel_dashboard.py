from django.utils.translation import gettext_lazy as _
import horizon

class DashboardFinops(horizon.Panel):
    name = _("Consommation et Coûts")
    slug = 'facturation_finops'
    urls = 'finops.tarification.urls_dashboard'