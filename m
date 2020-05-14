Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616201D3D3E
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 21:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgENTNX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 15:13:23 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41490 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgENTNW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 15:13:22 -0400
Received: by mail-ot1-f65.google.com with SMTP id 63so3282307oto.8;
        Thu, 14 May 2020 12:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1hsjDRxDrqUiJ2zCntl33FowRx8SVYyc1frPwk5HdUU=;
        b=cwzNovdlpIPu1wa5aa2sP2i9ZnCqjbGhgfUhFHRy7vtS4NmFvdW1BSz4uPc2LxaVJ1
         ORadOSM2H5Ts+HLI9wgIUpDz3D5txQWtBRx5QlMf4X/J3japAslN3PsY09IS2F2vd+UU
         2lbCESoYLeN4wKvbMuCBRCcjXPkBbKZConF8gFAJ/3ol6bTiooCmEAd13lNT+ZolDgMk
         3thaR2OO9xLU+u3LgJ6Wae1vOMR5z08uSXdv5HUe1jZ49a2U+Ca+Bysd1g8JzVarFidw
         9hqaJx8tEdffeEBvrJQBGB6VpPi8LH3Tv1ZCQ15RZp52GfTG3bCIq+SW5HZnEMsIAMKA
         oZiQ==
X-Gm-Message-State: AOAM530HFGn2VmhS1M53zx9NMWCoPM5H9Ajyzw47lS124p+/VLbZ47F2
        9xByX2ZngMMwzc1mRDRXS8/xF3w=
X-Google-Smtp-Source: ABdhPJwChB1vgd/fyeUGCU9oe4078K6mWpRpBkNggNqyJzVVUwQdfjyt0tHZ3CPD6L5pc+JJINTcWQ==
X-Received: by 2002:a9d:7cd1:: with SMTP id r17mr4811626otn.355.1589483600453;
        Thu, 14 May 2020 12:13:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y17sm1008975oou.13.2020.05.14.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 12:13:19 -0700 (PDT)
Received: (nullmailer pid 19245 invoked by uid 1000);
        Thu, 14 May 2020 19:13:18 -0000
Date:   Thu, 14 May 2020 14:13:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clk: Add Baikal-T1 CCU PLLs binding
Message-ID: <20200514191318.GA10192@bogus>
References: <20200306130053.BCBFC803078F@mail.baikalelectronics.ru>
 <20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru>
 <20200506222300.30895-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506222300.30895-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 01:22:57AM +0300, Serge Semin wrote:
> Baikal-T1 Clocks Control Unit is responsible for transformation of a
> signal coming from an external oscillator into clocks of various
> frequencies to propagate them then to the corresponding clocks
> consumers (either individual IP-blocks or clock domains). In order
> to create a set of high-frequency clocks the external signal is
> firstly handled by the embedded into CCU PLLs. So the corresponding
> dts-node is just a normal clock-provider node with standard set of
> properties. Note as being part of the Baikal-T1 System Controller its
> DT node is supposed to be a child the system controller node.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Rearrange the SoBs.
> - Discard comments in the bindings file header.
> - Add dual GPL/BSD license.
> - Add spaces around the ASCII-graphics in the binding description.
> - Remove reference to Documentation/devicetree/bindings/clock/clock-bindings.txt
>   file.
> - Discard redundant object check against "/schemas/clock/clock.yaml#" schema.
> - Discard redundant descriptions of the "#clock-cells" property.
> - Remove "reg" property since from now the clock DT node is supposed to be
>   a child of the syscon-compatible system controller node.
> - Remove "clock-output-names" property support.
> - Replace "additionalProperties: false" with "unevaluatedProperties: false".
> - Lowercase the nodes name in the examples.
> - Use "clock-controller" node name suffix in the examples.
> - Remove unnecessary comments in the clocks dt-bindings header file.
> ---
>  .../bindings/clock/baikal,bt1-ccu-pll.yaml    | 127 ++++++++++++++++++
>  include/dt-bindings/clock/bt1-ccu.h           |  16 +++
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
>  create mode 100644 include/dt-bindings/clock/bt1-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> new file mode 100644
> index 000000000000..571181758ef2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/baikal,bt1-ccu-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Baikal-T1 Clock Control Unit PLL
> +
> +maintainers:
> +  - Serge Semin <fancer.lancer@gmail.com>
> +
> +description: |
> +  Clocks Control Unit is the core of Baikal-T1 SoC System Controller
> +  responsible for the chip subsystems clocking and resetting. The CCU is
> +  connected with an external fixed rate oscillator, which signal is transformed
> +  into clocks of various frequencies and then propagated to either individual
> +  IP-blocks or to groups of blocks (clock domains). The transformation is done
> +  by means of PLLs and gateable/non-gateable dividers embedded into the CCU.
> +  It's logically divided into the next components:
> +  1) External oscillator (normally XTAL's 25 MHz crystal oscillator, but
> +     in general can provide any frequency supported by the CCU PLLs).
> +  2) PLLs clocks generators (PLLs) - described in this binding file.
> +  3) AXI-bus clock dividers (AXI).
> +  4) System devices reference clock dividers (SYS).
> +  which are connected with each other as shown on the next figure:
> +
> +          +---------------+
> +          | Baikal-T1 CCU |
> +          |   +----+------|- MIPS P5600 cores
> +          | +-|PLLs|------|- DDR controller
> +          | | +----+      |
> +  +----+  | |  |  |       |
> +  |XTAL|--|-+  |  | +---+-|
> +  +----+  | |  |  +-|AXI|-|- AXI-bus
> +          | |  |    +---+-|
> +          | |  |          |
> +          | |  +----+---+-|- APB-bus
> +          | +-------|SYS|-|- Low-speed Devices
> +          |         +---+-|- High-speed Devices
> +          +---------------+

