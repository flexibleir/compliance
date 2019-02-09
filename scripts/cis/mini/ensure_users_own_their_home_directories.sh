#!/bin/bash

ensure_users_own_their_home_directories() {
	output=$(cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
		if [ $uid -ge 1000 -a -d "$dir" -a $user != "nfsnobody" ]; then
			owner=$(stat -L -c "%U" "$dir")
		fi
	done )

	if [[ $output == "" ]]; then
		echo -e "Passed"
	else
		echo -e "Failed"
	fi
}

ensure_users_own_their_home_directories