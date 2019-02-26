# !/bin/bash

# echo -e "\e[92m== 4.2.1.1 Ensure rsyslog Service is enabled ==\n"


ensure_rsyslog_service_is_enabled () {
    if [[ "$(systemctl is-enabled rsyslog 2>/dev/null)" = "enabled" ]]
        then echo -e "Passed"
    else      
        echo -e "Failed"
    fi
}

ensure_rsyslog_service_is_enabled
    