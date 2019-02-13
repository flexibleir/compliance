#!/bin/bash

#echo -e "\e[92m== 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled ==\e\n"

disable_jffs2 () {       
        if [[ "$(modprobe -n -v jffs2 2>/dev/null)" = *install* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}


disable_jffs2