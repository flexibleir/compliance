# !/bin/bash

# echo -e "\e[92m== 5.4.4 Ensure default user umask is 027 or more restrictive ==\n"

ensure_default_user_umask_is_027_or_more_restrictive () {
    if [[ "$(grep -oP "(?<=^umask\s).+$" /etc/bash.bashrc 2>/dev/null)" = "027" && "$(grep -oP "(?<=^umask\s).+$" /etc/profile 2>/dev/null)" = "027" ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_default_user_umask_is_027_or_more_restrictive