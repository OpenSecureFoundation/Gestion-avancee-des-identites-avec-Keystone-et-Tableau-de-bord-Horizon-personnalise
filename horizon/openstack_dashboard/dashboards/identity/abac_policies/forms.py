# from django.utils.translation import gettext_lazy as _
# from horizon import forms
# from horizon import exceptions
# from horizon import messages
# from openstack_dashboard import api

# ACTION_CHOICES = [
#     ('compute:start', 'Démarrer une instance (Server Start)'),
#     ('compute:stop', 'Arrêter une instance (Server Stop)'),
#     ('identity:create_user', 'Créer un utilisateur (Create User)'),
#     ('volume:create', 'Créer un volume (Create Volume)'),
#     ('network:create_network', 'Créer un réseau (Create Network)'),
# ]

# class CreateAbacPolicyForm(forms.SelfHandlingForm):
#     name = forms.CharField(max_length=255, label=_("Nom de la règle (ex: Secu-WeekEnd)"))
#     description = forms.CharField(widget=forms.Textarea(attrs={'rows': 2}), label=_("Description"), required=False)
#     #target_action = forms.CharField(max_length=255, label=_("Action Cible (ex: compute:start)"))
#     effect = forms.ChoiceField(label=_("Effet"), choices=[('allow', 'Autoriser (Allow)'), ('deny', 'Refuser (Deny)')])
#     target_action = forms.ChoiceField(
#         choices=ACTION_CHOICES, 
#         label=_("Action à sécuriser"),
#         help_text=_("Sélectionnez l'opération OpenStack que vous souhaitez contrôler.")
#     )
        
#     # -- Les conditions --
#     context_def_id = forms.ChoiceField(label=_("Contexte dynamique"))
#     operator = forms.ChoiceField(label=_("Opérateur"), choices=[('==', 'Égal à (==)'), ('!=', 'Différent de (!=)'), ('in', 'Contient (in)')])
#     #value = forms.CharField(max_length=255, label=_("Valeur attendue (ex: Paris, 192.168.1.0/24)"))
#     value = forms.CharField(
#         max_length=255, 
#         label=_("Valeur autorisée"),
#         widget=forms.TextInput(attrs={'placeholder': 'ex: Yaoundé, 192.168.1.0/24, 08:00-18:00'}),
#         help_text=_("Entrez la valeur exacte que le contexte doit avoir pour valider la règle.")
#     )

#     def __init__(self, request, *args, **kwargs):
#         super().__init__(request, *args, **kwargs)
#         # On va chercher les contextes existants dans la base de données
#         try:
#             contexts = api.keystone.abac_context_list(request)
#             context_choices = [(c['id'], f"{c['name']} ({c['extraction_key']})") for c in contexts]
#             if not context_choices:
#                 context_choices = [('', _("Aucun contexte disponible"))]
#             self.fields['context_def_id'].choices = context_choices
#         except Exception:
#             self.fields['context_def_id'].choices = [('', _("Erreur de chargement des contextes"))]

#     def handle(self, request, data):
#         try:
#             # On formate la condition comme attendu par notre backend
#             conditions = [{
#                 "context_def_id": data['context_def_id'],
#                 "operator": data['operator'],
#                 "value": data['value']
#             }]
            
#             # On envoie tout à Keystone via notre fonction custom !
#             api.keystone.abac_policy_create(
#                 request,
#                 name=data['name'],
#                 target_action=data['target_action'],
#                 effect=data['effect'],
#                 conditions=conditions,
#                 description=data['description']
#             )
#             messages.success(request, _('Règle ABAC créée avec succès.'))
#             return True
#         except Exception:
#             exceptions.handle(request, _('Erreur lors de la création de la règle ABAC.'))
#             return False
        
