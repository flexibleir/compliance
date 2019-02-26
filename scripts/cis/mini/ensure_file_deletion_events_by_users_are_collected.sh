# !/bin/bash

# echo -e "\e[92m== 4.1.14 Ensure file deletion events by users are collected ==\n"


ensure_file_deletion_events_by_users_are_collected () {
    if [[ "$(grep delete /etc/audit/audit.rules 2>/dev/null)" =~ \-a.always,exit.+?arch.+delete ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_file_deletion_events_by_users_are_collected