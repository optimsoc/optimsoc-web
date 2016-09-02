---
layout: default
title: Download OpTiMSoC
---
{% include doc_versions.txt %}

# Download OpTiMSoC

<div class="alert alert-info">
OpTiMSoC is only tested on Ubuntu 14.04 and 16.04.
We strongly recommend using the same distribution setup to avoid any additional trouble.
If you experience problems when using other Linux distributions, please open a <a href="https://github.com/optimsoc/sources/issues">GitHub issue</a>.
</div>

## Get the latest release

The easiest way to get started is to use our latest release.
Download it, unzip it and you're ready to run software on a multi-core System-on-Chip!

```sh
sudo mkdir /opt/optimsoc
sudo chown $USER /opt/optimsoc
wget https://github.com/optimsoc/sources/releases/download/v{{doc_version_current_release}}/optimsoc-{{doc_version_current_release}}-base.tar.gz
wget https://github.com/optimsoc/sources/releases/download/v{{doc_version_current_release}}/optimsoc-{{doc_version_current_release}}-examples.tar.gz
tar -xf optimsoc-{{doc_version_current_release}}-base.tar.gz -C /opt/optimsoc
tar -xf optimsoc-{{doc_version_current_release}}-examples.tar.gz -C /opt/optimsoc
```

You are now ready to use OpTiMSoC, but you also need
[Verilator](http://www.veripool.org/wiki/verilator) and the [or1k-elf-multicore
Toolchain](http://openrisc.io/newlib). You can download and build them
on your own, or for convenience use the prebuilt distribution:

```sh
wget https://raw.githubusercontent.com/optimsoc/prebuilts/master/optimsoc-prebuilt-deploy.py
chmod a+x optimsoc-prebuilt-deploy.py
./optimsoc-prebuilt-deploy.py -d /opt/optimsoc verilator or1kelf
```

Done. Just source the environment scripts whenever you use OpTiMSoC or
add them to your `.bashrc`:

```sh
source /opt/optimsoc/{{doc_version_current_release}}/optimsoc-environment.sh
source /opt/optimsoc/setup_prebuilt.sh
```

### Test your installation

Download the sample applications and build `hello world!`:

```sh
git clone https://github.com/optimsoc/baremetal-apps
cd baremetal-apps/hello
make
$OPTIMSOC/examples/sim/compute_tile/compute_tile_sim_singlecore --meminit=hello.vmem
cat stdout.000
```

And you should see this:

```
# OpTiMSoC trace_monitor stdout file
# [TIME, CORE] MESSAGE
[               38916, 0] Hello World! Core 0 of 1 in tile 0, my absolute core id is: 0
[               47764, 0] There are 1 compute tiles:
[               55972, 0]  rank 0 is tile 0
```

### Dive into OpTiMSoC

Thats right the point where the [tutorials in the User Guide](/docs/{{doc_version_current_release}}/user-guide/chap_tutorials.html) start from.


## Get the sources
If you want to develop not just software on an existing SoC, but build your own SoC hardware, you need to get the [OpTiMSoC source code](https://github.com/optimsoc/sources).

```sh
git clone https://github.com/optimsoc/sources.git optimsoc-sources
```
