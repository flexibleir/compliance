# !/bin/bash

# echo -e "\e[92m== 6.1.2 Ensure permissions on /etc/passwd are configured ==\n"


ensure_permissions_on_etc_passwd_are_configured () {
    if [[ "$(stat -c %a /etc/passwd 2>/dev/null)" = "644" && "$(stat -c %U:%G /etc/passwd 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi

}

ensure_permissions_on_etc_passwd_are_configured