Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B671B252CA
	for <lists+linux-mips@lfdr.de>; Tue, 21 May 2019 16:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbfEUOwM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 May 2019 10:52:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41100 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728600AbfEUOwL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 May 2019 10:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558450329; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/3IsobQq4Cy/ekvjsVMKVmPk+PLAa+8F6X7YJJlpR84=;
        b=TzRf8HR7h/iC9StKnOULFz3jfOk8dN3d7sGw2ByVlJ40HyogOgm/FFzEBbs+JpmSMkQi2N
        oyZXkcW1aDs6mh6CJIzoOJZcHafmcSGv+v5QMfyiB3uyNJRwoCpH202AsvKb0W1UFa47M7
        BBxMB8kd5OuPhIHWKVx9ms+sk6q37jA=
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
Subject: [PATCH v12 09/13] MIPS: jz4740: Add DTS nodes for the TCU drivers
Date:   Tue, 21 May 2019 16:51:37 +0200
Message-Id: <20190521145141.9813-10-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add DTS nodes for the JZ4780, JZ4770 and JZ4740 devicetree files.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
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

 arch/mips/boot/dts/ingenic/jz4740.dtsi | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 21 +++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 21 +++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 2beb78a62b7d..807d9702d4cf 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -53,6 +53,28 @@
 		clock-names = "rtc";
 	};
 
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4740-tcu";
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
index 49ede6c14ff3..70932fd90902 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -46,6 +46,27 @@
 		#clock-cells = <1>;
 	};
 
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
+
 	pinctrl: pin-controller@10010000 {
 		compatible = "ingenic,jz4770-pinctrl";
 		reg = <0x10010000 0x600>;
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b03cdec56de9..495082ce7fc5 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -46,6 +46,27 @@
 		#clock-cells = <1>;
 	};
 
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4770-tcu";
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

