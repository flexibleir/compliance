# !/bin/bash

# echo -e "\e[92m== 3.5.2 Ensure SCTP is disabled (Not Scored) ==\n"


ensure_sctp_is_disabled () {
    if [[ "$(modprobe -n -v sctp 2>/dev/null)" =~ install./bin/true && "$(lsmod | grep sctp)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_sctp_is_disabled