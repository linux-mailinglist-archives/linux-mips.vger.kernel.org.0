Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C246F1C9E94
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 00:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgEGWlq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 18:41:46 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39014 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgEGWlp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 18:41:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 8A109803087C;
        Thu,  7 May 2020 22:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vJHN5w8HRwJK; Fri,  8 May 2020 01:41:40 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>, <linux-mips@vger.kernel.org>,
        <soc@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: bus: Add Baikal-T1 AXI-bus binding
Date:   Fri, 8 May 2020 01:41:13 +0300
Message-ID: <20200507224116.1523-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200507224116.1523-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
 <20200507224116.1523-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

AXI3-bus is the main communication bus connecting all high-speed
peripheral IP-cores with RAM controller and with MIPS P5600 cores on
Baikal-T1 SoC. This binding describes the DW AMBA 3 AXI Inteconnect
and Errors Handler Block synthesized on top of it, which are
responsible for the AXI-bus traffic arbitration and errors reporting
upstream to CPU. Baikal-T1 AXI-bus DT node is supposed to be compatible
with "be,bt1-axi" and "simple-bus" drivers, should have reg property with
AXI-bus QOS registers space, syscon phandle reference to the Baikal-T1
System Controller, IRQ line declared, AXI Interconnect reference clock and
reset line.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: linux-mips@vger.kernel.org
Cc: soc@kernel.org

---

Rob, I had to remove your Reviewed-by tag, since new changes had been
introduced.

Changelog v2:
- Move driver to the bus subsystem.
- Use dual GPL/BSD license.
- Use single lined copyright header.
- Lowercase the unit-address.
- Convert a simple EHB block binding to the Baikal-T1 AXI-bus one with
  interconnect capabilities support.
- Replace "additionalProperties: false" property with
  "unevaluatedProperties: false".
- Add AXI reference clock and reset support.
- Add syscon phandle reference to the Baikal-T1 System Controller node.
---
 .../bindings/bus/baikal,bt1-axi.yaml          | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml

diff --git a/Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml b/Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
new file mode 100644
index 000000000000..082ab5c3b4f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/baikal,bt1-axi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Baikal-T1 AXI-bus
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description: |
+  AXI3-bus is the main communication bus of Baikal-T1 SoC connecting all
+  high-speed peripheral IP-cores with RAM controller and with MIPS P5600
+  cores. Traffic arbitration is done by means of DW AXI Interconnect (so
+  called AXI Main Interconnect) routing IO requests from one block to
+  another: from CPU to SoC peripherals and between some SoC peripherals
+  (mostly between peripheral devices and RAM, but also between DMA and
+  some peripherals). In case of any protocol error, device not responding
+  an IRQ is raised and a faulty situation is reported to the AXI EHB
+  (Errors Handler Block) embedded on top of the DW AXI Interconnect and
+  accessible by means of the Baikal-T1 System Controller.
+
+allOf:
+ - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: baikal,bt1-axi
+
+  reg:
+    maxItems: 1
+
+  '#interconnect-cells':
+    const: 1
+
+  syscon:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description: Phandle to the Baikal-T1 System Controller DT node
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main Interconnect uplink reference clock
+
+  clock-names:
+    items:
+      - const: aclk
+
+  resets:
+    items:
+      - description: Main Interconnect reset line
+
+  reset-names:
+    items:
+      - const: arst
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - syscon
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+
+    bus@1f05a000 {
+      compatible = "baikal,bt1-axi", "simple-bus";
+      reg = <0 0x1f05a000 0 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #interconnect-cells = <1>;
+
+      syscon = <&syscon>;
+
+      ranges;
+
+      interrupts = <GIC_SHARED 127 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&ccu_axi 0>;
+      clock-names = "aclk";
+
+      resets = <&ccu_axi 0>;
+      reset-names = "arst";
+    };
+...
-- 
2.25.1

