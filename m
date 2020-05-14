Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07931D3DFC
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 21:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgENTys (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 15:54:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60826 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgENTyr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 15:54:47 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C6472803089C;
        Thu, 14 May 2020 19:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BbbTUiaU5uDB; Thu, 14 May 2020 22:54:37 +0300 (MSK)
Date:   Thu, 14 May 2020 22:54:36 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clk: Add Baikal-T1 CCU PLLs binding
Message-ID: <20200514195436.yvocpit7xrmygq3r@mobilestation>
References: <20200306130053.BCBFC803078F@mail.baikalelectronics.ru>
 <20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru>
 <20200506222300.30895-2-Sergey.Semin@baikalelectronics.ru>
 <20200514191318.GA10192@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514191318.GA10192@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 02:13:18PM -0500, Rob Herring wrote:
> On Thu, May 07, 2020 at 01:22:57AM +0300, Serge Semin wrote:
> > Baikal-T1 Clocks Control Unit is responsible for transformation of a
> > signal coming from an external oscillator into clocks of various
> > frequencies to propagate them then to the corresponding clocks
> > consumers (either individual IP-blocks or clock domains). In order
> > to create a set of high-frequency clocks the external signal is
> > firstly handled by the embedded into CCU PLLs. So the corresponding
> > dts-node is just a normal clock-provider node with standard set of
> > properties. Note as being part of the Baikal-T1 System Controller its
> > DT node is supposed to be a child the system controller node.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: linux-mips@vger.kernel.org
> > 
> > ---
> > 
> > Changelog v2:
> > - Rearrange the SoBs.
> > - Discard comments in the bindings file header.
> > - Add dual GPL/BSD license.
> > - Add spaces around the ASCII-graphics in the binding description.
> > - Remove reference to Documentation/devicetree/bindings/clock/clock-bindings.txt
> >   file.
> > - Discard redundant object check against "/schemas/clock/clock.yaml#" schema.
> > - Discard redundant descriptions of the "#clock-cells" property.
> > - Remove "reg" property since from now the clock DT node is supposed to be
> >   a child of the syscon-compatible system controller node.
> > - Remove "clock-output-names" property support.
> > - Replace "additionalProperties: false" with "unevaluatedProperties: false".
> > - Lowercase the nodes name in the examples.
> > - Use "clock-controller" node name suffix in the examples.
> > - Remove unnecessary comments in the clocks dt-bindings header file.
> > ---
> >  .../bindings/clock/baikal,bt1-ccu-pll.yaml    | 127 ++++++++++++++++++
> >  include/dt-bindings/clock/bt1-ccu.h           |  16 +++
> >  2 files changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> >  create mode 100644 include/dt-bindings/clock/bt1-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> > new file mode 100644
> > index 000000000000..571181758ef2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/baikal,bt1-ccu-pll.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Baikal-T1 Clock Control Unit PLL
> > +
> > +maintainers:
> > +  - Serge Semin <fancer.lancer@gmail.com>
> > +
> > +description: |
> > +  Clocks Control Unit is the core of Baikal-T1 SoC System Controller
> > +  responsible for the chip subsystems clocking and resetting. The CCU is
> > +  connected with an external fixed rate oscillator, which signal is transformed
> > +  into clocks of various frequencies and then propagated to either individual
> > +  IP-blocks or to groups of blocks (clock domains). The transformation is done
> > +  by means of PLLs and gateable/non-gateable dividers embedded into the CCU.
> > +  It's logically divided into the next components:
> > +  1) External oscillator (normally XTAL's 25 MHz crystal oscillator, but
> > +     in general can provide any frequency supported by the CCU PLLs).
> > +  2) PLLs clocks generators (PLLs) - described in this binding file.
> > +  3) AXI-bus clock dividers (AXI).
> > +  4) System devices reference clock dividers (SYS).
> > +  which are connected with each other as shown on the next figure:
> > +
> > +          +---------------+
> > +          | Baikal-T1 CCU |
> > +          |   +----+------|- MIPS P5600 cores
> > +          | +-|PLLs|------|- DDR controller
> > +          | | +----+      |
> > +  +----+  | |  |  |       |
> > +  |XTAL|--|-+  |  | +---+-|
> > +  +----+  | |  |  +-|AXI|-|- AXI-bus
> > +          | |  |    +---+-|
> > +          | |  |          |
> > +          | |  +----+---+-|- APB-bus
> > +          | +-------|SYS|-|- Low-speed Devices
> > +          |         +---+-|- High-speed Devices
> > +          +---------------+
> 
> Are you going to just duplicate all this for each sub-block? 

Apparently yes. Since the bindings are placed in different files it would be
good to have the CCU diagram in each of them so the user would see what part of
CCU this binding describes without need to open the other file. Additionally
they don't completely match. Here I signify that the binding file is about PLLs.
The text in another file says that its about the clock dividers.

