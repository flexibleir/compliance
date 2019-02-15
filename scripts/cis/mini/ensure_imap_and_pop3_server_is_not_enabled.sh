# !/bin/bash

# echo -e "\e[92m== 2.2.11 Ensure IMAP and POP3 Server is not enabled ==\n"

ensure_imap_and_pop3_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled dovecot 2>/dev/null)" = "" || "$(systemctl is-enabled dovecot)" = "disabled" || "$(systemctl is-enabled dovecot)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_imap_and_pop3_server_is_not_enabled