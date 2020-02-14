Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0C415F1D6
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 19:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390848AbgBNSDw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 13:03:52 -0500
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:41707 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390123AbgBNSDv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 13:03:51 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07452875|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.208385-0.00957184-0.782043;DS=CONTINUE|ham_system_inform|0.028472-0.000402336-0.971126;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07440;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.GoAKeCh_1581703384;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoAKeCh_1581703384)
          by smtp.aliyun-inc.com(10.147.42.253);
          Sat, 15 Feb 2020 02:03:29 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Subject: [PATCH v4 4/6] MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
Date:   Sat, 15 Feb 2020 02:02:38 +0800
Message-Id: <1581703360-112557-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
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
    
    v3->v4:
    Rebase on top of kernel 5.6-rc1.

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
index 4994c69..376df1b 100644
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

