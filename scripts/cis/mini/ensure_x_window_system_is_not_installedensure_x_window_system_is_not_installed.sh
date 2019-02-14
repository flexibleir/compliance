# !/bin/bash

# echo -e "\e[92m== 2.2.2 Ensure X Window System is not installed ==\n"


ensure_x_window_system_is_not_installed () {
	if [[ "$(dpkg -l xserver-xorg* 2>/dev/null | grep ii)" = "" ]]
		then echo -e "Passed"
	else
        echo -e "Failed"
    fi
}

ensure_x_window_system_is_not_installed