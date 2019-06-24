Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3170951EA1
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbfFXW6T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:58:19 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33022 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbfFXW6S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 18:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561417096; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BKUOdb8Y8FSPjs1DwkQBMqy8cIVIlNL2F1Wb5t+CtSg=;
        b=tvIWw1fqGtAIVOvNexNbSmWWnNODQWRPs5DmfM1/fM6dVQQSxZ+JZSQ8qIVMbl3V1U5WRx
        s6NKavsze3CLfV+YbPwsZ96JbPZC3w/5LWKrrMCiiTrzGEjOexPy8s0MuP22Hut8D8794n
        0iI6UmjsgYn6y+55eENF07FbphHeyYQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh@kernel.org>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v13 03/13] dt-bindings: Add doc for the Ingenic TCU drivers
Date:   Tue, 25 Jun 2019 00:57:49 +0200
Message-Id: <20190624225759.18299-4-paul@crapouillou.net>
In-Reply-To: <20190624225759.18299-1-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation about how to properly use the Ingenic TCU
(Timer/Counter Unit) drivers from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v4: New patch in this series. Corresponds to V2 patches 3-4-5 with
     added content.
    
    v5:
     - Edited PWM/watchdog DT bindings documentation to point to the new
       document.
     - Moved main document to
       Documentation/devicetree/bindings/timer/ingenic,tcu.txt
     - Updated documentation to reflect the new devicetree bindings.
    
    v6:
     - Removed PWM/watchdog documentation files as asked by upstream
     - Removed doc about properties that should be implicit
     - Removed doc about ingenic,timer-channel /
       ingenic,clocksource-channel as they are gone
     - Fix WDT clock name in the binding doc
     - Fix lengths of register areas in watchdog/pwm nodes
    
    v7: No change
    
    v8:
     - Fix address of the PWM node
     - Added doc about system timer and clocksource children nodes
    
    v9:
     - Remove doc about system timer and clocksource children
       nodes...
     - Add doc about ingenic,pwm-channels-mask property
    
    v10: No change
    
    v11: Fix info about default value of ingenic,pwm-channels-mask
    
    v12: Drop sub-nodes for now; they will be introduced in a follow-up
         patchset.
    
    v13:
     - Revert back to v11. Turns out it was okay.
     - Remove 'interrupt-parent' of the list of required properties.

 .../bindings/pwm/ingenic,jz47xx-pwm.txt       |  25 ----
 .../devicetree/bindings/timer/ingenic,tcu.txt | 136 ++++++++++++++++++
 .../bindings/watchdog/ingenic,jz4740-wdt.txt  |  17 ---
 3 files changed, 136 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt

