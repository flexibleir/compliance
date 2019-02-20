# !/bin/bash

# echo -e "\e[92m== 3.4.5 Ensure permissions on /etc/hosts.deny are 644 ==\n"


ensure_permissions_on_etc_hosts_deny () {
    if [[ "$(stat -c %a /etc/hosts.deny 2>/dev/null)" = "644" && "$(stat -c %U:%G /etc/hosts.deny 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_hosts_deny