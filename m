Return-Path: <linux-mips+bounces-1314-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96D849E84
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 16:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1521C2156A
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 15:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066F347F6E;
	Mon,  5 Feb 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UIU8C9Rs"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6856341773;
	Mon,  5 Feb 2024 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707147320; cv=none; b=ER9m6y4AAiupOIjkD3AmphojxNIPJipFLYQhcOsCzxGRS9OpTgtzytm9zQHaPXoTfZfuApn0jLSCz03UQzBhNIfp1DmxYSN48YkAXIcDrsK80uNozGFvjsu2O9bW8VirgkICFsc00gssMGFEmQnlr5NMoUmcjEX8hSEX0u5OKJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707147320; c=relaxed/simple;
	bh=8tVgkcNVLNLBRpOyAN3sTXkK2AFrbAaEOi1qJYHFBm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuvwDxL/5yoj2frgA7L7TMGr4Z+pK5HhfN0XpaOKpUt+VGfmpAu7jnagRgpMVFWhQI+9nuRE4Rn9dkLQzfXacT2XKZoSyjP0Fxjak2zO/TvEDup72AERPh3BbSnzwaPN2HRHFEu8kd/FpKn7wQ6eR95sh7IDgUOQgowS8G2H4DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UIU8C9Rs; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23E141C0003;
	Mon,  5 Feb 2024 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707147315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J34CKJwhiUt6uvWl5wHPj2lYqq5e5b68Q2aJT1fL64Y=;
	b=UIU8C9RsiihDps32dDtZIvbqdrUN7TpBTNKwR6CtEk6CfdfKnjlm/k/aIwANgk53bAv1Bi
	fJ8q0++u9qtpKLn9p5UpQy9o5v2yxHKKoePeAxJjiTZzuvZFJOzoDexGhrI82cGr8NOa5S
	X5KiNBij0wVeXPOxnC+LCHSn2WQfygGL3ucPAzKaL34p5AhwD5xrzvfRc4XqULlfsf3+Tz
	5CNl0OH/pqa8iWrrd6kXm4RF1G7SfymA+DNoQqqTeT4QohwZfKu9i9EmsMoM0Z9WOmxHg5
	edUcTk2ekSklw4R361VfeFxXqCUmHk5plAI6N7DP0RagislAV32SWUFL9J07UA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 10/14] MIPS: mobileye: Add EyeQ5 dtsi
Date: Mon,  5 Feb 2024 16:34:56 +0100
Message-ID: <20240205153503.574468-11-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205153503.574468-1-gregory.clement@bootlin.com>
References: <20240205153503.574468-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Add a device tree include file for the Mobileye EyeQ5 SoC.

Based on the work of Slava Samsonov <stanislav.samsonov@intel.com>

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/Makefile                   |   1 +
 .../boot/dts/mobileye/eyeq5-fixed-clocks.dtsi | 292 ++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi        | 124 ++++++++
 3 files changed, 417 insertions(+)
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5-fixed-clocks.dtsi
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5.dtsi

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 928f38a79dff9..efff87cb33a9e 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -8,6 +8,7 @@ subdir-$(CONFIG_LANTIQ)			+= lantiq
 subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
 subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
 subdir-$(CONFIG_MIPS_MALTA)		+= mti
+subdir-$(CONFIG_MACH_EYEQ5)		+= mobileye
 subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
 subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
 subdir-$(CONFIG_MACH_PIC32)		+= pic32
