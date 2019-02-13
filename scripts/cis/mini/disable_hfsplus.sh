#!/bin/bash

#echo -e "\e[92m== 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled ==\e\n"


disable_hfsplus () {
        if [[ "$(modprobe -n -v hfsplus 2>/dev/null)" = *install* ]]
                then echo "Passed"
        else
            echo  "Failed"
        fi
}

disable_hfsplus 
