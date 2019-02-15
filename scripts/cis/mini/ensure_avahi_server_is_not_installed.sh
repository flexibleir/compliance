# !/bin/bash

# echo -e "\e[92m== 2.2.3 Ensure Avahi Server is not enabled ==\n"

ensure_avahi_server_is_not_installed () {
	if [[ "$(systemctl is-enabled avahi-daemon 2>/dev/null)" = "" || "$(systemctl is-enabled avahi-daemon 2>/dev/null)" = "disabled" || "$(systemctl is-enabled avahi-daemon 2>/dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_avahi_server_is_not_installed