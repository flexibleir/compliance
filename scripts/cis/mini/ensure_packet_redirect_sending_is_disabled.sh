# !/bin/bash

# echo -e "\e[92m== 3.1.2 Ensure packet redirect sending is disabled ==\n"


ensure_packet_redirect_sending_is_disabled () {
	if [[ "$(sysctl net.ipv4.conf.all.send_redirects)" = "net.ipv4.conf.all.send_redirects = 0" && "$(sysctl net.ipv4.conf.default.send_redirects)" = "net.ipv4.conf.default.send_redirects = 0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_packet_redirect_sending_is_disabled