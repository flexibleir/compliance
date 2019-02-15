# !/bin/bash

# echo -e "\e[92m== 2.2.4 Ensure CUPS is not enabled ==\n"


ensure_cups_is_not_enabled () {
    if [[ "$(systemctl is-enabled cups 2>/dev/null)" = "" || "$(systemctl is-enabled cups 2>/dev/null)" = "disabled" || "$(systemctl is-enabled cups 2>/dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_cups_is_not_enabled