Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C234205A7E
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 20:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733261AbgFWSZ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 14:25:27 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52152 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWSZ0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 14:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1592936688; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XghSCXLoXnDYRQ/6JmcfdRYpTnLy4dP9MGr2AOJEaqM=;
        b=s2UcFamXFjhJBChZ5WsBn+lzWyPdYLxhZchfzUi7VJqmlt1mLRc5TCDBmLMi/3nXKvxEBt
        JaqPjJrOiFi8PA72g2b44USOY4bwP/PCfqs3FMkaInX84hBAao47545U8uM+AGjZb07RPk
        zBGZzBNqEXXQbQrSOXMjRlqwHMhWNvE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 6/7] MIPS: ingenic: Add support for the RS90 board
Date:   Tue, 23 Jun 2020 20:24:31 +0200
Message-Id: <20200623182432.187843-6-paul@crapouillou.net>
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The RS-90, better known as RetroMini, is a small and pocketable handheld
gaming console from YLMChina. It has little more than a JZ4725B SoC, a
NAND, a screen, some buttons and a speaker.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/Makefile |   1 +
 arch/mips/boot/dts/ingenic/rs90.dts | 311 ++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig            |   4 +
 3 files changed, 316 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/rs90.dts

diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index e1654291a7b0..f23ff5109e5b 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
+dtb-$(CONFIG_JZ4740_RS90)	+= rs90.dtb
 dtb-$(CONFIG_JZ4770_GCW0)	+= gcw0.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
 dtb-$(CONFIG_X1000_CU1000_NEO)	+= cu1000-neo.dtb
