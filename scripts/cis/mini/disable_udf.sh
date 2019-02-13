#!/bin/bash

#echo -e "\e[92m== 1.1.1.7 Ensure mounting of udf filesystems is disabled ==\e\n"


disable_udf () {
        if [[ "$(modprobe -n -v udf 2>/dev/null)" = *install* ]]
            then echo "Passed"
        else
            echo "Failed"
        fi
}

disable_udf