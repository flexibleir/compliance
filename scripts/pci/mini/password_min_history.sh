#!/bin/bash

password_min_history() {
    passwordHis=$(sed ' /^#/ d ; /^$/d' /etc/pam.d/common-password |grep remember=| awk -F"remember=" '{print $2}')
    if [[ $passwordHis != "" && $passwordHis -ge 4 ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

password_min_history