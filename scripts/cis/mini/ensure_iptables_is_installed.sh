# !/bin/bash

# echo -e "\e[92m== 3.6.1 Ensure iptables is installed ==\n"


ensure_iptables_is_installed () {
    if [[ "$(dpkg -s iptables 2>/dev/null | grep Status)" =~ "Status: install ok" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_iptables_is_installed