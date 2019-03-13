# !/bin/bash

# echo -e "\e[92m== 6.1.6 Ensure permissions on /etc/passwd- are configured ==\n"

ensure_permissions_on_etc_passwd__are_configured () {
    if [[ "$(stat -c %a /etc/passwd- 2>/dev/null)" = "600" && "$(stat -c %U:%G /etc/passwd- 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_passwd__are_configured