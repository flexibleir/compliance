# !/bin/bash

# echo -e "\e[92m== 2.1.1 Ensure chargen services are not enabled ==\e\n"


ensure_chargen_services_are_not_enabled () {
		if [[ "$(grep -R "^chargen" /etc/inetd.* 2> /dev/null)" = "" ]]
                then echo -e "Passed"
		else
                echo -e "Failed"
        fi
}

ensure_chargen_services_are_not_enabled