Are you going to just duplicate all this for each sub-block? 

> +
> +  Each CCU sub-block is represented as a separate dts-node and has an
> +  individual driver to be bound with.
> +
> +  In order to create signals of wide range frequencies the external oscillator
> +  output is primarily connected to a set of CCU PLLs. There are five PLLs
> +  to create a clock for the MIPS P5600 cores, the embedded DDR controller,
> +  SATA, Ethernet and PCIe domains. The last three domains though named by the
> +  biggest system interfaces in fact include nearly all of the rest SoC
> +  peripherals. Each of the PLLs is based on True Circuits TSMC CLN28HPM core
> +  with an interface wrapper (so called safe PLL' clocks switcher) to simplify
> +  the PLL configuration procedure. The PLLs work as depicted on the next
> +  diagram:
> +
> +      +--------------------------+
> +      |                          |
> +      +-->+---+    +---+   +---+ |  +---+   0|\
> +  CLKF--->|/NF|--->|PFD|...|VCO|-+->|/OD|--->| |
> +          +---+ +->+---+   +---+ /->+---+    | |--->CLKOUT
> +  CLKOD---------C----------------+          1| |
> +       +--------C--------------------------->|/
> +       |        |                             ^
> +  Rclk-+->+---+ |                             |
> +  CLKR--->|/NR|-+                             |
> +          +---+                               |
> +  BYPASS--------------------------------------+
> +  BWADJ--->
> +
> +  where Rclk is the reference clock coming  from XTAL, NR - reference clock
> +  divider, NF - PLL clock multiplier, OD - VCO output clock divider, CLKOUT -
> +  output clock, BWADJ is the PLL bandwidth adjustment parameter. At this moment
> +  the binding supports the PLL dividers configuration in accordance with a
> +  requested rate, while bypassing and bandwidth adjustment settings can be
> +  added in future if it gets to be necessary.
> +
> +  The PLLs CLKOUT is then either directly connected with the corresponding
> +  clocks consumer (like P5600 cores or DDR controller) or passed over a CCU
> +  divider to create a signal required for the clock domain.
> +
> +  The CCU PLL dts-node uses the common clock bindings with no custom
> +  parameters. The list of exported clocks can be found in
> +  'include/dt-bindings/clock/bt1-ccu.h'. Since CCU PLL is a part of the
> +  Baikal-T1 SoC System Controller its DT node is supposed to be a child of
> +  later one.

The schema can and should express this. IOW, either move this into the 
system controller schema or reference this ($ref) from it.

> +
> +properties:
> +  compatible:
> +    const: baikal,bt1-ccu-pll
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    description: External reference clock
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ref_clk
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  # Clock Control Unit PLL node:
> +  - |
> +    clock-controller-pll {
> +      compatible = "baikal,bt1-ccu-pll";
> +      #clock-cells = <1>;
> +
> +      clocks = <&clk25m>;
> +      clock-names = "ref_clk";

If there's a register range within the system controller for the pll, 
then add 'reg' even if Linux doesn't use it.

> +    };
> +  # Required external oscillator:
> +  - |
> +    clk25m: clock-oscillator-25m {
> +      compatible = "fixed-clock";
> +      #clock-cells = <0>;
> +      clock-frequency  = <25000000>;
> +      clock-output-names = "clk25m";
> +    };
> +...
> diff --git a/include/dt-bindings/clock/bt1-ccu.h b/include/dt-bindings/clock/bt1-ccu.h
> new file mode 100644
> index 000000000000..931a4bea67c0
> --- /dev/null
> +++ b/include/dt-bindings/clock/bt1-ccu.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
> + *
> + * Baikal-T1 CCU clock indices
> + */
> +#ifndef __DT_BINDINGS_CLOCK_BT1_CCU_H
> +#define __DT_BINDINGS_CLOCK_BT1_CCU_H
> +
> +#define CCU_CPU_PLL			0
> +#define CCU_SATA_PLL			1
> +#define CCU_DDR_PLL			2
> +#define CCU_PCIE_PLL			3
> +#define CCU_ETH_PLL			4
> +
> +#endif /* __DT_BINDINGS_CLOCK_BT1_CCU_H */
> -- 
> 2.25.1
> 
