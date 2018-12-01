#!/usr/bin/with-contenv sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

log() {
    echo "[cont-init.d] $(basename $0): $*"
}

# Generate machine id.
if [ ! -f /etc/machine-id ]; then
    log "generating machine-id..."
    cat /proc/sys/kernel/random/uuid | tr -d '-' > /etc/machine-id
fi

# Take ownership of the config directory content.
find /config -mindepth 1 -exec chown $USER_ID:$GROUP_ID {} \;

# vim:ft=sh:ts=4:sw=4:et:sts=4
