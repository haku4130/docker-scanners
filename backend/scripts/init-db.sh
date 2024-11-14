#! /usr/bin/env bash

export POSTGRES_PASSWORD=$(cat $POSTGRES_PASSWORD_FILE)
export SECRET_KEY=$(cat $SECRET_KEY_FILE)
export SMTP_PASSWORD=$(cat $SMTP_PASSWORD_FILE)
export FIRST_SUPERUSER_PASSWORD=$(cat $FIRST_SUPERUSER_PASSWORD_FILE)

fastapi run --workers 4 app/main.py