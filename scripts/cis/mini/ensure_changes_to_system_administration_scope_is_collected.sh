# !/bin/bash

# echo -e "\e[92m== 4.1.15 Ensure changes to system administration scope (sudoers) is collected ==\n"


ensure_changes_to_system_administration_scope_is_collected () {
    if [[ "$(grep scope /etc/audit/audit.rules 2>/dev/null | grep "sudoers ")" = "-w /etc/sudoers -p wa -k scope" && "$(grep scope /etc/audit/audit.rules 2>/dev/null | grep "sudoers.d")" = "-w /etc/sudoers.d -p wa -k scope" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_changes_to_system_administration_scope_is_collected