# !/bin/bash

# echo -e "\e[92m== 2.2.12 Ensure Samba is not enabled ==\n"


ensure_samba_is_not_enabled () {
    if [[ "$(systemctl is-enabled smbd 2>/dev/null)" = "" || "$(systemctl is-enabled smbd 2> /dev/null)" = "disabled" || "$(systemctl is-enabled smbd 2> /dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_samba_is_not_enabled