diff --git a/arch/mips/boot/dts/mobileye/eyeq5-fixed-clocks.dtsi b/arch/mips/boot/dts/mobileye/eyeq5-fixed-clocks.dtsi
new file mode 100644
index 0000000000000..78f5533a95c67
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq5-fixed-clocks.dtsi
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2023 Mobileye Vision Technologies Ltd.
+ */
+
+/ {
+	/* Fixed clock */
+	pll_cpu: pll-cpu {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1500000000>;
+	};
+
+	pll_vdi: pll-vdi {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1280000000>;
+	};
+
+	pll_per: pll-per {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2000000000>;
+	};
+
+	pll_ddr0: pll-ddr0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1857210000>;
+	};
+
+	pll_ddr1: pll-ddr1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1857210000>;
+	};
+
+/* PLL_CPU derivatives */
+	occ_cpu: occ-cpu {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_cpu>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	si_css0_ref_clk: si-css0-ref-clk { /* gate ClkRstGen_si_css0_ref */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_cpu>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	cpc_clk: cpc-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	core0_clk: core0-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	core1_clk: core1-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	core2_clk: core2-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	core3_clk: core3-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	cm_clk: cm-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	mem_clk: mem-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&si_css0_ref_clk>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	occ_isram: occ-isram {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_cpu>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+	isram_clk: isram-clk { /* gate ClkRstGen_isram */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_isram>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	occ_dbu: occ-dbu {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_cpu>;
+		#clock-cells = <0>;
+		clock-div = <10>;
+		clock-mult = <1>;
+	};
+	si_dbu_tp_pclk: si-dbu-tp-pclk { /* gate ClkRstGen_dbu */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_dbu>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+/* PLL_VDI derivatives */
+	occ_vdi: occ-vdi {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_vdi>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+	vdi_clk: vdi-clk { /* gate ClkRstGen_vdi */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_vdi>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	occ_can_ser: occ-can-ser {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_vdi>;
+		#clock-cells = <0>;
+		clock-div = <16>;
+		clock-mult = <1>;
+	};
+	can_ser_clk: can-ser-clk { /* gate ClkRstGen_can_ser */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_can_ser>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	i2c_ser_clk: i2c-ser-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_vdi>;
+		#clock-cells = <0>;
+		clock-div = <20>;
+		clock-mult = <1>;
+	};
+/* PLL_PER derivatives */
+	occ_periph: occ-periph {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_per>;
+		#clock-cells = <0>;
+		clock-div = <16>;
+		clock-mult = <1>;
+	};
+	periph_clk: periph-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	can_clk: can-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	spi_clk: spi-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	uart_clk: uart-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+	i2c_clk: i2c-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+		clock-output-names = "i2c_clk";
+	};
+	timer_clk: timer-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+		clock-output-names = "timer_clk";
+	};
+	gpio_clk: gpio-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+		clock-output-names = "gpio_clk";
+	};
+	emmc_sys_clk: emmc-sys-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_per>;
+		#clock-cells = <0>;
+		clock-div = <10>;
+		clock-mult = <1>;
+		clock-output-names = "emmc_sys_clk";
+	};
+	ccf_ctrl_clk: ccf-ctrl-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_per>;
+		#clock-cells = <0>;
+		clock-div = <4>;
+		clock-mult = <1>;
+		clock-output-names = "ccf_ctrl_clk";
+	};
+	occ_mjpeg_core: occ-mjpeg-core {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_per>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "occ_mjpeg_core";
+	};
+	hsm_clk: hsm-clk { /* gate ClkRstGen_hsm */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_mjpeg_core>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+		clock-output-names = "hsm_clk";
+	};
+	mjpeg_core_clk: mjpeg-core-clk { /* gate ClkRstGen_mjpeg_gen */
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_mjpeg_core>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+		clock-output-names = "mjpeg_core_clk";
+	};
+	fcmu_a_clk: fcmu-a-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_per>;
+		#clock-cells = <0>;
+		clock-div = <20>;
+		clock-mult = <1>;
+		clock-output-names = "fcmu_a_clk";
+	};
+	occ_pci_sys: occ-pci-sys {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_per>;
+		#clock-cells = <0>;
+		clock-div = <8>;
+		clock-mult = <1>;
+		clock-output-names = "occ_pci_sys";
+	};
+	pclk: pclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;  /* 250MHz */
+	};
+	tsu_clk: tsu-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;  /* 125MHz */
+	};
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
new file mode 100644
index 0000000000000..6cc5980e2fa17
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+* Copyright 2023 Mobileye Vision Technologies Ltd.
+*/
+
+#include <dt-bindings/interrupt-controller/mips-gic.h>
+
+#include "eyeq5-fixed-clocks.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "img,i6500";
+			reg = <0>;
+			clocks = <&core0_clk>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* These reserved memory regions are also defined in bootmanager
+		* for configuring inbound translation for BARS, don't change
+		* these without syncing with bootmanager
+		*/
+		shmem0_reserved: shmem@804000000 {
+			reg = <0x8 0x04000000 0x0 0x1000000>;
+		};
+		shmem1_reserved: shmem@805000000 {
+			reg = <0x8 0x05000000 0x0 0x1000000>;
+		};
+		pci0_msi_reserved: pci0-msi@806000000 {
+			reg = <0x8 0x06000000 0x0 0x100000>;
+		};
+		pci1_msi_reserved: pci1-msi@806100000 {
+			reg = <0x8 0x06100000 0x0 0x100000>;
+		};
+
+		mini_coredump0_reserved: mini-coredump0@806200000 {
+			reg = <0x8 0x06200000 0x0 0x100000>;
+		};
+		mhm_reserved_0: the-mhm-reserved-0@0 {
+			reg = <0x8 0x00000000 0x0 0x0000800>;
+		};
+	};
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+	};
+
+	cpu_intc: interrupt-controller {
+		compatible = "mti,cpu-interrupt-controller";
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+	};
+
+	soc: soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		compatible = "simple-bus";
+
+		uart0: serial@800000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x800000 0x0 0x1000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks  = <&uart_clk>, <&occ_periph>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		uart1: serial@900000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x900000 0x0 0x1000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks  = <&uart_clk>, <&occ_periph>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		uart2: serial@a00000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0xa00000 0x0 0x1000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks  = <&uart_clk>, <&occ_periph>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		gic: interrupt-controller@140000 {
+			compatible = "mti,gic";
+			reg = <0x0 0x140000 0x0 0x20000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			/*
+			* Declare the interrupt-parent even though the mti,gic
+			* binding doesn't require it, such that the kernel can
+			* figure out that cpu_intc is the root interrupt
+			* controller & should be probed first.
+			*/
+			interrupt-parent = <&cpu_intc>;
+
+			timer {
+				compatible = "mti,gic-timer";
+				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
+				clocks = <&core0_clk>;
+			};
+		};
+	};
+};
-- 
2.43.0


