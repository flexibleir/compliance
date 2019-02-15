# !/bin/bash

# echo -e "\e[92m== 1.7.2 Ensure GDM login banner is configured ==\n"


ensure_gdm_login_banner_is_configured () {
		if [[ "$(apt list --installed 2> /dev/null | grep -i ^gdm)" = "" ]]
		    then echo -e "Passed"
		else
            echo -e "Failed"
        fi
}

ensure_gdm_login_banner_is_configured