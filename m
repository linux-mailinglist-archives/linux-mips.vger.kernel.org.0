Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60E11E228D
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388933AbgEZM75 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 08:59:57 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57282 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgEZM7k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 08:59:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 66961803086B;
        Tue, 26 May 2020 12:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id B2Q0vX5ntY65; Tue, 26 May 2020 15:59:34 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>, <linux-mips@vger.kernel.org>,
        <soc@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: bus: Add Baikal-T1 AXI-bus binding
Date:   Tue, 26 May 2020 15:59:23 +0300
Message-ID: <20200526125928.17096-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: linux-mips@vger.kernel.org
Cc: soc@kernel.org

---

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

Changelog v3:
- Add syscon EHB registers range to the reg property as optional entry.
---
 .../bindings/bus/baikal,bt1-axi.yaml          | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml

diff --git a/Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml b/Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
new file mode 100644
index 000000000000..203bc0e5346b
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
@@ -0,0 +1,107 @@
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
+    minItems: 1
+    items:
+      - description: Synopsys DesignWare AXI Interconnect QoS registers
+      - description: AXI EHB MMIO system controller registers
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: qos
+      - const: ehb
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
+  - reg-names
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
+      reg = <0 0x1f05a000 0 0x1000>,
+            <0 0x1f04d110 0 0x8>;
+      reg-names = "qos", "ehb";
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
2.26.2

