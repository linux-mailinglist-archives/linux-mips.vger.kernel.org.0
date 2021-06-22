Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C663AFE0C
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 09:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFVHkD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 03:40:03 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:40326 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVHkB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 03:40:01 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07533422|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.177609-0.00199329-0.820397;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KW7pc9x_1624347446;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KW7pc9x_1624347446)
          by smtp.aliyun-inc.com(10.147.40.26);
          Tue, 22 Jun 2021 15:37:42 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH 4/4] MIPS: CI20: Reduce MSC0 frequency and add second percpu timer for SMP.
Date:   Tue, 22 Jun 2021 15:37:25 +0800
Message-Id: <1624347445-88070-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.On the hardware of CI20 v1, when the MSC0 clock is 50MHz, there is
  a certain probability that the communication with the SD card will
  be abnormal, and the file system will be damaged in severe cases.
  Limiting the maximum MSC0 clock frequency to 25MHz can solve this
  problem.
2.Add a new TCU channel as the percpu timer of core1, this is to
  prepare for the subsequent SMP support. The newly added channel
  will not adversely affect the current single-core state.
3.Adjust the position of TCU node to make it consistent with the
  order in jz4780.dtsi file.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 8877c62..58123e0 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -118,11 +118,22 @@
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
 
 	bus-width = <4>;
-	max-frequency = <50000000>;
+	max-frequency = <25000000>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_mmc0>;
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

