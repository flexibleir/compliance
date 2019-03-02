# !/bin/bash

# echo -e "\e[92m== 5.2.12 Ensure SSH Idle Timeout Interval is configured ==\n"

ensure_ssh_idle_timeout_interval_is_configured () {
    if [[ "$(grep ^ClientAliveInterval /etc/ssh/sshd_config 2>/dev/null | cut -d ' ' -f2)" -lt 301 && "$(grep ^ClientAliveCountMax /etc/ssh/sshd_config 2>/dev/null | cut -d ' ' -f2)" -lt 4 && "$(grep ^ClientAliveInterval /etc/ssh/sshd_config 2>/dev/null | cut -d ' ' -f2 )" -gt 0 ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_ssh_idle_timeout_interval_is_configured