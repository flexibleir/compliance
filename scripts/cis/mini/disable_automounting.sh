# !/bin/bash

#echo -e "\e[92m== 1.1.21 Disable Automounting ==\e\n"

disable_automounting () {
	if [[ "$(systemctl is-enabled autofs 2> /dev/null)" = "enabled" ]]
		then echo -e "Failed"
	else
		echo -e "Passed"
	fi
}

disable_automounting