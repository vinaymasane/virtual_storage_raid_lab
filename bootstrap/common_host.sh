#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

set -euo pipefail

###
ensure_service_running() {

    local service="$1"

    echo
    echo "====================================="
    echo "Starting ${service} service"
    echo "====================================="

    echo "[INFO] Enabling ${service}"
    systemctl enable "${service}"

    if systemctl is-active --quiet "${service}"; then
        echo "[INFO] ${service} already running"
    else
        echo "[INFO] Starting ${service}"
        systemctl start "${service}"

        if ! systemctl is-active --quiet "${service}"; then
            echo "[ERROR] Failed to start ${service}"
            return 1
        fi

        echo "[PASS] ${service} started"
    fi
}
