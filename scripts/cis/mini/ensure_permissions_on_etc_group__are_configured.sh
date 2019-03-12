# !/bin/bash

# echo -e "\e[92m== 6.1.8 Ensure permissions on /etc/group- are configured ==\n"

ensure_permissions_on_etc_group__are_configured () {
    if [[ "$(stat -c %a /etc/group- 2>/dev/null)" = "600" && "$(stat -c %U:%G /etc/group- 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_group__are_configured