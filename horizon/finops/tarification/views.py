

from django.views.generic import TemplateView
from django.conf import settings
from .models import GrilleTarifaire, ProjectBudget
import datetime
from django.utils import timezone

from keystoneauth1.identity import Token
from keystoneauth1 import session
from gnocchiclient.v1 import client as gnocchi_client
from horizon import forms
from .forms import TarificationForm, BudgetForm




class IndexView(forms.ModalFormView):
    form_class = TarificationForm
    template_name = 'admin/tarification/index.html'
    success_url = '/admin/tarification/'

    def get_initial(self):
        # Cette fonction sert à pré-remplir le formulaire avec les prix actuels s'ils existent
        try:
            tarif = GrilleTarifaire.objects.get(id=1)
            return {
                'vcpu_price': tarif.vcpu_price,
                'ram_mb_price': tarif.ram_mb_price,
                'disk_gb_price': tarif.disk_gb_price,
            }
        except GrilleTarifaire.DoesNotExist:
            return {}

class BudgetView(forms.ModalFormView):
    form_class = BudgetForm
    template_name = 'tarification/budget.html'
    success_url = '/project/budget_projet/'

    def get_initial(self):
        try:
            # On cherche le budget du projet courant
            budget = ProjectBudget.objects.get(project_id=self.request.user.project_id)
            return {
                'budget_mensuel': budget.budget_mensuel,
                'seuil_alerte': budget.seuil_alerte,
                'seuil_blocage': budget.seuil_blocage,
            }
        except ProjectBudget.DoesNotExist:
            return {'seuil_alerte': 80, 'seuil_blocage': 100} # Valeurs par défaut


# class DashboardFinopsView(TemplateView):
#     template_name = 'tarification/dashboard.html'

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         project_id = self.request.user.project_id
        
#         # 1. & 2. Récupérer le budget et la grille (inchangé)
#         try:
#             budget_obj = ProjectBudget.objects.get(project_id=project_id)
#             budget = float(budget_obj.budget_mensuel)
#             seuil_alerte = budget_obj.seuil_alerte
#             seuil_blocage = budget_obj.seuil_blocage
#         except ProjectBudget.DoesNotExist:
#             budget = 1000.0
#             seuil_alerte = 80
#             seuil_blocage = 100

#         try:
#             grille = GrilleTarifaire.objects.get(id=1)
#             prix_vcpu = float(grille.vcpu_price)
#             prix_ram = float(grille.ram_mb_price)
#             prix_disk = float(grille.disk_gb_price)
#         except GrilleTarifaire.DoesNotExist:
#             prix_vcpu = prix_ram = prix_disk = 0.0

#         # --- L'APPROCHE HYBRIDE : TEMPS RÉEL NOVA UPTIME ---
#         total_vcpu_heures = 0.0
#         total_ram_heures = 0.0
#         total_disk_heures = 0.0
        
#         current_vcpus = 0
#         current_ram = 0
#         current_disk = 0

#         try:
#             token = self.request.user.token.id
#             auth_url = settings.OPENSTACK_KEYSTONE_URL
#             auth = Token(auth_url=auth_url, token=token, project_id=project_id)
#             sess = session.Session(auth=auth)
            
#             # On utilise le client Nova (plus instantané que Gnocchi pour le temps réel)
#             nc = nova_client.Client(2, session=sess)
            
#             # Récupère toutes les instances du projet
#             instances = nc.servers.list(search_opts={'project_id': project_id})
            
#             for inst in instances:
#                 # Récupération des capacités réelles via le Flavor Nova
#                 try:
#                     flavor = nc.flavors.get(inst.flavor['id'])
#                     vcpus = flavor.vcpus
#                     ram = flavor.ram
#                     disk = flavor.disk
#                 except:
#                     vcpus = ram = disk = 0

#                 current_vcpus += vcpus
#                 current_ram += ram
#                 current_disk += disk

#                 # VRAIE FACTURATION FINOPS : Calcul de l'Uptime exact (Temps écoulé)
#                 created_at = dateutil.parser.isoparse(inst.created)
#                 now = timezone.now()
#                 uptime_heures = (now - created_at).total_seconds() / 3600.0
                
#                 # Multiplicateur du coût
#                 total_vcpu_heures += (vcpus * uptime_heures)
#                 total_ram_heures += (ram * uptime_heures)
#                 total_disk_heures += (disk * uptime_heures) # Ou just "disk" si facturé au mois plein
                
#         except Exception as e:
#             print("ERREUR NOVA API :", str(e))
        
#         # 4. Le calcul de la facture ! (Heures réelles x Prix)
#         cout_vcpu = total_vcpu_heures * prix_vcpu
#         cout_ram = total_ram_heures * prix_ram
#         cout_disk = total_disk_heures * prix_disk 
        
