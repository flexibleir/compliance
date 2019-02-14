# !/bin/bash

#echo -e "\e[92m== 1.4.2 Ensure bootloader password is set == \e\n"

ensure_bootloader_password () {
	if [[ "$(grep '^set superusers' /boot/grub/grub.cfg 2> /dev/null )" != "" && "$(grep '^password' /boot/grub/grub.cfg 2> /dev/null)" != "" ]]
		then echo -e "Passed"
	else
        echo "Failed"
    fi
}

ensure_bootloader_password