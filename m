Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1752AA4CF
	for <lists+linux-mips@lfdr.de>; Sat,  7 Nov 2020 12:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgKGLxf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Nov 2020 06:53:35 -0500
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:55537 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgKGLxe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 7 Nov 2020 06:53:34 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.110604-0.000734163-0.888662;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=18;RT=18;SR=0;TI=SMTPD_---.ItnO01s_1604749999;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.ItnO01s_1604749999)
          by smtp.aliyun-inc.com(10.147.41.231);
          Sat, 07 Nov 2020 19:53:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, nixiaoming@huawei.com,
        paulburton@kernel.org, krzk@kernel.org, hns@goldelico.com,
        ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 1/2] MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards.
Date:   Sat,  7 Nov 2020 19:52:50 +0800
Message-Id: <20201107115251.86182-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201107115251.86182-1-zhouyanjie@wanyeetech.com>
References: <20201107115251.86182-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add OTG/OTG PHY/RNG nodes for JZ4780, CGU/OTG nodes for CI20.
2.Add OTG/OTG PHY/RNG/OST nodes for X1000, SSI/CGU/OST/OTG/SC16IS752
  nodes for CU1000-Neo.
3.Add OTG/OTG PHY/DTRNG/OST nodes for X1830, SSI/CGU/OST/OTG/SC16IS752
  nodes for CU1830-Neo.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts       | 16 +++++++++
 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 60 +++++++++++++++++++++++++++----
 arch/mips/boot/dts/ingenic/cu1830-neo.dts | 60 +++++++++++++++++++++++++++----
 arch/mips/boot/dts/ingenic/jz4780.dtsi    | 41 +++++++++++++++++++--
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 52 ++++++++++++++++++++++++++-
 arch/mips/boot/dts/ingenic/x1830.dtsi     | 54 +++++++++++++++++++++++++++-
 6 files changed, 267 insertions(+), 16 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 75f5bfbf2c37..b31054a41754 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -93,6 +93,15 @@
 	clock-frequency = <48000000>;
 };
 
+&cgu {
+	/*
+	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
+	 * precision.
+	 */
+	assigned-clocks = <&cgu JZ4780_CLK_RTC>;
+	assigned-clock-parents = <&cgu JZ4780_CLK_RTCLK>;
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -396,6 +405,13 @@
 	status = "okay";
 };
 
+&otg {
+	status = "okay";
+
+	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>;
+	assigned-clock-rates = <48000000>;
+};
+
 &pinctrl {
 	pins_uart0: uart0 {
 		function = "uart0";
diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index 22a1066d637b..44d47d12db12 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -3,7 +3,7 @@
 
 #include "x1000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/clock/ingenic,tcu.h>
+#include <dt-bindings/clock/ingenic,sysost.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -31,6 +31,18 @@
 		};
 	};
 
+	ssi: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-chipselects = <1>;
+
+		mosi-gpios = <&gpd 2 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpd 3 GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpd 0 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpd 1 GPIO_ACTIVE_HIGH>;
+	};
+
 	wlan_pwrseq: msc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 
@@ -43,13 +55,19 @@
 	clock-frequency = <24000000>;
 };
 
