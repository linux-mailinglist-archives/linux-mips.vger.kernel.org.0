Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7A827310A
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 19:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgIURqM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 13:46:12 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:50341 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgIURqK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 13:46:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07512233|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.331912-0.000593707-0.667494;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03267;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.IaKe7sd_1600710348;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IaKe7sd_1600710348)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 22 Sep 2020 01:46:05 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        paulburton@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, Sergey.Semin@baikalelectronics.ru,
        akpm@linux-foundation.org, rppt@kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v2 1/2] MIPS: Ingenic: Add system type for new Ingenic SoCs.
Date:   Tue, 22 Sep 2020 01:45:21 +0800
Message-Id: <20200921174522.33866-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200921174522.33866-1-zhouyanjie@wanyeetech.com>
References: <20200921174522.33866-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add JZ4775, X1000E, X2000, and X2000E system type for cat /proc/cpuinfo
to give out JZ4775, X1000E, X2000 and X2000E.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    1.Add system type for JZ4775, X2000, and X2000E.
    2.Add Paul Cercueil's Reviewed-by.

 arch/mips/generic/board-ingenic.c | 12 ++++++++++++
 arch/mips/include/asm/bootinfo.h  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index 0d7de8f9713d..0cec0bea13d6 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -21,12 +21,20 @@
 static __init char *ingenic_get_system_type(unsigned long machtype)
 {
 	switch (machtype) {
+	case MACH_INGENIC_X2000E:
+		return "X2000E";
+	case MACH_INGENIC_X2000:
+		return "X2000";
 	case MACH_INGENIC_X1830:
 		return "X1830";
+	case MACH_INGENIC_X1000E:
+		return "X1000E";
 	case MACH_INGENIC_X1000:
 		return "X1000";
 	case MACH_INGENIC_JZ4780:
 		return "JZ4780";
+	case MACH_INGENIC_JZ4775:
+		return "JZ4775";
 	case MACH_INGENIC_JZ4770:
 		return "JZ4770";
 	case MACH_INGENIC_JZ4725B:
@@ -56,9 +64,13 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740", .data = (void *)MACH_INGENIC_JZ4740 },
 	{ .compatible = "ingenic,jz4725b", .data = (void *)MACH_INGENIC_JZ4725B },
 	{ .compatible = "ingenic,jz4770", .data = (void *)MACH_INGENIC_JZ4770 },
+	{ .compatible = "ingenic,jz4775", .data = (void *)MACH_INGENIC_JZ4775 },
 	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
 	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
+	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
 	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
+	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
+	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },
 	{}
 };
 
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 147c9327ce04..6dd173a22aeb 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -79,8 +79,10 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4775,
 	MACH_INGENIC_JZ4780,
 	MACH_INGENIC_X1000,
+	MACH_INGENIC_X1000E,
 	MACH_INGENIC_X1830,
 	MACH_INGENIC_X2000,
+	MACH_INGENIC_X2000E,
 };
 
 extern char *system_type;
-- 
2.11.0

