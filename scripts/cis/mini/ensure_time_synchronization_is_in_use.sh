# !/bin/bash

# echo -e "\e[92m== 2.2.1.1 Ensure time synchronization is in use (Not Scored) ==\n"


ensure_time_synchronization_is_in_use () {
	if [[ "$(dpkg -s ntp 2> /dev/null | grep Status)" = "Status: install ok installed" || "$(dpkg -s chrony 2>/dev/null | grep Status)" = "Status: install ok installed" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_time_synchronization_is_in_use