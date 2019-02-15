# !/bin/bash

# echo -e "\e[92m== 3.2.6 Ensure bogus ICMP responses are ignored ==\n"

ensure_bogus_icmp_responses_are_ignored () {
	if [[ "$(sysctl net.ipv4.icmp_ignore_bogus_error_responses)" = "net.ipv4.icmp_ignore_bogus_error_responses = 1" ]]
         then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_bogus_icmp_responses_are_ignored