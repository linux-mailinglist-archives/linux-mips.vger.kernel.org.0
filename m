Return-Path: <linux-mips+bounces-6596-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 334AE9B7F47
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B77282289
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA6F1C8FC0;
	Thu, 31 Oct 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WatHdMoG"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B41BBBFE;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389992; cv=none; b=OO9j16r/jYInLI4y7nIEnKeDNWLtN+jWPXrmLwR2kzQMpMHuTqNLBDYMep+Gs3XTOS/fraW64bgUH7E3xfZKy+/Ho0feD77gMpLqU/FdGoIEp/zfwiheaD+2OcVKfJUSPZw/DQRvVWSsuz5NUYStDrI7r9HfbyLKe/PlLX9REww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389992; c=relaxed/simple;
	bh=164AvxpBW24lmZ5bza1gILy+9Z0x/iue+c4IgUxIOFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqbSMXuHvadY5RuZiMDupQhVqlLswsyrT2xBQUJN4qqonLtQsRFGlS2ysKL1yBrAQ6+BZNnynu0SlaPEAWWctYSwklaIW+xaitKWBaVFhaW+zZr6DGzznlKmtdP3jdQDacDIvrwUka4bK6ls1Vp9a1G3eRhkReGs/bFfVF0kSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WatHdMoG; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 868D11C0013;
	Thu, 31 Oct 2024 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNYxA9PoraKNMZJ+/mQFXcEzKQ9APotFg7LB3yegiRc=;
	b=WatHdMoGNqWDyT/YrFtn7rOlSUilSNy5U+dCRtVlZRDIbiPA4b7hUWRI/86ILF5JCnoNMo
	gJ4VINXBS2wQkX25w5B5QInCoVztSEM5hwATAPXy6pS6UvT9Nw2dtE0yWOX3wDQl7dXnZL
	lA+R7fddw/Zwv80mJntbVLeU/X8HfgiJ91vB9X9lO8oVBD1fQ6cndjBqJMeuwhaiL317S6
	L0BK2fF9yKHJk/K+GGfrWm/H+WGssUJ/KTt0aqmj4VWm0ia0vJqBAGl6dtQR+BPrPdH8x4
	mSWtZmz7QnLQ9k2/MzS2KG7xApWFiuB4rSBcbAsqMMiWqjCCYzcPdWoxxFM6eA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:53:03 +0100
Subject: [PATCH 13/13] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove
 fixed clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-13-89d8b28e3006@bootlin.com>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
In-Reply-To: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Change the declaration of clocks: remove all fixed clocks and declare
system-controllers (OLB) as clock providers.

Remove eyeq6h-fixed-clocks.dtsi and move the crystal clock to the main
eyeq6h.dtsi file.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     | 52 ---------------
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            | 73 ++++++++++++++++++++--
 2 files changed, 69 insertions(+), 56 deletions(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
deleted file mode 100644
index 5fa99e06fde7e8f4942aafe5f6064e2c6f7d83fd..0000000000000000000000000000000000000000
--- a/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
+++ /dev/null
@@ -1,52 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Copyright 2023 Mobileye Vision Technologies Ltd.
- */
-
-#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
-
-/ {
-	xtal: clock-30000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <30000000>;
-	};
-
-	pll_west: clock-2000000000-west {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <2000000000>;
-	};
-
-	pll_cpu: clock-2000000000-cpu {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <2000000000>;
-	};
-
-	/* pll-cpu derivatives */
-	occ_cpu: clock-2000000000-occ-cpu {
-		compatible = "fixed-factor-clock";
-		clocks = <&pll_cpu>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-
-	/* pll-west derivatives */
-	occ_periph_w: clock-200000000 {
-		compatible = "fixed-factor-clock";
-		clocks = <&pll_west>;
-		#clock-cells = <0>;
-		clock-div = <10>;
-		clock-mult = <1>;
-	};
-	uart_clk: clock-200000000-uart {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph_w>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-
-};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 1db3c3cda2e395025075387bcb66ea0737fd37f6..4a1a43f351d39625b520a16d035cacd2e29d157c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 
-#include "eyeq6h-fixed-clocks.dtsi"
+#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
 
 / {
 	#address-cells = <2>;
@@ -17,7 +17,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "img,i6500";
 			reg = <0>;
-			clocks = <&occ_cpu>;
+			clocks = <&olb_central EQ6HC_CENTRAL_CPU_OCC>;
 		};
 	};
 
@@ -32,19 +32,42 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	xtal: clock-30000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
 
+		olb_acc: system-controller@d2003000 {
+			compatible = "mobileye,eyeq6h-acc-olb", "syscon";
+			reg = <0x0 0xd2003000 0x0 0x1000>;
+			#reset-cells = <1>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
+		olb_central: system-controller@d3100000 {
+			compatible = "mobileye,eyeq6h-central-olb", "syscon";
+			reg = <0x0 0xd3100000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
 		uart0: serial@d3331000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0xd3331000 0x0 0x1000>;
 			reg-io-width = <4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 43 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&occ_periph_w>, <&occ_periph_w>;
+			clocks = <&olb_west EQ6HC_WEST_PER_UART>, <&olb_west EQ6HC_WEST_PER_OCC>;
 			clock-names = "uartclk", "apb_pclk";
 		};
 
@@ -56,6 +79,15 @@ pinctrl_west: pinctrl@d3337000 {
 			pinctrl-single,function-mask = <0xffff>;
 		};
 
+		olb_west: system-controller@d3338000 {
+			compatible = "mobileye,eyeq6h-west-olb", "syscon";
+			reg = <0x0 0xd3338000 0x0 0x1000>;
+			#reset-cells = <1>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
 		pinctrl_east: pinctrl@d3357000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xd3357000 0x0 0xb0>;
@@ -64,6 +96,23 @@ pinctrl_east: pinctrl@d3357000 {
 			pinctrl-single,function-mask = <0xffff>;
 		};
 
+		olb_east: system-controller@d3358000 {
+			compatible = "mobileye,eyeq6h-east-olb", "syscon";
+			reg = <0x0 0xd3358000 0x0 0x1000>;
+			#reset-cells = <1>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
+		olb_south: system-controller@d8013000 {
+			compatible = "mobileye,eyeq6h-south-olb", "syscon";
+			reg = <0x0 0xd8013000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
 		pinctrl_south: pinctrl@d8014000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xd8014000 0x0 0xf8>;
@@ -72,6 +121,22 @@ pinctrl_south: pinctrl@d8014000 {
 			pinctrl-single,function-mask = <0xffff>;
 		};
 
+		olb_ddr0: system-controller@e4080000 {
+			compatible = "mobileye,eyeq6h-ddr0-olb", "syscon";
+			reg = <0x0 0xe4080000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
+		olb_ddr1: system-controller@e4081000 {
+			compatible = "mobileye,eyeq6h-ddr1-olb", "syscon";
+			reg = <0x0 0xe4081000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
 		gic: interrupt-controller@f0920000 {
 			compatible = "mti,gic";
 			reg = <0x0 0xf0920000 0x0 0x20000>;
@@ -89,7 +154,7 @@ gic: interrupt-controller@f0920000 {
 			timer {
 				compatible = "mti,gic-timer";
 				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-				clocks = <&occ_cpu>;
+				clocks = <&olb_central EQ6HC_CENTRAL_CPU_OCC>;
 			};
 		};
 	};

-- 
2.47.0


