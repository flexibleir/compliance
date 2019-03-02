# !/bin/bash

# echo -e "\e[92m== 4.2.2.3 Ensure syslog-ng default file permissions configured ==\n"

ensure_syslog_ng_default_file_permissions_configured () {
    if [[ "$(grep ^options /etc/syslog-ng/syslog-ng.conf 2>/dev/null)" = "options { chain_hostnames(off); flush_lines(0); perm(0640); stats_freq(3600); threaded(yes); };" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_syslog_ng_default_file_permissions_configured