# !/bin/bash

# echo -e "\e[92m== 2.3.1 Ensure NIS Client is not installed ==\n"

ensure_nis_client_is_not_installed () {
	if [[ "$(dpkg -s nis 2>/dev/null | grep Status)" = "" || "$(dpkg -s nis 2>/dev/null | grep Status)" =~ ^Status:.deinstall ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_nis_client_is_not_installed