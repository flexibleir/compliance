# !/bin/bash

# echo -e "\e[92m== 4.2.3 Ensure rsyslog or syslog-ng is installed ==\n"

ensure_rsyslog_or_syslog_ng_is_installed () {
    if [[ "$(dpkg -s rsyslog 2>/dev/null | grep Status)" =~ Status.+ok.installed || "$(dpkg -s syslog-ng 2>/dev/null | grep Status)" =~ Status.+ok.installed ]]
		then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_rsyslog_or_syslog_ng_is_installed