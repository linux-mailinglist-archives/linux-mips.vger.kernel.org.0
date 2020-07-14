Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC23321E78B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 07:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGNFdX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 01:33:23 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:55866 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgGNFdO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 01:33:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436284|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0113441-8.72379e-05-0.988569;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03299;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1QwJ79_1594704779;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1QwJ79_1594704779)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 14 Jul 2020 13:33:09 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, paulburton@kernel.org,
        paul@crapouillou.net, ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 4/5] MIPS: Ingenic: Fix bugs and add missing LED node for X1000.
Date:   Tue, 14 Jul 2020 13:32:28 +0800
Message-Id: <20200714053229.33195-5-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
References: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.The CU1000-Neo board actually uses X1000E instead of X1000,
  so the wrongly written "ingenic,x1000" in compatible should
  be changed to "ingenic,x1000e".
2.Adjust the order of nodes according to the corresponding
  address value.
3.Drop unnecessary node in "wlan_pwrseq".
4.Add the leds node to "cu1000-neo.dts".

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v4:
    New patch.

 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 114 +++++++++++++--------------
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 126 +++++++++++++++---------------
 2 files changed, 118 insertions(+), 122 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index 03abd94acd84..22a1066d637b 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -7,8 +7,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	compatible = "yna,cu1000-neo", "ingenic,x1000";
-	model = "YSH & ATIL General Board CU Neo";
+	compatible = "yna,cu1000-neo", "ingenic,x1000e";
+	model = "YSH & ATIL General Board CU1000-Neo";
 
 	aliases {
 		serial2 = &uart2;
@@ -23,20 +23,19 @@
 		reg = <0x0 0x04000000>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		led-0 {
+			gpios = <&gpb 21 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
+		};
+	};
+
 	wlan_pwrseq: msc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 
-		clocks = <&lpoclk>;
-		clock-names = "ext_clock";
-
 		reset-gpios = <&gpc 17 GPIO_ACTIVE_LOW>;
 		post-power-on-delay-ms = <200>;
-
-		lpoclk: ap6212a {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
 	};
 };
 
@@ -53,6 +52,13 @@
 	ingenic,pwm-channels-mask = <0xfa>;
 };
 
+&uart2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -61,43 +67,15 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_i2c0>;
 
-	ads7830@48 {
+	ads7830: adc@48 {
 		compatible = "ti,ads7830";
 		reg = <0x48>;
 	};
 };
 
-&uart2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pins_uart2>;
-
-	status = "okay";
-};
-
-&mac {
-	phy-mode = "rmii";
-	phy-handle = <&lan8720a>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pins_mac>;
-
-	snps,reset-gpio = <&gpc 23 GPIO_ACTIVE_LOW>; /* PC23 */
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 30000>;
-
-	status = "okay";
-};
-
-&mdio {
+&msc0 {
 	status = "okay";
 
-	lan8720a: ethernet-phy@0 {
-		compatible = "ethernet-phy-id0007.c0f0", "ethernet-phy-ieee802.3-c22";
-		reg = <0>;
-	};
-};
-
-&msc0 {
 	bus-width = <8>;
 	max-frequency = <50000000>;
 
@@ -105,26 +83,23 @@
 	pinctrl-0 = <&pins_msc0>;
 
 	non-removable;
-
-	status = "okay";
 };
 
 &msc1 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
 	bus-width = <4>;
 	max-frequency = <50000000>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_msc1>;
 
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	non-removable;
 
 	mmc-pwrseq = <&wlan_pwrseq>;
 
-	status = "okay";
-
 	ap6212a: wifi@1 {
 		compatible = "brcm,bcm4329-fmac";
 		reg = <1>;
@@ -137,23 +112,40 @@
 	};
 };
 
