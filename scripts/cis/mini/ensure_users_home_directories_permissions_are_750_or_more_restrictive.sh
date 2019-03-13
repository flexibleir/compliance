# !/bin/bash

# echo -e "\e[92m== 6.2.8 Ensure users' home directories permissions are 750 or more restrictive ==\n"

ensure_users_home_directories_permissions_are_750_or_more_restrictive () {
    output=$(for dir in `cat /etc/passwd  | egrep -v '(root|halt|sync|shutdown)' 2>/dev/null | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do
        dirperm=`ls -ld $dir 2>/dev/null | cut -f1 -d " "`

        if [ "`echo $dirperm | cut -c6 `" != "-" ]; then
            echo "Group Write permission set on directory $dir"
        fi

        if [ "`echo $dirperm | cut -c8 `" != "-" ]; then
            echo "Other Read permission set on directory $dir"
        fi
        
        if [ "`echo $dirperm | cut -c9 `" != "-" ]; then
            echo "Other Write permission set on directory $dir"
        fi

        if [ "`echo $dirperm | cut -c10 `" != "-" ]; then
            echo "Other Execute permission set on directory $dir"
        fi
    done)
    
    if [[ $output = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_users_home_directories_permissions_are_750_or_more_restrictive