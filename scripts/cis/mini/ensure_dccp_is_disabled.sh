# !/bin/bash

# echo -e "\e[92m== 3.5.1 Ensure DCCP is disabled (Not Scored) ==\n"


ensure_dccp_is_disabled () {
    if [[ "$(modprobe -n -v dccp 2>/dev/null)" =~ install./bin/true && "$(lsmod | grep dccp)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_dccp_is_disabled