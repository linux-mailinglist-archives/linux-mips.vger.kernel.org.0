Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717203CA36E
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 18:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhGORAM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 13:00:12 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:49928 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhGORAL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 13:00:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07441034|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.153769-0.00185027-0.844381;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.KiFz-tR_1626368228;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KiFz-tR_1626368228)
          by smtp.aliyun-inc.com(10.147.41.231);
          Fri, 16 Jul 2021 00:57:15 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     paul@crapouillou.net, paulburton@kernel.org,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        maoxiaochuan@loongson.cn, f.fainelli@gmail.com, git@xen0n.name,
        chenhuacai@kernel.org, cand@gmx.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v2] MIPS: Ingenic: Add system type for new Ingenic SoCs.
Date:   Fri, 16 Jul 2021 00:57:07 +0800
Message-Id: <1626368227-119499-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add JZ4730, JZ4750, JZ4755, JZ4760, JZ4760B, X2000H, and X2100 system
type for cat /proc/cpuinfo to give out JZ4730, JZ4750, JZ4755, JZ4760,
JZ4760B, X2000H, and X2100.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    1.Add system type for JZ4750 and JZ4755 as Paul Cercueil's suggestion.
    2.Add Paul Cercueil's Reviewed-by.

 arch/mips/generic/board-ingenic.c | 21 +++++++++++++++++++++
 arch/mips/include/asm/bootinfo.h  |  3 +++
 arch/mips/include/asm/cpu.h       |  4 ++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index dd855b7..4774636 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -21,6 +21,10 @@
 static __init char *ingenic_get_system_type(unsigned long machtype)
 {
 	switch (machtype) {
+	case MACH_INGENIC_X2100:
+		return "X2100";
+	case MACH_INGENIC_X2000H:
+		return "X2000H";
 	case MACH_INGENIC_X2000E:
 		return "X2000E";
 	case MACH_INGENIC_X2000:
@@ -37,8 +41,18 @@ static __init char *ingenic_get_system_type(unsigned long machtype)
 		return "JZ4775";
 	case MACH_INGENIC_JZ4770:
 		return "JZ4770";
+	case MACH_INGENIC_JZ4760B:
+		return "JZ4760B";
+	case MACH_INGENIC_JZ4760:
+		return "JZ4760";
+	case MACH_INGENIC_JZ4755:
+		return "JZ4755";
+	case MACH_INGENIC_JZ4750:
+		return "JZ4750";
 	case MACH_INGENIC_JZ4725B:
 		return "JZ4725B";
+	case MACH_INGENIC_JZ4730:
+		return "JZ4730";
 	default:
 		return "JZ4740";
 	}
@@ -61,8 +75,13 @@ static __init const void *ingenic_fixup_fdt(const void *fdt, const void *match_d
 }
 
 static const struct of_device_id ingenic_of_match[] __initconst = {
+	{ .compatible = "ingenic,jz4730", .data = (void *)MACH_INGENIC_JZ4730 },
 	{ .compatible = "ingenic,jz4740", .data = (void *)MACH_INGENIC_JZ4740 },
 	{ .compatible = "ingenic,jz4725b", .data = (void *)MACH_INGENIC_JZ4725B },
+	{ .compatible = "ingenic,jz4750", .data = (void *)MACH_INGENIC_JZ4750 },
+	{ .compatible = "ingenic,jz4755", .data = (void *)MACH_INGENIC_JZ4755 },
+	{ .compatible = "ingenic,jz4760", .data = (void *)MACH_INGENIC_JZ4760 },
+	{ .compatible = "ingenic,jz4760b", .data = (void *)MACH_INGENIC_JZ4760B },
 	{ .compatible = "ingenic,jz4770", .data = (void *)MACH_INGENIC_JZ4770 },
 	{ .compatible = "ingenic,jz4775", .data = (void *)MACH_INGENIC_JZ4775 },
 	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
@@ -71,6 +90,8 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
 	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
 	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
 	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },
+	{ .compatible = "ingenic,x2000h", .data = (void *)MACH_INGENIC_X2000H },
+	{ .compatible = "ingenic,x2100", .data = (void *)MACH_INGENIC_X2100 },
 	{}
 };
 
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 4c2e817..2128ba9 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -75,6 +75,7 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4750,
 	MACH_INGENIC_JZ4755,
 	MACH_INGENIC_JZ4760,
+	MACH_INGENIC_JZ4760B,
 	MACH_INGENIC_JZ4770,
 	MACH_INGENIC_JZ4775,
 	MACH_INGENIC_JZ4780,
@@ -83,6 +84,8 @@ enum ingenic_machine_type {
 	MACH_INGENIC_X1830,
 	MACH_INGENIC_X2000,
 	MACH_INGENIC_X2000E,
+	MACH_INGENIC_X2000H,
+	MACH_INGENIC_X2100,
 };
 
 extern char *system_type;
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 35072c4..6ceb5bd 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -46,8 +46,8 @@
 #define PRID_COMP_NETLOGIC	0x0c0000
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_LOONGSON	0x140000
-#define PRID_COMP_INGENIC_13	0x130000	/* X2000 */
-#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750, X1830 */
+#define PRID_COMP_INGENIC_13	0x130000	/* X2000, X2100 */
+#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750, JZ4755, JZ4760, X1830 */
 #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
 #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
 
-- 
2.7.4

