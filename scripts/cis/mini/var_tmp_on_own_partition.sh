

# !/bin/bash

# echo -e "\e[92m== 1.1.6 Ensure separate partition exists for /var/tmp  ==\e\n"


var_tmp_on_own_partition () {
        if [[ "$(mount | grep /var/tmp)" = */var/tmp.type* ]]
                then echo "Passed!"
        else
                echo "Failed"

        fi
}

var_tmp_on_own_partition