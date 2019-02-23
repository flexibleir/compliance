#!/bin/bash

password_min_len_policy() {
    passwordLen=$(sed ' /^#/ d ; /^$/d' /etc/pam.d/common-password |grep minlen=| awk -F"minlen=" '{print $2}')
    if [[ $passwordLen != "" && $passwordLen -ge 7 ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

password_min_len_policy

