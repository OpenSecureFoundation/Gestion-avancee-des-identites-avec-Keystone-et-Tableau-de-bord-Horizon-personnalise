from django.utils.translation import gettext_lazy as _
import horizon

class BudgetProjet(horizon.Panel):
    name = _("Mon Budget")
    slug = 'budget_projet'
    urls = 'finops.tarification.urls_budget'
    # Pas de restriction "admin" ici, c'est pour l'espace Projet !