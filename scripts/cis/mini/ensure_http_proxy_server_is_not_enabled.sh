# !/bin/bash

# echo -e "\e[92m== 2.2.13 Ensure HTTP Proxy Server is not enabled ==\n"


ensure_http_proxy_server_is_not_enabled () {
    if [[ "$(systemctl is-enabled squid 2>/dev/null)" = "" || "$(systemctl is-enabled squid 2> /dev/null)" = "disabled" || "$(systemctl is-enabled squid 2> /dev/null)" = "masked" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_http_proxy_server_is_not_enabled