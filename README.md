##	Setup S3 Bucket as mounted drive in linux

This description is for setting up an S3 bucket as mounted drive in linux. It requires s3fs installed on system and with accessId and secretKey for S3 you can bind S3 bucket as mounted drive. Additionally S3 bucket name is required for setup.


#####	Install s3fs 

```
sudo apt-get install automake autotools-dev \
fuse g++ git libcurl4-gnutls-dev libfuse-dev \
libssl-dev libxml2-dev make pkg-config

#clone s3fs-fuse in your system
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make

# install s3fs 
sudo make install
```

#####	Store aws user's accessId:secretKey for s3fs

```
sudo sh -c "echo '<ACCESS_ID>:<SECRET_KEY>' > /etc/passwd-s3fs"
sudo chmod 640 /etc/passwd-s3fs
```

#####	Add a directory, mount it and bind it with s3 bucket

```
sudo mkdir -p /s3/bucket
sudo s3fs -o allow_other a-test-bucket-124568d /s3/bucket

sudo s3fs <BUCKET_NAME> /s3/bucket -o passwd_file=/etc/passwd-s3fs -o allow_other -o uid=1000 -o umask=022 -o gid=33
```

#####	To check if /s3/bucket is mounted

```
sudo df -h
```

#####	To Unmount directory

```
sudo umount /s3/bucket-test
```

Refer this link for more details    :point_right:  [this link](http://www.whiteboardcoder.com/2017/12/how-to-mount-s3-bucket-as-hard-drive.html)

"May the odds be ever in your favor" :hamster:


