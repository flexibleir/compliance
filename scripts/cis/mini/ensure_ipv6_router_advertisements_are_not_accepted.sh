# !/bin/bash

# echo -e "\e[92m== 3.3.1 Ensure IPv6 router advertisements are not accepted (Not Scored) ==\n"


ensure_ipv6_router_advertisements_are_not_accepted () {
    if [[ "$(sysctl net.ipv6.conf.all.accept_ra)" = "net.ipv6.conf.all.accept_ra = 0" && "$(sysctl net.ipv6.conf.default.accept_ra)" = "net.ipv6.conf.default.accept_ra = 0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ipv6_router_advertisements_are_not_accepted