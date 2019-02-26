# !/bin/bash

# echo -e "\e[92m== 4.1.17 Ensure kernel module loading and unloading is collected ==\n"


ensure_kernel_module_loading_and_unloading_is_collected () {
    if [[ "$(grep modules /etc/audit/audit.rules 2>/dev/null | grep insmod)" = "-w /sbin/insmod -p x -k modules" && "$(grep modules /etc/audit/audit.rules 2>/dev/null | grep rmmod)" = "-w /sbin/rmmod -p x -k modules" && "$(grep modules /etc/audit/audit.rules 2>/dev/null | grep modprobe)" = "-w /sbin/modprobe -p x -k modules" && "$(grep modules /etc/audit/audit.rules 2>/dev/null | grep delete_module)" =~ -a.always,exit.arch.+?delete_module.-k.modules ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_kernel_module_loading_and_unloading_is_collected