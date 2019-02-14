# !/bin/bash

# echo -e "\e[92m== 1.8 Ensure updates, patches, and additional security software are installed (Not Scored) ==\n"

ensure_updates_patches_and_additional_security () {
		if [[ "$(apt-get update 1> /dev/null && apt-get upgrade -s 2>/dev/null | grep 'The following packages will be upgraded')" = "" ]]
		    then echo -e "Passed"
		else
            echo -e "Failed"
        fi
}

ensure_updates_patches_and_additional_security