
#!/bin/bash

#echo -e "\e[92m== 1.1.1.4 Ensure mounting of hfs filesystems is disabled ==\e\n"

disable_hfs () {
        
        if [[ "$(modprobe -n -v hfs 2>/dev/null)" = *install* ]]
                then echo "Passed"
        else

		echo "Failed"
	fi

}

disable_hfs