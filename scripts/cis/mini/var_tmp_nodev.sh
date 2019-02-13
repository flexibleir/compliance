# !/bin/bash

#echo -e "\e[92m== 1.1.7 Ensure nodev option set on /var/tmp partition ==\e\n"


var_tmp_nodev () {
        if [[ "$(mount | grep /var/tmp)" = *on./var/tmp.type.+?nodev.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

var_tmp_nodev