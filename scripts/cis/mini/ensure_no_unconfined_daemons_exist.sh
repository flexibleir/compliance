# !/bin/bash

#echo -e "\e[92m== 1.6.1.4 Ensure no unconfined daemons exist ==\e\n"


ensure_no_unconfined_daemons_exist () {
		if [[ $(ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }') = "" ]]
    		then echo -e "Passed"
		else        
                echo -e "Failed"
        fi
}

ensure_no_unconfined_daemons_exist