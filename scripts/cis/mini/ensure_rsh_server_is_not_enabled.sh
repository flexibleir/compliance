# !/bin/bash

# echo -e "\e[92m== 2.1.6 Ensure rsh server is not enabled ==\n"

ensure_rsh_server_is_not_enabled () {
		if [[ "$(grep -R "^shell" /etc/inetd.* 2>/dev/null)" = "" && "$(grep -R "^login" /etc/inetd.* 2>/dev/null)" = "" && "$(grep -R "^exec" /etc/inetd.* 2>/dev/null)" = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_rsh_server_is_not_enabled