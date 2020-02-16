Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3651603F3
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 13:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgBPMLQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 07:11:16 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:47643 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgBPMLQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 07:11:16 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08225468|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.254805-0.0044276-0.740768;DS=CONTINUE|ham_regular_dialog|0.0390826-0.000668241-0.960249;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Gof3ya4_1581855051;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gof3ya4_1581855051)
          by smtp.aliyun-inc.com(10.147.42.22);
          Sun, 16 Feb 2020 20:11:00 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, robh+dt@kernel.org, mark.rutland@arm.com,
        ralf@linux-mips.org, paulburton@kernel.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH] MIPS: X1000: Fix clock of watchdog node.
Date:   Sun, 16 Feb 2020 20:10:28 +0800
Message-Id: <1581855028-25552-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581855028-25552-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581855028-25552-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The devicetree ABI was broken on purpose by commit 6d532143c915
("watchdog: jz4740: Use regmap provided by TCU driver"), and
commit 1d9c30745455 ("watchdog: jz4740: Use WDT clock provided
by TCU driver"). The commit message of the latter explains why the ABI
was broken.

However, the current devicetree files were not updated to the new ABI
described in Documentation/devicetree/bindings/timer/ingenic,tcu.txt,
so the watchdog driver would not probe.

Fix this problem by updating the clock of watchdog node from
"&cgu X1000_CLK_RTCLK" to "&tcu TCU_CLK_WDT" to comply with the new
ABI.

Fixes: 7a16ccd300c2 ("[v8,1/4] MIPS: Ingenic: Add Ingenic X1000
support.").

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/x1000.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 4994c69..147f7d5 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/clock/x1000-cgu.h>
 #include <dt-bindings/dma/x1000-dma.h>
 
@@ -72,7 +73,7 @@
 			compatible = "ingenic,x1000-watchdog", "ingenic,jz4780-watchdog";
 			reg = <0x0 0x10>;
 
-			clocks = <&cgu X1000_CLK_RTCLK>;
+			clocks = <&tcu TCU_CLK_WDT>;
 			clock-names = "wdt";
 		};
 	};
@@ -158,7 +159,6 @@
 	i2c0: i2c-controller@10050000 {
 		compatible = "ingenic,x1000-i2c";
 		reg = <0x10050000 0x1000>;
-
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -173,7 +173,6 @@
 	i2c1: i2c-controller@10051000 {
 		compatible = "ingenic,x1000-i2c";
 		reg = <0x10051000 0x1000>;
-
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -188,7 +187,6 @@
 	i2c2: i2c-controller@10052000 {
 		compatible = "ingenic,x1000-i2c";
 		reg = <0x10052000 0x1000>;
-
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.7.4

