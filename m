Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481EA1E3244
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 00:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391548AbgEZWVV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 18:21:21 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60074 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389613AbgEZWVU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 18:21:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 167C2803086E;
        Tue, 26 May 2020 22:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kg_cMxTvKrmA; Wed, 27 May 2020 01:21:15 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] clk: Add Baikal-T1 SoC Clock Control Unit support
Date:   Wed, 27 May 2020 01:20:52 +0300
Message-ID: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Stephen, Michael, the merge window is upon us, please review/merge in/whatever
this patchset.

Clocks Control Unit is the core of Baikal-T1 SoC responsible for the chip
subsystems clocking and resetting. The CCU is connected with an external
fixed rate oscillator, which signal is transformed into clocks of various
frequencies and then propagated to either individual IP-blocks or to groups
of blocks (clock domains). The transformation is done by means of PLLs and
gateable/non-gateable, fixed/variable dividers embedded into the CCU. There
are five PLLs to create a clock for the MIPS P5600 cores, the embedded DDR
controller, SATA, Ethernet and PCIe domains. The last three PLLs CLKOUT are
then passed over CCU dividers to create signals required for the target clock
domains: individual AXI and APB bus clocks, SoC devices reference clocks.
The CCU divider registers may also provide a way to reset the target devices
state.

So this patchset introduces the Baikal-T1 clock and reset drivers of CCU
PLLs, AXI-bus clock dividers and system devices clock dividers.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Changelog v2:
- Rearrange the SoBs.
- Discard comments in the binding files headers.
- Add dual GPL/BSD license to the bindings.
- Add spaces around the ASCII-graphics in the bindings description.
- Discard redundant dt objects check against "/schemas/clock/clock.yaml#"
  schema.
- Discard redundant descriptions of the "#clock-cells" and "#reset-cells"
  properties in dt bindings schema.
- Discard "reg" property since the CCU dividers DT nodes are supposed be
  children of the syscon-compatible system controller node.
- Remove "clock-output-names" property support.
- Replace "additionalProperties: false" with "unevaluatedProperties: false"
  in the bindings.
- Lowercase the nodes name in the binding examples.
- Use "clock-controller" node name suffix in the binding examples.
- Remove unnecessary comments in the clocks and resets dt-binding header
  files.
- Don't enable the CCU clock drivers by default for COMPILE_TEST config.
- Make sure the CCU drivers depend on OF kernel config only when built for
  Baikal-T1-based platform.
- Fix spelling in the CCU PLL and Dividers kernel configs description.
- Replace lock delay and frequency calculation macros with inline functions.
- Use 64-bits arithmetics in the CCU PLL frequency calculation function.
- Use FIELD_{GET,PREP}() macro instead of handwritten field setters and
  getters.
- Discard CLK_IGNORE_UNUSED flag setting. It's redundant since CLK_IS_CRITICAL
  is enough for cases when it's appropriate.
- Comment out the CLK_IS_CRITICAL flag settings.
- Discard !pll and !div tests from ccu_pll_hw_unregister() and ccu_div_get_clk_id()
  methods respectively.
- Discard alive probe messages.
- Convert the drivers to using syscon regmap instead of direct IO methods,
  since now the PLLs DT node is supposed to be a sub-node of the Baikal-T1
  System Controller node.
- Add DebugFS nodes in RO-mode by default.

Link: https://lore.kernel.org/linux-clk/20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru/
Changelog v3:
- Get the reg property back to the DT bindings even though the driver is
  using the parental syscon regmap.
- The DT schema will live separately from the system controller, but the
  corresponding sub-node of the later DT schema will $ref this one.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (4):
  dt-bindings: clk: Add Baikal-T1 CCU PLLs binding
  dt-bindings: clk: Add Baikal-T1 CCU Dividers binding
  clk: Add Baikal-T1 CCU PLLs driver
  clk: Add Baikal-T1 CCU Dividers driver

 .../bindings/clock/baikal,bt1-ccu-div.yaml    | 188 ++++++
 .../bindings/clock/baikal,bt1-ccu-pll.yaml    | 131 ++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/baikal-t1/Kconfig                 |  42 ++
 drivers/clk/baikal-t1/Makefile                |   3 +
 drivers/clk/baikal-t1/ccu-div.c               | 602 ++++++++++++++++++
 drivers/clk/baikal-t1/ccu-div.h               | 110 ++++
 drivers/clk/baikal-t1/ccu-pll.c               | 558 ++++++++++++++++
 drivers/clk/baikal-t1/ccu-pll.h               |  64 ++
 drivers/clk/baikal-t1/clk-ccu-div.c           | 487 ++++++++++++++
 drivers/clk/baikal-t1/clk-ccu-pll.c           | 204 ++++++
 include/dt-bindings/clock/bt1-ccu.h           |  48 ++
 include/dt-bindings/reset/bt1-ccu.h           |  25 +
 14 files changed, 2464 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
 create mode 100644 drivers/clk/baikal-t1/Kconfig
 create mode 100644 drivers/clk/baikal-t1/Makefile
 create mode 100644 drivers/clk/baikal-t1/ccu-div.c
 create mode 100644 drivers/clk/baikal-t1/ccu-div.h
 create mode 100644 drivers/clk/baikal-t1/ccu-pll.c
 create mode 100644 drivers/clk/baikal-t1/ccu-pll.h
 create mode 100644 drivers/clk/baikal-t1/clk-ccu-div.c
 create mode 100644 drivers/clk/baikal-t1/clk-ccu-pll.c
 create mode 100644 include/dt-bindings/clock/bt1-ccu.h
 create mode 100644 include/dt-bindings/reset/bt1-ccu.h

-- 
2.26.2

