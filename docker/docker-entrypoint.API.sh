#!/bin/bash

poetry install

python docker/wait_for_db_ready.py

if [ "$SHOULD_RUN_MIGRATIONS" == "true" ]; then
    python manage.py migrate
fi

if [ "$SERVE_ASGI" == "true" ]; then
    echo 'SERVING ASGI'
    daphne -b 0.0.0.0 -p 8000 pickleball_manager.asgi:application
fi

if [ "$SERVE_DEVELOPMENT" == "true" ]; then
    python manage.py runserver 0:8000
fi

if [ "$DEBUG" == "true" ]; then
    bash
fi
