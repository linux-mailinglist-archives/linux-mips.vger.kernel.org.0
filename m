Return-Path: <linux-mips+bounces-6701-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C49BF2AA
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BE5C1C25F12
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBB320ADDC;
	Wed,  6 Nov 2024 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WjQduhOp"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5D20823C;
	Wed,  6 Nov 2024 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909048; cv=none; b=JzpgZy3SlYum0OQW99clyBQ+cLSv6CdcxxEYOm3mfCyFjNVRIPiQXMY7TaGoFzS3gtgp3eD7qvg4cbZ76AtgJNHrBxnN/Nsva75pc6hXC5xChqFxX1JxMRsV7mz/Tueal0eL8V590nRMtnHR7G390aovaOLi30GJxAxaKnZ/67E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909048; c=relaxed/simple;
	bh=dpx86UKWHmQob1x1Y9dZoFYGDcYgFQTexwF3Pl4RVJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+VQFkiTco7YLPvoT3BdRArPiqzk9BjghuSmsoyOHwzpyZRyc3qoRJp2uNAeNt0gyN00MbWtU+8J2qWBzeubHg0lL81InirG5HnAfu2fHUBN1dFpgS8bOfw0ElNubwntC2xzhrmYyEpsPbB6UhZZanHN85pfwVivYaBLXBzzocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WjQduhOp; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E085B40009;
	Wed,  6 Nov 2024 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBvALQBz6nzlJoEhBr0vnmX8yOjbMQW6G7cmJmWOtDo=;
	b=WjQduhOpP2qgKp7NnvyQZ0Fc9UeB/YqzChY9QhIHMAfoteJe/ZV1ZddCVx77DbHnIia2GX
	2zbpPNjWcQP3KCY1AN6h1Hd/4fn120s7LQXzDwZRtKSssFVnpVFR4i8/owv1IRo4yv5bu8
	eEmtdEa/WNeT9joKqbjesEXMZbTa78doVrLZSrb5J2xmUL8UHhPzsmCGkl3lvq+gCR5ORh
	/C7btTVfFb3XYPNBhNvohsHmkrJNJUvEkU1GcuACSnCVNZIyILenHEKKaX0GYBIEIi9w8V
	V4gMPEbKXrCRGbb6Grxag4Zn1vyohT+u4DnB4BZMrxqszdzI/MvV2clMD/go0A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:04:00 +0100
