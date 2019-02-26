# !/bin/bash

# echo -e "\e[92m== 5.1.7 Ensure permissions on /etc/cron.d are configured ==\n"

ensure_permissions_on_etc_cron_d_are_configured () {
    if [[ "$(stat -c %a /etc/cron.d 2>/dev/null)" = "600" || "$(stat -c %a /etc/cron.d 2>/dev/null)" = "700" && "$(stat -c %U:%G /etc/cron.d 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_cron_d_are_configured