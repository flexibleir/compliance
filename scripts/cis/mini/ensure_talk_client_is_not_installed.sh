# !/bin/bash

# echo -e "\e[92m== 2.3.3 Ensure talk client is not installed ==\n"


ensure_talk_client_is_not_installed () {
    if [[ "$(dpkg -s talk 2>/dev/null | grep Status)" = "" || "$(dpkg -s talk 2>/dev/null | grep Status)" =~ ^Status:.deinstall ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_talk_client_is_not_installed