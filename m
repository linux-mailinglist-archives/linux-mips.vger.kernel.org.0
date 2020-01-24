Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35A21484E1
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 13:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbgAXMGQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 07:06:16 -0500
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:43952 "EHLO
        out28-121.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388238AbgAXMGP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jan 2020 07:06:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08744468|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.258727-0.0162396-0.725034;DS=CONTINUE|ham_system_inform|0.00681365-0.000264499-0.992922;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03302;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.Gh-0wLC_1579867533;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gh-0wLC_1579867533)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 24 Jan 2020 20:06:08 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
        shawnguo@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, miquel.raynal@bootlin.com,
        keescook@chromium.org, ebiederm@xmission.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        chenhc@lemote.com, jiaxun.yang@flygoat.com, paul@boddie.org.uk,
        hns@goldelico.com, mips-creator-ci20-dev@googlegroups.com,
        rick.tyliu@ingenic.com
Subject: [PATCH v3 5/6] MIPS: CI20: Modify DTS to support high resolution timer for SMP.
Date:   Fri, 24 Jan 2020 20:05:07 +0800
Message-Id: <1579867508-81499-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modify DTS, change tcu channel from 2 to 3, channel #0 and #1 for
per core local timer, #2 for clocksource.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.

 arch/mips/boot/dts/ingenic/ci20.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 37b9316..98c4c42 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -456,6 +456,13 @@
 
 &tcu {
 	/* 3 MHz for the system timer and clocksource */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
-	assigned-clock-rates = <3000000>, <3000000>;
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+					  <&tcu TCU_CLK_TIMER2>;
+	assigned-clock-rates = <3000000>, <3000000>, <750000>;
+
+	/*
+	 * Use channel #0 and #1 for the per core system timer,
+	 * and use channel #2 for the clocksource.
+	 */
+	ingenic,pwm-channels-mask = <0xF8>;
 };
-- 
2.7.4

