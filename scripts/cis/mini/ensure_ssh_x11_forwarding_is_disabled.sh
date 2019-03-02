# !/bin/bash

# echo -e "\e[92m== 5.2.4 Ensure SSH X11 forwarding is disabled ==\n"

ensure_ssh_x11_forwarding_is_disabled () {
    if [[ "$(grep ^X11Forwarding /etc/ssh/sshd_config 2>/dev/null)" = "X11Forwarding no" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_x11_forwarding_is_disabled
