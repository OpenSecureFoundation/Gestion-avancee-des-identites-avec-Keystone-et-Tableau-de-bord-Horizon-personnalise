from django.db import models

class GrilleTarifaire(models.Model):
    # On stocke les prix avec 4 décimales pour être précis sur les coûts horaires
    vcpu_price = models.DecimalField(max_digits=10, decimal_places=4, default=0.0)
    ram_mb_price = models.DecimalField(max_digits=10, decimal_places=4, default=0.0)
    disk_gb_price = models.DecimalField(max_digits=10, decimal_places=4, default=0.0)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Grille Tarifaire"

class ProjectBudget(models.Model):
    # L'ID du projet OpenStack (Keystone) pour faire le lien
    project_id = models.CharField(max_length=64, unique=True)
    
    # Le budget en monnaie locale (ex: FCFA, Euro, Dollar...)
    budget_mensuel = models.DecimalField(max_digits=12, decimal_places=2, default=0.0)
    
    # Les seuils en pourcentage
    seuil_alerte = models.IntegerField(default=80, help_text="Seuil d'alerte (%)")
    seuil_blocage = models.IntegerField(default=100, help_text="Seuil de blocage (%)")
    
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Budget du Projet"