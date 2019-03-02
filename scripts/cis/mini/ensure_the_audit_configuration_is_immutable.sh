# !/bin/bash

# echo -e "\e[92m== 4.1.18 Ensure the audit configuration is immutable ==\n"

ensure_the_audit_configuration_is_immutable () {
    if [[ "$(grep "^\s*[^#]" /etc/audit/audit.rules 2>/dev/null | tail -1)" = "-e 2" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
fi
}

ensure_the_audit_configuration_is_immutable