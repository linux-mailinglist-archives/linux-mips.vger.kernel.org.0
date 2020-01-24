Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAE81484DD
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 13:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388311AbgAXMGO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 07:06:14 -0500
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:48694 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388165AbgAXMGN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jan 2020 07:06:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07453084|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.19843-0.0103649-0.791205;DS=CONTINUE|ham_system_inform|0.028472-0.000402336-0.971126;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03297;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.Gh-0wLC_1579867533;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gh-0wLC_1579867533)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 24 Jan 2020 20:06:06 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
        shawnguo@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, miquel.raynal@bootlin.com,
        keescook@chromium.org, ebiederm@xmission.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        chenhc@lemote.com, jiaxun.yang@flygoat.com, paul@boddie.org.uk,
        hns@goldelico.com, mips-creator-ci20-dev@googlegroups.com,
        rick.tyliu@ingenic.com
Subject: [PATCH v3 4/6] MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
Date:   Fri, 24 Jan 2020 20:05:06 +0800
Message-Id: <1579867508-81499-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add 'cpus' node to the jz4740.dtsi, jz4770.dtsi, jz4780.dtsi
and x1000.dtsi files.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.

 arch/mips/boot/dts/ingenic/jz4740.dtsi | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 15 ++++++++++++++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi  | 14 ++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 5accda2..9627d95 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -6,6 +6,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4740";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
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
index 0bfb9ed..1b8114d 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
 #include <dt-bindings/clock/jz4770-cgu.h>
 
 / {
@@ -7,6 +6,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4770";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
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
index f928329..93a0604 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -7,6 +7,29 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4780";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
+			reg = <0>;
+
+			clocks = <&cgu JZ4780_CLK_CPU>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
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
index 61061a4..ea54263 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -7,6 +7,20 @@
 	#size-cells = <1>;
 	compatible = "ingenic,x1000", "ingenic,x1000e";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst";
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
-- 
2.7.4

