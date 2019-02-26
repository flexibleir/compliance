# !/bin/bash

# echo -e "\e[92m== 4.2.1.5 Ensure remote rsyslog messages are only accepted on designated log hosts ==\n"

ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts () {
    if [[ "$(grep '$ModLoad imtcp.so' /etc/rsyslog.conf 2>/dev/null)" = "$ModLoad imtcp.so" && "$(grep '$InputTCPServerRun' /etc/rsyslog.conf 2>/dev/null)" = "$InputTCPServerRun 514" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts