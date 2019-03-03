# !/bin/bash

# echo -e "\e[92m== 5.2.11 Ensure only approved MAC algorithms are used ==\n"

ensure_only_approved_mac_algorithms_are_used () {
    if [[ "$(grep MACs /etc/ssh/sshd_config 2>/dev/null)" = "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com,curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256" || "$(grep MACs /etc/ssh/sshd_config 2>/dev/null)" = "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_only_approved_mac_algorithms_are_used