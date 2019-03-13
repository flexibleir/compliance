# !/bin/bash

# echo -e "\e[92m== 6.1.7 Ensure permissions on /etc/shadow- are configured ==\n"

ensure_permissions_on_etc_shadow__are_configured () {
    if [[ "$(stat -c %a /etc/shadow- 2>/dev/null)" = "600" && "$(stat -c %U:%G /etc/shadow- 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_shadow__are_configured