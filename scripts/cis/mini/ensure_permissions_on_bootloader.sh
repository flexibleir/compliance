# !/bin/bash

#echo -e "\e[92m== 1.4.1 Ensure permissions on bootloader config are configured == \e\n"

ensure_permissions_on_bootloader () {
	if [[ "$(stat -c %a /boot/grub/grub.cfg)" = "600" && "$(stat -c %U:%G /boot/grub/grub.cfg)" = "root:root" ]]
		then echo -e "Passed"
	else
            echo "Failed"
    fi
}

ensure_permissions_on_bootloader