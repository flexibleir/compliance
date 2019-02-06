#!/bin/bash

ensure_users_own_their_home_directories () {
		echo -e "\e[92m== 6.2.9 Ensure users own their home directories ==\n"
		output=$(cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
		 if [ $uid -ge 1000 -a -d "$dir" -a $user != "nfsnobody" ]; then
			  owner=$(stat -L -c "%U" "$dir")
			   if [ "$owner" != "$user" ]; then
				    echo "The home directory ($dir) of user $user is owned by $owner."
				     fi
				      fi
			      done)

		if [[ $output = "" ]]
                                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n
$output

		Audit:
		Run the following script and verify no results are returned:

#!/bin/bash
cat /etc/passwd | awk -F: '{ print \$1 \" \" \$3 \" \" \$6 }' | while read user uid dir; do
 if [ \$uid -ge 1000 -a -d \"\$dir\" -a \$user != \"nfsnobody\" ]; then
 owner=\$(stat -L -c \"%U\" \"\$dir\")
 if [ \"\$owner\" != \"\$user\" ]; then
 echo \"The home directory (\$dir) of user \$user is owned by \$owner.\"\n

 fi
 fi
done

		Remediation:
		Change the ownership of any home directories that are not owned by the defined user to the correct user.\n"


	fi
}

ensure_users_dot_files_are_not_group_or_world_writable () {
		echo -e "\e[92m== 6.2.10 Ensure users' dot files are not group or world writable ==\n"
output=$(for dir in `cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do
  for file in $dir/.[A-Za-z0-9]*; do
    if [ ! -h "$file" -a -f "$file" ]; then
      fileperm=`ls -ld $file 2>/dev/null | cut -f1 -d" "`
      if [ `echo $fileperm | cut -c6 ` != "-" ]; then
        echo "Group Write permission set on file $file"
fi
if [ `echo $fileperm | cut -c9 ` != "-" ]; then
        echo "Other Write permission set on file $file"
fi
fi
done
done)

		if [[ $output = "" ]]
	        then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

		Audit:
		Run the following script and verify no results are returned:
#!/bin/bash
for dir in \`cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'\`; do
  for file in \$dir/.[A-Za-z0-9]*; do
    if [ ! -h \"\$file\" -a -f \"\$file\" ]; then
      fileperm=\`ls -ld \$file | cut -f1 -d\" \"\`
      if [ \`echo \$fileperm | cut -c6 \` != \"-\" ]; then
        echo \"Group Write permission set on file \$file\"
fi
if [ \`echo \$fileperm | cut -c9 \` != \"-\" ]; then
        echo \"Other Write permission set on file \$file\"
fi
fi
done
done\n

		Remediation:
		Making global modifications to users' files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user dot file permissions and determine the action to be taken in accordance with site policy.\n"

	fi

}

ensure_no_users_have_forward_files () {
		echo -e "\e[92m== 6.2.11 Ensure no users have .forward files ==\n"
		output=$(for dir in `cat /etc/passwd |\
			  awk -F: '{ print $6 }'`; do
		  if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then
			      echo ".forward file $dir/.forward exists"
			        fi
			done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

                Audit:
		Run the following script and verify no results are returned:

		#!/bin/bash
		for dir in \`cat /etc/passwd |\
			  awk -F: '{ print \$6 }'\`; do
		  if [ ! -h \"\$dir/.forward\" -a -f \"\$dir/.forward\" ]; then
			      echo \".forward file \$dir/.forward exists\"
			        fi
			done


		Remediation:
		Making global modifications to users' files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .forward files and determine the action to be taken in accordance with site policy.\n"


	fi
}

ensure_no_users_have_netrc_files () {
		echo -e "\e[92m== 6.2.12 Ensure no users have .netrc files ==\n"
		output=$(for dir in `cat /etc/passwd |\
			  awk -F: '{ print $6 }'`; do
		  if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then
			      echo ".netrc file $dir/.netrc exists"
			        fi
			done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

                Audit:
		Run the following script and verify no results are returned:

#!/bin/bash
for dir in \`cat /etc/passwd |\
  awk -F: '{ print \$6 }'\`; do
  if [ ! -h \"\$dir/.netrc\" -a -f \"\$dir/.netrc\" ]; then
    echo \".netrc file \$dir/.netrc exists\"
  fi
done


		Remediation:
		Making global modifications to users' files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .netrc files and determine the action to be taken in accordance with site policy.\n"

	fi
}

ensure_users_netrc_files_are_not_group_or_world_accessible () {
		echo -e "\e[92m== 6.2.13 Ensure users' .netrc Files are not group or world accessible ==\n"
		output=$(for dir in `cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do
  for file in $dir/.netrc; do
    if [ ! -h "$file" -a -f "$file" ]; then
      fileperm=`ls -ld $file 2>/dev/null | cut -f1 -d" "`
      if [ "`echo $fileperm | cut -c5 `" != "-" ]; then
        echo "Group Read set on $file"
fi
      if [ "`echo $fileperm | cut -c6 `" != "-" ]; then
        echo "Group Write set on $file"
      fi
      if [ "`echo $fileperm | cut -c7 `" != "-" ]; then
        echo "Group Execute set on $file"
      fi
      if [ "`echo $fileperm | cut -c8 `" != "-" ]; then
        echo "Other Read  set on $file"
      fi
      if [ "`echo $fileperm | cut -c9 `" != "-" ]; then
        echo "Other Write set on $file"
      fi
      if [ "`echo $fileperm | cut -c10 `" != "-" ]; then
        echo "Other Execute set on $file"
      fi
fi done
done)

		if [[ $output = "" ]]
		then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

                Audit:
		Run the following script and verify no results are returned:
#!/bin/bash
for dir in \`cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '(\$7 != \"/usr/sbin/nologin\") { print \$6 }'\`; do
  for file in \$dir/.netrc; do
    if [ ! -h \"\$file\" -a -f \"\$file\" ]; then
      fileperm=\`ls -ld \$file | cut -f1 -d\" \"\`
      if [ \`echo \$fileperm | cut -c5 \` != \"-\" ]; then
        echo \"Group Read set on \$file\"
fi
      if [ \`echo \$fileperm | cut -c6 \` != \"-\" ]; then
        echo \"Group Write set on \$file\"
      fi
      if [ \`echo \$fileperm | cut -c7 \` != \"-\" ]; then
        echo "Group Execute set on \$file"
      fi
      if [ \`echo \$fileperm | cut -c8 \` != \"-\" ]; then
        echo "Other Read  set on \$file"
      fi
      if [ \`echo \$fileperm | cut -c9 \` != \"-\" ]; then
        echo "Other Write set on \$file"
      fi
      if [ \`echo \$fileperm | cut -c10 \` != \"-\" ]; then
        echo \"Other Execute set on \$file\"
      fi
fi done
done


		Remediation:
		Making global modifications to users\' files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .netrc file permissions and determine the action to be taken in accordance with site policy.

		Notes:
		While the complete removal of .netrc files is recommended if any are required on the system secure permissions must be applied.\n"

	fi
}

ensure_no_users_have_rhost_files () {
		echo -e "\e[92m== 6.2.14 Ensure no users have .rhosts files ==\n"
		output=$(for dir in `cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '($7 != "/usr/sbin/nologin") { print $6 }'`; do
		  for file in $dir/.rhosts; do
			      if [ ! -h "$file" -a -f "$file" ]; then
				            echo ".rhosts file in $dir"
					        fi
					done
				done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

                Audit:
		Run the following script and verify no results are returned:
	#!/bin/bash
	for dir in \`cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '(\$7 != \"/usr/sbin/nologin\") { print \$6 }'\`; do
	  for file in \$dir/.rhosts; do
	      if [ ! -h \"\$file\" -a -f \"\$file\" ]; then
	          echo \".rhosts file in \$dir\"
        fi
done
done


		Remediation:
		Making global modifications to users\' files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .rhosts files and determine the action to be taken in accordance with site policy.\n"

	fi
}

ensure_all_groups_in_etc_passwd_exist_in_etc_group () {
		echo -e "\e[92m== 6.2.15  Ensure all groups in /etc/passwd exist in /etc/group ==\n"
		output=$(for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
		  grep -q -P "^.*?:[^:]*:$i:" /etc/group
		    if [ $? -ne 0 ]; then
			        echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
				  fi
			  done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

                Audit:
		Run the following script and verify no results are returned:
		#!/bin/bash
		for i in \$(cut -s -d: -f4 /etc/passwd | sort -u ); do
			  grep -q -P \"^.*?:[^:]*:\$i:\" /etc/group
			    if [ \$? -ne 0 ]; then
				        echo \"Group \$i is referenced by /etc/passwd but does not exist in /etc/group\"
					  fi
				  done


		Remediation:
		Analyze the output of the Audit step above and perform the appropriate action to correct any discrepancies found.\n"

	fi
}

ensure_no_duplicate_uids_exist () {
		echo -e "\e[92m== 6.2.16 Ensure no duplicate UIDs exist ==\n"
		output=$(cat /etc/passwd | cut -f3 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
			          users=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs`
				      echo "Duplicate UID ($2): ${users}"
				        fi
				done)


		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

		Audit:
		Run the following script and verify no results are returned:
#!/bin/bash
cat /etc/passwd | cut -f3 -d\":\" | sort -n | uniq -c | while read x ; do
  [ -z \"\${x}\" ] && break
  set - \$x
  if [ \$1 -gt 1 ]; then
    users=\`awk -F: '(\$3 == n) { print \$1 }' n=\$2 /etc/passwd | xargs\`
    echo \"Duplicate UID (\$2): \${users}\"
  fi
done

		Remediation:
		Based on the results of the audit script, establish unique UIDs and review all files owned by the shared UIDs to determine which UID they are supposed to belong to.\n"

	fi

}

ensure_no_duplicate_gids_exist () {
		echo -e "\e[92m== 6.2.17 Ensure no duplicate GIDs exist ==\n"
		output=$(cat /etc/group | cut -f3 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
			          groups=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/group | xargs`
				      echo "Duplicate GID ($2): ${groups}"
				        fi
				done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

                Audit:
		Run the following script and verify no results are returned:

#!/bin/bash
cat /etc/group | cut -f3 -d\":\" | sort -n | uniq -c | while read x ; do
  [ -z \"\${x}\" ] && break
    set - \$x
      if [ \$1 -gt 1 ]; then
	          groups=\`awk -F: '(\$3 == n) { print \$1 }' n=\$2 /etc/group | xargs\`
		      echo \"Duplicate GID (\$2): \${groups}\"
		        fi
		done


		Remediation:
		Based on the results of the audit script, establish unique GIDs and review all files owned by the shared GID to determine which group they are supposed to belong to.\n

		Notes:
		You can also use the grpck command to check for other inconsistencies in the /etc/group file.\n"

	fi
}

ensure_no_duplicate_user_names_exist () {
		echo -e "\e[92m== 6.2.18 Ensure no duplicate user names exist ==\n"
		output=$(cat /etc/passwd | cut -f1 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
			          uids=`awk -F: '($1 == n) { print $3 }' n=$2 /etc/passwd | xargs`
				      echo "Duplicate User Name ($2): ${uids}"
			      fi done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

		Audit:
		Run the following script and verify no results are returned:

		#!/bin/bash
		cat /etc/passwd | cut -f1 -d\":\" | sort -n | uniq -c | while read x ; do
		  [ -z \"\${x}\" ] && break
		    set - \$x
		      if [ \$1 -gt 1 ]; then
			          uids=\`awk -F: '(\$1 == n) { print \$3 }' n=\$2 /etc/passwd | xargs\`
				      echo \"Duplicate User Name (\$2): \${uids}\"
			      fi
		      done


		Remediation:
		Based on the results of the audit script, establish unique user names for the users. File ownerships will automatically reflect the change as long as the users have unique UIDs.\n"

	fi

}

ensure_no_duplicate_group_names_exist () {
		echo -e "\e[92m== 6.2.19 Ensure no duplicate group names exist ==\n"
		output=$(cat /etc/group | cut -f1 -d":" | sort -n | uniq -c | while read x ; do
		  [ -z "${x}" ] && break
		    set - $x
		      if [ $1 -gt 1 ]; then
			          gids=`gawk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs`
				      echo "Duplicate Group Name ($2): ${gids}"
			      fi done)

		if [[ $output = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n

$output

		Audit:
	Run the following script and verify no results are returned:
#!/bin/bash
cat /etc/group | cut -f1 -d\":\" | sort -n | uniq -c | while read x ; do
  [ -z \"\${x}\" ] && break
    set - \$x
      if [ \$1 -gt 1 ]; then
	          gids=\`gawk -F: \'(\$1 == n) { print \$3 }\' n=\$2 /etc/group | xargs\`
		      echo \"Duplicate Group Name (\$2): \${gids}\"
	      fi done

	      Remediation:
	      Based on the results of the audit script, establish unique names for the user groups. File group ownerships will automatically reflect the change as long as the groups have unique GIDs.\n"

      fi
}

ensure_shadow_group_is_empty () {
		echo -e "\e[92m== 6.2.20 Ensure shadow group is empty ==\n"
		if [[ "$(grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group 2>/dev/null)" = "" && "$(awk -F: '($4 == "<shadow-gid>") { print }' /etc/passwd)" = "" ]]
                then echo -e "Passed!\n"
                else
                echo -e "\e[31mFailed!\e[0m : \n                Audit:
		Run the following commands and verify no results are returned:
		# grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group
		# awk -F: '(\$4 == \"<shadow-gid>\") { print }' /etc/passwd

		Remediation:
		Remove all users from the shadow group, and change the primary group of any users with shadow as their primary group.	\n"

	fi

}


echo -e "\e[92m== 6.2 User and Group Settings ==\n"
ensure_users_own_their_home_directories
ensure_users_dot_files_are_not_group_or_world_writable
ensure_users_dot_files_are_not_group_or_world_writable
ensure_no_users_have_forward_files
ensure_no_users_have_netrc_files
ensure_users_netrc_files_are_not_group_or_world_accessible
ensure_no_users_have_rhost_files
ensure_all_groups_in_etc_passwd_exist_in_etc_group
ensure_no_duplicate_uids_exist
ensure_no_duplicate_gids_exist
ensure_no_duplicate_user_names_exist
ensure_no_duplicate_group_names_exist
ensure_shadow_group_is_empty



echo -e "\e[0m"
