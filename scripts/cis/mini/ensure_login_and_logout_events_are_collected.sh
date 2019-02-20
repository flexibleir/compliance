# !/bin/bash

# echo -e "\e[92m== 4.1.8 Ensure login and logout events are collected ==\n"


ensure_login_and_logout_events_are_collected () {
    if [[ "$(grep logins /etc/audit/audit.rules 2>/dev/null)" != "" && "$(grep logins /etc/audit/audit.rules 2>/dev/null | grep faillog)" = "-w /var/log/faillog -p wa -k logins" && "$(grep logins /etc/audit/audit.rules 2>/dev/null | grep lastlog)" = "-w /var/log/lastlog -p wa -k logins" && "$(grep logins /etc/audit/audit.rules 2>/dev/null | grep tallylog)" = "-w /var/log/tallylog -p wa -k logins" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_login_and_logout_events_are_collected