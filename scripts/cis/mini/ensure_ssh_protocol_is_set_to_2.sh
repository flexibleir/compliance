# !/bin/bash

# echo -e "\e[92m== 5.2.2 Ensure SSH Protocol is set to 2 ==\n"

ensure_ssh_protocol_is_set_to_2 () {
    if [[ "$(grep "^Protocol" /etc/ssh/sshd_config 2>/dev/null)" = "Protocol 2" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_protocol_is_set_to_2