-&tcu {
+&cgu {
+	/*
+	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
+	 * precision.
+	 */
+	assigned-clocks = <&cgu X1000_CLK_RTC>;
+	assigned-clock-parents = <&cgu X1000_CLK_RTCLK>;
+};
+
+&ost {
 	/* 1500 kHz for the system timer and clocksource */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clocks = <&ost OST_CLK_PERCPU_TIMER>, <&ost OST_CLK_GLOBAL_TIMER>;
 	assigned-clock-rates = <1500000>, <1500000>;
-
-	/* Use channel #0 for the system timer channel #2 for the clocksource */
-	ingenic,pwm-channels-mask = <0xfa>;
 };
 
 &uart2 {
@@ -59,6 +77,32 @@
 	pinctrl-0 = <&pins_uart2>;
 };
 
+&ssi {
+	status = "okay";
+
+	spi-max-frequency = <50000000>;
+
+	sc16is752: expander@0 {
+		compatible = "nxp,sc16is752";
+		reg = <0>; /* CE0 */
+		spi-max-frequency = <4000000>;
+
+		clocks = <&exclk_sc16is752>;
+
+		interrupt-parent = <&gpc>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		exclk_sc16is752: sc16is752 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <48000000>;
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -135,6 +179,10 @@
 	};
 };
 
+&otg {
+	status = "okay";
+};
+
 &pinctrl {
 	pins_uart2: uart2 {
 		function = "uart2";
diff --git a/arch/mips/boot/dts/ingenic/cu1830-neo.dts b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
index 640f96c00d63..7a56e344e429 100644
--- a/arch/mips/boot/dts/ingenic/cu1830-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1830-neo.dts
@@ -3,7 +3,7 @@
 
 #include "x1830.dtsi"
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/clock/ingenic,tcu.h>
+#include <dt-bindings/clock/ingenic,sysost.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -31,6 +31,18 @@
 		};
 	};
 
+	ssi0: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		num-chipselects = <1>;
+
+		mosi-gpios = <&gpc 12 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpc 11 GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpc 15 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&gpc 16 GPIO_ACTIVE_HIGH>;
+	};
+
 	wlan_pwrseq: msc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 
@@ -43,13 +55,19 @@
 	clock-frequency = <24000000>;
 };
 
