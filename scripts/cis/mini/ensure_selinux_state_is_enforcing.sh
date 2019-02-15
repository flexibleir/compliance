# !/bin/bash

#echo -e "\e[92m== 1.6.1.2 Ensure the SELinux state is enforcing ==\e\n"


ensure_selinux_state_is_enforcing () {
		if [[ "$(grep SELINUX=enforcing /etc/selinux/config 2>/dev/null)" = "SELINUX=enforcing" && "$(sestatus 2>/dev/null | grep status)" = "SELinux status: enabled"  ]]
    		then echo "Passed"
		else
            echo -e "Failed"
        fi
}

ensure_selinux_state_is_enforcing