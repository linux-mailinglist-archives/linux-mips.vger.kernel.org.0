Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB761A68B5
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbgDMP1O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:27:14 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:39604 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgDMP1N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791630; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=BpUJKSG1QLwuJ8g/pPckTiPCHG4DN8mcNSgmsGC72ho=;
        b=uK67vhGuVa81RDQWDAezncZS76DHPz9eoSBJb+3/UCrpQpWgLa0yAaJhD26+340Lp1My99
        QddxVaHBAgzVRwcmuROY0KVpuvoCLWre0a4UMDUL3F4Xgi4sDjCVMwUmZp0Nmk6NssqWph
        wKog0aR0w6Pdd98mDTuouLWERdjPkNU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 01/13] dt-bindings: timer: Convert ingenic,tcu.txt to YAML
Date:   Mon, 13 Apr 2020 17:26:21 +0200
Message-Id: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the ingenic,tcu.txt file to YAML.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    This one patch was sent as standalone before, so it's technically
    a V2. Support for 'assigned-clocks', 'assigned-clock-parents',
    'assigned-clock-rates' was added.

 .../devicetree/bindings/timer/ingenic,tcu.txt | 138 ---------
 .../bindings/timer/ingenic,tcu.yaml           | 281 ++++++++++++++++++
 2 files changed, 281 insertions(+), 138 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.yaml

diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
deleted file mode 100644
index 91f704951845..000000000000
--- a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
+++ /dev/null
@@ -1,138 +0,0 @@
-Ingenic JZ47xx SoCs Timer/Counter Unit devicetree bindings
-==========================================================
-
-For a description of the TCU hardware and drivers, have a look at
-Documentation/mips/ingenic-tcu.rst.
-
-Required properties:
-
-- compatible: Must be one of:
-  * ingenic,jz4740-tcu
-  * ingenic,jz4725b-tcu
-  * ingenic,jz4770-tcu
-  * ingenic,x1000-tcu
-  followed by "simple-mfd".
-- reg: Should be the offset/length value corresponding to the TCU registers
-- clocks: List of phandle & clock specifiers for clocks external to the TCU.
-  The "pclk", "rtc" and "ext" clocks should be provided. The "tcu" clock
-  should be provided if the SoC has it.
-- clock-names: List of name strings for the external clocks.
-- #clock-cells: Should be <1>;
-  Clock consumers specify this argument to identify a clock. The valid values
-  may be found in <dt-bindings/clock/ingenic,tcu.h>.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value should be 1.
-- interrupts : Specifies the interrupt the controller is connected to.
-
-Optional properties:
-
-- ingenic,pwm-channels-mask: Bitmask of TCU channels reserved for PWM use.
-  Default value is 0xfc.
-
-
-Children nodes
-==========================================================
-
-
-PWM node:
----------
-
-Required properties:
-
-- compatible: Must be one of:
-  * ingenic,jz4740-pwm
-  * ingenic,jz4725b-pwm
-- #pwm-cells: Should be 3. See ../pwm/pwm.yaml for a description of the cell
-  format.
-- clocks: List of phandle & clock specifiers for the TCU clocks.
-- clock-names: List of name strings for the TCU clocks.
-
-
-Watchdog node:
---------------
-
-Required properties:
-
-- compatible: Must be "ingenic,jz4740-watchdog"
-- clocks: phandle to the WDT clock
-- clock-names: should be "wdt"
-
-
-OS Timer node:
----------
-
-Required properties:
-
-- compatible: Must be one of:
-  * ingenic,jz4725b-ost
-  * ingenic,jz4770-ost
-- clocks: phandle to the OST clock
-- clock-names: should be "ost"
-- interrupts : Specifies the interrupt the OST is connected to.
-
-
-Example
-==========================================================
-
-#include <dt-bindings/clock/jz4770-cgu.h>
-#include <dt-bindings/clock/ingenic,tcu.h>
-
-/ {
-	tcu: timer@10002000 {
-		compatible = "ingenic,jz4770-tcu", "simple-mfd";
-		reg = <0x10002000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x10002000 0x1000>;
-
-		#clock-cells = <1>;
-
-		clocks = <&cgu JZ4770_CLK_RTC
-			  &cgu JZ4770_CLK_EXT
-			  &cgu JZ4770_CLK_PCLK>;
-		clock-names = "rtc", "ext", "pclk";
-
-		interrupt-controller;
-		#interrupt-cells = <1>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <27 26 25>;
-
-		watchdog: watchdog@0 {
-			compatible = "ingenic,jz4740-watchdog";
-			reg = <0x0 0xc>;
-
-			clocks = <&tcu TCU_CLK_WDT>;
-			clock-names = "wdt";
-		};
-
-		pwm: pwm@40 {
-			compatible = "ingenic,jz4740-pwm";
-			reg = <0x40 0x80>;
-
-			#pwm-cells = <3>;
-
-			clocks = <&tcu TCU_CLK_TIMER0
-				  &tcu TCU_CLK_TIMER1
-				  &tcu TCU_CLK_TIMER2
-				  &tcu TCU_CLK_TIMER3
-				  &tcu TCU_CLK_TIMER4
-				  &tcu TCU_CLK_TIMER5
-				  &tcu TCU_CLK_TIMER6
-				  &tcu TCU_CLK_TIMER7>;
-			clock-names = "timer0", "timer1", "timer2", "timer3",
-				      "timer4", "timer5", "timer6", "timer7";
-		};
-
-		ost: timer@e0 {
-			compatible = "ingenic,jz4770-ost";
-			reg = <0xe0 0x20>;
-
-			clocks = <&tcu TCU_CLK_OST>;
-			clock-names = "ost";
-
-			interrupts = <15>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml b/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml
new file mode 100644
index 000000000000..e21e9972ed65
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml
@@ -0,0 +1,281 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/ingenic,tcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs Timer/Counter Unit (TCU) devicetree bindings
+
+description: |
+  For a description of the TCU hardware and drivers, have a look at
+  Documentation/mips/ingenic-tcu.rst.
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ingenic,jz4740-tcu
+          - ingenic,jz4725b-tcu
+          - ingenic,jz4770-tcu
+          - ingenic,jz4780-tcu
+          - ingenic,x1000-tcu
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^timer@[0-9a-f]+$"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-controller: true
+
+  ranges: true
+
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - ingenic,jz4740-tcu
+          - ingenic,jz4725b-tcu
+          - ingenic,jz4770-tcu
+          - ingenic,x1000-tcu
+        - const: simple-mfd
+      - items:
+        - const: ingenic,jz4780-tcu
+        - const: ingenic,jz4770-tcu
+        - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RTC clock
+      - description: EXT clock
+      - description: PCLK clock
+      - description: TCU clock
+    minItems: 3
+
+  clock-names:
+    items:
+      - const: rtc
+      - const: ext
+      - const: pclk
+      - const: tcu
+    minItems: 3
+
+  interrupts:
+    items:
+      - description: TCU0 interrupt
+      - description: TCU1 interrupt
+      - description: TCU2 interrupt
+    minItems: 1
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 8
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 8
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 8
+
+  ingenic,pwm-channels-mask:
+    description: Bitmask of TCU channels reserved for PWM use.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0x00
+      - maximum: 0xff
+      - default: 0xfc
+
+patternProperties:
+  "^watchdog@[a-f0-9]+$":
+    type: object
+    allOf: [ $ref: ../watchdog/watchdog.yaml# ]
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+            - ingenic,jz4740-watchdog
+            - ingenic,jz4780-watchdog
+          - items:
+            - const: ingenic,jz4770-watchdog
+            - const: ingenic,jz4740-watchdog
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        const: wdt
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+
+  "^pwm@[a-f0-9]+$":
+    type: object
+    allOf: [ $ref: ../pwm/pwm.yaml# ]
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+            - ingenic,jz4740-pwm
+          - items:
+            - enum:
+              - ingenic,jz4770-pwm
+              - ingenic,jz4780-pwm
+            - const: ingenic,jz4740-pwm
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        minItems: 6
+        maxItems: 8
+
+      clock-names:
+        items:
+          - const: timer0
+          - const: timer1
+          - const: timer2
+          - const: timer3
+          - const: timer4
+          - const: timer5
+          - const: timer6
+          - const: timer7
+        minItems: 6
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+
+  "^timer@[a-f0-9]+$":
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+            - ingenic,jz4725b-ost
+            - ingenic,jz4770-ost
+          - items:
+            - const: ingenic,jz4780-ost
+            - const: ingenic,jz4770-ost
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        const: ost
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+      - interrupts
+
+    additionalProperties: false
+
+required:
+  - "#clock-cells"
+  - "#interrupt-cells"
+  - interrupt-controller
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4770-cgu.h>
+    #include <dt-bindings/clock/ingenic,tcu.h>
+    tcu: timer@10002000 {
+      compatible = "ingenic,jz4770-tcu", "simple-mfd";
+      reg = <0x10002000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0x10002000 0x1000>;
+
+      #clock-cells = <1>;
+
+      clocks = <&cgu JZ4770_CLK_RTC>,
+               <&cgu JZ4770_CLK_EXT>,
+               <&cgu JZ4770_CLK_PCLK>;
+      clock-names = "rtc", "ext", "pclk";
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <27 26 25>;
+
+      watchdog: watchdog@0 {
+        compatible = "ingenic,jz4770-watchdog", "ingenic,jz4740-watchdog";
+        reg = <0x0 0xc>;
+
+        clocks = <&tcu TCU_CLK_WDT>;
+        clock-names = "wdt";
+      };
+
+      pwm: pwm@40 {
+        compatible = "ingenic,jz4770-pwm", "ingenic,jz4740-pwm";
+        reg = <0x40 0x80>;
+
+        #pwm-cells = <3>;
+
+        clocks = <&tcu TCU_CLK_TIMER0>,
+                 <&tcu TCU_CLK_TIMER1>,
+                 <&tcu TCU_CLK_TIMER2>,
+                 <&tcu TCU_CLK_TIMER3>,
+                 <&tcu TCU_CLK_TIMER4>,
+                 <&tcu TCU_CLK_TIMER5>,
+                 <&tcu TCU_CLK_TIMER6>,
+                 <&tcu TCU_CLK_TIMER7>;
+        clock-names = "timer0", "timer1", "timer2", "timer3",
+                "timer4", "timer5", "timer6", "timer7";
+      };
+
+      ost: timer@e0 {
+        compatible = "ingenic,jz4770-ost";
+        reg = <0xe0 0x20>;
+
+        clocks = <&tcu TCU_CLK_OST>;
+        clock-names = "ost";
+
+        interrupts = <15>;
+      };
+    };
-- 
2.25.1

