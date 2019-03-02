# !/bin/bash

# echo -e "\e[92m== 5.3.3 Ensure password reuse is limited ==\n"

ensure_password_reuse_is_limited () {
    if [[ "$(egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/common-password 2>/dev/null | cut -d \= -f2)" -gt 4 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_password_reuse_is_limited