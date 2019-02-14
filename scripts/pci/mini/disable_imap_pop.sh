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

PACKAGES='citadel-server courier-imap cyrus-imapd-2.4 dovecot-imapd mailutils-imap4d courier-pop cyrus-pop3d-2.4 dovecot-pop3d heimdal-servers mailutils-pop3d popa3d solid-pop3d xmail'

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
