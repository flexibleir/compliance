# !/bin/bash

# echo -e "\e[92m== 5.2.10 Ensure SSH PermitUserEnvironment is disabled ==\n"


ensure_ssh_PermitUserEnvironment_is_disabled () {
    if [[ "$(grep PermitUserEnvironment /etc/ssh/sshd_config 2>/dev/null)" = "PermitUserEnvironment no" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_PermitUserEnvironment_is_disabled