# !/bin/bash

# echo -e "\e[92m== 2.3.4 Ensure telnet client is not installed ==\n"


ensure_telnet_client_is_not_installed () {
    if [[ "$(dpkg -s telnet 2>/dev/null | grep Status)" = "" || "$(dpkg -s telnet 2>/dev/null | grep Status)" =~ ^Status:.deinstall* ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_telnet_client_is_not_installed