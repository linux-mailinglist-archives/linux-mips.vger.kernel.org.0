Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB96E33EDB2
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 10:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhCQJ6m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 05:58:42 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:48793 "EHLO
        out28-98.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhCQJ6Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 05:58:24 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07651106|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.120746-0.00035721-0.878897;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.JmJVfKa_1615975087;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JmJVfKa_1615975087)
          by smtp.aliyun-inc.com(10.147.40.200);
          Wed, 17 Mar 2021 17:58:20 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v3 03/10] pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
Date:   Wed, 17 Mar 2021 17:57:57 +0800
Message-Id: <1615975084-68203-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adjust the sequence of X1830's SSI related codes to make it consistent
with other Ingenic SoCs.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Add Paul Cercueil's Reviewed-by.

 drivers/pinctrl/pinctrl-ingenic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1d43b98..7179fd8 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1473,16 +1473,16 @@ static int x1830_ssi0_gpc_pins[] = { 0x4d, };
 static int x1830_ssi0_ce0_pins[] = { 0x50, };
 static int x1830_ssi0_ce1_pins[] = { 0x4e, };
 static int x1830_ssi1_dt_c_pins[] = { 0x53, };
-static int x1830_ssi1_dr_c_pins[] = { 0x54, };
-static int x1830_ssi1_clk_c_pins[] = { 0x57, };
-static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
-static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
-static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
 static int x1830_ssi1_dt_d_pins[] = { 0x62, };
+static int x1830_ssi1_dr_c_pins[] = { 0x54, };
 static int x1830_ssi1_dr_d_pins[] = { 0x63, };
+static int x1830_ssi1_clk_c_pins[] = { 0x57, };
 static int x1830_ssi1_clk_d_pins[] = { 0x66, };
+static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
 static int x1830_ssi1_gpc_d_pins[] = { 0x64, };
+static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
 static int x1830_ssi1_ce0_d_pins[] = { 0x67, };
+static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
 static int x1830_ssi1_ce1_d_pins[] = { 0x65, };
 static int x1830_mmc0_1bit_pins[] = { 0x24, 0x25, 0x20, };
 static int x1830_mmc0_4bit_pins[] = { 0x21, 0x22, 0x23, };
-- 
2.7.4

