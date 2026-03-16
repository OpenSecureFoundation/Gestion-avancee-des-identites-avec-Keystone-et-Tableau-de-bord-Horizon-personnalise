sudo systemctl restart memcached
python manage.py collectstatic --noinput
python manage.py compress --force
tox -e runserver -- 192.168.56.1:9000
