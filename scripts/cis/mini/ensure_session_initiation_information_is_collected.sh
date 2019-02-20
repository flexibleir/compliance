# !/bin/bash

# echo -e "\e[92m== 4.1.9 Ensure session initiation information is collected ==\n"

ensure_session_initiation_information_is_collected () {
    if [[ "$(grep session /etc/audit/audit.rules 2>/dev/null | grep utmp)" =~ /var/run/utmp.+wa.+session && "$(grep session /etc/audit/audit.rules 2>/dev/null | grep wtmp)" =~ /var/log/wtmp.+wa.+session && "$(grep session /etc/audit/audit.rules 2>/dev/null | grep btmp)" =~ /var/log/btmp.+wa.+session ]]
        then echo -e "Passed"
    else
        echo -e  "Failed"
    fi
}

ensure_session_initiation_information_is_collected