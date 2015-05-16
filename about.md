---
layout: default
title: About OpTiMSoC
---


# About OpTiMSoC
## Motivation
Tiled manycore System-on-Chip have become a common way to integrate tens or even hundreds of processor cores in future processing platforms. To research and measure enhancements of such platforms a basline system is necessary, ideally at different configurations. As many researches do not have such a system at hand, they are often restricted to (system level) simulation or need to build such a complex system from scratch.

## Goal
The goal of OpTiMSoC is to create a freely available, open source framework for research on manycore System-on-Chip. By providing basic blocks, such as a Network-on-Chip in different configurations, processing elements (CPU cores), hardware accelerators, and I/O modules creating a new SoC is a matter of plugging the different components together. The resulting hardware can then be simulated on a PC, e.g. in ModelSim, or synthesized and run on an FPGA.

On top of the hardware components, a basic runtime library ("operating system") as well as a trace-based debug and diagnosis infrastructure enable rapid prototyping.

It is **not** a goal to create a complete and optimized SoC design for production.

A summarizing (and citable) paper can be found at [arXiv:1304.5081](http://arxiv.org/abs/1304.5081).

## Contact
If you have questions, suggestions or anything else related to OpTiMSoC, please contact [Stefan Wallentowitz by mail](mailto:stefan.wallentowitz@tum.de).


## License
Most of OpTiMSoC is open source and licensed under the [MIT license](http://opensource.org/licenses/MIT). This essentially means (see the appropriate licenses for details and the only authoritative text):

You **can**

* freely use OpTiMSoC
* freely modify OpTiMSoC
* freely distribute any derived work of OpTiMSoC even for closed source or commercial applications

You **should**

* be a nice person and contribute your changes back!

Please note that some code is licensed under the [GPLv3+](http://www.gnu.org/licenses/gpl.html) (where necessary due to the usage of certain external libraries) or other open-source licenses. A notable example for this is the OpenRISC processor core, which is licensed under LGPLv2 (OR1200) or [OHDL](http://juliusbaxter.net/ohdl/) (mor1kx, OHDL is an MPLv2-derived license with file-based copyleft and no patent clause). Other code might be even more restricted when third-party code was integrated. This is especially true for generated code for FPGA targets, which can usually only be used with the corresponding hardware. (You cannot use Xilinx-generated code on an Altera FPGA for example.) Please be careful, read license headers of the source files and ask a lawyer if in doubt.

## The people behind OpTiMSoC

OpTiMSoC is developed mainly by a research group at the [Lehrstuhl für Integrierte Systeme (Institute for Integrated Systems)](http://lis.ei.tum.de) at the [Technische Universität München (TUM)](http://www.tum.de). We use it there for our research on new manycore System-on-Chip architectures. The project started in 2011 and up to now many researchers and students have contributed to it.

<div class="row optimsoc-about-people">
  <div class="col-md-2">
    <img class="img-rounded" src="/img/people/stefan.jpg"/>
  </div>
  <div class="col-md-10">
    <h3>Stefan Wallentowitz</h3>
    Stefan started the project in 2011 and is probably the only person who knows every corner of OpTiMSoC by heart.
    He works at <a href="http://www.lis.ei.tum.de/?id=wallentowitz">LIS</a>.
    Contact him by mail at <a href="mailto:stefan.wallentowitz@tum.de">stefan.wallentowitz@tum.de</a>
  </div>
</div>

<div class="row optimsoc-about-people">
  <div class="col-md-2">
    <img class="img-rounded" src="/img/people/philipp.jpg"/>
  </div>
  <div class="col-md-10">
    <h3>Philipp Wagner</h3>
    Philipp joined in 2012 and is mainly working on the debug and diagnosis infrastructure. He also works at <a href="http://www.lis.ei.tum.de/?id=wagner">LIS</a>. In his spare time he's fiddeling a lot with free/open source software, and you can read about it on his <a href="https://philipp-wagner.com">blog</a>. Contact him by mail at <a href="mailto:philipp.wagner@tum.de">philipp.wagner@tum.de</a>.
  </div>
</div>

<div class="row optimsoc-about-people"> <div class="col-md-2"> <img
  class="img-rounded" src="/img/people/no-image.png"/> </div> <div
  class="col-md-10"> <h3>Stefan Rösch</h3> Stefan joined the OpTiMSoC
  team in 2014 for his master thesis. He works afterwards joined the
  institute and now researches on dependable computing. Contact him by
  mail at <a
  href="mailto:stefan.roesch@tum.de">stefan.roesch@tum.de</a>.</div>
  </div>

<div class="row optimsoc-about-people">
  <div class="col-md-2">
  </div>
  <div class="col-md-10">
    <h3>Many others!</h3>
    The people listed here are just some who contributed to OpTiMSoC. In total around 30 people contributed in some form, most of them students doing their Bachelor's or Master's thesis.
  </div>
</div>


<div class="row optimsoc-about-people">
  <div class="col-md-2">
    <img class="img-rounded" src="/img/people/no-image.png"/>
  </div>
  <div class="col-md-10">
    <h3>You!</h3>
    Use OpTiMSoC for your projects, adapt it and contribute back. How? See the <a href="/getinvolved.html">Get involved</a> page!
  </div>
</div>
