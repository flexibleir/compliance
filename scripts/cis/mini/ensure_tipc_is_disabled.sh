# !/bin/bash

# echo -e "\e[92m== 3.5.4 Ensure TIPC is disabled (Not Scored) ==\n"

ensure_tipc_is_disabled () {
    if [[ "$(modprobe -n -v tipc 2>/dev/null)" =~ install./bin/true && "$(lsmod | grep tipc)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_tipc_is_disabled