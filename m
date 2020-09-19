Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45E9270DA6
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 13:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgISLkA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 07:40:00 -0400
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:45892 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISLkA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 07:40:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07437983|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.211489-0.000369664-0.788142;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03294;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.IZIG6YS_1600515567;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IZIG6YS_1600515567)
          by smtp.aliyun-inc.com(10.147.40.7);
          Sat, 19 Sep 2020 19:39:55 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 1/1] MIPS: Ingenic: Add CPU nodes for Ingenic SoCs.
Date:   Sat, 19 Sep 2020 19:38:59 +0800
Message-Id: <20200919113859.88566-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200919113859.88566-1-zhouyanjie@wanyeetech.com>
References: <20200919113859.88566-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add 'cpus' node to the jz4725b.dtsi, jz4740.dtsi, jz4770.dtsi,
jz4780.dtsi, x1000.dtsi, and x1830.dtsi files.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/jz4740.dtsi  | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi  | 15 ++++++++++++++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi  | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi   | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi   | 14 ++++++++++++++
 6 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index a8fca560878d..a1f0b71c9223 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -7,6 +7,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4725b";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-mxu1.0";
+			reg = <0>;
+
+			clocks = <&cgu JZ4725B_CLK_CCLK>;
+			clock-names = "cpu";
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 1520585c235c..eee523678ce5 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -7,6 +7,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4740";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-mxu1.0";
+			reg = <0>;
+
+			clocks = <&cgu JZ4740_CLK_CCLK>;
+			clock-names = "cpu";
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index fa11ac950499..018721a9eea9 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
 #include <dt-bindings/clock/jz4770-cgu.h>
 #include <dt-bindings/clock/ingenic,tcu.h>
 
@@ -8,6 +7,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4770";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+			reg = <0>;
+
+			clocks = <&cgu JZ4770_CLK_CCLK>;
+			clock-names = "cpu";
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b7f409a7cf5d..dfb5a7e1bb21 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -8,6 +8,29 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4780";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+			reg = <0>;
+
+			clocks = <&cgu JZ4780_CLK_CPU>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+			reg = <1>;
+
+			clocks = <&cgu JZ4780_CLK_CORE1>;
+			clock-names = "cpu";
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 9de9e7c2d523..1f1f896dd1f7 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -8,6 +8,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,x1000", "ingenic,x1000e";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-fpu1.0-mxu1.1";
+			reg = <0>;
+
+			clocks = <&cgu X1000_CLK_CPU>;
+			clock-names = "cpu";
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
index eb1214481a33..b05dac3ae308 100644
--- a/arch/mips/boot/dts/ingenic/x1830.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
@@ -8,6 +8,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,x1830";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-fpu2.0-mxu2.0";
+			reg = <0>;
+
+			clocks = <&cgu X1830_CLK_CPU>;
+			clock-names = "cpu";
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
-- 
2.11.0

