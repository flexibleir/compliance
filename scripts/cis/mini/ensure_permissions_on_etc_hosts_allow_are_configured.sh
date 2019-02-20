# !/bin/bash

#echo -e "\e[92m== 3.4.4 Ensure permissions on /etc/hosts.allow are configured ==\n"


ensure_permissions_on_etc_hosts_allow_are_configured () {
    if [[ "$(stat -c %a /etc/hosts.allow 2>/dev/null)" = "644" && "$(stat -c %U:%G /etc/hosts.allow 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_hosts_allow_are_configured