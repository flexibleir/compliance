#!/bin/bash

#echo -e "\e[92m== 1.1.1.6 Ensure mounting of squashfs filesystems is disabled ==\e\n"


disable_squashfs () {
        if [[ "$(grep squashfs /etc/modprobe.d/CIS.conf 2>/dev/null)" = *install* ]]
            then echo "Passed"
        else
            echo "Failed"
        fi
}

disable_squashfs
