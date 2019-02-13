# !/bin/bash

#echo -e "\e[92m== 1.1.1.8 Ensure mounting of fat filesystems is disabled ==\e\n"

disable_fat () {
     
        if [[ "$(grep vfat /etc/modprobe.d/CIS.conf 2>/dev/null)" = *install* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

disable_fat