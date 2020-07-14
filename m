Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD3221F202
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 14:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgGNM6N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 08:58:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33208 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgGNM6C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 08:58:02 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9711C8040A6B;
        Tue, 14 Jul 2020 12:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xP8fv7HxxHNJ; Tue, 14 Jul 2020 15:57:57 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>, James Hogan <jhogan@kernel.org>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/6] dt-bindings: interrupt-controller: Convert mti,gic to DT schema
Date:   Tue, 14 Jul 2020 15:57:48 +0300
Message-ID: <20200714125753.22466-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
References: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modern device tree bindings are supposed to be created as YAML-files
in accordance with DT schema. This commit replaces MIPS GIC legacy bare
text binding with YAML file. As before the binding file states that the
corresponding dts node is supposed to be compatible with MIPS Global
Interrupt Controller indicated by the "mti,gic" compatible string and
to provide a mandatory interrupt-controller and '#interrupt-cells'
properties. There might be optional registers memory range,
"mti,reserved-cpu-vectors" and "mti,reserved-ipi-vectors" properties
specified.

MIPS GIC also includes a free-running global timer, per-CPU count/compare
timers, and a watchdog. Since currently the GIC Timer is only supported the
DT schema expects an IRQ and clock-phandler charged timer sub-node with
"mti,mips-gic-timer" compatible string.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

I don't really know who is the corresponding driver maintainer, so I
added Paul to the maintainers property since he used to be looking for the
MIPS arch and Thomas looking after it now. Any idea what email should be
specified there instead?

Changelog prev:
- Since timer sub-node has no unit-address, the node shouldn't be named
  with one. So alter the MIPS GIC bindings to have a pure "timer"
  sub-node.
