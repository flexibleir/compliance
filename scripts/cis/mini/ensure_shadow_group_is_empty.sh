# !/bin/bash

# echo -e "\e[92m== 6.2.20 Ensure shadow group is empty ==\n"

ensure_shadow_group_is_empty () {
		if [[ "$(grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group 2>/dev/null)" = "" && "$(awk -F: '($4 == "<shadow-gid>") { print }' /etc/passwd)" = "" ]]
            then echo -e "Passed"
        else
            echo -e "Failed"
        fi
}

ensure_shadow_group_is_empty