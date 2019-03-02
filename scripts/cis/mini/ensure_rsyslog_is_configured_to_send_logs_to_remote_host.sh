# !/bin/bash

# echo -e "\e[92m== 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host ==\n"

ensure_rsyslog_is_configured_to_send_logs_to_remote_host () {
    if [[ "$(grep "^*.*[^I][^I]*@" /etc/rsyslog.conf 2>/dev/null)" =~ ^\*\.\*.\@\@.+?$ ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_rsyslog_is_configured_to_send_logs_to_remote_host