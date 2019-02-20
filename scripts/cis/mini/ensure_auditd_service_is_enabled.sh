# !/bin/bash

# echo -e "\e[92m== 4.1.2 Ensure auditd service is enabled ==\n"


ensure_auditd_service_is_enabled () {
    if [[ "$(systemctl is-enabled auditd 2>/dev/null)" = "enabled" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_auditd_service_is_enabled