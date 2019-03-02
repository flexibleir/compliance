# !/bin/bash

# echo -e "\e[92m== 5.4.1.3 Ensure password expiration warning days is 7 or more ==\n"

ensure_password_expiration_warning_is_7_days_or_more () {
    if [[ "$(grep -oP "(?<=^PASS_WARN_AGE\s).+$" /etc/login.defs 2>/dev/null)" -gt 6 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_password_expiration_warning_is_7_days_or_more