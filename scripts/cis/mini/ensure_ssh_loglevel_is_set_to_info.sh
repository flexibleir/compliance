# !/bin/bash

# echo -e "\e[92m== 5.2.3 Ensure SSH LogLevel is set to INFO ==\n"

ensure_ssh_loglevel_is_set_to_info () {
    if [[ "$(grep "^LogLevel" /etc/ssh/sshd_config 2>/dev/null)" = "LogLevel INFO" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_loglevel_is_set_to_info