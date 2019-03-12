# !/bin/bash

# echo -e "\e[92m== 6.1.9 Ensure permissions on /etc/gshadow- are configured ==\n"

ensure_permissions_on_etc_gshadow__are_configured () {
    if [[ "$(stat -c %a /etc/gshadow- 2>/dev/null)" = "600" && "$(stat -c %U:%G /etc/gshadow- 2>/dev/null)" = "root:root" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_permissions_on_etc_gshadow__are_configured