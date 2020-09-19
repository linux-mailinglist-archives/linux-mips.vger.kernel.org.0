Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4214C270DEE
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgISMpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 08:45:22 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:43476 "EHLO
        out28-197.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgISMpW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 08:45:22 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09383579|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0499707-0.000457718-0.949572;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16368;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.IZJIYjg_1600519505;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IZJIYjg_1600519505)
          by smtp.aliyun-inc.com(10.147.42.198);
          Sat, 19 Sep 2020 20:45:17 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     paulburton@kernel.org, tsbogend@alpha.franken.de,
        paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, rppt@kernel.org,
        Sergey.Semin@baikalelectronics.ru,
        Alexey.Malahov@baikalelectronics.ru, akpm@linux-foundation.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 1/2] MIPS: X1000E: Add X1000E system type.
Date:   Sat, 19 Sep 2020 20:44:36 +0800
Message-Id: <20200919124437.89576-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200919124437.89576-1-zhouyanjie@wanyeetech.com>
References: <20200919124437.89576-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add X1000 system type for cat /proc/cpuinfo to give out X1000E.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/generic/board-ingenic.c | 3 +++
 arch/mips/include/asm/bootinfo.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index 0d7de8f9713d..c634ee35a6cd 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -23,6 +23,8 @@ static __init char *ingenic_get_system_type(unsigned long machtype)
 	switch (machtype) {
 	case MACH_INGENIC_X1830:
 		return "X1830";
+	case MACH_INGENIC_X1000E:
+		return "X1000E";
 	case MACH_INGENIC_X1000:
 		return "X1000";
 	case MACH_INGENIC_JZ4780:
@@ -58,6 +60,7 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4770", .data = (void *)MACH_INGENIC_JZ4770 },
 	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
 	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
+	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
 	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
 	{}
 };
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 147c9327ce04..b6fdfbec1f07 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -79,6 +79,7 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4775,
 	MACH_INGENIC_JZ4780,
 	MACH_INGENIC_X1000,
+	MACH_INGENIC_X1000E,
 	MACH_INGENIC_X1830,
 	MACH_INGENIC_X2000,
 };
-- 
2.11.0

