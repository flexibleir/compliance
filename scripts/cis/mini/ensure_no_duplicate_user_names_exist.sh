# !/bin/bash

# echo -e "\e[92m== 6.2.18 Ensure no duplicate user names exist ==\n"

ensure_no_duplicate_user_names_exist () {
    output=$(cat /etc/passwd | cut -f1 -d":" | sort -n | uniq -c | while read x ; do
        [ -z "${x}" ] && break
        set - $x
           if [ $1 -gt 1 ]; then
                uids=`awk -F: '($1 == n) { print $3 }' n=$2 /etc/passwd | xargs`
                echo "Duplicate User Name ($2): ${uids}"
            fi done)
    if [[ $output = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_no_duplicate_user_names_exist