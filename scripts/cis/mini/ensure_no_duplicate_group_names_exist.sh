# !/bin/bash

# echo -e "\e[92m== 6.2.19 Ensure no duplicate group names exist ==\n"

ensure_no_duplicate_group_names_exist () {
		output=$(cat /etc/group | cut -f1 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
			          gids=`gawk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs`
				      echo "Duplicate Group Name ($2): ${gids}"
              fi 
        done)
		
        if [[ $output = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_no_duplicate_group_names_exist