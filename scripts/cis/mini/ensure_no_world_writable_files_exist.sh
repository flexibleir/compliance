# !/bin/bash

# echo -e "\e[92m== 6.1.10 Ensure no world writable files exist ==\n"

ensure_no_world_writable_files_exist () {
    if [[ "$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_no_world_writable_files_exist