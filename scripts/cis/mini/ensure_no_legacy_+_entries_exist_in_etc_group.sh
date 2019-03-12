# !/bin/bash

# echo -e "\e[92m== 6.2.4 Ensure no legacy \"+\" entries exist in /etc/group ==\n"

ensure_no_legacy_+_entries_exist_in_etc_group () {
    if [[ "$(grep '^+:' /etc/group 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_no_legacy_+_entries_exist_in_etc_group