-&tcu {
+&cgu {
+	/*
+	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
+	 * precision.
+	 */
+	assigned-clocks = <&cgu X1830_CLK_RTC>;
+	assigned-clock-parents = <&cgu X1830_CLK_RTCLK>;
+};
+
+&ost {
 	/* 1500 kHz for the system timer and clocksource */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clocks = <&ost OST_CLK_PERCPU_TIMER>, <&ost OST_CLK_GLOBAL_TIMER>;
 	assigned-clock-rates = <1500000>, <1500000>;
-
-	/* Use channel #0 for the system timer channel #2 for the clocksource */
-	ingenic,pwm-channels-mask = <0xfa>;
 };
 
 &uart1 {
@@ -59,6 +77,32 @@
 	pinctrl-0 = <&pins_uart1>;
 };
 
+&ssi0 {
+	status = "okay";
+
+	spi-max-frequency = <50000000>;
+
+	sc16is752: expander@0 {
+		compatible = "nxp,sc16is752";
+		reg = <0>; /* CE0 */
+		spi-max-frequency = <4000000>;
+
+		clocks = <&exclk_sc16is752>;
+
+		interrupt-parent = <&gpb>;
+		interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		exclk_sc16is752: sc16is752 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <48000000>;
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -135,6 +179,10 @@
 	};
 };
 
+&otg {
+	status = "okay";
+};
+
 &pinctrl {
 	pins_uart1: uart1 {
 		function = "uart1";
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index dfb5a7e1bb21..8837147e5a84 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -61,13 +61,30 @@
 	};
 
 	cgu: jz4780-cgu@10000000 {
-		compatible = "ingenic,jz4780-cgu";
+		compatible = "ingenic,jz4780-cgu", "simple-mfd";
 		reg = <0x10000000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10000000 0x100>;
+
+		#clock-cells = <1>;
 
 		clocks = <&ext>, <&rtc>;
 		clock-names = "ext", "rtc";
 
-		#clock-cells = <1>;
+		otg_phy: usb-phy@3c {
+			compatible = "ingenic,jz4780-phy";
+			reg = <0x3c 0x10>;
+
+			clocks = <&cgu JZ4780_CLK_OTG1>;
+
+			#phy-cells = <0>;
+		};
+
+		rng: rng@d8 {
+			compatible = "ingenic,jz4780-rng";
+			reg = <0xd8 0x8>;
+		};
 	};
 
 	tcu: timer@10002000 {
@@ -494,4 +511,24 @@
 
 		status = "disabled";
 	};
+
+	otg: usb@13500000 {
+		compatible = "ingenic,jz4780-otg", "snps,dwc2";
+		reg = <0x13500000 0x40000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <21>;
+
+		clocks = <&cgu JZ4780_CLK_UHC>;
+		clock-names = "otg";
+
+		phys = <&otg_phy>;
+		phy-names = "usb2-phy";
+
+		g-rx-fifo-size = <768>;
+		g-np-tx-fifo-size = <256>;
+		g-tx-fifo-size = <256 256 256 256 256 256 256 512>;
+
+		status = "disabled";
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 1f1f896dd1f7..854fac58f45e 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -52,13 +52,43 @@
 	};
 
 	cgu: x1000-cgu@10000000 {
-		compatible = "ingenic,x1000-cgu";
+		compatible = "ingenic,x1000-cgu", "simple-mfd";
 		reg = <0x10000000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10000000 0x100>;
 
 		#clock-cells = <1>;
 
 		clocks = <&exclk>, <&rtclk>;
 		clock-names = "ext", "rtc";
+
+		otg_phy: usb-phy@3c {
+			compatible = "ingenic,x1000-phy";
+			reg = <0x3c 0x10>;
+
+			clocks = <&cgu X1000_CLK_OTGPHY>;
+
+			#phy-cells = <0>;
+		};
+
+		rng: rng@d8 {
+			compatible = "ingenic,x1000-rng";
+			reg = <0xd8 0x8>;
+		};
+	};
+
+	ost: timer@12000000 {
+		compatible = "ingenic,x1000-ost";
+		reg = <0x12000000 0x3c>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu X1000_CLK_OST>;
+		clock-names = "ost";
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <3>;
 	};
 
 	tcu: timer@10002000 {
@@ -323,4 +353,24 @@
 			status = "disabled";
 		};
 	};
+
+	otg: usb@13500000 {
+		compatible = "ingenic,x1000-otg", "snps,dwc2";
+		reg = <0x13500000 0x40000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <21>;
+
+		clocks = <&cgu X1000_CLK_OTG>;
+		clock-names = "otg";
+
+		phys = <&otg_phy>;
+		phy-names = "usb2-phy";
+
+		g-rx-fifo-size = <768>;
+		g-np-tx-fifo-size = <256>;
+		g-tx-fifo-size = <256 256 256 256 256 256 256 512>;
+
+		status = "disabled";
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
index b05dac3ae308..4831350efdf2 100644
--- a/arch/mips/boot/dts/ingenic/x1830.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
@@ -52,13 +52,38 @@
 	};
 
 	cgu: x1830-cgu@10000000 {
-		compatible = "ingenic,x1830-cgu";
+		compatible = "ingenic,x1830-cgu", "simple-mfd";
 		reg = <0x10000000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10000000 0x100>;
 
 		#clock-cells = <1>;
 
 		clocks = <&exclk>, <&rtclk>;
 		clock-names = "ext", "rtc";
+
+		otg_phy: usb-phy@3c {
+			compatible = "ingenic,x1830-phy";
+			reg = <0x3c 0x10>;
+
+			clocks = <&cgu X1830_CLK_OTGPHY>;
+
+			#phy-cells = <0>;
+		};
+	};
+
+	ost: timer@12000000 {
+		compatible = "ingenic,x1830-ost", "ingenic,x1000-ost";
+		reg = <0x12000000 0x3c>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu X1830_CLK_OST>;
+		clock-names = "ost";
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <4>;
 	};
 
 	tcu: timer@10002000 {
@@ -236,6 +261,13 @@
 		status = "disabled";
 	};
 
+	dtrng: trng@10072000 {
+		compatible = "ingenic,x1830-dtrng";
+		reg = <0x10072000 0xc>;
+
+		clocks = <&cgu X1830_CLK_DTRNG>;
+	};
+
 	pdma: dma-controller@13420000 {
 		compatible = "ingenic,x1830-dma";
 		reg = <0x13420000 0x400
@@ -311,4 +343,24 @@
 			status = "disabled";
 		};
 	};
+
+	otg: usb@13500000 {
+		compatible = "ingenic,x1830-otg", "snps,dwc2";
+		reg = <0x13500000 0x40000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <21>;
+
+		clocks = <&cgu X1830_CLK_OTG>;
+		clock-names = "otg";
+
+		phys = <&otg_phy>;
+		phy-names = "usb2-phy";
+
+		g-rx-fifo-size = <768>;
+		g-np-tx-fifo-size = <256>;
+		g-tx-fifo-size = <256 256 256 256 256 256 256 512>;
+
+		status = "disabled";
+	};
 };
-- 
2.11.0

