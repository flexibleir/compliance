# !/bin/bash

# echo -e "\e[92m== 5.2 Ensure permissions on /etc/ssh/sshd_config are configured ==\n"

ensure_permissions_on_etc_ssh_sshd_config_are_configured () {
    if [[ "$(stat -c %a /etc/ssh/sshd_config 2>/dev/null)" = "600" && "$(stat -c %U:%G /etc/ssh/sshd_config 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed!\n"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_ssh_sshd_config_are_configured