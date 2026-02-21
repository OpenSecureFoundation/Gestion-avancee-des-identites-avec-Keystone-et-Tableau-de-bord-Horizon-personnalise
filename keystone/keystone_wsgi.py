import sys
import os

# 1. Calcul du chemin (comme avant)
base_dir = os.path.abspath(os.path.dirname(__file__))
conf_file = os.path.join(base_dir, "etc/keystone/keystone.conf")

# 2. Vérification
if not os.path.exists(conf_file):
    print(f"ERREUR: Fichier introuvable: {conf_file}")
    sys.exit(1)
else:
    print(f"[SUCCES] Injection de la config: {conf_file}")

# 3. --- LE CORRECTIF EST ICI ---
# Au lieu de vider les arguments, on simule l'argument --config-file
# C'est la seule façon 100% fiable de forcer oslo.config à lire le fichier
sys.argv = ['keystone-wsgi', '--config-file', conf_file]

# 4. Lancement
from keystone.server import wsgi
application = wsgi.initialize_public_application()