
# !/bin/bash

#echo -e "\e[92m== 1.1.5 Ensure separate partition exists for /var  ==\e\n"

var_on_own_partition () {
    
        if [[ "$(mount | grep /var)" = */var.type* ]]
                then echo "Passed"
        else
                echo "Failed"
        fi  
}

var_on_own_partition