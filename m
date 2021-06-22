Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BB33AFE06
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 09:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhFVHj6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 03:39:58 -0400
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:55335 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhFVHj6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 03:39:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1416569|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0113689-0.000133307-0.988498;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KW7pc9x_1624347446;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KW7pc9x_1624347446)
          by smtp.aliyun-inc.com(10.147.40.26);
          Tue, 22 Jun 2021 15:37:39 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH 2/4] MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
Date:   Tue, 22 Jun 2021 15:37:23 +0800
Message-Id: <1624347445-88070-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add MAC syscon nodes for X1000 SoC and X1830 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/x1000.dtsi | 7 +++++++
 arch/mips/boot/dts/ingenic/x1830.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index aac9ded..dec7909 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -80,6 +80,11 @@
 
 			status = "disabled";
 		};
+
+		mac_phy_ctrl: mac-phy-ctrl@e8 {
+			compatible = "syscon";
+			reg = <0xe8 0x4>;
+		};
 	};
 
 	ost: timer@12000000 {
@@ -347,6 +352,8 @@
 		clocks = <&cgu X1000_CLK_MAC>;
 		clock-names = "stmmaceth";
 
+		mode-reg = <&mac_phy_ctrl>;
+
 		status = "disabled";
 
 		mdio: mdio {
diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
index 59ca3a8..215257f 100644
--- a/arch/mips/boot/dts/ingenic/x1830.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
@@ -73,6 +73,11 @@
 
 			status = "disabled";
 		};
+
+		mac_phy_ctrl: mac-phy-ctrl@e8 {
+			compatible = "syscon";
+			reg = <0xe8 0x4>;
+		};
 	};
 
 	ost: timer@12000000 {
@@ -336,6 +341,8 @@
 		clocks = <&cgu X1830_CLK_MAC>;
 		clock-names = "stmmaceth";
 
+		mode-reg = <&mac_phy_ctrl>;
+
 		status = "disabled";
 
 		mdio: mdio {
-- 
2.7.4

