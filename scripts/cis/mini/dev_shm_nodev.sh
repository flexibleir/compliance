

# !/bin/bash

#echo -e "\e[92m== 1.1.14 Ensure nodev option set on /dev/shm partition ==\e\n"


dev_shm_nodev () {
        if [[ "$(mount | grep /dev/shm)" = *on./dev/shm.type.+?nodev.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

dev_shm_nodev
        