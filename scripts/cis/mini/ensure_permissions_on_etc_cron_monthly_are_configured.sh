# !/bin/bash

# echo -e "\e[92m== 5.1.6 Ensure permissions on /etc/cron.monthly are configured ==\n"


ensure_permissions_on_etc_cron_monthly_are_configured () {
    if [[ "$(stat -c %a /etc/cron.monthly 2>/dev/null)" = "600" || "$(stat -c %a /etc/cron.monthly 2>/dev/null)" = "700" && "$(stat -c %U:%G /etc/cron.monthly 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_cron_monthly_are_configured