- Discard allOf: [ $ref: /schemas/interrupt-controller.yaml# ].
- Since it's a conversion patch use GPL-2.0-only SPDX header.
---
 .../interrupt-controller/mips-gic.txt         |  67 --------
 .../interrupt-controller/mti,gic.yaml         | 148 ++++++++++++++++++
 2 files changed, 148 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
deleted file mode 100644
index 173595305e26..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-MIPS Global Interrupt Controller (GIC)
-
-The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
-It also supports local (per-processor) interrupts and software-generated
-interrupts which can be used as IPIs.  The GIC also includes a free-running
-global timer, per-CPU count/compare timers, and a watchdog.
-
-Required properties:
-- compatible : Should be "mti,gic".
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt specifier.  Should be 3.
-  - The first cell is the type of interrupt, local or shared.
-    See <include/dt-bindings/interrupt-controller/mips-gic.h>.
-  - The second cell is the GIC interrupt number.
-  - The third cell encodes the interrupt flags.
-    See <include/dt-bindings/interrupt-controller/irq.h> for a list of valid
-    flags.
-
-Optional properties:
-- reg : Base address and length of the GIC registers.  If not present,
-  the base address reported by the hardware GCR_GIC_BASE will be used.
-- mti,reserved-cpu-vectors : Specifies the list of CPU interrupt vectors
-  to which the GIC may not route interrupts.  Valid values are 2 - 7.
-  This property is ignored if the CPU is started in EIC mode.
-- mti,reserved-ipi-vectors : Specifies the range of GIC interrupts that are
-  reserved for IPIs.
-  It accepts 2 values, the 1st is the starting interrupt and the 2nd is the size
-  of the reserved range.
-  If not specified, the driver will allocate the last 2 * number of VPEs in the
-  system.
-
-Required properties for timer sub-node:
-- compatible : Should be "mti,gic-timer".
-- interrupts : Interrupt for the GIC local timer.
-
-Optional properties for timer sub-node:
-- clocks : GIC timer operating clock.
-- clock-frequency : Clock frequency at which the GIC timers operate.
-
-Note that one of clocks or clock-frequency must be specified.
-
-Example:
-
-	gic: interrupt-controller@1bdc0000 {
-		compatible = "mti,gic";
-		reg = <0x1bdc0000 0x20000>;
-
-		interrupt-controller;
-		#interrupt-cells = <3>;
-
-		mti,reserved-cpu-vectors = <7>;
-		mti,reserved-ipi-vectors = <40 8>;
-
-		timer {
-			compatible = "mti,gic-timer";
-			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-			clock-frequency = <50000000>;
-		};
-	};
-
-	uart@18101400 {
-		...
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
new file mode 100644
index 000000000000..9f0eb3addac4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mti,gic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS Global Interrupt Controller
+
+maintainers:
+  - Paul Burton <paulburton@kernel.org>
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+description: |
+  The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
+  It also supports local (per-processor) interrupts and software-generated
+  interrupts which can be used as IPIs. The GIC also includes a free-running
+  global timer, per-CPU count/compare timers, and a watchdog.
+
+properties:
+  compatible:
+    const: mti,gic
+
+  "#interrupt-cells":
+    const: 3
+    description: |
+      The 1st cell is the type of interrupt: local or shared defined in the
+      file 'dt-bindings/interrupt-controller/mips-gic.h'. The 2nd cell is the
+      GIC interrupt number. The 3d cell encodes the interrupt flags setting up
+      the IRQ trigger modes, which are defined in the file
+      'dt-bindings/interrupt-controller/irq.h'.
+
+  reg:
+    description: |
+      Base address and length of the GIC registers space. If not present,
+      the base address reported by the hardware GCR_GIC_BASE will be used.
+    maxItems: 1
+
+  interrupt-controller: true
+
+  mti,reserved-cpu-vectors:
+    description: |
+      Specifies the list of CPU interrupt vectors to which the GIC may not
+      route interrupts. This property is ignored if the CPU is started in EIC
+      mode.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint32-array
+      - minItems: 1
+        maxItems: 6
+        uniqueItems: true
+        items:
+          minimum: 2
+          maximum: 7
+
+  mti,reserved-ipi-vectors:
+    description: |
+      Specifies the range of GIC interrupts that are reserved for IPIs.
+      It accepts two values: the 1st is the starting interrupt and the 2nd is
+      the size of the reserved range. If not specified, the driver will
+      allocate the last (2 * number of VPEs in the system).
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint32-array
+      - items:
+          - minimum: 0
+            maximum: 254
+          - minimum: 2
+            maximum: 254
+
+  timer:
+    type: object
+    description: |
+      MIPS GIC includes a free-running global timer, per-CPU count/compare
+      timers, and a watchdog. Currently only the GIC Timer is supported.
+    properties:
+      compatible:
+        const: mti,gic-timer
+
+      interrupts:
+        description: |
+          Interrupt for the GIC local timer, so normally it's suppose to be of
+          <GIC_LOCAL X IRQ_TYPE_NONE> format.
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-frequency: true
+
+    required:
+      - compatible
+      - interrupts
+
+    oneOf:
+      - required:
+          - clocks
+      - required:
+          - clock-frequency
+
+    additionalProperties: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#interrupt-cells"
+  - interrupt-controller
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@1bdc0000 {
+      compatible = "mti,gic";
+      reg = <0x1bdc0000 0x20000>;
+      interrupt-controller;
+      #interrupt-cells = <3>;
+      mti,reserved-cpu-vectors = <7>;
+      mti,reserved-ipi-vectors = <40 8>;
+
+      timer {
+        compatible = "mti,gic-timer";
+        interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
+        clock-frequency = <50000000>;
+      };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@1bdc0000 {
+      compatible = "mti,gic";
+      reg = <0x1bdc0000 0x20000>;
+      interrupt-controller;
+      #interrupt-cells = <3>;
+
+      timer {
+        compatible = "mti,gic-timer";
+        interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
+        clocks = <&cpu_pll>;
+      };
+    };
+  - |
+    interrupt-controller {
+      compatible = "mti,gic";
+      interrupt-controller;
+      #interrupt-cells = <3>;
+    };
+...
-- 
2.26.2

