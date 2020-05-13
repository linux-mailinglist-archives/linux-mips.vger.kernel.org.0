Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44351D1DE9
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 20:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390325AbgEMSrI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 14:47:08 -0400
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:43164 "EHLO
        out28-100.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390202AbgEMSrH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 14:47:07 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07453629|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0280056-0.000386409-0.971608;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03299;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.HY8LAU0_1589395602;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HY8LAU0_1589395602)
          by smtp.aliyun-inc.com(10.147.44.118);
          Thu, 14 May 2020 02:47:02 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, tglx@linutronix.de,
        robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, paul@crapouillou.net, krzk@kernel.org,
        hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v7 5/6] MIPS: Ingenic: Add 'cpus' node for Ingenic SoCs.
Date:   Thu, 14 May 2020 02:46:16 +0800
Message-Id: <1589395578-87441-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589395578-87441-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1589395578-87441-1-git-send-email-zhouyanjie@wanyeetech.com>
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
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.
    
    v6->v7:
    Update compatible strings.

 arch/mips/boot/dts/ingenic/jz4740.dtsi | 14 ++++++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 15 ++++++++++++++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi  | 14 ++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index a3301ba..1f2f896 100644
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
index 0bfb9ed..12c7101 100644
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
index bb89653..03aeeff 100644
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
index 147f7d5..2205e1b 100644
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
-- 
2.7.4

