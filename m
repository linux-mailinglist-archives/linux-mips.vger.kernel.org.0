Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A4844BAA7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 04:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhKJDhu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 22:37:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33858 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229963AbhKJDhu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 22:37:50 -0500
Received: from openarena.loongson.cn (unknown [10.20.41.56])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9PbPYth0MQBAA--.4086S2;
        Wed, 10 Nov 2021 11:34:51 +0800 (CST)
From:   suijingfeng <suijingfeng@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        David Airlie <airlied@linux.ie>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips/loongson64: seperate wbflush_loongson out of setup.c
Date:   Wed, 10 Nov 2021 11:34:51 +0800
Message-Id: <20211110033451.326093-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9PbPYth0MQBAA--.4086S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4UZrWkWFWrZr17WrW8Crg_yoWrXr1fpw
        sYkan5Gr48Zr17Ars3CryUZr45Za95GFs7XF42vFyUZasFq34jvrn3KryrJrWDXry0qayr
        u34UWrZ8uFy7CaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk0b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
        CF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

