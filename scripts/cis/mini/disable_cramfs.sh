# !/bin/bash

#echo - e "\e[92m== 1.1.1.1 Ensure mounting of cramfs filesystems is disabled ==\e\n"

disable_cramfs () {	
	if [[ "$(modprobe -n -v cramfs 2>/dev/null)" =  *install* ]]
		then echo "Passed"
	else
		echo "Failed"
	fi
}


disable_cramfs