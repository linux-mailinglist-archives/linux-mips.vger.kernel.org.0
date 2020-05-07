Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE431C9E96
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 00:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgEGWlt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 18:41:49 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39048 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgEGWls (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 18:41:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 4376580307C2;
        Thu,  7 May 2020 22:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id t8s8ukNo7Mpq; Fri,  8 May 2020 01:41:43 +0300 (MSK)
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
Subject: [PATCH v2 2/4] dt-bindings: bus: Add Baikal-T1 APB-bus binding
Date:   Fri, 8 May 2020 01:41:14 +0300
Message-ID: <20200507224116.1523-3-Sergey.Semin@baikalelectronics.ru>
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

Baikal-T1 CPU or DMAC MMIO requests are handled by the AMBA 3 AXI
Interconnect which routes them to the AXI-APB bridge, which in turn
serializes accesses and routes them to the corresponding APB slave device.
This binding describes the AXI-APB bridge considered as the APB-bus. It is
supposed to be compatible with "be,bt1-apb" and "simple-bus" drivers,
should be equipped with EHB MMIO region and a region with no slave device
mapped, interrupts line number, APB reference clock and domain reset line.

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
- Don't use a multi-arg clock phandle reference in the examples dt-bindings
  property. Thus redundant include statement can be removed.
- Use dual GPL/BSD license.
- Use single lined copyright header.
- Lowercase the unit-address.
- Convert a dedicated EHB block binding to the Baikal-T1 APB-bus one.
- Add APB reference clock and reset support.
- Replace "additionalProperties: false" property with
  "unevaluatedProperties: false".
- Add reg-names property.
---
 .../bindings/bus/baikal,bt1-apb.yaml          | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml

diff --git a/Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml b/Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml
new file mode 100644
index 000000000000..d6a3b71ea835
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/baikal,bt1-apb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Baikal-T1 APB-bus
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description: |
+  Baikal-T1 CPU or DMAC MMIO requests are handled by the AMBA 3 AXI Interconnect
+  which routes them to the AXI-APB bridge. This interface is a single master
+  multiple slaves bus in turn serializing IO accesses and routing them to the
+  addressed APB slave devices. In case of any APB protocol collisions, slave
+  device not responding on timeout an IRQ is raised with an erroneous address
+  reported to the APB terminator (APB Errors Handler Block).
+
+allOf:
+ - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: baikal,bt1-apb
+
+  reg:
+    items:
+      - description: APB EHB MMIO registers
+      - description: APB MMIO region with no any device mapped
+
+  reg-names:
+    items:
+      - const: ehb
+      - const: nodev
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB reference clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+  resets:
+    items:
+      - description: APB domain reset line
+
+  reset-names:
+    items:
+      - const: prst
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+
+    bus@1f059000 {
+      compatible = "baikal,bt1-apb", "simple-bus";
+      reg = <0 0x1f059000 0 0x1000>,
+            <0 0x1d000000 0 0x2040000>;
+      reg-names = "ehb", "nodev";
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      ranges;
+
+      interrupts = <GIC_SHARED 16 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&ccu_sys 1>;
+      clock-names = "pclk";
+
+      resets = <&ccu_sys 1>;
+      reset-names = "prst";
+    };
+...
-- 
2.25.1

