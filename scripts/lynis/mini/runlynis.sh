# !/bin/bash

mkdir -p /tmp/tmp-lynis 
cd /tmp/tmp-lynis 
tar xzf ../lynis-remote.tar.gz 
rm ../lynis-remote.tar.gz 
cd lynis 
./lynis audit system