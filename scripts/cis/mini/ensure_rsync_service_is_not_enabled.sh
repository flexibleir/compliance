# !/bin/bash

# echo -e "\e[92m== 2.2.16 Ensure rsync service is not enabled ==\n"


ensure_rsync_service_is_not_enabled () {
    if [[ "$(systemctl is-enabled rsync 2>/dev/null)" = "" || "$(systemctl is-enabled rsync 2> /dev/null)" = "disabled" || "$(systemctl is-enabled rsync 2> /dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_rsync_service_is_not_enabled