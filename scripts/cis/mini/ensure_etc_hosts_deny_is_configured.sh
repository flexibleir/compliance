# !/bin/bash

# echo -e "\e[92m== 3.4.3 Ensure /etc/hosts.deny is configured ==\n"

ensure_etc_hosts_deny_is_configured () {
    if [[ "$(grep -v \# /etc/hosts.deny | egrep -v "^$" 2>/dev/null)" = "ALL: ALL" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_etc_hosts_deny_is_configured