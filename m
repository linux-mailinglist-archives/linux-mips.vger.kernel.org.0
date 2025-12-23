Return-Path: <linux-mips+bounces-12570-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA4CCD8E11
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9552302B645
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBB8331233;
	Tue, 23 Dec 2025 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l+FnPcgm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318A1DE4CE
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484172; cv=none; b=BFLYHBBcF5olFU6u5scFh5VXT+wQ07vyw3IJ6c/W41jF556gE39kwOB8LkjV2XpTvZDvRwmbFqSsf6O2ZEWnm6kVVqWiM6H4Wr58NfQqhWn4Gc9DduWN8r0qhHZQfwNAVOL7tNDyEqtHdotw1HAOjGxLqEO1G3xmvWdAIAJVdH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484172; c=relaxed/simple;
	bh=jHCMrBULvwVzv5JpCqHP1Kn3GqfcRs7OGNudExX2Uo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWUecsu2EGXpDN85BJtL3JWZLuy9UyLv2kA4lJOGJ7CwFyqQmbxNq7Kbnf/w61k2gZZtn3MwJn+nxGo8WjcbKu7WI+RRBPQGXtcgZynnhPV+lo+amIZWu7l+yrIF0IPt0kJGsTf9k6JR55yan9RIhuZqIaFzU/w6IZUlQRxFDhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l+FnPcgm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E74BE1A23A1;
	Tue, 23 Dec 2025 10:02:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCC2160716;
	Tue, 23 Dec 2025 10:02:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46BF410AB09BC;
	Tue, 23 Dec 2025 11:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=riB5KJaXNeA6IOitdQ8kr+NsrOyX+9YKQFa5ylL1kOc=;
	b=l+FnPcgmFXHpECPCxUm1P7xp7rhcecAGBpyoCiMtkSubnvQPfVSh7YDVWyD8AOQuvaLv/G
	MxXfKSRHXTK3ZOWBhsEmZuqo/M5y8CseoVat61PNHahFizfDC9M0Mjx+Gfwv0z6mdcI5m3
	X0q9arPxxgNZgniWw0bWr8B4/ecSGdRbZ3O9f9aTpZWWqTDNLeNjY98PAzoFu8wWPcJ++O
	geSNQm6pOKbYqczPYYq5bde7SbZdHPXGGedbjty10CzngqNO0Kd7bZw2GDgeCWdYpyUZY5
	/nCZpkmAF7m036wc0EIa0h/IcoWCBoEZxEh8mN3i/py1PHjo+GVhzUNzDdh8NA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:25 +0100
Subject: [PATCH v2 10/13] MIPS: Add Mobileye EyeQ6Lplus SoC dtsi
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-10-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add the device tree include files for the EyeQ6Lplus system on chip
from Mobileye.

Those files provide the initial support of the SoC:
* The I6500 CPU and GIC interrupt controller.
* The OLB ("Other Logic Block") providing clocks, resets and pin controls.
* One UART.
* One GPIO controller.
* Two SPI controllers, one in host mode and one in target mode.
* One octoSPI flash controller.
* Two I2C controllers.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi |  84 +++++++++++
 arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi      | 169 +++++++++++++++++++++++
 2 files changed, 253 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi b/arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi
