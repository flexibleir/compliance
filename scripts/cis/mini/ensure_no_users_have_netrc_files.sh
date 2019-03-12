# !/bin/bash

# echo -e "\e[92m== 6.2.12 Ensure no users have .netrc files ==\n"

ensure_no_users_have_netrc_files () {
		output=$(for dir in `cat /etc/passwd |\
			  awk -F: '{ print $6 }'`; do
		  if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then
			      echo ".netrc file $dir/.netrc exists"
			        fi
        done)
		if [[ $output = "" ]]
            then echo -e "Passed"
        else
                echo -e "Failed"
        fi
}