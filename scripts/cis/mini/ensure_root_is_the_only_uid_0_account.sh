# !/bin/bash

# echo -e "\e[92m== 6.2.5 Ensure root is the only UID 0 account ==\n"

ensure_root_is_the_only_uid_0_account () {
    if [[ "$(cat /etc/passwd | awk -F: '($3 == 0) { print $1 }')" = "root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_root_is_the_only_uid_0_account