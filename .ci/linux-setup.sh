#!/bin/sh -xe

# need to install as 'root' since some of the unit tests won't run without it
sudo python3 -m pip install --upgrade meson

if [ "$EXTRA_PACKAGES" = "1" ]; then
        sudo apt-get install -y \
             libbsd-dev \
             libpcap-dev \
             libcrypto++-dev \
             libjansson4
fi

if [ "$BUILD_DOCS" = "1" ]; then
        sudo apt-get install -y \
             doxygen \
             graphviz \
             python3-sphinx
fi

if [ "$BUILD_32BIT" = "1" ]; then
       sudo apt-get install -y \
            gcc-multilib
fi

if [ "$RUN_TESTS" = "1" ]; then
        # setup hugepages
        cat /proc/meminfo
        sudo sh -c 'echo 1024 > /proc/sys/vm/nr_hugepages'
        cat /proc/meminfo
fi
