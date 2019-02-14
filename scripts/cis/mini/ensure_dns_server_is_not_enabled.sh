# !/bin/bash

# echo -e "\e[92m== 2.2.8 Ensure DNS Server is not enabled ==\n"

ensure_dns_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled bind9 2>/dev/null)" = "" || "$(systemctl is-enabled bind9)" = "disabled" || "$(systemctl is-enabled bind9)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_dns_server_is_not_enabled