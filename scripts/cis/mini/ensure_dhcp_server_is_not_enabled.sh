# !/bin/bash

# echo -e "\e[92m== 2.2.5 Ensure DHCP Server is not enabled ==\n"

ensure_dhcp_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled isc-dhcp-server 2>/dev/null)" = "" || "$(systemctl is-enabled isc-dhcp-server)" = "disabled" || "$(systemctl is-enabled isc-dhcp-server)" = "masked" && "$(systemctl is-enabled isc-dhcp-server6 2>/dev/null)" = "" || "$(systemctl is-enabled isc-dhcp-server6)" = "disabled" || "$(systemctl is-enabled isc-dhcp-server6)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_dhcp_server_is_not_enabled