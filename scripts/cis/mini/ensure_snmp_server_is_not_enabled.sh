# !/bin/bash

# echo -e "\e[92m== 2.2.14 Ensure SNMP Server is not enabled ==\n"

ensure_snmp_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled snmpd 2>/dev/null)" = "" || "$(systemctl is-enabled snmpd 2> /dev/null)" = "disabled" || "$(systemctl is-enabled snmpd 2> /dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_snmp_server_is_not_enabled