# !/bin/bash

# echo -e "\e[92m== 4.1.1.3 Ensure audit logs are not automatically deleted ==\n"


ensure_audit_logs_are_not_automatically_deleted () {
    if [[ "$(grep ^max_log_file_action /etc/audit/auditd.conf 2>/dev/null)" = "max_log_file_action = keep_logs" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_audit_logs_are_not_automatically_deleted