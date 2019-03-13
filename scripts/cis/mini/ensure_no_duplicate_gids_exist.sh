# !/bin/bash

# echo -e "\e[92m== 6.2.17 Ensure no duplicate GIDs exist ==\n"


ensure_no_duplicate_gids_exist () {
		output=$(cat /etc/group | cut -f3 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
			          groups=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/group | xargs`
				      echo "Duplicate GID ($2): ${groups}"
              fi
        done)

		if [[ $output = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_no_duplicate_gids_exist