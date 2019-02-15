# !/bin/bash

# echo -e "\e[92m== 2.3.5 Ensure ldap-utils client is not installed ==\n"


ensure_ldap_client_is_not_installed () {
    if [[ "$(dpkg -s ldap-utils 2>/dev/null | grep Status)" = "" || "$(dpkg -s ldap-utils 2>/dev/null | grep Status)" =~ ^Status:.deinstall* ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ldap_client_is_not_installed