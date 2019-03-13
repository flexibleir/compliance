# !/bin/bash

# echo -e "\e[92m== 6.1.12 Ensure no ungrouped files or directories exist ==\n"

ensure_no_ungrouped_files_or_directories_exist () {
    if [[ "$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_no_ungrouped_files_or_directories_exist