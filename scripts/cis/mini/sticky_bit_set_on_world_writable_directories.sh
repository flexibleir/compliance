# !/bin/bash

#echo -e "\e[92m== 1.1.20 Ensure sticky bit is set on all world-writable directories ==\e\n"

sticky_bit_set_on_world_writable_directories () {
	if [[ "$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null)" = "" ]]
		then echo -e "Passed"
	else
            echo "Failed"
    fi
}

sticky_bit_set_on_world_writable_directories