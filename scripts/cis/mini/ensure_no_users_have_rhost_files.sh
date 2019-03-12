# !/bin/bash

# echo -e "\e[92m== 6.2.14 Ensure no users have .rhosts files ==\n"

ensure_no_users_have_rhost_files () {
		output=$(for dir in `cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do
		  for file in $dir/.rhosts; do
			      if [ ! -h "$file" -a -f "$file" ]; then
				            echo ".rhosts file in $dir"
					        fi
					done
				done)
		
        if [[ $output = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_no_users_have_rhost_files