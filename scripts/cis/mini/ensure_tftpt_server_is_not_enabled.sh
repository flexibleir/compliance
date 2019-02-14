# !/bin/bash

# echo -e "\e[92m== 2.1.9 Ensure tftp server is not enabled ==\n"

ensure_tftpt_server_is_not_enabled () {
	if [[ "$(grep -R "^tftp" /etc/inetd.* 2> /dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_tftpt_server_is_not_enabled