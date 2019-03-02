# !/bin/bash

# echo -e "\e[92m== 5.2.14 Ensure SSH access is limited ==\n"

ensure_ssh_access_is_limited () {
    if [[ "$(grep ^AllowUsers /etc/ssh/sshd_config 2>/dev/null)" =~ AllowUsers.+$ || "$(grep ^AllowGroups /etc/ssh/sshd_config 2>/dev/null)" =~ AllowGroups.+$ || "$(grep ^DenyUsers /etc/ssh/sshd_config 2>/dev/null)" =~ DenyUsers.+$ || "$(grep ^DenyGroups /etc/ssh/sshd_config 2>/dev/null)" =~ DenyGroups.+$ ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_access_is_limited