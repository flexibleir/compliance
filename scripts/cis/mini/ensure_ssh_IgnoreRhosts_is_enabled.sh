# !/bin/bash

# echo -e "\e[92m== 5.2.6 Ensure SSH IgnoreRhosts is enabled ==\n"

ensure_ssh_IgnoreRhosts_is_enabled () {
    if [[ "$(grep ^IgnoreRhosts /etc/ssh/sshd_config 2>/dev/null)" = "IgnoreRhosts yes" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_IgnoreRhosts_is_enabled