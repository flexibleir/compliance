# !/bin/bash

# echo -e "\e[92m== 2.2.17 Ensure NIS server is not enabled ==\n"


ensure_nis_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled nis 2>/dev/null)" = "" || "$(systemctl is-enabled nis 2> /dev/null)" = "disabled" || "$(systemctl is-enabled nis 2> /dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_nis_server_is_not_enabled