#         cout_actuel = cout_vcpu + cout_ram + cout_disk
        
#         # 5. Calcul des pourcentages
#         pct_vcpu = (cout_vcpu / cout_actuel * 100) if cout_actuel > 0 else 0
#         pct_ram = (cout_ram / cout_actuel * 100) if cout_actuel > 0 else 0
#         pct_disk = (cout_disk / cout_actuel * 100) if cout_actuel > 0 else 0

#         # 6. Jauge globale
#         pourcentage_global = (cout_actuel / budget * 100) if budget > 0 else 0
#         couleur = "success"
#         if pourcentage_global >= seuil_blocage:
#             couleur = "danger"
#         elif pourcentage_global >= seuil_alerte:
#             couleur = "warning"

#         context.update({
#             'budget': budget,
#             'cout_actuel': round(cout_actuel, 2),
#             'reste': round(max(0, budget - cout_actuel), 2),
#             'pourcentage': min(round(pourcentage_global, 2), 100),
#             'couleur': couleur,
#             'gnocchi_vcpus': current_vcpus,
#             'gnocchi_ram': current_ram,
#             'gnocchi_disk': current_disk,
#             'cout_vcpu': round(cout_vcpu, 4),
#             'cout_ram': round(cout_ram, 4),
#             'cout_disk': round(cout_disk, 4),
#             'pct_vcpu': round(pct_vcpu, 1),
#             'pct_ram': round(pct_ram, 1),
#             'pct_disk': round(pct_disk, 1),
#         })
#         return context    


# # # TEST AVEC DES DONNEES PREREMPLIES
class DashboardFinopsView(TemplateView):
    template_name = 'tarification/dashboard.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        project_id = self.request.user.project_id
        
        # 1. & 2. Récupérer le budget et la grille (Garde ton code actuel ici)
        try:
            budget_obj = ProjectBudget.objects.get(project_id=project_id)
            budget = float(budget_obj.budget_mensuel)
            seuil_alerte = budget_obj.seuil_alerte
            seuil_blocage = budget_obj.seuil_blocage
        except ProjectBudget.DoesNotExist:
            budget = 1000.0
            seuil_alerte = 80
            seuil_blocage = 100

        try:
            grille = GrilleTarifaire.objects.get(id=1)
            prix_vcpu = float(grille.vcpu_price)
            prix_ram = float(grille.ram_mb_price)
            prix_disk = float(grille.disk_gb_price)
        except GrilleTarifaire.DoesNotExist:
            prix_vcpu = prix_ram = prix_disk = 0.0

        # 3. Interroger Gnocchi (Toujours nos données de test pour l'instant)
        gnocchi_vcpus_utilises = 4 
        gnocchi_ram_utilisee = 8192
        gnocchi_disk_utilise = 100
        
        # --- NOUVEAU : On calcule les coûts détaillés ---
        cout_vcpu = gnocchi_vcpus_utilises * prix_vcpu
        cout_ram = gnocchi_ram_utilisee * prix_ram
        cout_disk = gnocchi_disk_utilise * prix_disk
        
        cout_actuel = cout_vcpu + cout_ram + cout_disk
        
        # On calcule le pourcentage que représente chaque ressource sur la facture totale
        pct_vcpu = (cout_vcpu / cout_actuel * 100) if cout_actuel > 0 else 0
        pct_ram = (cout_ram / cout_actuel * 100) if cout_actuel > 0 else 0
        pct_disk = (cout_disk / cout_actuel * 100) if cout_actuel > 0 else 0

        # Calcul de la jauge globale
        pourcentage_global = (cout_actuel / budget * 100) if budget > 0 else 0
        couleur = "success"
        if pourcentage_global >= seuil_blocage:
            couleur = "danger"
        elif pourcentage_global >= seuil_alerte:
            couleur = "warning"

        # On envoie toutes ces nouvelles données au template
        context.update({
            'budget': budget,
            'cout_actuel': round(cout_actuel, 2),
            'reste': round(max(0, budget - cout_actuel), 2),
            'pourcentage': min(round(pourcentage_global, 2), 100),
            'couleur': couleur,
            
            # Nouvelles variables pour le tableau détaillé :
            'gnocchi_vcpus': gnocchi_vcpus_utilises,
            'gnocchi_ram': gnocchi_ram_utilisee,
            'gnocchi_disk': gnocchi_disk_utilise,
            'cout_vcpu': round(cout_vcpu, 2),
            'cout_ram': round(cout_ram, 2),
            'cout_disk': round(cout_disk, 2),
            'pct_vcpu': round(pct_vcpu, 1),
            'pct_ram': round(pct_ram, 1),
            'pct_disk': round(pct_disk, 1),
        })
        return context






