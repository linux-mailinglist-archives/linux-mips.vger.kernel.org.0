Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70401D1DE4
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 20:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390298AbgEMSrD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 14:47:03 -0400
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:52659 "EHLO
        out28-218.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390202AbgEMSrC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 14:47:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08427303|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.016342-0.00062254-0.983035;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03295;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.HY8LAU0_1589395602;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HY8LAU0_1589395602)
          by smtp.aliyun-inc.com(10.147.44.118);
          Thu, 14 May 2020 02:46:57 +0800
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
Subject: [PATCH v7 2/6] MIPS: CI20: Modify DTS to support high resolution timer for SMP.
Date:   Thu, 14 May 2020 02:46:13 +0800
Message-Id: <1589395578-87441-4-git-send-email-zhouyanjie@wanyeetech.com>
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
    
    v3->v4:
    Rebase on top of kernel 5.6-rc1.
    
    v4->v5:
    Move [5/6] in v4 to this patch, to ensure that we can
    git-bisect without ending up with a broken kernel.
    
    v5->v6:
    No change.
    
    v6->v7:
    Remove unnecessary "ingenic,pwm-channels-mask".

 arch/mips/boot/dts/ingenic/ci20.dts | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index db0ca25..06e3186 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -486,7 +486,12 @@
 };
 
 &tcu {
-	/* 3 MHz for the system timer and clocksource */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
-	assigned-clock-rates = <3000000>, <3000000>;
+	/*
+	 * 750 kHz for the system timers and clocksource,
+	 * use channel #0 and #1 for the per cpu system timers,
+	 * and use channel #2 for the clocksource.
+	 */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+					  <&tcu TCU_CLK_TIMER2>;
+	assigned-clock-rates = <750000>, <750000>, <750000>;
 };
-- 
2.7.4

