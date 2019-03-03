# !/bin/bash

# echo -e "\e[92m== 5.4.1.1 Ensure password expiration is 90 days or less ==\n"

ensure_password_expiration_is_90_days_or_less () {
    if [[ "$(grep -oP "(?<=^PASS_MAX_DAYS\s).+$" /etc/login.defs 2>/dev/null)" -lt 91 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_password_expiration_is_90_days_or_less