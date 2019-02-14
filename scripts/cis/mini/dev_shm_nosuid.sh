
# !/bin/bash

#echo -e "\e[92m== 1.1.15 Ensure nosuid option set on /dev/shm partition ==\e\n"


dev_shm_nosuid () {
        if [[ "$(mount | grep /dev/shm)" = */dev/shm.type.+?nosuid.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

dev_shm_nosuid 