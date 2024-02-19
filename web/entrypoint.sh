#!/bin/bash
APP_PORT=${PORT:-8000}
cd /app/
/opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm django_k8s.wsgi:application --bind "0.0.0.0:${APP_PORT}"
#waitress-serve --worker-tmp-dir django.core.wsgi:get_wsgi_application --bind "0.0.0.0:${APP_PORT}"