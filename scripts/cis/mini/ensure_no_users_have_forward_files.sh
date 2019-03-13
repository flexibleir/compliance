# !/bin/bash

# echo -e "\e[92m== 6.2.11 Ensure no users have .forward files ==\n"

ensure_no_users_have_forward_files () {
 	output=$(for dir in `cat /etc/passwd |\
		awk -F: '{ print $6 }'`; do
		  if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then
			echo ".forward file $dir/.forward exists"
		fi
	done)
	
	if [[ $output = "" ]]
		then echo -e "Passed"
	else
		echo -e "Failed"
	fi
}

ensure_no_users_have_forward_files