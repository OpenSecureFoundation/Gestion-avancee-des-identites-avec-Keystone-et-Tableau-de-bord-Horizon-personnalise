import multiprocessing

# L'adresse d'écoute
bind = "0.0.0.0:5001"

# Performance
workers = 2
threads = 2
timeout = 120

# Correction du bug "AF_UNIX path too long" que vous avez eu dans les logs
# On force l'utilisation de la mémoire partagée pour les sockets temporaires
worker_tmp_dir = "/tmp"
