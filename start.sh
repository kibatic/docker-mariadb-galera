#!/bin/bash
set -e

CMD="/usr/local/bin/docker-entrypoint.sh mysqld"
LOCKFILE="/var/lib/mysql/cluster_initialized.lock"

if [ "$GALERA_PRIMARY" = "true" ]; then
    if [ ! -f "$LOCKFILE" ]; then
        CMD="$CMD --wsrep-new-cluster"
        touch "$LOCKFILE"
    fi
fi

exec $CMD
