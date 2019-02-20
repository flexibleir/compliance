# !/bin/bash

# echo -e "\e[92m== 3.3.2 Ensure IPv6 redirects are not accepted ==\n"


ensure_ipv6_redirects_are_not_accepted () {
    if [[ "$(sysctl net.ipv6.conf.all.accept_redirects)" = "net.ipv6.conf.all.accept_redirect = 0" && "$(sysctl net.ipv6.conf.default.accept_redirects)" = "net.ipv6.conf.default.accept_redirect = 0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ipv6_redirects_are_not_accepted