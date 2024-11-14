#! /usr/bin/env bash

set -e
set -x

export POSTGRES_PASSWORD=$(cat $POSTGRES_PASSWORD_FILE)
export SECRET_KEY=$(cat $SECRET_KEY_FILE)
export SMTP_PASSWORD=$(cat $SMTP_PASSWORD_FILE)
export FIRST_SUPERUSER_PASSWORD=$(cat $FIRST_SUPERUSER_PASSWORD_FILE)

# Let the DB start
python app/backend_pre_start.py

# Run migrations
alembic upgrade head

# Create initial data in DB
python app/initial_data.py
