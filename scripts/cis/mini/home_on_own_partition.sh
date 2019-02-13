
# !/bin/bash

#echo -e "\e[92m== 1.1.12 Ensure separate partition exists for /home  ==\e\n"


home_on_own_partition () {
        if [[ "$(mount | grep /home)" = */home.type* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

home_on_own_partition