# !/bin/bash

# echo -e "\e[92m== 1.6.3 Ensure SELinux or AppArmor are installed (Not Scored) ==\n"

ensure_selinux_or_apparmor_are_installed () {
		if [[ "$(dpkg -s selinux 2>/dev/null | grep Status )" =~ Status:.install.ok* || "$(dpkg -s apparmor 2>/dev/null | grep Status)" =~ Status:.install.ok* ]]
		    then echo -e "Passed"
		else
            echo -e "Failed"
        fi
}

ensure_selinux_or_apparmor_are_installed