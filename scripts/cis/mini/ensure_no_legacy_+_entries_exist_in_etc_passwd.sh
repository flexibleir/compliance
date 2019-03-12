# !/bin/bash

# echo -e "\e[92m== 6.2.2 Ensure no legacy \"+\" entries exist in /etc/passwd ==\n"

ensure_no_legacy_+_entries_exist_in_etc_passwd () {
    if [[ "$(grep '^+:' /etc/passwd 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_no_legacy_+_entries_exist_in_etc_passwd