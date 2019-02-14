# !/bin/bash

# echo -e "\e[92m== 2.1.3 Ensure discard services are not enabled ==\n"

ensure_discard_services_are_not_enabled () {
		if [[ "$(grep -R "^discard" /etc/inetd.* 2>/dev/null)" = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_discard_services_are_not_enabled