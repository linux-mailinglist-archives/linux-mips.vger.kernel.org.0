Return-Path: <linux-mips+bounces-3113-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC38BD265
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 18:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E27283485
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 16:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A63156C79;
	Mon,  6 May 2024 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m+kpqjfC"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8491215625A;
	Mon,  6 May 2024 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012209; cv=none; b=nX0R2aVdq0uh3TmVF2uMn+In8cNvs1LZV4wBxqKz0g0r+vHsAohvCS2h2ZsmMnS395t6khZYFS9SwURsAWJFxWzbxV/bQyeDYBgBG/y3jPmzj7CbYUk+1H2bdfvLkheNrpj5k170ylagzZ1bXElVqsdqA/dzkYsULDGPHhn8xHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012209; c=relaxed/simple;
	bh=Fo6LkXSE2FoO0rNhdf/MoBM6EDP6h8SAqx7v5TDobG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8FSFGOssE8Vc6kzIvwjfkLrHh0c2yuCc0jC/2hKmucncCc/ahQ32ffqyOOSMvbv6ZyY31PKF/LnFUq4SFESXP+yT/5c272irSA6ynPlXij2XzgF/tDE2i08wD2cqzIhBvOko1Gaot8d16wsGMlpWnVuXFxsGdAD79fWk6wZeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m+kpqjfC; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2157F40006;
	Mon,  6 May 2024 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715012204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9WyJ9Gc4EK55pftEVV87sUey9S4c9HcoTPoxa1EZac=;
	b=m+kpqjfCLpX+QOw32GOyLMRGI2M0FV0tQeJb6SOhWPZJrw9BBm8dJbkbSVkPoNYlsThZ18
	9JNQSLqe1IHLQJ99ojOQjszL7xKsbMXnl6nAaEmrXAf+mt6UaYg+sanPoidZRCyKqUZPEb
	sYXQSnJBY0rFU1ziwffJLAzjT9B2xJt9T//M+3Tn6crWyYZFSvfxNYqKr1bhrizK1dFoif
	DNfpqocrSjmYjmtlmWC3ZI5KnJGr6LXGc+IzBEfMZuiEQepja2fSumLmnQKQEldfXsnhc4
	Bm432NRRuoEUBM37Q5sy3Fme3RCduY7fMLzjB4CIOPt0RDTEyMAcLriw71iqMA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 06 May 2024 18:16:11 +0200
Subject: [PATCH 2/3] MIPS: mobileye: Add EyeQ6H device tree
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240506-eyeq6h-v1-2-f29b5269cc43@bootlin.com>
References: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
In-Reply-To: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8484;
 i=gregory.clement@bootlin.com; h=from:subject:message-id;
 bh=Fo6LkXSE2FoO0rNhdf/MoBM6EDP6h8SAqx7v5TDobG8=;
 b=owGbwMvMwCTIzSbRJ1JkfZXxtFoSQ5olU6buhJ07U5qe+K1db2/w5PV306Naz9tyL2/Uu74sa
 iLLwwbHjlgWBkEmBlkxRRaJlQVnxMv1PbbZNV+HmcPKBDKEgYtTACay/gfDfP/KigWXogytQrOu
 dB3SPnZc9W46L8N8F7vKA2t1rcs41pppnf4QZCNfvi8UAA==
X-Developer-Key: i=gregory.clement@bootlin.com; a=openpgp;
 fpr=18A970CC17772F48B63E83D70B06188E14723BD5
X-GND-Sasl: gregory.clement@bootlin.com

EyeQ6H (or “High”) is an other SoC from Mobileye still based on the
MIPS I6500 architecture as the EyeQ5. The 2 clusters of this SoC
contains 4 cores which are capable of running 4 threads. Besides this,
it features multiple controllers such as the classic UART, high speed
I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
also includes a Hardware Security Module, Functional Safety Hardware,
and video encoders and more.

This commit provides the initial device tree files with support for
UART, GPIO and pinctrl, as well as fixed clocked.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts        | 22 +++++
 .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     | 52 ++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi       | 88 +++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            | 99 ++++++++++++++++++++++
 4 files changed, 261 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
