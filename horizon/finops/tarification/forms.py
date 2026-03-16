from horizon import forms
from horizon import messages 
from django.utils.translation import gettext_lazy as _
from .models import GrilleTarifaire, ProjectBudget


class TarificationForm(forms.SelfHandlingForm):
    vcpu_price = forms.DecimalField(label=_("Prix par vCPU (par heure)"), required=True, max_digits=10, decimal_places=4)
    ram_mb_price = forms.DecimalField(label=_("Prix par Mo de RAM (par heure)"), required=True, max_digits=10, decimal_places=4)
    disk_gb_price = forms.DecimalField(label=_("Prix par Go de Disque (par heure)"), required=True, max_digits=10, decimal_places=4)

    def handle(self, request, data):
        try:
            tarif, created = GrilleTarifaire.objects.get_or_create(id=1)
            tarif.vcpu_price = data['vcpu_price']
            tarif.ram_mb_price = data['ram_mb_price']
            tarif.disk_gb_price = data['disk_gb_price']
            tarif.save()
            
            # Et la correction est appliquée ici aussi :
            messages.success(request, _('Grille tarifaire mise à jour avec succès.'))
            return True
        except Exception:
            print("ERREUR FINOPS TARIFICATION :", str(e))
            messages.error(request, _('Erreur lors de la mise à jour de la grille.'))
            return False

class BudgetForm(forms.SelfHandlingForm):
    budget_mensuel = forms.DecimalField(label=_("Budget mensuel alloué"), required=True, max_digits=12, decimal_places=2)
    seuil_alerte = forms.IntegerField(label=_("Seuil d'alerte (%)"), required=True, min_value=1, max_value=100)
    seuil_blocage = forms.IntegerField(label=_("Seuil de blocage (%)"), required=True, min_value=1, max_value=100)

    def handle(self, request, data):
        try:
            # On récupère l'ID du projet actuel sur lequel l'utilisateur est connecté
            current_project_id = request.user.project_id
            
            budget, created = ProjectBudget.objects.get_or_create(project_id=current_project_id)
            budget.budget_mensuel = data['budget_mensuel']
            budget.seuil_alerte = data['seuil_alerte']
            budget.seuil_blocage = data['seuil_blocage']
            budget.save()
            
            messages.success(request, _('Budget et seuils mis à jour avec succès.'))
            return True
        except Exception as e:
            # On affiche la vraie erreur dans le terminal pour comprendre ce qui cloche
            print("ERREUR FINOPS BUDGET :", str(e)) 
            messages.error(request, _('Erreur lors de la mise à jour du budget.'))
            return False