diff --git a/arch/mips/boot/dts/ingenic/rs90.dts b/arch/mips/boot/dts/ingenic/rs90.dts
new file mode 100644
index 000000000000..246f97efe5ef
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/rs90.dts
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "jz4725b.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/ingenic,adc.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	compatible = "ylm,rs90", "ingenic,jz4725b";
+	model = "RS-90";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x2000000>;
+	};
+
+	vcc: regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc";
+		regulaor-min-microvolt = <3300000>;
+		regulaor-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 3 40000 0>;
+
+		brightness-levels = <0 16 32 48 64 80 112 144 192 255>;
+		default-brightness-level = <8>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_pwm3>;
+
+		power-supply = <&vcc>;
+	};
+
+	keys@0 {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		key@0 {
+			label = "D-pad up";
+			linux,code = <KEY_UP>;
+			gpios = <&gpc 10 GPIO_ACTIVE_LOW>;
+		};
+
+		key@1 {
+			label = "D-pad down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpc 11 GPIO_ACTIVE_LOW>;
+		};
+
+		key@2 {
+			label = "D-pad left";
+			linux,code = <KEY_LEFT>;
+			gpios = <&gpb 31 GPIO_ACTIVE_LOW>;
+		};
+
+		key@3 {
+			label = "D-pad right";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&gpd 21 GPIO_ACTIVE_LOW>;
+		};
+
+		key@4 {
+			label = "Button A";
+			linux,code = <KEY_LEFTCTRL>;
+			gpios = <&gpc 31 GPIO_ACTIVE_LOW>;
+		};
+
+		key@5 {
+			label = "Button B";
+			linux,code = <KEY_LEFTALT>;
+			gpios = <&gpc 30 GPIO_ACTIVE_LOW>;
+		};
+
+		key@6 {
+			label = "Right shoulder button";
+			linux,code = <KEY_BACKSPACE>;
+			gpios = <&gpc 12 GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+		};
+
+		key@7 {
+			label = "Start button";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpd 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	keys@1 {
+		compatible = "adc-keys";
+		io-channels = <&adc INGENIC_ADC_AUX>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1400000>;
+		poll-interval = <30>;
+
+		key@0 {
+			label = "Left shoulder button";
+			linux,code = <KEY_TAB>;
+			press-threshold-microvolt = <800000>;
+		};
+
+		key@1 {
+			label = "Select button";
+			linux,code = <KEY_ESC>;
+			press-threshold-microvolt = <1100000>;
+		};
+	};
+
+	amp: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpc 15 GPIO_ACTIVE_HIGH>;
+
+		VCC-supply = <&vcc>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "rs90-audio";
+		simple-audio-card,format = "i2s";
+
+		simple-audio-card,widgets =
+			"Speaker", "Speaker",
+			"Headphone", "Headphones";
+		simple-audio-card,routing =
+			"INL", "LHPOUT",
+			"INR", "RHPOUT",
+			"Headphones", "LHPOUT",
+			"Headphones", "RHPOUT",
+			"Speaker", "OUTL",
+			"Speaker", "OUTR";
+		simple-audio-card,pin-switches = "Speaker";
+
+		simple-audio-card,hp-det-gpio = <&gpd 16 GPIO_ACTIVE_LOW>;
+		simple-audio-card,aux-devs = <&amp>;
+
+		simple-audio-card,bitclock-master = <&dai_codec>;
+		simple-audio-card,frame-master = <&dai_codec>;
+
+		dai_cpu: simple-audio-card,cpu {
+			sound-dai = <&aic>;
+		};
+
+		dai_codec: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+
+	};
+
+	usb_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+
+		clocks = <&cgu JZ4725B_CLK_UDC_PHY>;
+		clock-names = "main_clk";
+		vcc-supply = <&vcc>;
+	};
+
+	panel {
+		compatible = "sharp,ls020b1dd01d";
+
+		backlight = <&backlight>;
+		power-supply = <&vcc>;
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&panel_output>;
+			};
+		};
+	};
+};
+
+&ext {
+	clock-frequency = <12000000>;
+};
+
+&rtc_dev {
+	system-power-controller;
+};
+
+&udc {
+	phys = <&usb_phy>;
+};
+
+&pinctrl {
+	pins_mmc1: mmc1 {
+		function = "mmc1";
+		groups = "mmc1-1bit";
+	};
+
+	pins_nemc: nemc {
+		function = "nand";
+		groups = "nand-cs1", "nand-cle-ale", "nand-fre-fwe";
+	};
+
+	pins_pwm3: pwm3 {
+		function = "pwm3";
+		groups = "pwm3";
+		bias-disable;
+	};
+
+	pins_lcd: lcd {
+		function = "lcd";
+		groups = "lcd-8bit", "lcd-16bit", "lcd-special";
+	};
+};
+
+&mmc0 {
+	status = "disabled";
+};
+
+&mmc1 {
+	bus-width = <1>;
+	max-frequency = <48000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_mmc1>;
+
+	cd-gpios = <&gpc 20 GPIO_ACTIVE_LOW>;
+};
+
+&uart {
+	/*
+	 * The pins for RX/TX are used for the right shoulder button and
+	 * backlight PWM.
+	 */
+	status = "disabled";
+};
+
+&nemc {
+	nandc: nand-controller@1 {
+		compatible = "ingenic,jz4725b-nand";
+		reg = <1 0 0x4000000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ecc-engine = <&bch>;
+
+		ingenic,nemc-tAS = <10>;
+		ingenic,nemc-tAH = <5>;
+		ingenic,nemc-tBP = <10>;
+		ingenic,nemc-tAW = <15>;
+		ingenic,nemc-tSTRV = <100>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_nemc>;
+
+		rb-gpios = <&gpc 27 GPIO_ACTIVE_HIGH>;
+
+		nand@1 {
+			reg = <1>;
+
+			nand-ecc-step-size = <512>;
+			nand-ecc-strength = <8>;
+			nand-ecc-mode = "hw";
+			nand-is-boot-medium;
+			nand-on-flash-bbt;
+
+			partitions {
+				compatible = "fixed-partitions";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				partition@0 {
+					label = "bootloader";
+					reg = <0x0 0x20000>;
+				};
+
+				partition@20000 {
+					label = "system";
+					reg = <0x20000 0x0>;
+				};
+			};
+		};
+	};
+};
+
+&cgu {
+	/* Use 32kHz oscillator as the parent of the RTC clock */
+	assigned-clocks = <&cgu JZ4725B_CLK_RTC>;
+	assigned-clock-parents = <&cgu JZ4725B_CLK_OSC32K>;
+};
+
+&tcu {
+	/*
+	 * 750 kHz for the system timer and clocksource, and use RTC as the
+	 * parent for the watchdog clock.
+	 */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>, <&tcu TCU_CLK_WDT>;
+	assigned-clock-parents = <0>, <0>, <&cgu JZ4725B_CLK_RTC>;
+	assigned-clock-rates = <750000>, <750000>;
+};
+
+&lcd {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_lcd>;
+
+	port {
+		panel_output: endpoint {
+			remote-endpoint = <&panel_input>;
+		};
+	};
+};
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 0325153efbd4..baa315c8183a 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -15,6 +15,10 @@ config JZ4740_QI_LB60
 	bool "Qi Hardware Ben NanoNote"
 	select MACH_JZ4740
 
+config JZ4740_RS90
+	bool "YLM RetroMini (RS-90)"
+	select MACH_JZ4725B
+
 config JZ4770_GCW0
 	bool "Game Consoles Worldwide GCW Zero"
 	select MACH_JZ4770
-- 
2.27.0

