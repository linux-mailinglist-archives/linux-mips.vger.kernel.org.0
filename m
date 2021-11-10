Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF1844BABC
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 04:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhKJD5r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 22:57:47 -0500
Received: from ptr.189.cn ([183.61.185.101]:11369 "EHLO 189.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229963AbhKJD5r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 22:57:47 -0500
X-Greylist: delayed 467 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Nov 2021 22:57:46 EST
HMM_SOURCE_IP: 10.64.8.31:45218.1712933027
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id BC86410013F;
        Wed, 10 Nov 2021 11:47:06 +0800 (CST)
Received: from  ([14.17.101.176])
        by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id 2d4330556833488a80fac8471e799c55 for chenhuacai@kernel.org;
        Wed, 10 Nov 2021 11:47:06 CST
X-Transaction-ID: 2d4330556833488a80fac8471e799c55
X-Real-From: 15330273260@189.cn
X-Receive-IP: 14.17.101.176
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        David Airlie <airlied@linux.ie>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH] mips/loongson64: seperate wbflush_loongson out of setup.c
Date:   Wed, 10 Nov 2021 11:46:53 +0800
Message-Id: <20211110034653.2404-1-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: suijingfeng <suijingfeng@loongson.cn>

 1) .set pop is enough, so remove redundant .set mips0

 2) loongson's cpu spec call the write buffers as store fill buffer,
    it is implemented in ls3a4000, ls3a3000, ls2k1000 etc cpus.
    wbflush is mean to empty data gathered in the write buffers within
    the CPU, however the system is still bootable and works normally
    if we deselect CPU_HAS_WB. This patch provided a convenient way
    to bypass __wbflush by removing CPU_HAS_WB in arch/mips/Kconfig.

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
---
 arch/mips/loongson64/Makefile  |  1 +
 arch/mips/loongson64/setup.c   | 17 -----------------
 arch/mips/loongson64/smp.c     |  6 +++---
 arch/mips/loongson64/wbflush.c | 26 ++++++++++++++++++++++++++
 4 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 arch/mips/loongson64/wbflush.c

diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index e806280bbb85..ad00d92c2871 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_SUSPEND) += pm.o
 obj-$(CONFIG_PCI_QUIRKS) += vbios_quirk.o
 obj-$(CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION) += cpucfg-emul.o
 obj-$(CONFIG_SYSFS) += boardinfo.o
+obj-$(CONFIG_CPU_HAS_WB) += wbflush.o
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 6fe3ffffcaa6..cb10d14da433 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -3,10 +3,7 @@
  * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
  * Author: Fuxin Zhang, zhangfx@lemote.com
  */
-#include <linux/export.h>
 #include <linux/init.h>
-
-#include <asm/wbflush.h>
 #include <asm/bootinfo.h>
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>
@@ -17,20 +14,6 @@
 
 void *loongson_fdt_blob;
 
-static void wbflush_loongson(void)
-{
-	asm(".set\tpush\n\t"
-	    ".set\tnoreorder\n\t"
-	    ".set mips3\n\t"
-	    "sync\n\t"
-	    "nop\n\t"
-	    ".set\tpop\n\t"
-	    ".set mips0\n\t");
-}
-
-void (*__wbflush)(void) = wbflush_loongson;
-EXPORT_SYMBOL(__wbflush);
-
 void __init plat_mem_setup(void)
 {
 	if (loongson_fdt_blob)
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 09ebe84a17fe..4a938a29bfb2 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -42,13 +42,13 @@ static uint32_t core0_c0count[NR_CPUS];
 #define loongson3_ipi_write32(action, addr)	\
 	do {					\
 		writel(action, addr);		\
-		__wbflush();			\
+		__sync();			\
 	} while (0)
 /* write a 64bit value to ipi register */
 #define loongson3_ipi_write64(action, addr)	\
 	do {					\
 		writeq(action, addr);		\
-		__wbflush();			\
+		__sync();			\
 	} while (0)
 
 static u32 (*ipi_read_clear)(int cpu);
@@ -418,7 +418,7 @@ static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 		c0count = c0count ? c0count : 1;
 		for (i = 1; i < nr_cpu_ids; i++)
 			core0_c0count[i] = c0count;
-		__wbflush(); /* Let others see the result ASAP */
+		__sync(); /* Let others see the result ASAP */
 	}
 
 	return IRQ_HANDLED;
diff --git a/arch/mips/loongson64/wbflush.c b/arch/mips/loongson64/wbflush.c
new file mode 100644
index 000000000000..7127e43d44e6
--- /dev/null
+++ b/arch/mips/loongson64/wbflush.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
+ * Author: Fuxin Zhang, zhangfx@lemote.com
+ */
+#include <linux/export.h>
+#include <linux/init.h>
+#include <asm/wbflush.h>
+#include <asm/sync.h>
+
+#ifdef CONFIG_CPU_HAS_WB
+
+static void wbflush_loongson(void)
+{
+	asm(".set push\n\t"
+	    ".set noreorder\n\t"
+	    ".set mips64r2\n\t"
+	    "sync\n\t"
+	    "nop\n\t"
+	    ".set pop\n\t");
+}
+
+void (*__wbflush)(void) = wbflush_loongson;
+EXPORT_SYMBOL(__wbflush);
+
+#endif
-- 
2.25.1

