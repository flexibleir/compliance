# !/bin/bash

# echo -e "\e[92m== 2.1.10 Ensure xinetd is not enabled ==\n"

ensure_xinetd_is_not_enabled () {
	if [[ "$(systemctl is-enabled xinetd 2>/dev/null)" = "disabled" || "$(systemctl is-enabled xinetd 2>/dev/null)" = "" ]]
		then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_xinetd_is_not_enabled