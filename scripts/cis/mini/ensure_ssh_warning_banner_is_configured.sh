# !/bin/bash

# echo -e "\e[92m== 5.2.15 Ensure SSH warning banner is configured ==\n"

ensure_ssh_warning_banner_is_configured () {
    if [[ "$(grep ^Banner /etc/ssh/sshd_config 2>/dev/null)" = "Banner /etc/issue.net" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_warning_banner_is_configured