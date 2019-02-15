# !/bin/bash

#echo -e "\e[92m== 1.5.2 Ensure XD/NX support is enabled (Not Scored) ==\e\n"

ensure_xd_nd_support_is_disabled () {
		if [[ "$(dmesg | grep NX | grep active)" != "" ]]
			then echo -e "Passed"
		else
                echo -e "Failed"
        fi
}

ensure_xd_nd_support_is_disabled