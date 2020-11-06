Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB042A93DA
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 11:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgKFKNn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 05:13:43 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:55972 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFKNn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 05:13:43 -0500
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id EC4F33B21E1
        for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2020 10:09:25 +0000 (UTC)
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4812F20001B;
        Fri,  6 Nov 2020 10:09:01 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 5/9] MIPS: mscc: Add luton dtsi
Date:   Fri,  6 Nov 2020 11:08:45 +0100
Message-Id: <20201106100849.969240-7-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106100849.969240-1-gregory.clement@bootlin.com>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a device tree include file for the Microsemi Luton SoC which
belongs to same family of the Ocelot SoC.

It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mscc/luton.dtsi | 116 +++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 arch/mips/boot/dts/mscc/luton.dtsi

diff --git a/arch/mips/boot/dts/mscc/luton.dtsi b/arch/mips/boot/dts/mscc/luton.dtsi
new file mode 100644
index 000000000000..2a170b84c5a9
--- /dev/null
+++ b/arch/mips/boot/dts/mscc/luton.dtsi
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020 Microsemi Corporation */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "mscc,luton";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "mips,mips24KEc";
+			device_type = "cpu";
+			clocks = <&cpu_clk>;
+			reg = <0>;
+		};
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	cpu_clk: cpu-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <416666666>;
+	};
+
+	ahb_clk: ahb-clk {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&cpu_clk>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	ahb@60000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x60000000 0x20000000>;
+
+		interrupt-parent = <&intc>;
+
+		cpu_ctrl: syscon@10000000 {
+			compatible = "mscc,ocelot-cpu-syscon", "syscon";
+			reg = <0x10000000 0x2c>;
+		};
+
+		intc: interrupt-controller@10000084 {
+			compatible = "mscc,luton-icpu-intr";
+			reg = <0x10000084 0x70>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+		};
+
+		uart0: serial@10100000 {
+			pinctrl-0 = <&uart_pins>;
+			pinctrl-names = "default";
+			compatible = "ns16550a";
+			reg = <0x10100000 0x20>;
+			interrupts = <6>;
+			clocks = <&ahb_clk>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+
+			status = "disabled";
+		};
+
+		i2c0: i2c@10100400 {
+			compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
+			pinctrl-0 = <&i2c_pins>;
+			pinctrl-names = "default";
+			reg = <0x10100400 0x100>, <0x100002a4 0x8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <11>;
+			clocks = <&ahb_clk>;
+
+			status = "disabled";
+		};
+
+		gpio: pinctrl@70068 {
+			compatible = "mscc,luton-pinctrl";
+			reg = <0x70068 0x28>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 0 32>;
+			interrupt-controller;
+			interrupts = <13>;
+			#interrupt-cells = <2>;
+
+			i2c_pins: i2c-pins {
+				pins = "GPIO_5", "GPIO_6";
+				function = "twi";
+			};
+
+			uart_pins: uart-pins {
+				pins = "GPIO_30", "GPIO_31";
+				function = "uart";
+			};
+
+		};
+	};
+};
-- 
2.28.0

