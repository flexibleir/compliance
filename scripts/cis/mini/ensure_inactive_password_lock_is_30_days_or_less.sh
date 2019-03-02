# !/bin/bash

# echo -e "\e[92m== 5.4.1.4 Ensure inactive password lock is 30 days or less ==\n"

ensure_inactive_password_lock_is_30_days_or_less () {
    if [[ "$(useradd -D | grep INACTIVE | cut -d \= -f2)" -lt 31 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_inactive_password_lock_is_30_days_or_less