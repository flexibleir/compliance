# !/bin/bash

# echo -e "\e[92m== 3.2.3 Ensure secure ICMP redirects are not accepted ==\n"

ensure_secure_icmp_redirects_are_not_accepted () {
    if [[ "$(sysctl net.ipv4.conf.all.secure_redirects)" = "net.ipv4.conf.all.secure_redirects = 0" && "$(sysctl net.ipv4.conf.default.secure_redirects)" = "net.ipv4.conf.default.secure_redirects = 0" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_secure_icmp_redirects_are_not_accepted