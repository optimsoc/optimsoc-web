---
layout: default
title: Download OpTiMSoC
---
{% include doc_versions.txt %}

# Download OpTiMSoC

<div class="alert alert-info">
OpTiMSoC is only tested on Ubuntu 16.04.
We strongly recommend using the same distribution setup to avoid any additional trouble.
If you experience problems when using other Linux distributions, please open a <a href="https://github.com/optimsoc/optimsoc/issues">GitHub issue</a>.
</div>

## Get the latest release

The easiest way to get started is to use our latest release.
Download it, unzip it and you're ready to run software on a multi-core System-on-Chip!

You can find all releases on the [GitHub release page](https://github.com/optimsoc/optimsoc/releases).
Nightly builds can be found in the [optimsoc/nightly channel on Bintray](https://bintray.com/optimsoc/nightly/) (these builds can be unstable!).

Read more about installing OpTiMSoC in our [User Guide](/docs/{{doc_version_current_release}}/user_guide/installation.html).

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

If you want to develop not just software on an existing SoC, but build your own SoC hardware, you need to get the [OpTiMSoC source code](https://github.com/optimsoc/optimsoc).

```sh
git clone https://github.com/optimsoc/optimsoc.git
```
