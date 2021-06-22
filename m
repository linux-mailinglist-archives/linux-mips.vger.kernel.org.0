Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA8A3B09A5
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 17:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbhFVP6T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 11:58:19 -0400
Received: from out29-123.mail.aliyun.com ([115.124.29.123]:36614 "EHLO
        out29-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbhFVP6S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 11:58:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07751058|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.133883-0.00167999-0.864438;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KWKjI6A_1624377348;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KWKjI6A_1624377348)
          by smtp.aliyun-inc.com(10.147.41.178);
          Tue, 22 Jun 2021 23:55:59 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v2 3/3] MIPS: CI20: Add second percpu timer for SMP.
Date:   Tue, 22 Jun 2021 23:55:38 +0800
Message-Id: <1624377338-75384-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624377338-75384-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624377338-75384-1-git-send-email-zhouyanjie@wanyeetech.com>
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
    v1->v2:
    New patch.

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

