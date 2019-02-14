# !/bin/bash

# echo -e "\e[92m== 2.1.4 Ensure echo services are not enabled ==\n"


ensure_echo_services_are_not_enabled () {
		if [[ "$(grep -R "^echo" /etc/inetd.* 2> /dev/null)" = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_echo_services_are_not_enabled