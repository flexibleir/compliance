# !/bin/bash

#echo -e "\e[92m== 1.4.3 Ensure authentication required for single user mode ==\e\n"


ensure_auth_required_for_single_user_mode () {
	if [[ "$(grep ^root:[*\!]: /etc/shadow)" = "" ]]
	    then echo -e "Passed"
	else
            echo -e "Failed"
    fi
}

ensure_auth_required_for_single_user_mode