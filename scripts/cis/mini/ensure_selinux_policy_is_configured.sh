# !/bin/bash

#echo -e "\e[92m== 1.6.1.3 Ensure SELinux policy is configured ==\e\n"

 ensure_selinux_policy_is_configured () {
		if [[ "$(grep SELINUXTYPE= /etc/selinux/config 2>/dev/null)" = "SELINUXTYPE=ubuntu" || "$(grep SELINUXTYPE= /etc/selinux/config 2>/dev/null)" = "SELINUXTYPE=default" || "$(grep SELINUXTYPE= /etc/selinux/config 2>/dev/null)" = "SELINUXTYPE=mls" && "$(sestatus 2>/dev/null)" && "$(sestatus)" =~ "Policy from config file: (ubuntu|default|mls)" ]]
    		then echo -e "Passed"
         else
                echo -e "Failed"
        fi
 }

 ensure_selinux_policy_is_configured