-&pinctrl {
-	pins_i2c0: i2c0 {
-		function = "i2c0";
-		groups = "i2c0-data";
-		bias-disable;
+&mac {
+	status = "okay";
+
+	phy-mode = "rmii";
+	phy-handle = <&lan8720a>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_mac>;
+
+	snps,reset-gpio = <&gpc 23 GPIO_ACTIVE_LOW>; /* PC23 */
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 30000>;
+};
+
+&mdio {
+	status = "okay";
+
+	lan8720a: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.c0f0", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
 	};
+};
 
+&pinctrl {
 	pins_uart2: uart2 {
 		function = "uart2";
 		groups = "uart2-data-d";
-		bias-disable;
+		bias-pull-up;
 	};
 
-	pins_mac: mac {
-		function = "mac";
-		groups = "mac";
-		bias-disable;
+	pins_i2c0: i2c0 {
+		function = "i2c0";
+		groups = "i2c0-data";
+		bias-pull-up;
 	};
 
 	pins_msc0: msc0 {
@@ -167,4 +159,10 @@
 		groups = "mmc1-1bit", "mmc1-4bit";
 		bias-disable;
 	};
+
+	pins_mac: mac {
+		function = "mac";
+		groups = "mac";
+		bias-disable;
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 59a63a0985a8..9de9e7c2d523 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -48,9 +48,7 @@
 	};
 
 	tcu: timer@10002000 {
-		compatible = "ingenic,x1000-tcu",
-				 "ingenic,jz4770-tcu",
-				 "simple-mfd";
+		compatible = "ingenic,x1000-tcu", "simple-mfd";
 		reg = <0x10002000 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -156,48 +154,6 @@
 		};
 	};
 
-	i2c0: i2c-controller@10050000 {
-		compatible = "ingenic,x1000-i2c";
-		reg = <0x10050000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <60>;
-
-		clocks = <&cgu X1000_CLK_I2C0>;
-
-		status = "disabled";
-	};
-
-	i2c1: i2c-controller@10051000 {
-		compatible = "ingenic,x1000-i2c";
-		reg = <0x10051000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <59>;
-
-		clocks = <&cgu X1000_CLK_I2C1>;
-
-		status = "disabled";
-	};
-
-	i2c2: i2c-controller@10052000 {
-		compatible = "ingenic,x1000-i2c";
-		reg = <0x10052000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <58>;
-
-		clocks = <&cgu X1000_CLK_I2C2>;
-
-		status = "disabled";
-	};
-
 	uart0: serial@10030000 {
 		compatible = "ingenic,x1000-uart";
 		reg = <0x10030000 0x100>;
@@ -237,37 +193,57 @@
 		status = "disabled";
 	};
 
-	pdma: dma-controller@13420000 {
-		compatible = "ingenic,x1000-dma";
-		reg = <0x13420000 0x400>, <0x13421000 0x40>;
-		#dma-cells = <2>;
+	i2c0: i2c-controller@10050000 {
+		compatible = "ingenic,x1000-i2c";
+		reg = <0x10050000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		interrupt-parent = <&intc>;
-		interrupts = <10>;
+		interrupts = <60>;
 
-		clocks = <&cgu X1000_CLK_PDMA>;
+		clocks = <&cgu X1000_CLK_I2C0>;
+
+		status = "disabled";
 	};
 
-	mac: ethernet@134b0000 {
-		compatible = "ingenic,x1000-mac", "snps,dwmac";
-		reg = <0x134b0000 0x2000>;
+	i2c1: i2c-controller@10051000 {
+		compatible = "ingenic,x1000-i2c";
+		reg = <0x10051000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		interrupt-parent = <&intc>;
-		interrupts = <55>;
-		interrupt-names = "macirq";
+		interrupts = <59>;
 
-		clocks = <&cgu X1000_CLK_MAC>;
-		clock-names = "stmmaceth";
+		clocks = <&cgu X1000_CLK_I2C1>;
 
 		status = "disabled";
+	};
 
-		mdio: mdio {
-			compatible = "snps,dwmac-mdio";
-			#address-cells = <1>;
-			#size-cells = <0>;
+	i2c2: i2c-controller@10052000 {
+		compatible = "ingenic,x1000-i2c";
+		reg = <0x10052000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-			status = "disabled";
-		};
+		interrupt-parent = <&intc>;
+		interrupts = <58>;
+
+		clocks = <&cgu X1000_CLK_I2C2>;
+
+		status = "disabled";
+	};
+
+	pdma: dma-controller@13420000 {
+		compatible = "ingenic,x1000-dma";
+		reg = <0x13420000 0x400>, <0x13421000 0x40>;
+		#dma-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <10>;
+
+		clocks = <&cgu X1000_CLK_PDMA>;
 	};
 
 	msc0: mmc@13450000 {
@@ -311,4 +287,26 @@
 
 		status = "disabled";
 	};
+
+	mac: ethernet@134b0000 {
+		compatible = "ingenic,x1000-mac", "snps,dwmac";
+		reg = <0x134b0000 0x2000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <55>;
+		interrupt-names = "macirq";
+
+		clocks = <&cgu X1000_CLK_MAC>;
+		clock-names = "stmmaceth";
+
+		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+	};
 };
-- 
2.11.0

