from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from horizon import exceptions
from horizon import forms
from horizon import tables

from openstack_dashboard import api
from openstack_dashboard.dashboards.identity.abac_policies import tables as project_tables
from openstack_dashboard.dashboards.identity.abac_policies import forms as project_forms

# Ce "Wrapper" transforme les dictionnaires JSON de notre API en objets lisibles par le tableau Horizon
class AbacPolicyWrapper(api.base.APIDictWrapper):
    _attrs = ['id', 'name', 'target_action', 'effect', 'description', 'conditions']

class IndexView(tables.DataTableView):
    table_class = project_tables.AbacPoliciesTable
    template_name = 'identity/abac_policies/index.html'
    page_title = _("Sécurité Avancée (ABAC)")

    def get_data(self):
        policies = []
        try:
            # On appelle la fonction magique qu'on a créée dans keystone.py !
            data = api.keystone.abac_policy_list(self.request)
            policies = [AbacPolicyWrapper(p) for p in data]
        except Exception:
            exceptions.handle(self.request, _('Impossible de récupérer les règles ABAC.'))
        return policies

# On prépare la coquille vide pour notre futur formulaire de création 
class CreateView(forms.ModalFormView):
    form_class = project_forms.CreateAbacPolicyForm
    template_name = 'identity/abac_policies/create.html'
    success_url = reverse_lazy('horizon:identity:abac_policies:index')
    page_title = _("Créer une règle ABAC")

class CreateContextView(forms.ModalFormView):
    form_class = project_forms.CreateContextForm
    template_name = 'identity/abac_policies/create_context.html'
    success_url = reverse_lazy('horizon:identity:abac_policies:index')
    page_title = _("Créer un contexte dynamique")