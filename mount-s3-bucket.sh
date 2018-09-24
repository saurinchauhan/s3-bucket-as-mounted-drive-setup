#!/bin/bash

sudo apt-get install automake autotools-dev \
fuse g++ git libcurl4-gnutls-dev libfuse-dev \
libssl-dev libxml2-dev make pkg-config

git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
sudo make install
sudo sh -c "echo '<Access key Id>:<Secret Access key>' > /etc/passwd-s3fs"
sudo chmod 640 /etc/passwd-s3fs


sudo mkdir -p /s3/bucket-test
sudo s3fs -o allow_other a-test-bucket-124568d /s3/bucket-test

#	sudo vi /etc/fuse.conf
#	uncomment	user_allow_other

#	s3fs vms-on-cloud-tmp /s3/bucket-test -o passwd_file=/etc/passwd-s3fs -o dbglevel=info -f -o curldbg

sudo s3fs vms-on-cloud-tmp /s3/bucket-test -o passwd_file=/etc/passwd-s3fs -o allow_other -o uid=1000 -o umask=022 -o gid=33

##	check if directory is mounted or not
sudo df -h


#	unmount directory
#	sudo umount /s3/bucket-test