> 
> > +
> > +  Each CCU sub-block is represented as a separate dts-node and has an
> > +  individual driver to be bound with.
> > +
> > +  In order to create signals of wide range frequencies the external oscillator
> > +  output is primarily connected to a set of CCU PLLs. There are five PLLs
> > +  to create a clock for the MIPS P5600 cores, the embedded DDR controller,
> > +  SATA, Ethernet and PCIe domains. The last three domains though named by the
> > +  biggest system interfaces in fact include nearly all of the rest SoC
> > +  peripherals. Each of the PLLs is based on True Circuits TSMC CLN28HPM core
> > +  with an interface wrapper (so called safe PLL' clocks switcher) to simplify
> > +  the PLL configuration procedure. The PLLs work as depicted on the next
> > +  diagram:
> > +
> > +      +--------------------------+
> > +      |                          |
> > +      +-->+---+    +---+   +---+ |  +---+   0|\
> > +  CLKF--->|/NF|--->|PFD|...|VCO|-+->|/OD|--->| |
> > +          +---+ +->+---+   +---+ /->+---+    | |--->CLKOUT
> > +  CLKOD---------C----------------+          1| |
> > +       +--------C--------------------------->|/
> > +       |        |                             ^
> > +  Rclk-+->+---+ |                             |
> > +  CLKR--->|/NR|-+                             |
> > +          +---+                               |
> > +  BYPASS--------------------------------------+
> > +  BWADJ--->
> > +
> > +  where Rclk is the reference clock coming  from XTAL, NR - reference clock
> > +  divider, NF - PLL clock multiplier, OD - VCO output clock divider, CLKOUT -
> > +  output clock, BWADJ is the PLL bandwidth adjustment parameter. At this moment
> > +  the binding supports the PLL dividers configuration in accordance with a
> > +  requested rate, while bypassing and bandwidth adjustment settings can be
> > +  added in future if it gets to be necessary.
> > +
> > +  The PLLs CLKOUT is then either directly connected with the corresponding
> > +  clocks consumer (like P5600 cores or DDR controller) or passed over a CCU
> > +  divider to create a signal required for the clock domain.
> > +
> > +  The CCU PLL dts-node uses the common clock bindings with no custom
> > +  parameters. The list of exported clocks can be found in
> > +  'include/dt-bindings/clock/bt1-ccu.h'. Since CCU PLL is a part of the
> > +  Baikal-T1 SoC System Controller its DT node is supposed to be a child of
> > +  later one.
> 
> The schema can and should express this. IOW, either move this into the 
> system controller schema or reference this ($ref) from it.

Ok. I'll make use of $ref approach because otherwise the system controller DT
binding would be overwhelmed with various properties.

> 
> > +
> > +properties:
> > +  compatible:
> > +    const: baikal,bt1-ccu-pll
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    description: External reference clock
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: ref_clk
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#clock-cells"
> > +  - clocks
> > +  - clock-names
> > +
> > +examples:
> > +  # Clock Control Unit PLL node:
> > +  - |
> > +    clock-controller-pll {
> > +      compatible = "baikal,bt1-ccu-pll";
> > +      #clock-cells = <1>;
> > +
> > +      clocks = <&clk25m>;
> > +      clock-names = "ref_clk";
> 
> If there's a register range within the system controller for the pll, 
> then add 'reg' even if Linux doesn't use it.

Yes, there is. Shall I add the optional reg property to the binding too and use
the reg value in the unit-name like clock-controller@1F04D000?

-Sergey

> 
> > +    };
> > +  # Required external oscillator:
> > +  - |
> > +    clk25m: clock-oscillator-25m {
> > +      compatible = "fixed-clock";
> > +      #clock-cells = <0>;
> > +      clock-frequency  = <25000000>;
> > +      clock-output-names = "clk25m";
> > +    };
> > +...
> > diff --git a/include/dt-bindings/clock/bt1-ccu.h b/include/dt-bindings/clock/bt1-ccu.h
> > new file mode 100644
> > index 000000000000..931a4bea67c0
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/bt1-ccu.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> > + *
> > + * Baikal-T1 CCU clock indices
> > + */
> > +#ifndef __DT_BINDINGS_CLOCK_BT1_CCU_H
> > +#define __DT_BINDINGS_CLOCK_BT1_CCU_H
> > +
> > +#define CCU_CPU_PLL			0
> > +#define CCU_SATA_PLL			1
> > +#define CCU_DDR_PLL			2
> > +#define CCU_PCIE_PLL			3
> > +#define CCU_ETH_PLL			4
> > +
> > +#endif /* __DT_BINDINGS_CLOCK_BT1_CCU_H */
> > -- 
> > 2.25.1
> > 
