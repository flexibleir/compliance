# !/bin/bash

# echo -e "\e[92m== 3.2.4 Ensure suspicious packets are logged ==\n"

ensure_suspicious_packets_are_logged () {
    if [[ "$(sysctl net.ipv4.conf.all.log_martians)" = "net.ipv4.conf.all.log_martians = 1" && "$(sysctl net.ipv4.conf.default.log_martians)" = "net.ipv4.conf.default.log_martians = 1" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_suspicious_packets_are_logged