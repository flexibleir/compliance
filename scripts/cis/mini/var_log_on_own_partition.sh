
# !/bin/bash

#echo -e "\e[92m== 1.1.10 Ensure separate partition exists for /var/log  ==\e\n"


var_log_on_own_partition () {
        if [[ "$(mount | grep /var/log)" = */var/log.type* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi
}

var_log_on_own_partition