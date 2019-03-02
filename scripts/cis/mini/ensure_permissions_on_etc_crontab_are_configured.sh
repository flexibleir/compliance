# !/bin/bash

# echo -e "\e[92m== 5.1.2 Ensure permissions on /etc/crontab are configured ==\n"

ensure_permissions_on_etc_crontab_are_configured () {
    if [[ "$(stat -c %a /etc/crontab 2>/dev/null)" = "600" || "$(stat -c %a /etc/crontab 2>/dev/null)" = "700" && "$(stat -c %U:%G /etc/crontab 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e  "Failed"
    fi
}

ensure_permissions_on_etc_crontab_are_configured