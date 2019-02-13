
# !/bin/bash

#echo -e "\e[92m== 1.1.11 Ensure separate partition exists for /var/log/audit  ==\e\n"


var_log_audit_on_own_partition () {
        if [[ "$(mount | grep /var/log/audit)" = */var/log/audit.type* ]]
                then echo "Passed"
        else
                echo "Failed" 
        fi
}

var_log_audit_on_own_partition