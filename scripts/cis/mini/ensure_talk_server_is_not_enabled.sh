# !/bin/bash

# echo -e "\e[92m== 2.1.7 Ensure talk server is not enabled ==\n"

ensure_talk_server_is_not_enabled () {
    if [[ "$(grep -R "^talk" /etc/inetd.* 2>/dev/null)" = "" && "$(grep -R "^ntalk" /etc/inetd.* 2> /dev/null)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_talk_server_is_not_enabled