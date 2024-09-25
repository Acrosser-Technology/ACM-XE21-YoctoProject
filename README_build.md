# follow the steps from yocto web
# https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html



# Yocto Project Quick Build

# Build Host Packages

$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1
$ sudo locale-gen en_US.UTF-8


# Use Git to Clone Poky

$ git clone git://git.yoctoproject.org/poky
Cloning into 'poky'...
remote: Counting
objects: 432160, done. remote: Compressing objects: 100%
(102056/102056), done. remote: Total 432160 (delta 323116), reused
432037 (delta 323000) Receiving objects: 100% (432160/432160), 153.81 MiB | 8.54 MiB/s, done.
Resolving deltas: 100% (323116/323116), done.
Checking connectivity... done.



$ git checkout -t origin/scarthgap -b my-scarthgap
Branch 'my-scarthgap' set up to track remote branch 'scarthgap' from 'origin'.
Switched to a new branch 'my-scarthgap'


$ git pull

# Building Your Image

$ cd poky
$ source oe-init-build-env <build-folder-name>

<build-folder-name> is a variable which could be "build" or the any name for your build.

ex:

$ source oe-init-build-env build-test

# Copy xe21 local file for x86_64 machine

ex: 
$ cp local.conf <build-folder-name>/conf

# add xe21 layer for support such as w83627 ...

Depends on the location of meta-xe21

ex:
$ bbitbake-layers add-layer meta-xe21
or 
$ bbitbake-layers add-layer ../meta-xe21

# Start the Build

$ bitbake core-image-sato

# Create image by wic

Create legacy image 
$ wic create directdisk -e core-image-sato

Create UEFI image
$ wic create mkefidisk -e core-image-sato

# Create a bootable USB disk

insert USB storage.
check its partion or block

use dd to copy image into USB disk.

ex:
$ sudo dd if=directdisk-202409201728-sda.direct of=/dev/sdxxx