Subject: [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for
 fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-9-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
In-Reply-To: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
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

Change the structure of the clock tree: rather than individual
devicetree nodes registering each fixed factor clock derived from OLB
PLLs, have the OLB node provide the necessary clocks.

Remove eyeq5-clocks.dtsi and move the three remaining "fixed-clock"s to
the main eyeq5.dtsi file.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi | 270 --------------------------
 arch/mips/boot/dts/mobileye/eyeq5.dtsi        |  30 ++-
 2 files changed, 24 insertions(+), 276 deletions(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi b/arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi
deleted file mode 100644
index 17a342cc744e57dc1f21262abdbfa97d4e4d58f3..0000000000000000000000000000000000000000
--- a/arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi
+++ /dev/null
@@ -1,270 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-/*
- * Copyright 2023 Mobileye Vision Technologies Ltd.
- */
-
-#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
-
-/ {
-	/* Fixed clock */
-	xtal: xtal {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <30000000>;
-	};
-
-/* PLL_CPU derivatives */
-	occ_cpu: occ-cpu {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_CPU>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	si_css0_ref_clk: si-css0-ref-clk { /* gate ClkRstGen_si_css0_ref */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_cpu>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	cpc_clk: cpc-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	core0_clk: core0-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	core1_clk: core1-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	core2_clk: core2-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	core3_clk: core3-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	cm_clk: cm-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	mem_clk: mem-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&si_css0_ref_clk>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	occ_isram: occ-isram {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_CPU>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-	isram_clk: isram-clk { /* gate ClkRstGen_isram */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_isram>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	occ_dbu: occ-dbu {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_CPU>;
-		#clock-cells = <0>;
-		clock-div = <10>;
-		clock-mult = <1>;
-	};
-	si_dbu_tp_pclk: si-dbu-tp-pclk { /* gate ClkRstGen_dbu */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_dbu>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-/* PLL_VDI derivatives */
-	occ_vdi: occ-vdi {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_VDI>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
-	vdi_clk: vdi-clk { /* gate ClkRstGen_vdi */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_vdi>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	occ_can_ser: occ-can-ser {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_VDI>;
-		#clock-cells = <0>;
-		clock-div = <16>;
-		clock-mult = <1>;
-	};
-	can_ser_clk: can-ser-clk { /* gate ClkRstGen_can_ser */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_can_ser>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	i2c_ser_clk: i2c-ser-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_VDI>;
-		#clock-cells = <0>;
-		clock-div = <20>;
-		clock-mult = <1>;
-	};
-/* PLL_PER derivatives */
-	occ_periph: occ-periph {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_PER>;
-		#clock-cells = <0>;
-		clock-div = <16>;
-		clock-mult = <1>;
-	};
-	periph_clk: periph-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	can_clk: can-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	spi_clk: spi-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	uart_clk: uart-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-	};
-	i2c_clk: i2c-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-		clock-output-names = "i2c_clk";
-	};
-	timer_clk: timer-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-		clock-output-names = "timer_clk";
-	};
-	gpio_clk: gpio-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_periph>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-		clock-output-names = "gpio_clk";
-	};
-	emmc_sys_clk: emmc-sys-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_PER>;
-		#clock-cells = <0>;
-		clock-div = <10>;
-		clock-mult = <1>;
-		clock-output-names = "emmc_sys_clk";
-	};
-	ccf_ctrl_clk: ccf-ctrl-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_PER>;
-		#clock-cells = <0>;
-		clock-div = <4>;
-		clock-mult = <1>;
-		clock-output-names = "ccf_ctrl_clk";
-	};
-	occ_mjpeg_core: occ-mjpeg-core {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_PER>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-		clock-output-names = "occ_mjpeg_core";
-	};
-	hsm_clk: hsm-clk { /* gate ClkRstGen_hsm */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_mjpeg_core>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-		clock-output-names = "hsm_clk";
-	};
-	mjpeg_core_clk: mjpeg-core-clk { /* gate ClkRstGen_mjpeg_gen */
-		compatible = "fixed-factor-clock";
-		clocks = <&occ_mjpeg_core>;
-		#clock-cells = <0>;
-		clock-div = <1>;
-		clock-mult = <1>;
-		clock-output-names = "mjpeg_core_clk";
-	};
-	fcmu_a_clk: fcmu-a-clk {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_PER>;
-		#clock-cells = <0>;
-		clock-div = <20>;
-		clock-mult = <1>;
-		clock-output-names = "fcmu_a_clk";
-	};
-	occ_pci_sys: occ-pci-sys {
-		compatible = "fixed-factor-clock";
-		clocks = <&olb EQ5C_PLL_PER>;
-		#clock-cells = <0>;
-		clock-div = <8>;
-		clock-mult = <1>;
-		clock-output-names = "occ_pci_sys";
-	};
-	pclk: pclk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <250000000>;  /* 250MHz */
-	};
-	tsu_clk: tsu-clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;  /* 125MHz */
-	};
-};
diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 0708771c193d064fa56be2c7f6115672b5c24d8d..5d73e8320b8efc1b4f68923482bf188c4345f1cb 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 
-#include "eyeq5-clocks.dtsi"
+#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
 
 / {
 	#address-cells = <2>;
@@ -17,7 +17,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "img,i6500";
 			reg = <0>;
-			clocks = <&core0_clk>;
+			clocks = <&olb EQ5C_CPU_CORE0>;
 		};
 	};
 
@@ -64,6 +64,24 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	xtal: xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
+	pclk: pclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;  /* 250MHz */
+	};
+
+	tsu_clk: tsu-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;  /* 125MHz */
+	};
+
 	soc: soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -76,7 +94,7 @@ uart0: serial@800000 {
 			reg-io-width = <4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
-			clocks  = <&uart_clk>, <&occ_periph>;
+			clocks  = <&olb EQ5C_PER_UART>, <&olb EQ5C_PER_OCC>;
 			clock-names = "uartclk", "apb_pclk";
 			resets = <&olb 0 10>;
 			pinctrl-names = "default";
@@ -89,7 +107,7 @@ uart1: serial@900000 {
 			reg-io-width = <4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
-			clocks  = <&uart_clk>, <&occ_periph>;
+			clocks  = <&olb EQ5C_PER_UART>, <&olb EQ5C_PER_OCC>;
 			clock-names = "uartclk", "apb_pclk";
 			resets = <&olb 0 11>;
 			pinctrl-names = "default";
@@ -102,7 +120,7 @@ uart2: serial@a00000 {
 			reg-io-width = <4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
-			clocks  = <&uart_clk>, <&occ_periph>;
+			clocks  = <&olb EQ5C_PER_UART>, <&olb EQ5C_PER_OCC>;
 			clock-names = "uartclk", "apb_pclk";
 			resets = <&olb 0 12>;
 			pinctrl-names = "default";
@@ -135,7 +153,7 @@ gic: interrupt-controller@140000 {
 			timer {
 				compatible = "mti,gic-timer";
 				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-				clocks = <&core0_clk>;
+				clocks = <&olb EQ5C_CPU_CORE0>;
 			};
 		};
 	};

-- 
2.47.0


