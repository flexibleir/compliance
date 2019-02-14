# !/bin/bash

#echo -e "\e[92m== 1.5.1 Ensure core dumps are restricted ==\e\n"


ensure_core_dumps_are_restricted () {
	if [[ "$(grep 'hard core' /etc/security/limits.conf /etc/security/limits.d/* 2>/dev/null | cut -d \: -f2)" = "* hard core 0" && "$(sysctl fs.suid_dumpable 2>/dev/null)" = "fs.suid_dumpable = 0" ]]
		then echo -e "Passed"
	else
            echo -e "Failed"
    fi
}

ensure_core_dumps_are_restricted