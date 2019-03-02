# !/bin/bash

# echo -e "\e[92m== 5.3.4 Ensure password hashing algorithm is SHA-512 ==\n"

ensure_password_hashing_algorithm_is_sha_512 () {
    if [[ "$(egrep '^password\s+\S+\s+pam_unix.so' /etc/pam.d/common-password 2>/dev/null)" =~ password.+?sha512+$ ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_password_hashing_algorithm_is_sha_512