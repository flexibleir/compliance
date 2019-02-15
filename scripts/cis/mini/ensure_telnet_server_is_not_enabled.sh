# !/bin/bash

# echo -e "\e[92m== 2.1.8 Ensure telnet server is not enabled ==\n"


ensure_telnet_server_is_not_enabled () {
	if [[ "$(grep -R "^telnet" /etc/inetd.* 2>/dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_telnet_server_is_not_enabled