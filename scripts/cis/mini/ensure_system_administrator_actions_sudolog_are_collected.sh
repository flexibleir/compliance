# !/bin/bash

# echo -e "\e[92m== 4.1.16 Ensure system administrator actions (sudolog) are collected ==\n"


ensure_system_administrator_actions_sudolog_are_collected () {
    if [[ "$(grep actions /etc/audit/audit.rules 2>/dev/null | grep sudo.log)" = "-w /var/log/sudo.log -p wa -k actions" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_system_administrator_actions_sudolog_are_collected
