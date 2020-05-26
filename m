Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A461E3254
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 00:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404177AbgEZWV2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 18:21:28 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60114 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391422AbgEZWVZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 18:21:25 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C87A4803086B;
        Tue, 26 May 2020 22:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pE__-sroFlTw; Wed, 27 May 2020 01:21:17 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: clk: Add Baikal-T1 CCU Dividers binding
Date:   Wed, 27 May 2020 01:20:54 +0300
Message-ID: <20200526222056.18072-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After being gained by the CCU PLLs the signals must be transformed to
be suitable for the clock-consumers. This is done by a set of dividers
embedded into the CCU. A first block of dividers is used to create
reference clocks for AXI-bus of high-speed peripheral IP-cores of the
chip. The second block dividers alter the PLLs output signals to be then
consumed by SoC peripheral devices. Both block DT nodes are ordinary
clock-providers with standard set of properties supported. But in addition
to that each clock provider can be used to reset the corresponding clock
domain. This makes the AXI-bus and System Devices CCU DT nodes to be also
reset-providers.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- Rearrange the SoBs.
- Combine AXI-bus and System Devices CCU bindings into a single file.
- Discard comments in the bindings file header.
- Add dual GPL/BSD license.
- Add spaces around the ASCII-graphics in the binding description.
- Remove reference to Documentation/devicetree/bindings/clock/clock-bindings.txt
  file.
- Discard redundant object check against "/schemas/clock/clock.yaml#" schema.
- Discard redundant descriptions of "#clock-cells" and "#reset-cells"
  properties.
- Discard "reg" property since the CCU dividers DT nodes are supposed be
  children of the syscon-compatible system controller node.
- Remove "clock-output-names" property support.
- Replace "additionalProperties: false" with "unevaluatedProperties: false".
- Lowercase the nodes name in the examples.
- Use "clock-controller" node name suffix in the examples.
- Remove unnecessary comments in the clocks and resets dt-binding header
  files.
- Discard label definitions in the examples.

Changelog v3:
- Get the reg property back even though the driver is using the parental
  syscon regmap.
- The DT schema will live separately from the system controller, but the
  corresponding sub-node of the later DT schema will $ref this one.
---
 .../bindings/clock/baikal,bt1-ccu-div.yaml    | 188 ++++++++++++++++++
 include/dt-bindings/clock/bt1-ccu.h           |  32 +++
 include/dt-bindings/reset/bt1-ccu.h           |  25 +++
 3 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
 create mode 100644 include/dt-bindings/reset/bt1-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
