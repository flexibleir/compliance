# !/bin/bash

# echo -e "\e[92m== 4.2.1.3 Ensure rsyslog default file permissions configured ==\n"

ensure_rsyslog_default_file_permissions_configured () {
    if [[ "$(grep ^\$FileCreateMode /etc/rsyslog.conf 2>/dev/null)" =~ \$FileCreateMode.06[0,4]0 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_rsyslog_default_file_permissions_configured