new file mode 100644
index 000000000000..ebc0d363fbf8
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2024 Mobileye Vision Technologies Ltd.
+ */
+
+/dts-v1/;
+
+#include "eyeq6h.dtsi"
+
+/ {
+	compatible = "mobileye,eyeq6-epm6", "mobileye,eyeq6";
+	model = "Mobile EyeQ6H MP6 Evaluation board";
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x1 0x00000000>;
+	};
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
new file mode 100644
index 000000000000..8bb806eb567e
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2023 Mobileye Vision Technologies Ltd.
+ */
+
+#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+
+/ {
+	xtal: xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
+	pll_west: pll-static-west {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2000000000>;
+	};
+
+	pll_cpu: pll-static-cpu {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2000000000>;
+	};
+
+	/* pll-cpu derivatives */
+	occ_cpu: occ-cpu {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_cpu>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+
+	/* pll-west derivatives */
+	occ_periph_w: occ-periph-w {
+		compatible = "fixed-factor-clock";
+		clocks = <&pll_west>;
+		#clock-cells = <0>;
+		clock-div = <10>;
+		clock-mult = <1>;
+	};
+	uart_clk: uart-clk {
+		compatible = "fixed-factor-clock";
+		clocks = <&occ_periph_w>;
+		#clock-cells = <0>;
+		clock-div = <1>;
+		clock-mult = <1>;
+	};
+
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi
new file mode 100644
index 000000000000..a3d1b3684893
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2024 Mobileye Vision Technologies Ltd.
+ */
+
+/*
+ * MUX register structure
+ * bits    | field      | comment
+ * [0]     | MUX_SEL    | 0 - GPIO, 1 - alternative func
+ * [4]     | SW_LOOPBACK|
+ * [5]     | SW_OUT_HZ  |
+ * [7]     | DBG_IN     |
+ * [11:8]  | DS         | drive strength
+ * [13:12] | PUD        | pull-up/pull-down. 0, 3 - no, 1 - PD, 2 - PU
+ * [14]    | OD         | Open drain
+ * [15]    | ST_CFG     | Hysteretic input enable (Schmitt trigger)
+ */
+
+&pinctrl_west {
+	// TODO: use pinctrl-single,bias-pullup
+	// TODO: use pinctrl-single,bias-pulldown
+	// TODO: use pinctrl-single,drive-strength
+	// TODO: use pinctrl-single,input-schmitt
+
+	i2c0_pins: i2c0-pins {
+		pinctrl-single,pins = <
+			0x000 0x200	// I2C0_SCL pin
+			0x004 0x200	// I2C0_SDA pin
+		>;
+	};
+	i2c1_pins: i2c1-pins {
+		pinctrl-single,pins = <
+			0x008 0x200	// I2C1_SCL pin
+			0x00c 0x200	// I2C1_SDA pin
+		>;
+	};
+	eth0_pins: eth0-pins {
+		pinctrl-single,pins = <
+			0x080 1		// GPIO_C4__SMA0_MDC pin
+			0x084 1		// GPIO_C5__SMA0_MDIO pin
+		>;
+	};
+	uart0_pins: uart0-pins {
+		pinctrl-single,pins = <0x0a8 1>; // UART0 pin group
+	};
+	uart1_pins: uart1-pins {
+		pinctrl-single,pins = <0x0a0 1>; // UART1 pin group
+	};
+	spi0_pins: spi0-pins {
+		pinctrl-single,pins = <0x0ac 1>; // SPI0 pin group
+	};
+	spi1_pins: spi1-pins {
+		pinctrl-single,pins = <0x0a4 1>; // SPI1 pin group
+	};
+};
+
+&pinctrl_east {
+	i2c2_pins: i2c2-pins {
+		pinctrl-single,pins = <
+			0x000 0x200	// i2c2_SCL pin
+			0x004 0x200	// i2c2_SDA pin
+		>;
+	};
+	i2c3_pins: i2c3-pins {
+		pinctrl-single,pins = <
+			0x008 0x200	// i2c3_SCL pin
+			0x00c 0x200	// i2c3_SDA pin
+		>;
+	};
+	eth1_pins: eth1-pins {
+		pinctrl-single,pins = <
+			0x080 1	// GPIO_D4__SMA1_MDC pin
+			0x084 1	// GPIO_D5__SMA1_MDIO pin
+		>;
+	};
+	uart2_sel_pins: uart2-pins {
+		pinctrl-single,pins = <0x0a4 1>; // UART2 pin group
+	};
+	uart3_pins: uart3-pins {
+		pinctrl-single,pins = <0x09c 1>; // UART3 pin group
+	};
+	spi2_pins: spi2-pins {
+		pinctrl-single,pins = <0x0a8 1>; // SPI2 pin group
+	};
+	spi3_pins: spi3-pins {
+		pinctrl-single,pins = <0x0a0 1>; // SPI3 pin group
+	};
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
new file mode 100644
index 000000000000..2ebd02c5426c
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Copyright 2024 Mobileye Vision Technologies Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/mips-gic.h>
+
+#include "eyeq6h-fixed-clocks.dtsi"
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
+			clocks = <&occ_cpu>;
+		};
+	};
+
+	aliases {
+		serial0 = &uart0;
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
+		uart0: serial@d3331000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0xd3331000 0x0 0x1000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&occ_periph_w>, <&occ_periph_w>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		pinctrl_west: pinctrl@d3337000 {
+			compatible = "pinctrl-single";
+			reg = <0x0 0xd3337000 0x0 0xb0>;
+			#pinctrl-cells = <1>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0xffff>;
+		};
+
+		pinctrl_east: pinctrl@d3357000 {
+			compatible = "pinctrl-single";
+			reg = <0x0 0xd3357000 0x0 0xb0>;
+			#pinctrl-cells = <1>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0xffff>;
+		};
+
+		pinctrl_south: pinctrl@d8014000 {
+			compatible = "pinctrl-single";
+			// 0xf8 size is correct? last mentioned reg is 0xe4
+			reg = <0x0 0xd8014000 0x0 0xf8>;
+			#pinctrl-cells = <1>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0xffff>;
+		};
+
+		gic: interrupt-controller@f0920000 {
+			compatible = "mti,gic";
+			reg = <0x0 0xf0920000 0x0 0x20000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			/*
+			 * Declare the interrupt-parent even though the mti,gic
+			 * binding doesn't require it, such that the kernel can
+			 * figure out that cpu_intc is the root interrupt
+			 * controller & should be probed first.
+			 */
+			interrupt-parent = <&cpu_intc>;
+
+			timer {
+				compatible = "mti,gic-timer";
+				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
+				clocks = <&occ_cpu>;
+			};
+		};
+	};
+};
+
+#include "eyeq6h-pins.dtsi"

-- 
2.43.0


