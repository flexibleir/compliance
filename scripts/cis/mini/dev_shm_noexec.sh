
# !/bin/bash

#echo -e "\e[92m== 1.1.16 Ensure noexec option set on /dev/shm partition ==\e\n"

dev_shm_noexec () {
        if [[ "$(mount | grep /dev/shm)" = */dev/shm.type.+?noexec.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

dev_shm_noexec