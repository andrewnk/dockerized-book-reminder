#!/bin/sh
set -e

if [[ "$1" = 'rails' ]]; then

    if [[ "$RAILS_ENV" = production ]]; then
        export RAILS_SERVE_STATIC_FILES=true
        rake assets:precompile
    fi

    rm -f /usr/src/app/tmp/pids/server.pid
    find . -type d | xargs chmod 0755
    find . -type f | xargs chmod 0644

    if [[ "$(id -u)" = '0' ]]; then
        find . \! -user app -exec chown app:app '{}' +
        exec su-exec app "$@"
    fi
fi

exec "$@"
