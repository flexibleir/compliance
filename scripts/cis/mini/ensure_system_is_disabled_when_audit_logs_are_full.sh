# !/bin/bash

# echo -e "\e[92m== 4.1.1.2 Ensure system is disabled when audit logs are full ==\n"


ensure_system_is_disabled_when_audit_logs_are_full() {
    if [[ "$(grep space_left_action /etc/audit/auditd.conf 2>/dev/null)" = "space_left_action = email" && "$(grep action_mail_acct /etc/audit/auditd.conf 2>/dev/null)" = "action_mail_acct = root" && "$(grep admin_space_left_action /etc/audit/auditd.conf 2>/dev/null)" = "admin_space_left_action = halt" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_system_is_disabled_when_audit_logs_are_full