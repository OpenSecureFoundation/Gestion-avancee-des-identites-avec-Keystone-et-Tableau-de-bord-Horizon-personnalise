import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "openstack_dashboard.settings")
django.setup()

from keystoneauth1.identity import Password
from keystoneauth1 import session
from gnocchiclient.v1 import client as gnocchi_client

# Mets tes identifiants admin ici
auth = Password(auth_url="http://localhost:5000/v3",
                username="admin", password="ton_password",
                project_name="admin", user_domain_id="default", project_domain_id="default")
sess = session.Session(auth=auth)
gc = gnocchi_client.Client(session=sess)

print("Recherche des instances...")
instances = gc.resource.search(resource_type='instance')

for inst in instances:
    print(f"\n--- Instance: {inst.get('id')} ---")
    print(f"Nom : {inst.get('display_name')}")
    print(f"vCPUs (attribut) : {inst.get('vcpus', 'NON TROUVÉ')}")
    print(f"RAM (attribut) : {inst.get('memory', 'NON TROUVÉ')}")
    print("Métriques associées :")
    for metric_name, metric_id in inst.get('metrics', {}).items():
        print(f" - {metric_name} : {metric_id}")
