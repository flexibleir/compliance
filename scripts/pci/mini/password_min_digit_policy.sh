#!/bin/bash

password_min_digit() {
    passwordDig=$(sed ' /^#/ d ; /^$/d' /etc/pam.d/common-password |grep dcredit=| awk -F"dcredit=" '{print $2}')
    if [[ $passwordDig != "" && $passwordDig -ge 4 ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

password_min_digit