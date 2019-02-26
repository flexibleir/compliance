# !/bin/bash

# echo -e "\e[92m== 4.1.13 Ensure successful file system mounts are collected ==\n"


ensure_successful_file_system_mounts_are_collected () {
    if [[ "$(grep mounts /etc/audit/audit.rules 2>/dev/null)" =~ \-a.always,exit.-F.arch.+?k.mounts ]]
        then echo -e "Passed"
    else
        echo "Failed"
    fi
}

ensure_successful_file_system_mounts_are_collected