import base64
from io import BytesIO
import pyotp
import qrcode
from django.utils.translation import gettext_lazy as _
from horizon import views
from openstack_dashboard import api
from django.views import generic
from django.shortcuts import redirect
from horizon import messages

class IndexView(views.HorizonTemplateView):
    template_name = 'settings/mfa/index.html'
    page_title = _("Configuration MFA")

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        request = self.request
        
        try:
            # 1. On initialise le client Keystone AVEC les droits de Daniel (pas en admin)
            client = api.keystone.keystoneclient(request)
            
            # 2. On récupère le profil de Daniel
            user = client.users.get(request.user.id)
            options = getattr(user, 'options', {})
            
            # 3. Vérification de l'autorisation de l'admin
            mfa_autorise = getattr(user, 'mfa_autorise', False)
            if not mfa_autorise:
                context['non_autorise'] = True
                return context

            # 4. Vérification si déjà configuré
            creds = client.credentials.list(user=request.user.id, type='totp')
            if creds and options.get('multi_factor_auth_rules'):
                context['already_configured'] = True
                return context
                
            # 5. Création du credential TOTP
            secret = pyotp.random_base32()
            client.credentials.create(user=request.user.id, type='totp', blob=secret)
            
            # 6. Génération de l'image
            uri = pyotp.totp.TOTP(secret).provisioning_uri(
                name=request.user.username,
                issuer_name="OpenStack-Groupe9"
            )
            
            img = qrcode.make(uri)
            buffer = BytesIO()
            img.save(buffer, format="PNG")
            
            context['qr_code'] = base64.b64encode(buffer.getvalue()).decode("utf-8")
            context['secret'] = secret
            context['user_id'] = request.user.id 
            
        except Exception as e:
            import traceback
            details = str(e) if str(e) else "Message vide"
            type_erreur = type(e).__name__
            context['error_keystone'] = f"Type: {type_erreur} | Détails: {details}"
            print("=== ERREUR MFA ===")
            print(traceback.format_exc())
            print("==================")
            
        return context


class ActiverRegleView(generic.View):
    def post(self, request, *args, **kwargs):
        try:
            # On utilise le client standard pour ne pas exiger de droits admin
            client = api.keystone.keystoneclient(request)
            user = client.users.get(request.user.id)
            options = getattr(user, 'options', {})
            
            # On active la règle MFA
            options['multi_factor_auth_rules'] = [['password', 'totp']]
            
            # On met à jour l'utilisateur directement via le client
            client.users.update(request.user.id, options=options)
            
            messages.success(request, _("MFA activé avec succès ! Lors de votre prochaine connexion, le code sera exigé."))
        except Exception as e:
            messages.error(request, _("Erreur lors de l'activation : %s") % str(e))
            
        return redirect('horizon:settings:mfa:index')