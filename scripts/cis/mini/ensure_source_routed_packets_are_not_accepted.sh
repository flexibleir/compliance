# !/bin/bash

# echo -e "\e[92m== 3.2.1 Ensure source routed packets are not accepted ==\n"


ensure_source_routed_packets_are_not_accepted () {
	if [[ "$(sysctl net.ipv4.conf.all.accept_source_route)" = "net.ipv4.conf.all.accept_source_route = 0" && "$(sysctl net.ipv4.conf.default.accept_source_route)" = "net.ipv4.conf.default.accept_source_route = 0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_source_routed_packets_are_not_accepted