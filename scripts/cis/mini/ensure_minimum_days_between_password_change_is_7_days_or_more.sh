# !/bin/bash

# echo -e "\e[92m== 5.4.1.2 Ensure minimum days between password changes is 7 or more ==\n"

ensure_minimum_days_between_password_change_is_7_days_or_more () {
    if [[ "$(grep -oP "(?<=^PASS_MIN_DAYS\s).+$" /etc/login.defs 2>/dev/null)" -gt 6 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_minimum_days_between_password_change_is_7_days_or_more