
# !/bin/bash

#echo -e "\e[92m== 1.1.13 Ensure nodev option set on /home partition ==\e\n"


home_nodev () {
        if [[ "$(mount | grep /home)" = *on./home.type.+?nodev.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

home_nodev