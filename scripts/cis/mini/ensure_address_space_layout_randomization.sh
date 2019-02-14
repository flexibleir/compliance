# !/bin/bash

#echo -e "\e[92m== 1.5.3 Ensure address space layout randomization (ASLR) is enabled ==\e\n"

ensure_address_space_layout_randomization () {
		if [[ "$(sysctl kernel.randomize_va_space)" = "kernel.randomize_va_space = 2" ]]
			then echo -e "Passed"
		else
                echo -e "Failed"
        fi
}

ensure_address_space_layout_randomization