Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B423B4D05
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jun 2021 08:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFZGVS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Jun 2021 02:21:18 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:52807 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhFZGVP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Jun 2021 02:21:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1503672|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0113689-0.000133307-0.988498;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KYGAXY7_1624688322;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KYGAXY7_1624688322)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 26 Jun 2021 14:18:50 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v4 3/5] MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
Date:   Sat, 26 Jun 2021 14:18:39 +0800
Message-Id: <1624688321-69131-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add MAC syscon nodes for X1000 SoC and X1830 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.

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

