# !/bin/bash

# echo -e "\e[92m== 6.2.15  Ensure all groups in /etc/passwd exist in /etc/group ==\n"

ensure_all_groups_in_etc_passwd_exist_in_etc_group () {
		output=$(for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
		  grep -q -P "^.*?:[^:]*:$i:" /etc/group
		    if [ $? -ne 0 ]; then
			        echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
			fi
		done)
		
		if [[ $output = "" ]]
			then echo -e "Passed"
		else
			echo -e "Failed"
		fi
}

ensure_all_groups_in_etc_passwd_exist_in_etc_group
            