# !/bin/bash

# echo -e "\e[92m== 3.1.1 Ensure IP forwarding is disabled ==\n"


ensure_ip_forwarding_is_disabled () {
    if [[ "$(sysctl net.ipv4.ip_forward)" = "net.ipv4.ip_forward = 0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ip_forwarding_is_disabled