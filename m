Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7273581
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 19:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387754AbfGXR2K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 13:28:10 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52026 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbfGXR2J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Jul 2019 13:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563988651; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cq/6GvwGL7/hPF8mufyJ7EZk4QaPV3bSCBnWavgiG1c=;
        b=pWCEaUXj9OBuIU51+UoC+ElFQqM6KQxo1Oj5axpLC+qO+X9ZGUoMWQ6Xh4GwXSvRru4JaG
        wvemkIiwYQ+LYYWjLu+VedWBZWpjHDR+DtHBshlrnY+yRDeiFCQCYjST877kOJ4L4NAmvP
        4GOnVcw3zC5erA5HeV0YqYWE65i2x1g=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v15 09/13] MIPS: jz4740: Add DTS nodes for the TCU drivers
Date:   Wed, 24 Jul 2019 13:16:11 -0400
Message-Id: <20190724171615.20774-10-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add DTS nodes for the JZ4780, JZ4770 and JZ4740 devicetree files.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v5: New patch
    
    v6: Fix register lengths in watchdog/pwm nodes
    
    v7: No change
    
    v8: - Fix wrong start address for PWM node
    	- Add system timer and clocksource sub-nodes
    
    v9: Drop timer and clocksource sub-nodes
    
    v10-v11: No change
    
    v12: Drop PWM/watchdog/OST sub-nodes, for now.
    
    v13-v14: No change
    
    v15: Add "simple-mfd" compatible string

 arch/mips/boot/dts/ingenic/jz4740.dtsi | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 21 +++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 23 +++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 3ffaf63f22dd..058800bfc875 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -53,6 +53,28 @@
 		clock-names = "rtc";
 	};
 
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4740-tcu", "simple-mfd";
+		reg = <0x10002000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10002000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu JZ4740_CLK_RTC
+			  &cgu JZ4740_CLK_EXT
+			  &cgu JZ4740_CLK_PCLK
+			  &cgu JZ4740_CLK_TCU>;
+		clock-names = "rtc", "ext", "pclk", "tcu";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <23 22 21>;
+	};
+
 	rtc_dev: rtc@10003000 {
 		compatible = "ingenic,jz4740-rtc";
 		reg = <0x10003000 0x40>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 49ede6c14ff3..0bfb9edff3d0 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -46,6 +46,27 @@
 		#clock-cells = <1>;
 	};
 
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4770-tcu", "simple-mfd";
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
+
 	pinctrl: pin-controller@10010000 {
 		compatible = "ingenic,jz4770-pinctrl";
 		reg = <0x10010000 0x600>;
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b03cdec56de9..c54bd7cfec55 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -46,6 +46,29 @@
 		#clock-cells = <1>;
 	};
 
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4780-tcu",
+			     "ingenic,jz4770-tcu",
+			     "simple-mfd";
+		reg = <0x10002000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10002000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu JZ4780_CLK_RTCLK
+			  &cgu JZ4780_CLK_EXCLK
+			  &cgu JZ4780_CLK_PCLK>;
+		clock-names = "rtc", "ext", "pclk";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <27 26 25>;
+	};
+
 	rtc_dev: rtc@10003000 {
 		compatible = "ingenic,jz4780-rtc";
 		reg = <0x10003000 0x4c>;
-- 
2.21.0.593.g511ec345e18

