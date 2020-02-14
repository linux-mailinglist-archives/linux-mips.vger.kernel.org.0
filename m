Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA4C15F1D9
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 19:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389272AbgBNSEH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 13:04:07 -0500
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:43381 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388680AbgBNSDl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 13:03:41 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2733001|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0763182-0.00649236-0.917189;DS=CONTINUE|ham_system_inform|0.00986228-0.000458731-0.989679;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03297;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.GoAKeCh_1581703384;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoAKeCh_1581703384)
          by smtp.aliyun-inc.com(10.147.42.253);
          Sat, 15 Feb 2020 02:03:33 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Subject: [PATCH v4 6/6] MIPS: CI20: Update defconfig to support SMP.
Date:   Sat, 15 Feb 2020 02:02:40 +0800
Message-Id: <1581703360-112557-8-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add "CONFIG_SMP=y" and "CONFIG_NR_CPUS=2" to support SMP.

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

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be41df2..3aadb2e 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -1,3 +1,5 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
-- 
2.7.4

