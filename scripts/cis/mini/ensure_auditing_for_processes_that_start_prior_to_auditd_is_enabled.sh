# !/bin/bash

# echo -e "\e[92m== 4.1.3 Ensure auditing for processes that start prior to auditd is enabled ==\n"


ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled () {
    if [[ "$(grep GRUB_CMDLINE_LINUX /etc/default/grub 2>/dev/null)" =~ GRUB_CMDLINE_LINUX.+audit=1 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled