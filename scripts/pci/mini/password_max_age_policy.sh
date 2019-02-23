#!/bin/bash

password_min_len_policy() {
    passwordMaxAge=$(sed ' /^#/ d ; /^$/d' /etc/login.defs | awk -F" " '/PASS_MAX_DAYS/{print $2}')
    if [[ $passwordMaxAge != "" && $passwordMaxAge -le 90 ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

password_min_len_policy

