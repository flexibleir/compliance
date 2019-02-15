# !/bin/bash

#echo -e "\e[92m== 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration ==\e\n"

ensure_selinux_is_not_disabled_in_bootloader () {
		if [[ "$(egrep 'selinux=0|enforcing=0' /boot/grub/grub.cfg 2>/dev/null)" = "" ]]
    		then echo -e "Passed"
		else
                echo -e "Failed"
        fi
}

ensure_selinux_is_not_disabled_in_bootloader