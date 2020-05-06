Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C5D1C7CA0
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 23:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730113AbgEFVl2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 17:41:28 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33846 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729600AbgEFVl1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 17:41:27 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A25C4803087C;
        Wed,  6 May 2020 21:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id It840X74PCZn; Thu,  7 May 2020 00:41:22 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: rtc: Convert snps,dw-apb-timer to DT schema
Date:   Thu, 7 May 2020 00:41:01 +0300
Message-ID: <20200506214107.25956-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modern device tree bindings are supposed to be created as YAML-files
in accordance with DT schema. This commit replaces Synopsys DW Timer
legacy bare text binding with YAML file. As before the binding file
states that the corresponding dts node is supposed to be compatible
with generic DW APB Timer indicated by the "snps,dw-apb-timer"
compatible string and to provide a mandatory registers memory range,
one timer interrupt, either reference clock source or a fixed clock
rate value. It may also have an optional APB bus reference clock
phandle specified.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org

---

This binding file doesn't belong to the bindings/rtc seeing it's a pure
timer with no rtc facilities like days/months/years counting and alarms.
The binding file will be moved to the
"Documentation/devicetree/bindings/timer/" directory in the next patch.

I also don't know who is the corresponding driver maintainer, so I added
Daniel Lezcano to the maintainers schema. Any idea what email should be
specified there instead?

Changelog v3:
- Since it's a conversion patch use GPL-2.0-only SPDX header.
- Replace "additionalProperties: false" property with
  "unevaluatedProperties: false".
---
 .../devicetree/bindings/rtc/dw-apb.txt        | 32 -------
 .../bindings/rtc/snps,dw-apb-timer.yaml       | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/dw-apb.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml

diff --git a/Documentation/devicetree/bindings/rtc/dw-apb.txt b/Documentation/devicetree/bindings/rtc/dw-apb.txt
deleted file mode 100644
index c703d51abb6c..000000000000
--- a/Documentation/devicetree/bindings/rtc/dw-apb.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Designware APB timer
-
-Required properties:
-- compatible: One of:
- 	"snps,dw-apb-timer"
-	"snps,dw-apb-timer-sp" <DEPRECATED>
-	"snps,dw-apb-timer-osc" <DEPRECATED>
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the timer.
-- either clocks+clock-names or clock-frequency properties
-
-Optional properties:
-- clocks	: list of clock specifiers, corresponding to entries in
-		  the clock-names property;
-- clock-names	: should contain "timer" and "pclk" entries, matching entries
-		  in the clocks property.
-- clock-frequency: The frequency in HZ of the timer.
-- clock-freq: For backwards compatibility with picoxcell
-
-If using the clock specifiers, the pclk clock is optional, as not all
-systems may use one.
-
-
-Example:
-	timer@ffe00000 {
-		compatible = "snps,dw-apb-timer";
-		interrupts = <0 170 4>;
-		reg = <0xffe00000 0x1000>;
-		clocks = <&timer_clk>, <&timer_pclk>;
-		clock-names = "timer", "pclk";
-	};
diff --git a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
new file mode 100644
index 000000000000..002fe1ee709b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/snps,dw-apb-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare APB Timer
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: snps,dw-apb-timer
+      - enum:
+          - snps,dw-apb-timer-sp
+          - snps,dw-apb-timer-osc
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+       - description: Timer ticks reference clock source
+       - description: APB interface clock source
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: timer
+      - const: pclk
+
+  clock-frequency: true
+
+  clock-freq:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: |
+      Has the same meaning as the 'clock-frequency' property - timer clock
+      frequency in HZ, but is defined only for the backwards compatibility
+      with the picoxcell platform.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+oneOf:
+  - required:
+      - clocks
+      - clock-names
+  - required:
+      - clock-frequency
+  - required:
+      - clock-freq
+
+examples:
+  - |
+    timer@ffe00000 {
+      compatible = "snps,dw-apb-timer";
+      interrupts = <0 170 4>;
+      reg = <0xffe00000 0x1000>;
+      clocks = <&timer_clk>, <&timer_pclk>;
+      clock-names = "timer", "pclk";
+    };
+  - |
+    timer@ffe00000 {
+      compatible = "snps,dw-apb-timer";
+      interrupts = <0 170 4>;
+      reg = <0xffe00000 0x1000>;
+      clocks = <&timer_clk>;
+      clock-names = "timer";
+    };
+  - |
+    timer@ffe00000 {
+      compatible = "snps,dw-apb-timer";
+      interrupts = <0 170 4>;
+      reg = <0xffe00000 0x1000>;
+      clock-frequency = <25000000>;
+    };
+...
-- 
2.25.1

