---
layout: blogpost
title:  "OpTiMSoC Enabled Demonstrator System with Fault-Tolerant NoC"
date:   2021-01-26
categories: general
author: max
---

Although it has been silent around OpTiMSoC in recent months, some development is still ongoing.
Based on OpTiMSoC, a demonstrator system has been developed in the scope of the [ARAMiS II](https://www.aramis2.org/) research project and has since been further improved.
This blog post describes the demonstrator system, its architecture and building blocks, and the alterations and extensions made to OpTiMSoC in order to build it.
<!--more-->
## Purpose of the demonstrator

The demonstrator was implemented to demonstrate the capabilities of a newly developed Network on Chip (NoC).
This network is a hybrid packet-switched and Time-Division-Multiplexed (TDM) NoC using TDM channels with protection switching to implement fault-tolerance and hard real-time guarantees for safety-critical traffic in a mixed-critical environment.

The goal of the demonstrator is to:
- demonstrate fault-tolerance of critical communication in the NoC
- demonstrate isolation between critical and non-critical traffic in the NOC
- visualize the current status of the NoC
- allow interaction with the system and the applications running

## Overview

The following picture gives an overview of the different parts of the demonstrator.

![An overview of the demonstrator system](/img/posts/2021-01-26-demonstrator/overview.jpg "An overview of the demonstrator system")

The demonstrator has two main parts: an OpTiMSoC-based tiled 3x3 many-core system implemented on FPGA and a "Host PC" to control the system and visualize its current state.
The 3x3 system is implemented on a [VCU108 Evaluation Board](https://www.xilinx.com/products/boards-and-kits/ek-u1-vcu108-g.html) from Xilinx and connected to the Host PC via the [Cypress EZ-USB FX3](https://www.cypress.com/products/ez-usb-fx3-superspeed-usb-30-peripheral-controller) peripheral controller.

A special bridge module connects the debug system to the NoC and acts as I/O tile to allow communication between the Host PC and the other tiles.
The remaining 8 tiles are compute tiles that each contain an OpenRISC CPU.
Three of these tiles run a pedestrian detection algorithm to represent a safety critical application, the remaining five tiles run an application that produces uniform random background traffic in the NoC.
Furthermore, in order to demonstrate a globally asynchronous locally synchronous (GALS) architecture, the critical tiles, the non-critical tiles, and the NoC are all in different clock domains.

The application on the Host PC is split in two major parts: a control part to handle the communication with the target, load the applications into the local memory of the compute tiles, and handle the frame distribution for the pedestrian detection, and a monitoring part to observe and interact with the NoC.
The control part is written in Python and makes heavy use of the glip Python bindings, the monitoring part is displayed in a browser using a local Flask server.

The video shows the demonstrator in action and the necessary steps to get it running.
<iframe width="560" height="315" src="https://www.youtube.com/embed/IdkbkLiwBRc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## OpTiMSoC extensions/alterations

Several new hardware modules were implemented and some existing OpTiMSoC modules altered for the demonstrator system.
Most notably:
- A completely new NoC has been implemented. The NoC uses TDM for critical traffic and packet-switching for non-critical traffic. The packet-switched part can use either source-routing or distributed routing (defined at design time). 1+1 protection switching can be used to guarantee fault-tolerance for critical communication.
- An I/O tile allowing communication between a Host PC and the compute tiles of a system via the NoC.
- Modules for fault-detection of NoC flits based on parity, as well as modules to generate the parity information for NoC flits.
- Fault injection modules to test the fault-tolerance of the NoC.
- A monitoring module to trace the utilization of individual NoC links for both TDM and packet-switched traffic.
- Clock-domain-crossing capabilities between the NoC, the compute tiles, and the debug interconnect as well as for the reset signals.

## So, what's next?

As of now, the new and altered modules are not available in the public OpTiMSoC repository as some of them are specific to the demonstrator system and some are still being worked on.
However, we plan to add the hybrid NoC, the I/O tile, and the support for different clock domains and will hopefully have a new release this year.