# CONTEXT_TEMPLATES = [
#     ('HTTP_X_CITY', 'Localisation (Ville via Header HTTP)'),
#     ('REMOTE_ADDR', 'Adresse IP de l\'utilisateur'),
#     ('HTTP_USER_AGENT', 'Navigateur / OS (User Agent)'),
#     ('TIME_HOUR', 'Heure de la journée (HH:MM)'),
#     ('HTTP_X_COMPANY_NETWORK', _('Réseau Entreprise (VPN)')),
# ]
        
# class CreateContextForm(forms.SelfHandlingForm):
#     name = forms.CharField(max_length=255, label=_("Nom du contexte (ex: Ville, IP, Heure)"))
#     data_type = forms.ChoiceField(
#         label=_("Type de donnée"), 
#         choices=[('string', 'Texte (String)'), ('time', 'Heure (Time)'), ('cidr', 'Réseau (IP/CIDR)')]
#     )
#     extraction_key = forms.CharField(
#         max_length=255, 
#         label=_("Clé d'extraction (ex: HTTP_X_CITY, REMOTE_ADDR)")
#     )
#     description = forms.CharField(widget=forms.Textarea(attrs={'rows': 2}), required=False)

#     def handle(self, request, data):
#         try:
#             # On appelle notre API custom pour sauvegarder le contexte !
#             api.keystone.abac_context_create(
#                 request,
#                 name=data['name'],
#                 data_type=data['data_type'],
#                 extraction_key=data['extraction_key'],
#                 description=data['description']
#             )
#             messages.success(request, _('Contexte dynamique créé avec succès.'))
#             return True
#         except Exception:
#             exceptions.handle(request, _('Erreur lors de la création du contexte.'))
#             return False




from django.utils.translation import gettext_lazy as _
from horizon import forms
from horizon import exceptions
from horizon import messages
from openstack_dashboard import api

# --- Modèles de contextes pour simplifier la vie de l'admin ---
CONTEXT_TEMPLATES = [
    # Localisation & Réseau
    ('REMOTE_ADDR', _('Adresse IP Source (Ex: 192.168.1.100)')),
    ('HTTP_X_FORWARDED_FOR', _('IP Réelle (Si derrière un VPN/Proxy)')),
    ('HTTP_X_COUNTRY_CODE', _('Code Pays (Ex: CM, FR, US)')),
    
    # ATTRIBUTS DU SUJET (NOUVEAU)
    ('USER_ID', _('ID de l\'utilisateur (Keystone Token)')),
    ('PROJECT_ID', _('ID du projet (Keystone Token)')), 
    
    # Appareil & Sécurité
    ('HTTP_USER_AGENT', _('Navigateur / OS (User-Agent)')),
    ('wsgi.url_scheme', _('Protocole de connexion (http ou https)')),
    
    #  Temps & Horaires (Nécessite souvent un proxy système qui injecte ces headers)
    ('HTTP_X_DAY_OF_WEEK', _('Jour de la semaine (Ex: Monday)')),
    ('HTTP_X_BUSINESS_HOURS', _('Heures de bureau (Ex: True / False)')),
    
    # Organisation
    ('HTTP_X_DEPARTMENT', _('Département de l\'employé (Ex: IT, RH)')),
]

