# !/bin/bash

# echo -e "\e[92m== 4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host ==\n"

ensure_syslog_ng_is_configured_to_send_logs_to_remote_host () {
    if [[ "$(grep 'destination logserver' /etc/syslog-ng/syslog-ng.conf 2>/dev/null)" =~ destination.logserver.\{.tcp\(\".+?destination.+\}\; ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_syslog_ng_is_configured_to_send_logs_to_remote_host