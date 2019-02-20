# !/bin/bash

# echo -e "\e[92m== 4.1.11 Ensure unsuccessful unauthorized file access attempts are collected ==\n"


ensure_unsuccessful_unauthorized_file_access_attempts_are_collected () {
    if [[ "$(grep access /etc/audit/audit.rules 2>/dev/null | grep EACCES | grep access)" =~  a.always,exit.+?EACCES..F.+?access && "$(grep access /etc/audit/audit.rules 2>/dev/null | grep EPERM | grep access)" =~ a.always,exit.+?EPERM..F.+?access ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_unsuccessful_unauthorized_file_access_attempts_are_collected