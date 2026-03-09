from horizon import tables
from horizon import exceptions
from django.utils.translation import gettext_lazy as _
from openstack_dashboard import api
from openstack_dashboard.dashboards.identity.abac_audit import tables as audit_tables

import json
from collections import Counter

# Wrapper d'objet pour le tableau d'Horizon
class AuditLog(object):
    def __init__(self, data):
        self.id = data.get('id')
        self.timestamp = data.get('timestamp')
        self.user_id = data.get('user_id', 'Inconnu')
        self.target_action = data.get('target_action')
        self.policy_name = data.get('policy_name')
        self.effect = data.get('effect', 'UNKNOWN').upper()
        self.details = data.get('details')

class IndexView(tables.DataTableView):
    table_class = audit_tables.AbacAuditTable
    template_name = 'identity/abac_audit/index.html'
    page_title = _("Tableau de Bord & Audit ABAC")

    def get_data(self):
        logs = []
        try:
            # Récupération des données brutes
            raw_logs = api.keystone.abac_audit_log_list(self.request)
            
            # 1. On récupère les dates, et on s'assure qu'il n'y a pas d'espaces vides
            start_date = self.request.GET.get('start_date', '').strip()
            end_date = self.request.GET.get('end_date', '').strip()

            for l in raw_logs:
                log_obj = AuditLog(l)
                
                # 2. On force la conversion en chaîne et on prend les 10 premiers caractères (YYYY-MM-DD)
                # Cela évite les crashs si le format de l'heure change
                log_date = str(log_obj.timestamp)[:10] if log_obj.timestamp else ""
                
                # 3. Le filtrage strict
                if start_date and log_date < start_date:
                    continue # Trop vieux, on saute
                if end_date and log_date > end_date:
                    continue # Trop récent, on saute
                    
                # Si ça passe, on garde le log
                logs.append(log_obj)
                
        except Exception:
            exceptions.handle(self.request, _('Impossible de récupérer les journaux d\'audit.'))
        return logs

    def get_context_data(self, **kwargs):
        # 1. On récupère le contexte de base (qui contient déjà le tableau)
        context = super(IndexView, self).get_context_data(**kwargs)
        
        # On récupère les logs qui viennent d'être chargés par get_data()
        logs = context['table'].data

        # 2. Initialisation de nos compteurs statistiques
        total_requests = len(logs)
        total_denied = 0
        unique_users = set()
        
        dates_count = Counter()
        effect_count = Counter()
        user_count = Counter()

        # 3. La boucle d'analyse : on scanne tous les logs un par un
        for log in logs:
            # KPI 1 : Compter les actions bloquées
            if log.effect == 'DENY':
                total_denied += 1
            
            # KPI 2 : Identifier les utilisateurs uniques
            unique_users.add(log.user_id)

            # GRAPHIQUE 1 : Répartition Allow vs Deny
            effect_count[log.effect] += 1

            # GRAPHIQUE 2 : Top des utilisateurs
            user_count[log.user_id] += 1

            # GRAPHIQUE 3 : Évolution temporelle (On extrait juste la date AAAA-MM-JJ)
            if log.timestamp:
                try:
                    # Les timestamps Keystone ressemblent à "2026-03-09T14:01:41.378Z"
                    date_part = log.timestamp.split('T')[0].split(' ')[0]
                    dates_count[date_part] += 1
                except:
                    pass

        # 4. Préparation des données pour les graphiques (Format Listes)
        # Tri des dates chronologiquement
        sorted_dates = sorted(dates_count.keys())
        dates_values = [dates_count[d] for d in sorted_dates]

        # Top 5 des utilisateurs les plus actifs
        top_users = user_count.most_common(5)
        top_users_labels = [u[0] for u in top_users]
        top_users_data = [u[1] for u in top_users]

        # 5. Injection dans le contexte (en JSON pour que le Javascript puisse les lire)
        # Variables KPI classiques
        context['kpi_total'] = total_requests
        context['kpi_denied'] = total_denied
        context['kpi_users'] = len(unique_users)
        
        # Variables Graphiques (converties en chaînes JSON)
        context['chart_dates_labels'] = json.dumps(sorted_dates)
        context['chart_dates_data'] = json.dumps(dates_values)
        
        context['chart_effect_labels'] = json.dumps(list(effect_count.keys()))
        context['chart_effect_data'] = json.dumps(list(effect_count.values()))
        
        context['chart_users_labels'] = json.dumps(top_users_labels)
        context['chart_users_data'] = json.dumps(top_users_data)

        context['start_date'] = self.request.GET.get('start_date', '')
        context['end_date'] = self.request.GET.get('end_date', '')

        return context