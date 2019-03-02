# !/bin/bash

# echo -e "\e[92m== 5.1.1 Ensure cron daemon is enabled ==\n"

ensure_cron_daemon_is_enabled () {
    if [[ "$(systemctl is-enabled crond 2>/dev/null)" = "enabled" || "$(systemctl is-enabled cron 2>/dev/null)" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_cron_daemon_is_enabled