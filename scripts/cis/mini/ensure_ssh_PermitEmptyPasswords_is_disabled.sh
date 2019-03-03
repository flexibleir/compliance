# !/bin/bash

# echo -e "\e[92m== 5.2.9 Ensure SSH PermitEmptyPasswords is disabled ==\n"

ensure_ssh_PermitEmptyPasswords_is_disabled () {
    if [[ "$(grep "^PermitEmptyPasswords" /etc/ssh/sshd_config 2>/dev/null)" = "PermitEmptyPasswords no" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_PermitEmptyPasswords_is_disabled