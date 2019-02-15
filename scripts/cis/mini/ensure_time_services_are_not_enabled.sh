# !/bin/bash

# echo -e "\e[92m== 2.1.5 Ensure time services are not enabled ==\n"

ensure_time_services_are_not_enabled () {
		if [[ "$(grep -R "^time" /etc/inetd.* 2>/dev/null)" = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_time_services_are_not_enabled