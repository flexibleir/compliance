#!/bin/bash

ensure_telnet_client_is_not_installed() {
    if [[ "$(dpkg -s telnet 2>/dev/null | grep Status)" == "" || "$(dpkg -s telnet 2>/dev/null | grep Status)" =~ ^Status:.deinstall* ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_telnet_client_is_not_installed
