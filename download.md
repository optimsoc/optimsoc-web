---
layout: default
title: Download OpTiMSoC
---

# Download OpTiMSoC

You can find the sources for OpTiMSoC at the [github
organization](https://github.com/optimsoc). Usually this is where you
end up when you need to develop in OpTiMSoC or around the
framework. If you want to develop user software or just to get
started, you can download the current release:

    sudo mkdir /opt/optimsoc
    sudo chown $USER /opt/optimsoc
    wget https://github.com/optimsoc/sources/releases/download/2015.1/optimsoc-2015.1-base.tgz
    wget https://github.com/optimsoc/sources/releases/download/2015.1/optimsoc-2015.1-examples.tgz
    tar -xzf optimsoc-2015.1-base.tgz -C /opt/optimsoc
    tar -xzf optimsoc-2015.1-examples.tgz -C /opt/optimsoc

You are now ready to use OpTiMSoC, but you also need
[Verilator](http://www.veripool.org/wiki/verilator),
[SystemC](http://www.systemc.org) and the [or1k-elf-multicore
Toolchain](http://openrisc.io/newlib). You can download and build them
on your own, or for convenience use the prebuilt distribution:

    wget https://raw.githubusercontent.com/optimsoc/prebuilts/master/optimsoc-prebuilt-deploy.py
    chmod a+x optimsoc-prebuilt-deploy.py
    ./optimsoc-prebuilt-deploy -d /opt/optimsoc systemc verilator or1kelf

Done. Just source the environment scripts whenever you use OpTiMSoC or
add them to your `.bashrc`:

    source /opt/optimsoc/2015.1/setup.sh
    source /opt/optimsoc/setup_prebuilt.sh

## Test you installation

Download the sample applications and build `hello world!`:

    git clone https://github.com/optimsoc/baremetal-apps
    cd baremetal-apps/hello
    make
    $OPTIMSOC/examples/dm/compute_tile/tb_compute_tile --standalone
    cat stdout.000

## Dive into OpTiMSoC

Thats right the point where the [user guide's tutorials start
from](/docs/user-guide/chap_tutorials.html).