ACTION_CHOICES = [
    # IDENTITY (Keystone - Gestion des accès)
    ('identity:list_users', _('Lister les utilisateurs (Keystone)')),
    ('identity:create_user', _('Créer un utilisateur (Keystone)')),
    ('identity:delete_user', _('Supprimer un utilisateur (Keystone)')),
    ('identity:update_project', _('Modifier un projet (Keystone)')),
    ('identity:grant_role', _('Attribuer un rôle à un utilisateur (Keystone)')),
    
    # COMPUTE (Nova - Gestion des machines virtuelles)
    ('os_compute_api:servers:index', _('Lister les instances (Nova)')),
    ('os_compute_api:servers:create', _('Créer une nouvelle instance (Nova)')),
    ('os_compute_api:servers:start', _('Démarrer une instance (Nova)')),
    ('os_compute_api:servers:stop', _('Arrêter une instance (Nova)')),
    ('os_compute_api:servers:delete', _('Détruire une instance (Nova)')),
    ('os_compute_api:servers:resize', _('Redimensionner une instance (Nova)')),
    
    # NETWORK (Neutron - Gestion du réseau)
    ('create_network', _('Créer un réseau virtuel (Neutron)')),
    ('delete_network', _('Supprimer un réseau (Neutron)')),
    ('create_security_group', _('Créer un pare-feu/Security Group (Neutron)')),
    
    # STORAGE (Cinder & Glance - Disques et Images)
    ('volume:create', _('Créer un disque dur/Volume (Cinder)')),
    ('volume:delete', _('Supprimer un disque dur (Cinder)')),
    ('add_image', _('Uploader une image système (Glance)')),
]

class CreateContextForm(forms.SelfHandlingForm):
    name = forms.CharField(
        max_length=255, 
        label=_("Nom du contexte"),
        widget=forms.TextInput(attrs={'placeholder': _('Ex: Zone Géographique')})
    )
    data_type = forms.ChoiceField(
        label=_("Nature de la donnée"), 
        choices=[('string', 'Texte'), ('time', 'Heure'), ('cidr', 'Adresse IP')]
    )
    # ICI : On utilise ChoiceField au lieu de CharField pour être intuitif
    extraction_key = forms.ChoiceField(
        label=_("Information à extraire"),
        choices=CONTEXT_TEMPLATES,
        help_text=_("Sélectionnez l'élément du trafic réseau que Keystone doit analyser.")
    )
    description = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 2}), 
        label=_("Description"),
        required=False
    )

    def handle(self, request, data):
        try:
            api.keystone.abac_context_create(
                request,
                name=data['name'],
                data_type=data['data_type'],
                extraction_key=data['extraction_key'],
                description=data['description']
            )
            messages.success(request, _('Contexte créé avec succès.'))
            return True
        except Exception:
            exceptions.handle(request, _('Erreur lors de la création du contexte.'))
            return False

class CreateAbacPolicyForm(forms.SelfHandlingForm):
    name = forms.CharField(label=_("Nom de la règle"))
    target_action = forms.ChoiceField(
        label=_("Action OpenStack à protéger"),
        choices=ACTION_CHOICES
    )
    effect = forms.ChoiceField(
        label=_("Décision"), 
        choices=[('allow', 'Autoriser'), ('deny', 'Bloquer (Deny)')]
    )
    
    context_def_id = forms.ChoiceField(label=_("Condition basée sur le contexte"))
    operator = forms.ChoiceField(
        label=_("Opérateur logique"), 
        choices=[('==', 'Est égal à'), ('!=', 'Est différent de'), ('in', 'Fait partie de')]
    )
    value = forms.CharField(
        label=_("Valeur de contrôle"),
        widget=forms.TextInput(attrs={'placeholder': _('Ex: Paris, 192.168.1.1...')})
    )

    def __init__(self, request, *args, **kwargs):
        super().__init__(request, *args, **kwargs)
        try:
            contexts = api.keystone.abac_context_list(request)
            self.fields['context_def_id'].choices = [
                (c['id'], c['name']) for c in contexts
            ]
        except Exception:
            self.fields['context_def_id'].choices = [('', _("Aucun contexte disponible"))]

    def handle(self, request, data):
        try:
            conditions = [{
                "context_def_id": data['context_def_id'],
                "operator": data['operator'],
                "value": data['value']
            }]
            api.keystone.abac_policy_create(
                request,
                name=data['name'],
                target_action=data['target_action'],
                effect=data['effect'],
                conditions=conditions
            )
            messages.success(request, _('Politique ABAC activée.'))
            return True
        except Exception:
            exceptions.handle(request, _('Erreur de création.'))
            return False