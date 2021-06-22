Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892B93AFE08
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 09:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhFVHj7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 03:39:59 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:48237 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhFVHj6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 03:39:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1499681|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0474579-0.00115018-0.951392;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KW7pc9x_1624347446;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KW7pc9x_1624347446)
          by smtp.aliyun-inc.com(10.147.40.26);
          Tue, 22 Jun 2021 15:37:40 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH 3/4] MIPS: GCW0: Adjust pinctrl related code in device tree.
Date:   Tue, 22 Jun 2021 15:37:24 +0800
Message-Id: <1624347445-88070-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change the "lcd-24bit" in the pinctrl groups to "lcd-8bit",
"lcd-16bit", "lcd-18bit", "lcd-24bit", since the pinctrl
driver has done the necessary splitting of the lcd group,
and it is convenient to further streamline the lcd-24bit
group in the subsequent pinctrl driver.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index f4c04f2..dec3ba6f 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -393,7 +393,7 @@
 &pinctrl {
 	pins_lcd: lcd {
 		function = "lcd";
-		groups = "lcd-24bit";
+		groups = "lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit";
 	};
 
 	pins_uart2: uart2 {
-- 
2.7.4

