# !/bin/bash

#echo -e "\e[92m== 1.3.2 Ensure filesystem integrity is regularly checked ==\e\n"

ensure_filesystem_integrity_is_regularly_checked () {
	if [[ "$(grep -r aide /etc/cron.* /etc/crontab 2> /dev/null)" = "" ]]
		then echo -e "Failed"
	else
		echo -e "Passed"
	fi
}

ensure_filesystem_integrity_is_regularly_checked