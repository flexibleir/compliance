# !/bin/bash


# echo -e "\e[92m== 3.2.5 Ensure broadcast ICMP requests are ignored ==\n"

ensure_broadcast_icmp_requests_are_ignored () {
	if [[ "$(sysctl net.ipv4.icmp_echo_ignore_broadcasts)" = "net.ipv4.icmp_echo_ignore_broadcasts = 1" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_broadcast_icmp_requests_are_ignored