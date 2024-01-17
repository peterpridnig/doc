# pridnig, 3.1.2024

sudo apt-get install autoconf automake bison bzip2 make flex g++ gawk gcc gettext git gperf help2man libncurses5-dev libstdc++6 libtool libtool-bin make

sudo apt-get install python3-dev patch rsync texinfo unzip wget xz-utils

# ################
# ## YOCTO "dunfell"
# ################

ssh 10.0.0.13 -l peter

git clone -b dunfell git://git.yoctoproject.org/poky.git

=> ./poky

source poky/oe-init-build-env build-qemu
=> ./build-qemu

./conf/local_conf
MACHINE ?= "qemuarm"


sudo apt-get install chrpath
bitbake core-image-minimal