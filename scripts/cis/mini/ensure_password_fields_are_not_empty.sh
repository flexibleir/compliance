# !/bin/bash

# echo -e "\e[92m== 6.2.1 Ensure password fields are not empty ==\n"

ensure_password_fields_are_not_empty () {
    if [[ "$(cat /etc/shadow | awk -F: '($2 == "" ) { print $1 " does not have a password "}')" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_password_fields_are_not_empty