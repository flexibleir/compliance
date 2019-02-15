# !/bin/bash

#echo -e "\e[92m== 1.3.1 Ensure AIDE is installed ==\e\n"

ensure_aide_is_installed () {
	if [[ "$(dpkg -s aide 2> /dev/null| grep Status)" = "Status: install ok installed" ]]
		then echo -e "Passed"
	else
        echo -e "Failed"
    fi
}

ensure_aide_is_installed