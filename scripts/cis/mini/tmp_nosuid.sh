
# !/bin/bash

#echo -e "\e[92m== 1.1.4 Ensure nosuid option set on /tmp partition ==\e\n"

tmp_nosuid () {
        if [[ "$(mount | grep /tmp)" = */tmp.type.+?nosuid.* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}


tmp_nosuid