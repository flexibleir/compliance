# !/bin/bash

# echo -e "\e[92m== 4.2.2.1 Ensure syslog-ng service is enabled ==\n"

ensure_syslog_ng_service_is_enabled () {
    if [[ "$(systemctl is-enabled syslog-ng 2>/dev/null)" = "enabled" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_syslog_ng_service_is_enabled