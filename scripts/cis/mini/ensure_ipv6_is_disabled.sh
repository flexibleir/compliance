# !/bin/bash

# echo -e "\e[92m== 3.3.3 Ensure IPv6 is disabled (Not Scored) ==\n"


ensure_ipv6_is_disabled () {
    if [[ "$(grep GRUB_CMDLINE_LINUX /etc/default/grub 2>/dev/null)" =~ GRUB_CMDLINE_LINUX=.+?ipv6.disable=1 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ipv6_is_disabled