# !/bin/bash

# echo -e "\e[92m== 3.2.7 Ensure Reverse Path Filtering is enabled ==\n"


ensure_reverse_path_filtering_is_enabled () {
	if [[ "$(sysctl net.ipv4.conf.all.rp_filter)" = "net.ipv4.conf.all.rp_filter = 1" && "$(sysctl net.ipv4.conf.default.rp_filter)" = "net.ipv4.conf.default.rp_filter = 1" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_reverse_path_filtering_is_enabled