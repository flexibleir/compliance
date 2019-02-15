# !/bin/bash

# echo -e "\e[92m== 3.2.2 Ensure ICMP redirects are not accepted ==\n"


ensure_icmp_redirects_are_not_accepted () {
	if [[ "$(sysctl net.ipv4.conf.all.accept_redirects)" = "net.ipv4.conf.all.accept_redirects = 0" && "$(sysctl net.ipv4.conf.default.accept_redirects)" = "net.ipv4.conf.default.accept_redirects = 0" ]]
        then echo -e "Passed!\n"
    else
        echo -e  "Failed"
    fi
}

ensure_icmp_redirects_are_not_accepted