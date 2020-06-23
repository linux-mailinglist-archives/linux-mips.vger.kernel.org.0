Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E337205A7B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 20:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733105AbgFWSZS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 14:25:18 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52110 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWSZS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 14:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1592936687; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FYKfNVd30L/ZHXSNz64Wbq3SIUcXXkgLY/JGnV8rS3o=;
        b=SXtxxLymCpJiqoKGGUqUgsFf0FrL2HgnjyEXSiBm4czVKcDVofRBCWDNXGbvcAbq1y5Eor
        yJ2/bJ6tLamOgZLhaEr5CDHRrqHtCxphl+P1WoYCjIcSMBLmp4iLS+lDUCLtYj3aAEWXvA
        sLutyTpMqT45FWaQqNlE6Q3PaIdU4jg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/7] MIPS: ingenic: Add support for the JZ4725B SoC
Date:   Tue, 23 Jun 2020 20:24:30 +0200
Message-Id: <20200623182432.187843-5-paul@crapouillou.net>
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add preliminary support for boards based on the JZ4725B SoC from
Ingenic.

The JZ4725B SoC is supposed to be older than the JZ4740 SoC, but its
internals are much closer to what can be found on the JZ4750 and newer
SoCs.

It is low-power SoC with a MIPS32r1 SoC running at ~360 MHz, and no FPU.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 334 ++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig                |   4 +
 arch/mips/jz4740/setup.c                |   4 +
 3 files changed, 342 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/jz4725b.dtsi

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
new file mode 100644
index 000000000000..89402a15f049
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/jz4725b-cgu.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ingenic,jz4725b";
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	intc: interrupt-controller@10001000 {
+		compatible = "ingenic,jz4725b-intc", "ingenic,jz4740-intc";
+		reg = <0x10001000 0x14>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+	};
+
+	ext: ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	osc32k: osc32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	cgu: clock-controller@10000000 {
+		compatible = "ingenic,jz4725b-cgu";
+		reg = <0x10000000 0x100>;
+
+		clocks = <&ext>, <&osc32k>;
+		clock-names = "ext", "osc32k";
+
+		#clock-cells = <1>;
+	};
+
+	tcu: timer@10002000 {
+		compatible = "ingenic,jz4725b-tcu", "simple-mfd";
+		reg = <0x10002000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10002000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu JZ4725B_CLK_RTC>,
+			 <&cgu JZ4725B_CLK_EXT>,
+			 <&cgu JZ4725B_CLK_PCLK>,
+			 <&cgu JZ4725B_CLK_TCU>;
+		clock-names = "rtc", "ext", "pclk", "tcu";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <23>, <22>, <21>;
+
+		watchdog: watchdog@0 {
+			compatible = "ingenic,jz4725b-watchdog", "ingenic,jz4740-watchdog";
+			reg = <0x0 0xc>;
+
+			clocks = <&tcu TCU_CLK_WDT>;
+			clock-names = "wdt";
+		};
+
+		pwm: pwm@60 {
+			compatible = "ingenic,jz4725b-pwm";
+			reg = <0x60 0x40>;
+
+			#pwm-cells = <3>;
+
+			clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+				 <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_TIMER3>,
+				 <&tcu TCU_CLK_TIMER4>, <&tcu TCU_CLK_TIMER5>;
+			clock-names = "timer0", "timer1", "timer2",
+				      "timer3", "timer4", "timer5";
+		};
+
+		ost: timer@e0 {
+			compatible = "ingenic,jz4725b-ost";
+			reg = <0xe0 0x20>;
+
+			clocks = <&tcu TCU_CLK_OST>;
+			clock-names = "ost";
+
+			interrupts = <15>;
+		};
+	};
+
+	rtc_dev: rtc@10003000 {
+		compatible = "ingenic,jz4725b-rtc", "ingenic,jz4740-rtc";
+		reg = <0x10003000 0x40>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <6>;
+
+		clocks = <&cgu JZ4725B_CLK_RTC>;
+		clock-names = "rtc";
+	};
+
+	pinctrl: pinctrl@10010000 {
+		compatible = "ingenic,jz4725b-pinctrl";
+		reg = <0x10010000 0x400>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpa: gpio@0 {
+			compatible = "ingenic,jz4725b-gpio";
+			reg = <0>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <16>;
+		};
+
+		gpb: gpio@1 {
+			compatible = "ingenic,jz4725b-gpio";
+			reg = <1>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <15>;
+		};
+
+		gpc: gpio@2 {
+			compatible = "ingenic,jz4725b-gpio";
+			reg = <2>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <14>;
+		};
+
+		gpd: gpio@3 {
+			compatible = "ingenic,jz4725b-gpio";
+			reg = <3>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <13>;
+		};
+	};
+
+	aic: audio-controller@10020000 {
+		compatible = "ingenic,jz4725b-i2s", "ingenic,jz4740-i2s";
+		reg = <0x10020000 0x38>;
+
+		#sound-dai-cells = <0>;
+
+		clocks = <&cgu JZ4725B_CLK_AIC>,
+			 <&cgu JZ4725B_CLK_I2S>,
+			 <&cgu JZ4725B_CLK_EXT>,
+			 <&cgu JZ4725B_CLK_PLL_HALF>;
+		clock-names = "aic", "i2s", "ext", "pll half";
+
+		interrupt-parent = <&intc>;
+		interrupts = <10>;
+
+		dmas = <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
+		dma-names = "rx", "tx";
+	};
+
+	codec: audio-codec@100200a4 {
+		compatible = "ingenic,jz4725b-codec";
+		reg = <0x100200a4 0x8>;
+
+		#sound-dai-cells = <0>;
+
+		clocks = <&cgu JZ4725B_CLK_AIC>;
+		clock-names = "aic";
+	};
+
+	mmc0: mmc@10021000 {
+		compatible = "ingenic,jz4725b-mmc";
+		reg = <0x10021000 0x1000>;
+
+		clocks = <&cgu JZ4725B_CLK_MMC0>;
+		clock-names = "mmc";
+
+		interrupt-parent = <&intc>;
+		interrupts = <25>;
+
+		dmas = <&dmac 27 0xffffffff>, <&dmac 26 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+	};
+
+	mmc1: mmc@10022000 {
+		compatible = "ingenic,jz4725b-mmc";
+		reg = <0x10022000 0x1000>;
+
+		clocks = <&cgu JZ4725B_CLK_MMC1>;
+		clock-names = "mmc";
+
+		interrupt-parent = <&intc>;
+		interrupts = <24>;
+
+		dmas = <&dmac 31 0xffffffff>, <&dmac 30 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+	};
+
+	uart: serial@10030000 {
+		compatible = "ingenic,jz4725b-uart", "ingenic,jz4740-uart";
+		reg = <0x10030000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <9>;
+
+		clocks = <&ext>, <&cgu JZ4725B_CLK_UART>;
+		clock-names = "baud", "module";
+	};
+
+	adc: adc@10070000 {
+		compatible = "ingenic,jz4725b-adc";
+		#io-channel-cells = <1>;
+
+		reg = <0x10070000 0x30>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10070000 0x30>;
+
+		clocks = <&cgu JZ4725B_CLK_ADC>;
+		clock-names = "adc";
+
+		interrupt-parent = <&intc>;
+		interrupts = <18>;
+	};
+
+	nemc: memory-controller@13010000 {
+		compatible = "ingenic,jz4725b-nemc", "ingenic,jz4740-nemc";
+		reg = <0x13010000 0x10000>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <1 0 0x18000000 0x4000000>, <2 0 0x14000000 0x4000000>,
+			 <3 0 0x0c000000 0x4000000>, <4 0 0x08000000 0x4000000>;
+
+		clocks = <&cgu JZ4725B_CLK_MCLK>;
+	};
+
+	dmac: dma-controller@13020000 {
+		compatible = "ingenic,jz4725b-dma";
+		reg = <0x13020000 0xd8>, <0x13020300 0x14>;
+
+		#dma-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <29>;
+
+		clocks = <&cgu JZ4725B_CLK_DMA>;
+	};
+
+	udc: usb@13040000 {
+		compatible = "ingenic,jz4725b-musb", "ingenic,jz4740-musb";
+		reg = <0x13040000 0x10000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <27>;
+		interrupt-names = "mc";
+
+		clocks = <&cgu JZ4725B_CLK_UDC>;
+		clock-names = "udc";
+	};
+
+	lcd: lcd-controller@13050000 {
+		compatible = "ingenic,jz4725b-lcd";
+		reg = <0x13050000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <31>;
+
+		clocks = <&cgu JZ4725B_CLK_LCD>;
+		clock-names = "lcd_pclk";
+	};
+
+	bch: ecc-controller@130d0000 {
+		compatible = "ingenic,jz4725b-bch";
+		reg = <0x130d0000 0x44>;
+
+		clocks = <&cgu JZ4725B_CLK_BCH>;
+	};
+
+	rom: memory@1fc00000 {
+		compatible = "mtd-rom";
+		probe-type = "map_rom";
+		reg = <0x1fc00000 0x2000>;
+
+		bank-width = <4>;
+		device-width = <1>;
+	};
+};
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 9c2e8c15bb97..0325153efbd4 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -29,6 +29,10 @@ config X1000_CU1000_NEO
 
 endchoice
 
+config MACH_JZ4725B
+	bool
+	select SYS_HAS_CPU_MIPS32_R1
+
 config MACH_JZ4740
 	bool
 	select SYS_HAS_CPU_MIPS32_R1
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index 61468a87775c..83f343abf13e 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -57,6 +57,8 @@ static unsigned long __init get_board_mach_type(const void *fdt)
 		return MACH_INGENIC_JZ4780;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4770"))
 		return MACH_INGENIC_JZ4770;
+	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4725b"))
+		return MACH_INGENIC_JZ4725B;
 
 	return MACH_INGENIC_JZ4740;
 }
@@ -99,6 +101,8 @@ const char *get_system_type(void)
 		return "JZ4780";
 	case MACH_INGENIC_JZ4770:
 		return "JZ4770";
+	case MACH_INGENIC_JZ4725B:
+		return "JZ4725B";
 	default:
 		return "JZ4740";
 	}
-- 
2.27.0

