# !/bin/bash

# echo -e "\e[92m== 6.2.7 Ensure all users' home directories exist ==\n"

ensure_all_users_home_directories_exist () {
    output=$(cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
        if [ $uid -ge 1000 -a ! -d "$dir" -a $user != "nfsnobody" ]; then
                echo "The home directory ($dir) of user $user does not exist."
        fi
    done)
    
    if [[ $output = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_all_users_home_directories_exist