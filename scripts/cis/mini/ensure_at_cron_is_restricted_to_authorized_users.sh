# !/bin/bash

# echo -e "\e[92m== 5.1.8 Ensure at/cron is restricted to authorized users  ==\n"

ensure_at_cron_is_restricted_to_authorized_users () {
    if [[ ! -f /etc/cron.deny && ! -f /etc/at.deny && "$(stat -c %a /etc/at.allow 2>/dev/null)" = "600" || "$(stat -c %a /etc/at.allow 2>/dev/null)" = "700" && "$(stat -c %U:%G /etc/at.allow 2>/dev/null)" = "root:root" && "$(stat -c %a /etc/cron.allow 2>/dev/null)" = "600" || "$(stat -c %a /etc/cron.allow 2>/dev/null)" = "700" && "$(stat -c %U:%G /etc/cron.allow 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_at_cron_is_restricted_to_authorized_users