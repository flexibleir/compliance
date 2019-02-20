# !/bin/bash

# echo -e "\e[92m== 3.2.8 Ensure TCP SYN Cookies is enabled ==\n"

ensure_tcp_syn_cookies_is_enabled () {
    if [[ "$(sysctl net.ipv4.tcp_syncookies)" = "net.ipv4.tcp_syncookies = 1" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_tcp_syn_cookies_is_enabled