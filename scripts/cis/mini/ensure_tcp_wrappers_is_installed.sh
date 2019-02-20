# !/bin/bash

# echo -e "\e[92m== 3.4.1 Ensure TCP Wrappers is installed ==\n"


ensure_tcp_wrappers_is_installed () {
    if [[ "$(dpkg -s tcpd 2>/dev/null | grep Status)" = "" || "$(dpkg -s tcpd 2>/dev/null | grep Status)" =~ ^Status:.install* ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_tcp_wrappers_is_installed