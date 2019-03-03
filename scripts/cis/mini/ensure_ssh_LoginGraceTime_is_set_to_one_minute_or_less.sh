# !/bin/bash

# echo -e "\e[92m== 5.2.13 Ensure SSH LoginGraceTime is set to one minute or less ==\n"

ensure_ssh_LoginGraceTime_is_set_to_one_minute_or_less () {
    if [[ "$(grep ^LoginGraceTime /etc/ssh/sshd_config 2>/dev/null | cut -d ' ' -f2)" -lt 61 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_LoginGraceTime_is_set_to_one_minute_or_less