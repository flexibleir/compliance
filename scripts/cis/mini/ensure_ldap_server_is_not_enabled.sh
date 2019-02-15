# !/bin/bash

# echo -e "\e[92m== 2.2.6 Ensure LDAP Server is not enabled ==\n"

ensure_ldap_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled slapd 2>/dev/null)" = "" || "$(systemctl is-enabled slapd)" = "disabled" || "$(systemctl is-enabled slapd)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ldap_server_is_not_enabled