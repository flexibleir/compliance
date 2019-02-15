# !/bin/bash

# echo -e "\e[92m== 1.6.2.1 Ensure AppArmor is not disabled in bootloader configuration ==\e\n"

ensure_apparmor_is_not_disabled_in_bootloader () {
		if [[ "$(grep apparmor=0 /boot/grub/grub.cfg 2>/dev/null)" = "" ]]
    		then echo -e "Passed"
		else
                echo -e "Failed"
        fi
}

ensure_apparmor_is_not_disabled_in_bootloader