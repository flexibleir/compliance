

# !/bin/bash

#echo -e "\e[92m== 1.1.8 Ensure nosuid option set on /var/tmp partition ==\e\n"


var_tmp_nosuid () {
        if [[ "$(mount | grep /var/tmp)" = */var/tmp.type.+?nosuid.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

var_tmp_nosuid