new file mode 100644
index 000000000000..2821425ee445
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/baikal,bt1-ccu-div.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Baikal-T1 Clock Control Unit Dividers
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description: |
+  Clocks Control Unit is the core of Baikal-T1 SoC System Controller
+  responsible for the chip subsystems clocking and resetting. The CCU is
+  connected with an external fixed rate oscillator, which signal is transformed
+  into clocks of various frequencies and then propagated to either individual
+  IP-blocks or to groups of blocks (clock domains). The transformation is done
+  by means of an embedded into CCU PLLs and gateable/non-gateable dividers. The
+  later ones are described in this binding. Each clock domain can be also
+  individually reset by using the domain clocks divider configuration
+  registers. Baikal-T1 CCU is logically divided into the next components:
+  1) External oscillator (normally XTAL's 25 MHz crystal oscillator, but
+     in general can provide any frequency supported by the CCU PLLs).
+  2) PLLs clocks generators (PLLs).
+  3) AXI-bus clock dividers (AXI) - described in this binding file.
+  4) System devices reference clock dividers (SYS) - described in this binding
+     file.
+  which are connected with each other as shown on the next figure:
+
+          +---------------+
+          | Baikal-T1 CCU |
+          |   +----+------|- MIPS P5600 cores
+          | +-|PLLs|------|- DDR controller
+          | | +----+      |
+  +----+  | |  |  |       |
+  |XTAL|--|-+  |  | +---+-|
+  +----+  | |  |  +-|AXI|-|- AXI-bus
+          | |  |    +---+-|
+          | |  |          |
+          | |  +----+---+-|- APB-bus
+          | +-------|SYS|-|- Low-speed Devices
+          |         +---+-|- High-speed Devices
+          +---------------+
+
+  Each sub-block is represented as a separate DT node and has an individual
+  driver to be bound with.
+
+  In order to create signals of wide range frequencies the external oscillator
+  output is primarily connected to a set of CCU PLLs. Some of PLLs CLKOUT are
+  then passed over CCU dividers to create signals required for the target clock
+  domain (like AXI-bus or System Device consumers). The dividers have the
+  following structure:
+
+          +--------------+
+  CLKIN --|->+----+ 1|\  |
+  SETCLK--|--|/DIV|->| | |
+  CLKDIV--|--|    |  | |-|->CLKLOUT
+  LOCK----|--+----+  | | |
+          |          |/  |
+          |           |  |
+  EN------|-----------+  |
+  RST-----|--------------|->RSTOUT
+          +--------------+
+
+  where CLKIN is the reference clock coming either from CCU PLLs or from an
+  external clock oscillator, SETCLK - a command to update the output clock in
+  accordance with a set divider, CLKDIV - clocks divider, LOCK - a signal of
+  the output clock stabilization, EN - enable/disable the divider block,
+  RST/RSTOUT - reset clocks domain signal. Depending on the consumer IP-core
+  peculiarities the dividers may lack of some functionality depicted on the
+  figure above (like EN, CLKDIV/LOCK/SETCLK). In this case the corresponding
+  clock provider just doesn't expose either switching functions, or the rate
+  configuration, or both of them.
+
+  The clock dividers, which output clock is then consumed by the SoC individual
+  devices, are united into a single clocks provider called System Devices CCU.
+  Similarly the dividers with output clocks utilized as AXI-bus reference clocks
+  are called AXI-bus CCU. Both of them use the common clock bindings with no
+  custom properties. The list of exported clocks and reset signals can be found
+  in the files: 'include/dt-bindings/clock/bt1-ccu.h' and
+  'include/dt-bindings/reset/bt1-ccu.h'. Since System Devices and AXI-bus CCU
+  are a part of the Baikal-T1 SoC System Controller their DT nodes are supposed
+  to be a children of later one.
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: baikal,bt1-ccu-axi
+
+then:
+  properties:
+    clocks:
+      items:
+        - description: CCU SATA PLL output clock
+        - description: CCU PCIe PLL output clock
+        - description: CCU Ethernet PLL output clock
+
+    clock-names:
+      items:
+        - const: sata_clk
+        - const: pcie_clk
+        - const: eth_clk
+
+else:
+  properties:
+    clocks:
+      items:
+        - description: External reference clock
+        - description: CCU SATA PLL output clock
+        - description: CCU PCIe PLL output clock
+        - description: CCU Ethernet PLL output clock
+
+    clock-names:
+      items:
+        - const: ref_clk
+        - const: sata_clk
+        - const: pcie_clk
+        - const: eth_clk
+
+properties:
+  compatible:
+    enum:
+      - baikal,bt1-ccu-axi
+      - baikal,bt1-ccu-sys
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+examples:
+  # AXI-bus Clock Control Unit node:
+  - |
+    #include <dt-bindings/clock/bt1-ccu.h>
+
+    clock-controller@1f04d030 {
+      compatible = "baikal,bt1-ccu-axi";
+      reg = <0x1f04d030 0x030>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+
+      clocks = <&ccu_pll CCU_SATA_PLL>,
+               <&ccu_pll CCU_PCIE_PLL>,
+               <&ccu_pll CCU_ETH_PLL>;
+      clock-names = "sata_clk", "pcie_clk", "eth_clk";
+    };
+  # System Devices Clock Control Unit node:
+  - |
+    #include <dt-bindings/clock/bt1-ccu.h>
+
+    clock-controller@1f04d060 {
+      compatible = "baikal,bt1-ccu-sys";
+      reg = <0x1f04d060 0x0a0>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+
+      clocks = <&clk25m>,
+               <&ccu_pll CCU_SATA_PLL>,
+               <&ccu_pll CCU_PCIE_PLL>,
+               <&ccu_pll CCU_ETH_PLL>;
+      clock-names = "ref_clk", "sata_clk", "pcie_clk",
+                    "eth_clk";
+    };
+  # Required Clock Control Unit PLL node:
+  - |
+    ccu_pll: clock-controller@1f04d000 {
+      compatible = "baikal,bt1-ccu-pll";
+      reg = <0x1f04d000 0x028>;
+      #clock-cells = <1>;
+
+      clocks = <&clk25m>;
+      clock-names = "ref_clk";
+    };
+...
diff --git a/include/dt-bindings/clock/bt1-ccu.h b/include/dt-bindings/clock/bt1-ccu.h
index 931a4bea67c0..5f166d27a00a 100644
--- a/include/dt-bindings/clock/bt1-ccu.h
+++ b/include/dt-bindings/clock/bt1-ccu.h
@@ -13,4 +13,36 @@
 #define CCU_PCIE_PLL			3
 #define CCU_ETH_PLL			4
 
