Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8F83AFE03
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 09:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFVHj5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 03:39:57 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:40274 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhFVHj5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 03:39:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1999582|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.163213-0.00915802-0.827629;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KW7pc9x_1624347446;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KW7pc9x_1624347446)
          by smtp.aliyun-inc.com(10.147.40.26);
          Tue, 22 Jun 2021 15:37:38 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH 1/4] MIPS: X1830: Respect cell count of common properties.
Date:   Tue, 22 Jun 2021 15:37:22 +0800
Message-Id: <1624347445-88070-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If N fields of X cells should be provided, then that's what the
devicetree should represent, instead of having one single field of
(N * X) cells.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/x1830.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
index b21c930..59ca3a8 100644
--- a/arch/mips/boot/dts/ingenic/x1830.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
@@ -97,9 +97,9 @@
 
 		#clock-cells = <1>;
 
-		clocks = <&cgu X1830_CLK_RTCLK
-			  &cgu X1830_CLK_EXCLK
-			  &cgu X1830_CLK_PCLK>;
+		clocks = <&cgu X1830_CLK_RTCLK>,
+			 <&cgu X1830_CLK_EXCLK>,
+			 <&cgu X1830_CLK_PCLK>;
 		clock-names = "rtc", "ext", "pclk";
 
 		interrupt-controller;
@@ -274,8 +274,7 @@
 
 	pdma: dma-controller@13420000 {
 		compatible = "ingenic,x1830-dma";
-		reg = <0x13420000 0x400
-			   0x13421000 0x40>;
+		reg = <0x13420000 0x400>, <0x13421000 0x40>;
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
-- 
2.7.4

