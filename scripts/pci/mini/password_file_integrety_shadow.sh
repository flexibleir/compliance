#!/bin/bash

password_file_integrety_shadow() {
    if [[ "$(stat -c %a /etc/shadow | grep 640)" ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

password_file_integrety_shadow
