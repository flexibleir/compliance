#!/bin/bash

is_pkg_installed()
{
    PKG_NAME=$1
    if $(dpkg -s $PKG_NAME 2> /dev/null | grep -q '^Status: install ') ; then
        # debug "$PKG_NAME is installed"
        FNRET=0
    else
        # debug "$PKG_NAME is not installed"
        FNRET=1
    fi
}

PACKAGES='ftpd ftpd-ssl heimdal-servers inetutils-ftpd krb5-ftpd muddleftpd proftpd-basic pure-ftpd pure-ftpd-ldap pure-ftpd-mysql pure-ftpd-postgresql twoftpd-run vsftpd wzdftpd'

failed=0
for PACKAGE in $PACKAGES; do
    is_pkg_installed $PACKAGE
    if [ $FNRET = 0 ]; then
        failed=1
    fi
done

if [ $failed = 1 ]; then
    echo "Failed"
else
    echo "Passed"
fi
