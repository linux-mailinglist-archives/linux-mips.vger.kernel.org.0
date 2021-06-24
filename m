Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F157B3B323E
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 17:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhFXPJK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 11:09:10 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:57717 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhFXPJH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Jun 2021 11:09:07 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07750118|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.133883-0.00167999-0.864438;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KXPsfY8_1624547190;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KXPsfY8_1624547190)
          by smtp.aliyun-inc.com(10.147.40.200);
          Thu, 24 Jun 2021 23:06:44 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v3 4/4] MIPS: CI20: Add second percpu timer for SMP.
Date:   Thu, 24 Jun 2021 23:06:29 +0800
Message-Id: <1624547189-61079-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624547189-61079-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624547189-61079-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add a new TCU channel as the percpu timer of core1, this is to
  prepare for the subsequent SMP support. The newly added channel
  will not adversely affect the current single-core state.
2.Adjust the position of TCU node to make it consistent with the
  order in jz4780.dtsi file.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    No change.

 arch/mips/boot/dts/ingenic/ci20.dts | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 8877c62..70005cc 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -118,6 +118,17 @@
 	assigned-clock-rates = <48000000>;
 };
 
+&tcu {
+	/*
+	 * 750 kHz for the system timers and 3 MHz for the clocksources,
+	 * use channel #0 and #1 for the per cpu system timers, and use
+	 * channel #2 for the clocksource.
+	 */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+					  <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_OST>;
+	assigned-clock-rates = <750000>, <750000>, <3000000>, <3000000>;
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -522,13 +533,3 @@
 		bias-disable;
 	};
 };
-
-&tcu {
-	/*
-	 * 750 kHz for the system timer and 3 MHz for the clocksource,
-	 * use channel #0 for the system timer, #1 for the clocksource.
-	 */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
-					  <&tcu TCU_CLK_OST>;
-	assigned-clock-rates = <750000>, <3000000>, <3000000>;
-};
-- 
2.7.4

