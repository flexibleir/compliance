# !/bin/bash

# echo -e "\e[92m== 2.2.7 Ensure NFS and RPC are not enabled ==\n"

ensure_nfs_and_rpc_are_not_enabled () {
    if [[ "$(systemctl is-enabled nfs-kernel-server 2>/dev/null)" = "" || "$(systemctl is-enabled nfs-kernel-server)" = "disabled" || "$(systemctl is-enabled nfs-kernel-server)" = "masked" && "$(systemctl is-enabled rpcbind 2>/dev/null)" = "" || "$(systemctl is-enabled rpcbind)" = "disabled" || "$(systemctl is-enabled rpcbind)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_nfs_and_rpc_are_not_enabled