diff --git a/Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt b/Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt
deleted file mode 100644
index 7d9d3f90641b..000000000000
--- a/Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Ingenic JZ47xx PWM Controller
-=============================
-
-Required properties:
-- compatible: One of:
-  * "ingenic,jz4740-pwm"
-  * "ingenic,jz4770-pwm"
-  * "ingenic,jz4780-pwm"
-- #pwm-cells: Should be 3. See pwm.txt in this directory for a description
-  of the cells format.
-- clocks : phandle to the external clock.
-- clock-names : Should be "ext".
-
-
-Example:
-
-	pwm: pwm@10002000 {
-		compatible = "ingenic,jz4740-pwm";
-		reg = <0x10002000 0x1000>;
-
-		#pwm-cells = <3>;
-
-		clocks = <&ext>;
-		clock-names = "ext";
-	};
diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
new file mode 100644
index 000000000000..87962da64561
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
@@ -0,0 +1,136 @@
+Ingenic JZ47xx SoCs Timer/Counter Unit devicetree bindings
+==========================================================
+
+For a description of the TCU hardware and drivers, have a look at
+Documentation/mips/ingenic-tcu.txt.
+
+Required properties:
+
+- compatible: Must be one of:
+  * ingenic,jz4740-tcu
+  * ingenic,jz4725b-tcu
+  * ingenic,jz4770-tcu
+- reg: Should be the offset/length value corresponding to the TCU registers
+- clocks: List of phandle & clock specifiers for clocks external to the TCU.
+  The "pclk", "rtc" and "ext" clocks should be provided. The "tcu" clock
+  should be provided if the SoC has it.
+- clock-names: List of name strings for the external clocks.
+- #clock-cells: Should be <1>;
+  Clock consumers specify this argument to identify a clock. The valid values
+  may be found in <dt-bindings/clock/ingenic,tcu.h>.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value should be 1.
+- interrupts : Specifies the interrupt the controller is connected to.
+
+Optional properties:
+
+- ingenic,pwm-channels-mask: Bitmask of TCU channels reserved for PWM use.
+  Default value is 0xfc.
+
+
+Children nodes
+==========================================================
+
+
+PWM node:
+---------
+
+Required properties:
+
+- compatible: Must be one of:
+  * ingenic,jz4740-pwm
+  * ingenic,jz4725b-pwm
+- #pwm-cells: Should be 3. See ../pwm/pwm.txt for a description of the cell
+  format.
+- clocks: List of phandle & clock specifiers for the TCU clocks.
+- clock-names: List of name strings for the TCU clocks.
+
+
+Watchdog node:
+--------------
+
+Required properties:
+
+- compatible: Must be "ingenic,jz4740-watchdog"
+- clocks: phandle to the WDT clock
+- clock-names: should be "wdt"
+
+
+OS Timer node:
+---------
+
+Required properties:
+
+- compatible: Must be one of:
+  * ingenic,jz4725b-ost
+  * ingenic,jz4770-ost
+- clocks: phandle to the OST clock
+- clock-names: should be "ost"
+- interrupts : Specifies the interrupt the OST is connected to.
+
+
+Example
+==========================================================
+
+#include <dt-bindings/clock/jz4770-cgu.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
+
+/ {
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4770-tcu";
+		reg = <0x10002000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10002000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu JZ4770_CLK_RTC
+			  &cgu JZ4770_CLK_EXT
+			  &cgu JZ4770_CLK_PCLK>;
+		clock-names = "rtc", "ext", "pclk";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <27 26 25>;
+
+		watchdog: watchdog@0 {
+			compatible = "ingenic,jz4740-watchdog";
+			reg = <0x0 0xc>;
+
+			clocks = <&tcu TCU_CLK_WDT>;
+			clock-names = "wdt";
+		};
+
+		pwm: pwm@40 {
+			compatible = "ingenic,jz4740-pwm";
+			reg = <0x40 0x80>;
+
+			#pwm-cells = <3>;
+
+			clocks = <&tcu TCU_CLK_TIMER0
+				  &tcu TCU_CLK_TIMER1
+				  &tcu TCU_CLK_TIMER2
+				  &tcu TCU_CLK_TIMER3
+				  &tcu TCU_CLK_TIMER4
+				  &tcu TCU_CLK_TIMER5
+				  &tcu TCU_CLK_TIMER6
+				  &tcu TCU_CLK_TIMER7>;
+			clock-names = "timer0", "timer1", "timer2", "timer3",
+				      "timer4", "timer5", "timer6", "timer7";
+		};
+
+		ost: timer@e0 {
+			compatible = "ingenic,jz4770-ost";
+			reg = <0xe0 0x20>;
+
+			clocks = <&tcu TCU_CLK_OST>;
+			clock-names = "ost";
+
+			interrupts = <15>;
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
deleted file mode 100644
index ce1cb72d5345..000000000000
--- a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Ingenic Watchdog Timer (WDT) Controller for JZ4740 & JZ4780
-
-Required properties:
-compatible: "ingenic,jz4740-watchdog" or "ingenic,jz4780-watchdog"
-reg: Register address and length for watchdog registers
-clocks: phandle to the RTC clock
-clock-names: should be "rtc"
-
-Example:
-
-watchdog: jz4740-watchdog@10002000 {
-	compatible = "ingenic,jz4740-watchdog";
-	reg = <0x10002000 0x10>;
-
-	clocks = <&cgu JZ4740_CLK_RTC>;
-	clock-names = "rtc";
-};
-- 
2.21.0.593.g511ec345e18

