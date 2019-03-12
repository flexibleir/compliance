# !/bin/bash

# echo -e "\e[92m== 6.1.11 Ensure no unowned files or directories exist ==\n"

ensure_no_unowned_files_or_directories_exist () {
    if [[ "$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_no_unowned_files_or_directories_exist