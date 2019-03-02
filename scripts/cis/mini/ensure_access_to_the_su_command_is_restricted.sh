# !/bin/bash

# echo -e "\e[92m== 5.6 Ensure access to the su command is restricted ==\n"

ensure_access_to_the_su_command_is_restricted () {
    if [[ "$(grep pam_wheel.so /etc/pam.d/su)" = "auth required pam_wheel.so use_uid" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_access_to_the_su_command_is_restricted