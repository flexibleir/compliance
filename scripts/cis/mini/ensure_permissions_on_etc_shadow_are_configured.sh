# !/bin/bash

# echo -e "\e[92m== 6.1.3 Ensure permissions on /etc/shadow are configured ==\n"

ensure_permissions_on_etc_shadow_are_configured () {
    if [[ "$(stat -c %a /etc/shadow 2>/dev/null)" = "640" && "$(stat -c %U:%G /etc/shadow 2>/dev/null)" = "root:shadow" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_shadow_are_configured