new file mode 100644
index 000000000000..5cb0660f46c6
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+&olb {
+	timer0_pins: timer0-pins {
+		function = "timer0";
+		pins = "PA0", "PA1";
+	};
+	timer1_pins: timer1-pins {
+		function = "timer1";
+		pins = "PA2", "PA3";
+	};
+	uart_ssi_pins: uart-ssi-pins {
+		function = "uart_ssi";
+		pins = "PA4", "PA5";
+	};
+	spi0_pins: spi0-pins {
+		function = "spi0";
+		pins = "PA6", "PA7", "PA8", "PA9";
+	};
+	uart0_pins: uart0-pins {
+		function = "uart0";
+		pins = "PA11", "PA12";
+	};
+	timer2_pins: timer2-pins {
+		function = "timer2";
+		pins = "PA13", "PA14";
+	};
+	timer3_pins: timer3-pins {
+		function = "timer3";
+		pins = "PA15", "PA16";
+	};
+	timer_ext0_pins: timer-ext0-pins {
+		function = "timer_ext0";
+		pins = "PA17", "PA18", "PA19", "PA20";
+	};
+	timer_ext0_input_a_pins: timer-ext0-input-a-pins {
+		function = "timer_ext0";
+		pins = "PA17";
+	};
+	pps0_pins: pps0-pins {
+		function = "timer_ext0";
+		pins = "PA17";
+	};
+	timer_ext0_input_b_pins: timer-ext0-input-b-pins {
+		function = "timer_ext0";
+		pins = "PA18";
+	};
+	timer_ext0_output_pins: timer-ext0-output-pins {
+		function = "timer_ext0";
+		pins = "PA19", "PA20";
+	};
+	spi1_pins: spi1-pins {
+		function = "spi1";
+		pins = "PA21", "PA22", "PA23", "PA24";
+	};
+	spi1_reduced_pins: spi1-reduced-pins {
+		function = "spi1";
+		pins = "PA21", "PA22", "PA23";
+	};
+	timer_ext1_pins: timer-ext1-pins {
+		function = "timer_ext1";
+		pins = "PA26", "PA27", "PA28", "PA29";
+	};
+	timer_ext1_input_a_pins: timer-ext1-input-a-pins {
+		function = "timer_ext1";
+		pins = "PA26";
+	};
+	timer_ext1_input_b_pins: timer-ext1-input-b-pins {
+		function = "timer_ext1";
+		pins = "PA27";
+	};
+	timer_ext1_output_pins: timer-ext1-output-pins {
+		function = "timer_ext1";
+		pins = "PA28", "PA29";
+	};
+	ext_ref_clk_pins: ext-ref-clk-pins {
+		function = "ext_ref_clk";
+		pins = "PA30";
+	};
+	mipi_ref_clk_pins: mipi-ref-clk-pins {
+		function = "mipi_ref_clk";
+		pins = "PA31";
+	};
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi b/arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi
new file mode 100644
index 000000000000..28131ea558f6
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Copyright 2025 Mobileye Vision Technologies Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/mips-gic.h>
+
+#include <dt-bindings/clock/mobileye,eyeq6lplus-clk.h>
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
+			clocks = <&olb EQ6LPC_CPU_OCC>;
+		};
+	};
+
+	cpu_intc: interrupt-controller {
+		compatible = "mti,cpu-interrupt-controller";
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+	};
+
+	coherency-manager {
+		compatible = "mobileye,eyeq6-cm";
+	};
+
+	xtal: clock-30000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		olb: system-controller@e8400000 {
+			compatible = "mobileye,eyeq6lplus-olb", "syscon";
+			reg = <0 0xe8400000 0x0 0x80000>;
+			#reset-cells = <2>;
+			#clock-cells = <1>;
+			clocks = <&xtal>;
+			clock-names = "ref";
+		};
+
+		ospi: spi@e8800000 {
+			compatible = "mobileye,eyeq5-ospi", "cdns,qspi-nor";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0xe8800000 0x0 0x100000>,
+			      <0 0xb0000000 0x0 0x30000000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x00000000>;
+			clocks  = <&olb EQ6LPC_PER_OSPI>;
+			status = "disabled";
+		};
+
+		spi0: spi@eac0d000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0 0xeac0d000 0x0 0x1000>;
+			clocks = <&olb EQ6LPC_PER_SPI>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 11 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&olb 0 0>;
+			reset-names = "spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@eac0e000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0 0xeac0e000 0x0 0x1000>;
+			spi-slave;
+			clocks = <&olb EQ6LPC_PER_SPI>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&olb 0 1>;
+			reset-names = "spi";
+			#address-cells = <0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uart0: serial@eac10000 {
+			compatible = "snps,dw-apb-uart";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&olb EQ6LPC_PER_UART>;
+			clock-frequency = <15625000>;
+			reg = <0 0xeac10000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 8 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&olb 0 2>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@eac11000 {
+			compatible = "mobileye,eyeq6lplus-i2c", "snps,designware-i2c";
+			reg = <0 0xeac11000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 6 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&olb EQ6LPC_PER_I2C_SER>;
+			resets = <&olb 0 3>;
+			i2c-sda-hold-time-ns = <50>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@eac12000 {
+			compatible = "mobileye,eyeq6lplus-i2c", "snps,designware-i2c";
+			reg = <0 0xeac12000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>;
+			clocks = <&olb EQ6LPC_PER_I2C_SER>;
+			resets = <&olb 0 4>;
+			i2c-sda-hold-time-ns = <50>;
+			status = "disabled";
+		};
+
+		gpio: gpio@eac14000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x0 0xeac14000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&olb 0 13>;
+			porta: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				gpio-ranges = <&olb 0 0 32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 13 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gic: interrupt-controller@f0920000 {
+			compatible = "mti,gic";
+			reg = <0x0 0xf0920000 0x0 0x20000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&cpu_intc>;
+			timer {
+				compatible = "mti,gic-timer";
+				interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
+				clocks = <&olb EQ6LPC_CPU_OCC>;
+			};
+		};
+	};
+};
+
+#include "eyeq6lplus-pins.dtsi"

-- 
2.52.0


