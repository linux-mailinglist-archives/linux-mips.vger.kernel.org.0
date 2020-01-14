Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 885C513B053
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 18:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgANREy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 12:04:54 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:44572 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgANREx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jan 2020 12:04:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0744315|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.348141-0.00561474-0.646245;DS=CONTINUE|ham_system_inform|0.0586062-0.000217884-0.941176;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.Gc2hy8j_1579021451;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gc2hy8j_1579021451)
          by smtp.aliyun-inc.com(10.147.41.120);
          Wed, 15 Jan 2020 01:04:40 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com
Subject: [PATCH 1/2] MIPS: Ingenic: Add missing nodes for X1000 and CU1000-Neo.
Date:   Wed, 15 Jan 2020 01:03:47 +0800
Message-Id: <1579021428-43535-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579021428-43535-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579021428-43535-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add I2C0/I2C1/I2C2 nodes for X1000 and add I2C0, ADS7830,
MSC1, AP6212A, wlan_pwrseq nodes for CU1000-Neo.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 71 +++++++++++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 45 ++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index b0733da..03abd94 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -4,6 +4,7 @@
 #include "x1000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/ingenic,tcu.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	compatible = "yna,cu1000-neo", "ingenic,x1000";
@@ -21,6 +22,22 @@
 		device_type = "memory";
 		reg = <0x0 0x04000000>;
 	};
+
+	wlan_pwrseq: msc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		clocks = <&lpoclk>;
+		clock-names = "ext_clock";
+
+		reset-gpios = <&gpc 17 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+
+		lpoclk: ap6212a {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
 };
 
 &exclk {
@@ -36,6 +53,20 @@
 	ingenic,pwm-channels-mask = <0xfa>;
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_i2c0>;
+
+	ads7830@48 {
+		compatible = "ti,ads7830";
+		reg = <0x48>;
+	};
+};
+
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_uart2>;
@@ -78,7 +109,41 @@
 	status = "okay";
 };
 
+&msc1 {
+	bus-width = <4>;
+	max-frequency = <50000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_msc1>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	non-removable;
+
+	mmc-pwrseq = <&wlan_pwrseq>;
+
+	status = "okay";
+
+	ap6212a: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpc>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "host-wake";
+
+		brcm,drive-strength = <10>;
+	};
+};
+
 &pinctrl {
+	pins_i2c0: i2c0 {
+		function = "i2c0";
+		groups = "i2c0-data";
+		bias-disable;
+	};
+
 	pins_uart2: uart2 {
 		function = "uart2";
 		groups = "uart2-data-d";
@@ -96,4 +161,10 @@
 		groups = "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
 		bias-disable;
 	};
+
+	pins_msc1: msc1 {
+		function = "mmc1";
+		groups = "mmc1-1bit", "mmc1-4bit";
+		bias-disable;
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index ea54263..376df1b 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -169,6 +169,51 @@
 		};
 	};
 
+	i2c0: i2c-controller@10050000 {
+		compatible = "ingenic,x1000-i2c";
+		reg = <0x10050000 0x1000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <60>;
+
+		clocks = <&cgu X1000_CLK_I2C0>;
+
+		status = "disabled";
+	};
+
+	i2c1: i2c-controller@10051000 {
+		compatible = "ingenic,x1000-i2c";
+		reg = <0x10051000 0x1000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <59>;
+
+		clocks = <&cgu X1000_CLK_I2C1>;
+
+		status = "disabled";
+	};
+
+	i2c2: i2c-controller@10052000 {
+		compatible = "ingenic,x1000-i2c";
+		reg = <0x10052000 0x1000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <58>;
+
+		clocks = <&cgu X1000_CLK_I2C2>;
+
+		status = "disabled";
+	};
+
 	uart0: serial@10030000 {
 		compatible = "ingenic,x1000-uart";
 		reg = <0x10030000 0x100>;
-- 
2.7.4

