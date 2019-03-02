# !/bin/bash

# echo -e "\e[92m== 5.3.2 Ensure lockout for failed password attempts is configured (Not Scored) ==\n"

ensure_lockout_for_failed_password_attempts_is_configured () {
    if [[ "$(grep pam_tally2 /etc/pam.d/common-auth 2>/dev/null)" = "auth required pam_tally2.so onerr=fail audit silent deny=5 unlock_time=900" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_lockout_for_failed_password_attempts_is_configured