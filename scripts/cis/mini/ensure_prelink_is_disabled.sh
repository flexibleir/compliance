# !/bin/bash

#echo -e "\e[92m== 1.5.4 Ensure prelink is disabled ==\e\n"


ensure_prelink_is_disabled () {
		if [[ "$(dpkg -s prelink 2>/dev/null | grep Status)" =~ 'Status: deinstall' || "$(dpkg -s prelink 2>/dev/null)" = "" ]]
    		then echo -e "Passed"
		else
                echo -e "Failed"
        fi
}

ensure_prelink_is_disabled