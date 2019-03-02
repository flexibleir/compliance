# !/bin/bash

# echo -e "\e[92m== 4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts (Not Scored) ==\n"

ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_hosts () {
    if [[ "$(grep 'source net' /etc/syslog-ng/syslog-ng.conf 2>/dev/null)" =~ ^source.net\{.tcp\(\).+\;$ && "$(grep 'destination remote' /etc/syslog-ng/syslog-ng.conf 2>/dev/null)" =~ ^destination.remote.+?file.+?log\"\).+?\; && "$(grep 'log {' /etc/syslog-ng/syslog-ng.conf 2>/dev/null)" =~ ^log.\{.source\(net.+?destination\(remote.+?\; ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
    }

    ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_hosts