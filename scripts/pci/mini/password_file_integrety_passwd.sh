#!/bin/bash

password_file_integrety_passwd() {
    if [[ "$(stat -c %a /etc/passwd | grep 644)" != "" ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

password_file_integrety_passwd
