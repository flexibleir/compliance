# !/bin/bash

# echo -e "\e[92m== 5.2.8 Ensure SSH root login is disabled ==\n"

ensure_ssh_root_login_is_disabled () {
    if [[ "$(grep ^PermitRootLogin /etc/ssh/sshd_config 2>/dev/null)" = "PermitRootLogin no" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_root_login_is_disabled