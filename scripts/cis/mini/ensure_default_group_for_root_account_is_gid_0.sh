# !/bin/bash

# echo -e "\e[92m== 5.4.3 Ensure default group for the root account is GID 0 ==\n"

ensure_default_group_for_root_account_is_gid_0 () {
    if [[ "$(grep ^root: /etc/passwd | cut -f4 -d:)" = "0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_default_group_for_root_account_is_gid_0