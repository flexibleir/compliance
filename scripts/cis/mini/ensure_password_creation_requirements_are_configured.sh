# !/bin/bash

# echo -e "\e[92m== 5.3.1 Ensure password creation requirements are configured ==\n"

ensure_password_creation_requirements_are_configured () {
    if [[ "$(grep pam_pwquality.so /etc/pam.d/common-password 2>/dev/null)" = "password requisite pam_pwquality.so try_first_pass retry=3" && "$(grep ^minlen /etc/security/pwquality.conf 2>/dev/null | cut -d \= -f2)" -gt 13 && "$(grep ^dcredit /etc/security/pwquality.conf 2>/dev/null | cut -d \= -f2)" -gt -2 && "$(grep ^lcredit /etc/security/pwquality.conf 2>/dev/null | cut -d \= -f2)" -gt -2 && "$(grep ^ocredit /etc/security/pwquality.conf 2>/dev/null | cut -d \= -f2)" -gt -2 && "$(grep ^ucredit /etc/security/pwquality.conf 2>/dev/null | cut -d \= -f2)" -gt -2 ]]
		then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_password_creation_requirements_are_configured