#!/bin/bash

echo "⏳ Iniciando Chatwoot en producción..."

bundle exec rails db:prepare
bundle exec rails s -e production
