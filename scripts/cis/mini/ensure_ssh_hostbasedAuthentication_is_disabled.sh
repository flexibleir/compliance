# !/bin/bash

# echo -e "\e[92m== 5.2.7 Ensure SSH HostbasedAuthentication is disabled ==\n"

ensure_ssh_hostbasedAuthentication_is_disabled () {
    if [[ "$(grep "^HostbasedAuthentication" /etc/ssh/sshd_config 2>/dev/null)" = "HostbasedAuthentication no" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_hostbasedAuthentication_is_disabled