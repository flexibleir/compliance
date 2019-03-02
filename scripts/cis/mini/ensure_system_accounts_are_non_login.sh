# !/bin/bash

# echo -e "\e[92m== 5.4.2 Ensure system accounts are non-login ==\n"

ensure_system_accounts_are_non_login () {
    if [[ "$(egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<1000 && $7!="/usr/sbin/nologin" && $7!="/bin/false") {print}')" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_system_accounts_are_non_login