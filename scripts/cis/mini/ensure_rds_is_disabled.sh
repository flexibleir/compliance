# !/bin/bash

# echo -e "\e[92m== 3.5.3 Ensure RDS is disabled (Not Scored) ==\n"


ensure_rds_is_disabled () {
    if [[ "$(modprobe -n -v rds 2>/dev/null)" =~ install./bin/true && "$(lsmod | grep rds)" = "" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_rds_is_disabled