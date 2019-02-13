
# !/bin/bash

#echo -e "\e[92m== 1.1.2 Ensure separate partition exists for /tmp  ==\e\n"


tmp_on_own_partition () {
	if [[ "$(mount | grep /tmp)" = *on./tmp.type* ]]
		then echo "Passed"
	else
        echo "Failed"
    fi
}

tmp_on_own_partition