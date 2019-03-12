# !/bin/bash

# echo -e "\e[92m== 6.1.5 Ensure permissions on /etc/gshadow are configured ==\n"

ensure_permissions_on_etc_gshadow_are_configured () {
    if [[ "$(stat -c %a /etc/gshadow 2>/dev/null)" = "640" && "$(stat -c %U:%G /etc/gshadow 2>/dev/null)" = "root:shadow" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_gshadow_are_configured