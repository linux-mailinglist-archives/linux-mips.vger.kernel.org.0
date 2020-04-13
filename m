Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503381A68CF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbgDMP2f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:28:35 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40986 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbgDMP2d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791638; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nis2cZB2rkITa84kPNYt8uyMzK/LpegBX5M2cq3zIUU=;
        b=j2nT1+cvdcrqH/TJmhhwX++VWdpiqfy7UmamqJ405js3IziRhA8ZAn/Ui1DI8vJrHAE5s3
        SSL0EXFogsCR4S5kg8mf4AKTNSbv1qDG9hlhKp2yKK5u9nnAI9FvEi5Ueack9l3Q3nXEx8
        kSinCqeWIqDK7eGyt/5J9VNCxZFN4Io=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 10/13] MIPS: ingenic: DTS: Update GCW0 support
Date:   Mon, 13 Apr 2020 17:26:30 +0200
Message-Id: <20200413152633.198301-10-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for the face buttons, the ACT8600 PMUC, the LCD panel
with backlight, the rumble, internal/external SD readers, and other
things.

Note that the otg-phy node was dropped in the process as it was neither
useful nor used, and was inside a non-compliant board "bus".

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 499 +++++++++++++++++++++++++++-
 1 file changed, 484 insertions(+), 15 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index f58d239c2058..c2396b5ca175 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -4,6 +4,10 @@
 #include "jz4770.dtsi"
 #include <dt-bindings/clock/ingenic,tcu.h>
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/ingenic,adc.h>
+#include <dt-bindings/input/input.h>
+
 / {
 	compatible = "gcw,zero", "ingenic,jz4770";
 	model = "GCW Zero";
@@ -19,16 +23,360 @@ chosen {
 		stdout-path = "serial2:57600n8";
 	};
 
-	board {
-		compatible = "simple-bus";
+	vcc: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	mmc1_power: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "mmc1_vcc";
+		gpio = <&gpe 9 0>;
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc>;
+	};
+
+	headphones_amp: analog-amplifier@0 {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpf 3 GPIO_ACTIVE_LOW>;
+		enable-delay-ms = <50>;
+
+		VCC-supply = <&ldo5>;
+		sound-name-prefix = "Headphones Amp";
+	};
+
+	speaker_amp: analog-amplifier@1 {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpf 20 GPIO_ACTIVE_HIGH>;
+
+		VCC-supply = <&ldo5>;
+		sound-name-prefix = "Speaker Amp";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,name = "gcw0-audio";
+		simple-audio-card,format = "i2s";
+
+		simple-audio-card,widgets =
+			"Speaker", "Speaker",
+			"Headphone", "Headphones",
+			"Line", "FM Radio",
+			"Microphone", "Built-in Mic";
+		simple-audio-card,routing =
+			"Headphones Amp INL", "LHPOUT",
+			"Headphones Amp INR", "RHPOUT",
+			"Headphones", "Headphones Amp OUTL",
+			"Headphones", "Headphones Amp OUTR",
+			"Speaker Amp INL", "LOUT",
+			"Speaker Amp INR", "ROUT",
+			"Speaker", "Speaker Amp OUTL",
+			"Speaker", "Speaker Amp OUTR",
+			"LLINEIN", "FM Radio",
+			"RLINEIN", "FM Radio",
+			"Built-in Mic", "MICBIAS",
+			"MIC1P", "Built-in Mic",
+			"MIC1N", "Built-in Mic";
+		simple-audio-card,pin-switches = "Speaker", "Headphones";
+
+		simple-audio-card,hp-det-gpio = <&gpf 21 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,aux-devs = <&speaker_amp>, <&headphones_amp>;
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
+	};
+
+	rumble {
+		compatible = "pwm-vibrator";
+		pwms = <&pwm 4 2000000 0>;
+		pwm-names = "enable";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_pwm4>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 1 40000 0>;
+		power-supply = <&vcc>;
+
+		brightness-levels = <0 16 32 48 64 80 96 112 128
+				     144 160 176 192 208 224 240 255>;
+		default-brightness-level = <12>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_pwm1>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		autorepeat;
+
+		button@0 {
+			label = "D-pad up";
+			linux,code = <KEY_UP>;
+			linux,can-disable;
+			gpios = <&gpe 21 GPIO_ACTIVE_LOW>;
+		};
+
+		button@1 {
+			label = "D-pad down";
+			linux,code = <KEY_DOWN>;
+			linux,can-disable;
+			gpios = <&gpe 25 GPIO_ACTIVE_LOW>;
+		};
+
+		button@2 {
+			label = "D-pad left";
+			linux,code = <KEY_LEFT>;
+			linux,can-disable;
+			gpios = <&gpe 23 GPIO_ACTIVE_LOW>;
+		};
+
+		button@3 {
+			label = "D-pad right";
+			linux,code = <KEY_RIGHT>;
+			linux,can-disable;
+			gpios = <&gpe 24 GPIO_ACTIVE_LOW>;
+		};
+
+		button@4 {
+			label = "Button A";
+			linux,code = <KEY_LEFTCTRL>;
+			linux,can-disable;
+			gpios = <&gpe 29 GPIO_ACTIVE_LOW>;
+		};
+
+		button@5 {
+			label = "Button B";
+			linux,code = <KEY_LEFTALT>;
+			linux,can-disable;
+			gpios = <&gpe 20 GPIO_ACTIVE_LOW>;
+		};
+
+		button@6 {
+			label = "Button Y";
+			linux,code = <KEY_SPACE>;
+			linux,can-disable;
+			gpios = <&gpe 27 GPIO_ACTIVE_LOW>;
+		};
+
+		button@7 {
+			label = "Button X";
+			linux,code = <KEY_LEFTSHIFT>;
+			linux,can-disable;
+			gpios = <&gpe 28 GPIO_ACTIVE_LOW>;
+		};
+
+		button@8 {
+			label = "Left shoulder button";
+			linux,code = <KEY_TAB>;
+			linux,can-disable;
+			gpios = <&gpb 20 GPIO_ACTIVE_LOW>;
+		};
+
+		button@9 {
+			label = "Right shoulder button";
+			linux,code = <KEY_BACKSPACE>;
+			linux,can-disable;
+			gpios = <&gpe 26 GPIO_ACTIVE_LOW>;
+		};
+
+		button@10 {
+			label = "Start button";
+			linux,code = <KEY_ENTER>;
+			linux,can-disable;
+			gpios = <&gpb 21 GPIO_ACTIVE_LOW>;
+		};
+
+		button@11 {
+			label = "Select button";
+			linux,code = <KEY_ESC>;
+			linux,can-disable;
+			/*
+			 * This is the only button that is active high,
+			 * since it doubles as BOOT_SEL1.
+			 */
+			gpios = <&gpd 18 GPIO_ACTIVE_HIGH>;
+		};
+
+		button@12 {
+			label = "Power slider";
+			linux,code = <KEY_POWER>;
+			linux,can-disable;
+			gpios = <&gpa 30 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button@13 {
+			label = "Power hold";
+			linux,code = <KEY_PAUSE>;
+			linux,can-disable;
+			gpios = <&gpf 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	i2c3: i2c-controller@3 {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sda-gpios = <&gpd 5 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&gpd 4 GPIO_ACTIVE_HIGH>;
+		i2c-gpio,delay-us = <2>; /* 250 kHz */
+
+		act8600: pmic@5a {
+			compatible = "active-semi,act8600";
+			reg = <0x5a>;
+
+			regulators {
+				/* USB OTG */
+				otg_vbus: SUDCDC_REG4 {
+					/*
+					 * 5.3V instead of 5.0V to compensate
+					 * for the voltage drop of a diode
+					 * between the regulator and the
+					 * connector.
+					 */
+					regulator-min-microvolt = <5300000>;
+					regulator-max-microvolt = <5300000>;
+					inl-supply = <&vcc>;
+				};
+
+				/*
+				 * When this is off, there is no sound, but also
+				 * no USB networking.
+				 */
+				ldo5: LDO5 {
+					regulator-min-microvolt = <2500000>;
+					regulator-max-microvolt = <2500000>;
+					inl-supply = <&vcc>;
+				};
+
+				/* LCD panel and FM radio */
+				ldo6: LDO6 {
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					inl-supply = <&vcc>;
+				};
+
+				/* ??? */
+				LDO7 {
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					/*regulator-always-on;*/
+					inl-supply = <&vcc>;
+				};
+
+				/*
+				 * The colors on the LCD are wrong when this is
+				 * off. Which is strange, since the LCD panel
+				 * data sheet only mentions a 3.3V input.
+				 */
+				LDO8 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					inl-supply = <&vcc>;
+				};
+
+				/* RTC fixed 3.3V */
+				LDO_REG9 {
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					inl-supply = <&vcc>;
+				};
+
+				/* Unused fixed 1.2V */
+				LDO_REG10 {
+					inl-supply = <&vcc>;
+				};
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			gpios = <&gpb 30 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	spi {
+		compatible = "spi-gpio";
 		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpe 15 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpe 17 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpe 16 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+
+		nt39016@0 {
+			compatible = "kingdisplay,kd035g6-54nt";
+			reg = <0>;
+
+			spi-max-frequency = <3125000>;
+			spi-3wire;
+			spi-cs-high;
+
+			reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
 
-		otg_phy: otg-phy {
-			compatible = "usb-nop-xceiv";
-			clocks = <&cgu JZ4770_CLK_OTG_PHY>;
-			clock-names = "main_clk";
+			backlight = <&backlight>;
+			power-supply = <&ldo6>;
+
+			port {
+				panel_input: endpoint {
+					remote-endpoint = <&panel_output>;
+				};
+			};
+		};
+	};
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "mini-USB";
+		type = "mini";
+
+		/*
+		 * USB OTG is not yet working reliably, the ID detection
+		 * mechanism tends to fry easily for unknown reasons.
+		 * Until this is fixed, disable OTG by not providing the
+		 * ID GPIO to the driver.
+		 */
+		//id-gpios = <&gpf 18 GPIO_ACTIVE_LOW>;
+
+		vbus-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&otg_vbus>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_otg>;
+
+		port {
+			usb_ep: endpoint {
+				remote-endpoint = <&usb_otg_ep>;
+			};
 		};
 	};
 };
@@ -37,24 +385,86 @@ &ext {
 	clock-frequency = <12000000>;
 };
 
+&pinctrl {
+	pins_lcd: lcd {
+		function = "lcd";
+		groups = "lcd-24bit";
+	};
+
+	pins_uart2: uart2 {
+		function = "uart2";
+		groups = "uart2-data";
+	};
+
+	pins_mmc0: mmc0 {
+		function = "mmc0";
+		groups = "mmc0-1bit-a", "mmc0-4bit-a";
+	};
+
+	pins_mmc1: mmc1 {
+		function = "mmc1";
+		groups = "mmc1-1bit-d", "mmc1-4bit-d";
+	};
+
+	pins_otg: otg {
+		otg-vbus-pin {
+			function = "otg";
+			groups = "otg-vbus";
+		};
+
+		vbus-pin {
+			pins = "PB5";
+			bias-disable;
+		};
+	};
+
+	pins_pwm1: pwm1 {
+		function = "pwm1";
+		groups = "pwm1";
+	};
+
+	pins_pwm4: pwm4 {
+		function = "pwm4";
+		groups = "pwm4";
+	};
+};
+
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+
 	status = "okay";
 };
 
 &cgu {
-	/* Put high-speed peripherals under PLL1, such that we can change the
+	/*
+	 * Put high-speed peripherals under PLL1, such that we can change the
 	 * PLL0 frequency on demand without having to suspend peripherals.
 	 * We use a rate of 432 MHz, which is the least common multiple of
 	 * 27 MHz (required by TV encoder) and 48 MHz (required by USB host).
+	 * Put the GPU under PLL0 since we want a higher frequency.
+	 * Use the 32 kHz oscillator as the parent of the RTC for a higher
+	 * precision.
 	 */
 	assigned-clocks =
 		<&cgu JZ4770_CLK_PLL1>,
-		<&cgu JZ4770_CLK_UHC>;
+		<&cgu JZ4770_CLK_GPU>,
+		<&cgu JZ4770_CLK_RTC>,
+		<&cgu JZ4770_CLK_UHC>,
+		<&cgu JZ4770_CLK_LPCLK_MUX>,
+		<&cgu JZ4770_CLK_MMC0_MUX>,
+		<&cgu JZ4770_CLK_MMC1_MUX>;
 	assigned-clock-parents =
 		<0>,
+		<&cgu JZ4770_CLK_PLL0>,
+		<&cgu JZ4770_CLK_OSC32K>,
+		<&cgu JZ4770_CLK_PLL1>,
+		<&cgu JZ4770_CLK_PLL1>,
+		<&cgu JZ4770_CLK_PLL1>,
 		<&cgu JZ4770_CLK_PLL1>;
 	assigned-clock-rates =
-		<432000000>;
+		<432000000>,
+		<600000000>;
 };
 
 &uhc {
@@ -63,10 +473,69 @@ &uhc {
 };
 
 &tcu {
-	/* 750 kHz for the system timer and clocksource */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
-	assigned-clock-rates = <750000>, <750000>;
+	/*
+	 * 750 kHz for the system timer and clocksource, 12 MHz for the OST,
+	 * and use RTC as the parent for the watchdog clock
+	 */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>,
+			  <&tcu TCU_CLK_OST>, <&tcu TCU_CLK_WDT>;
+	assigned-clock-parents = <0>, <0>, <0>, <&cgu JZ4770_CLK_RTC>;
+	assigned-clock-rates = <750000>, <750000>, <12000000>;
 
-	/* PWM1 is in use, so reserve channel #2 for the clocksource */
+	/* PWM1 is in use, so use channel #2 for the clocksource */
 	ingenic,pwm-channels-mask = <0xfa>;
 };
+
+&usb_otg {
+	port {
+		usb_otg_ep: endpoint {
+			remote-endpoint = <&usb_ep>;
+		};
+	};
+};
+
+&otg_phy {
+	vcc-supply = <&ldo5>;
+};
+
+&rtc {
+	clocks = <&cgu JZ4770_CLK_RTC>;
+	clock-names = "rtc";
+
+	system-power-controller;
+};
+
+&mmc0 {
+	status = "okay";
+
+	bus-width = <4>;
+	max-frequency = <48000000>;
+	vmmc-supply = <&vcc>;
+	non-removable;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_mmc0>;
+};
+
+&mmc1 {
+	status = "okay";
+
+	bus-width = <4>;
+	max-frequency = <48000000>;
+	cd-gpios = <&gpb 2 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&mmc1_power>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_mmc1>;
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
-- 
2.25.1

