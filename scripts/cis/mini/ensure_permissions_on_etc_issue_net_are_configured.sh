# !/bin/bash

#echo -e "\e[92m== 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored) ==\n"


ensure_permissions_on_etc_issue_net_are_configured () {
    if [[ "$(stat -c %a /etc/issue.net 2>/dev/null)" = "644" && "$(stat -c %U:%G /etc/issue.net 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
            echo -e "Failed"
    fi
}

ensure_permissions_on_etc_issue_net_are_configured