+#define CCU_AXI_MAIN_CLK		0
+#define CCU_AXI_DDR_CLK			1
+#define CCU_AXI_SATA_CLK		2
+#define CCU_AXI_GMAC0_CLK		3
+#define CCU_AXI_GMAC1_CLK		4
+#define CCU_AXI_XGMAC_CLK		5
+#define CCU_AXI_PCIE_M_CLK		6
+#define CCU_AXI_PCIE_S_CLK		7
+#define CCU_AXI_USB_CLK			8
+#define CCU_AXI_HWA_CLK			9
+#define CCU_AXI_SRAM_CLK		10
+
+#define CCU_SYS_SATA_REF_CLK		0
+#define CCU_SYS_APB_CLK			1
+#define CCU_SYS_GMAC0_TX_CLK		2
+#define CCU_SYS_GMAC0_PTP_CLK		3
+#define CCU_SYS_GMAC1_TX_CLK		4
+#define CCU_SYS_GMAC1_PTP_CLK		5
+#define CCU_SYS_XGMAC_REF_CLK		6
+#define CCU_SYS_XGMAC_PTP_CLK		7
+#define CCU_SYS_USB_CLK			8
+#define CCU_SYS_PVT_CLK			9
+#define CCU_SYS_HWA_CLK			10
+#define CCU_SYS_UART_CLK		11
+#define CCU_SYS_I2C1_CLK		12
+#define CCU_SYS_I2C2_CLK		13
+#define CCU_SYS_GPIO_CLK		14
+#define CCU_SYS_TIMER0_CLK		15
+#define CCU_SYS_TIMER1_CLK		16
+#define CCU_SYS_TIMER2_CLK		17
+#define CCU_SYS_WDT_CLK			18
+
 #endif /* __DT_BINDINGS_CLOCK_BT1_CCU_H */
diff --git a/include/dt-bindings/reset/bt1-ccu.h b/include/dt-bindings/reset/bt1-ccu.h
new file mode 100644
index 000000000000..3578e83026bc
--- /dev/null
+++ b/include/dt-bindings/reset/bt1-ccu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Baikal-T1 CCU reset indices
+ */
+#ifndef __DT_BINDINGS_RESET_BT1_CCU_H
+#define __DT_BINDINGS_RESET_BT1_CCU_H
+
+#define CCU_AXI_MAIN_RST		0
+#define CCU_AXI_DDR_RST			1
+#define CCU_AXI_SATA_RST		2
+#define CCU_AXI_GMAC0_RST		3
+#define CCU_AXI_GMAC1_RST		4
+#define CCU_AXI_XGMAC_RST		5
+#define CCU_AXI_PCIE_M_RST		6
+#define CCU_AXI_PCIE_S_RST		7
+#define CCU_AXI_USB_RST			8
+#define CCU_AXI_HWA_RST			9
+#define CCU_AXI_SRAM_RST		10
+
+#define CCU_SYS_SATA_REF_RST		0
+#define CCU_SYS_APB_RST			1
+
+#endif /* __DT_BINDINGS_RESET_BT1_CCU_H */
-- 
2.26.2

