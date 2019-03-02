# !/bin/bash

# echo -e "\e[92m== 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less  ==\n"

ensure_ssh_MaxAuthTries_is_set_to_4_or_less () {
    if [[ "$(grep ^MaxAuthTries /etc/ssh/sshd_config 2>/dev/null)" =~ MaxAuthTries.[1,2,3,4] ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_MaxAuthTries_is_set_to_4_or_less