
wget --input-file=wget-list-sysv --continue --directory-prefix=/mnt/lfs/sources
mkdir -pv /mnt/lfs/{etc,var} /mnt/lfs/usr/{bin,lib,sbin}
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs /mnt/lfs/{usr{,/*},lib,var,etc,bin,sbin,tools}
