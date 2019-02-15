# !/bin/bash

# echo -e "\e[92m== 2.3.2 Ensure rsh client is not installed ==\n"

ensure_rsh_client_is_not_installed () {
    if [[ "$(dpkg -s rsh-client 2>/dev/null | grep Status)" = "" || "$(dpkg -s rsh-client 2>/dev/null | grep Status)" =~ ^Status:.deinstall && "$(dpkg -s rsh-redone-client 2>/dev/null | grep Status)" = "" || "$(dpkg -s rsh-redone-client 2>/dev/null | grep Status)" =~ ^Status:.deinstall ]]
        then echo -e "Passed"
    else
        echo -e "Failed" 
    fi
}

ensure_rsh_client_is_not_installed