#! /usr/bin/env python3

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --no-input

# for production deploy:
uwsgi ./uwsgi.ini

# for debugging:
# export PYTHONUNBUFFERED=1
# python manage.py runserver 0.0.0.0:8000