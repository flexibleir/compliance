#!/bin/bash

ensure_users_dot_files_are_not_group_or_world_writable() {
    output=$(for dir in $(cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'); do
        for file in $dir/.[A-Za-z0-9]*; do
            if [ ! -h "$file" -a -f "$file" ]; then
                fileperm=$(ls -ld $file 2>/dev/null | cut -f1 -d" ")
            fi
        done
    done)

    if [[ $output == "" ]]; then
        echo -e "Passed"
    else
        echo -e "Failed"
    fi

}

ensure_users_dot_files_are_not_group_or_world_writable
