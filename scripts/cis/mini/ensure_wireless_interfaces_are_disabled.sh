# !/bin/bash

# echo -e "\e[92m== 3.7 Ensure wireless interfaces are disabled (Not Scored) ==\n"


ensure_wireless_interfaces_are_disabled () {
    if [[ "$(iwconfig 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_wireless_interfaces_are_disabled