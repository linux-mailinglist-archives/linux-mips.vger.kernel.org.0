Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64096252F9
	for <lists+linux-mips@lfdr.de>; Tue, 21 May 2019 16:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbfEUOv7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 May 2019 10:51:59 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40734 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbfEUOv6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 May 2019 10:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558450315; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pA+PGpDaF9FLM9fLKhA3FZisZhkWFOlD1Tve/vqGEiA=;
        b=Lj9xu0mKMEHf7DwemD4HqdN2kNZeTXVPj26bMGt7k39+DUoetmnDGdbQsTTbNf5AwusA59
        5YuQYWqujyN1567QfShO42pKR4iDfuUtuBikwyLm8GbQvqCmQ7pNh20oVq4rsj5Vkybzm+
        gi2VpbZBQuuCf43RrvU73GIobeIoWhg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 03/13] dt-bindings: Add doc for the Ingenic TCU drivers
Date:   Tue, 21 May 2019 16:51:31 +0200
Message-Id: <20190521145141.9813-4-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation about how to properly use the Ingenic TCU
(Timer/Counter Unit) drivers from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v4: New patch in this series. Corresponds to V2 patches 3-4-5 with
     added content.
    
    v5: - Edited PWM/watchdog DT bindings documentation to point to the new
       document.
     - Moved main document to
       Documentation/devicetree/bindings/timer/ingenic,tcu.txt
     - Updated documentation to reflect the new devicetree bindings.
    
    v6: - Removed PWM/watchdog documentation files as asked by upstream
     - Removed doc about properties that should be implicit
     - Removed doc about ingenic,timer-channel /
       ingenic,clocksource-channel as they are gone
     - Fix WDT clock name in the binding doc
     - Fix lengths of register areas in watchdog/pwm nodes
    
    v7: No change
    
    v8: - Fix address of the PWM node
     - Added doc about system timer and clocksource children nodes
    
    v9: - Remove doc about system timer and clocksource children
       nodes...
    - Add doc about ingenic,pwm-channels-mask property
    
    v10: No change
    
    v11: Fix info about default value of ingenic,pwm-channels-mask
    
    v12: Drop sub-nodes for now; they will be introduced in a follow-up
    	 patchset.

 .../devicetree/bindings/timer/ingenic,tcu.txt | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt

diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
new file mode 100644
index 000000000000..d101cd72c9b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
@@ -0,0 +1,59 @@
+Ingenic JZ47xx SoCs Timer/Counter Unit devicetree bindings
+==========================================================
+
+For a description of the TCU hardware and drivers, have a look at
+Documentation/mips/ingenic-tcu.txt.
+
+Required properties:
+
+- compatible: Must be one of:
+  * "ingenic,jz4740-tcu"
+  * "ingenic,jz4725b-tcu"
+  * "ingenic,jz4770-tcu"
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
+- interrupt-parent : phandle of the interrupt controller.
+- interrupts : Specifies the interrupt the controller is connected to.
+
+Optional properties:
+
+- ingenic,pwm-channels-mask: Bitmask of TCU channels reserved for PWM use.
+  Default value is 0xfc.
+
+
+Example
+==========================================================
+
+#include <dt-bindings/clock/jz4770-cgu.h>
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
+	};
+};
-- 
2.21.0.593.g511ec345e18

