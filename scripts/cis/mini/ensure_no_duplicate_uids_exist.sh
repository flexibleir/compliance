# !/bin/bash

# echo -e "\e[92m== 6.2.16 Ensure no duplicate UIDs exist ==\n"


ensure_no_duplicate_uids_exist () {
		output=$(cat /etc/passwd | cut -f3 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
                    users=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs`
                   echo "Duplicate UID ($2): ${users}"
               fi
        done)

		if [[ $output = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_no_duplicate_uids_exist