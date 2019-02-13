
# !/bin/bash

#echo -e "\e[92m== 1.1.3 Ensure nodev option set on /tmp partition ==\e\n"


tmp_nodev () {
	if [[ "$(mount | grep /tmp)" = *on./tmp.type.+?nodev.* ]]
		then echo "Passed"
	else
        echo "Failed"
    fi
}

tmp_nodev