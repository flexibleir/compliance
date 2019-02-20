# !/bin/bash

# echo -e "\e[92m== 4.1.10 Ensure discretionary access control permission modification events are collected ==\n"

ensure_discretionary_access_control_permission_mod_events_are_collected () {
    if [[ "$(grep perm_mod /etc/audit/audit.rules 2>/dev/null | grep fchmodat | head -1)" =~ \-a.always,exit.-F.arch=b(32|64).-S.chmod.-S.fchmod.-S.fchmodat.-F.auid.=1000.-F.auid!=4294967295.-k.perm_mod  && "$(grep perm_mod /etc/audit/audit.rules 2>/dev/null | grep fchownat | head -1)" =~ -a.always,exit.-F.arch=b...-S.chown.-S.fchown.-S.fchownat.-S.lchown.-F.auid.=1000.-F.auid!=4294967295.-k.perm_mod ]]
        then echo -e "Passed"
    else
        echo -e "Failed"
    fi
}

ensure_discretionary_access_control_permission_mod_events_are_collected