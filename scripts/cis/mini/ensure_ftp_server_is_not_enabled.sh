# !/bin/bash

# echo -e "\e[92m== 2.2.9 Ensure FTP Server is not enabled ==\n"

ensure_ftp_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled vsftpd 2>/dev/null)" = "" || "$(systemctl is-enabled vsftpd)" = "disabled" || "$(systemctl is-enabled vsftpd)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ftp_server_is_not_enabled