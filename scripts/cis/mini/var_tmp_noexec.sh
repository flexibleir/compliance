
# !/bin/bash

#echo -e "\e[92m== 1.1.9 Ensure noexec option set on /var/tmp partition ==\e\n"


var_tmp_noexec () {
        if [[ "$(mount | grep /var/tmp)" = */var/tmp.type.+?noexec.* ]]
                then echo "Passed"
        else
                echo "Failed"

        fi
}

var_tmp_noexec