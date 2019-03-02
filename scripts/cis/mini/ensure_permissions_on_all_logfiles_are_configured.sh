# !/bin/bash

# echo -e "\e[92m== 4.2.4 Ensure permissions on all logfiles are configured ==\n"

ensure_permissions_on_all_logfiles_are_configured () {
    if [[ "$(find /var/log/ -type f -perm /o+x 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_all_logfiles_are_configured