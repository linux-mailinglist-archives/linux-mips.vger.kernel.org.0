Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE43125D64D
	for <lists+linux-mips@lfdr.de>; Fri,  4 Sep 2020 12:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgIDKce (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Sep 2020 06:32:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43334 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730029AbgIDKbX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Sep 2020 06:31:23 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT8djF1JfQMEQAA--.120S2;
        Fri, 04 Sep 2020 18:30:59 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Simplify ipi_regs_init
Date:   Fri,  4 Sep 2020 18:30:58 +0800
Message-Id: <1599215458-2820-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxT8djF1JfQMEQAA--.120S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Kw4UArWfKr43Wry3WF48WFg_yoWkKrW7pr
        4Yva98Xr43W395WF1DJa40qF45t39FqFZrZwsxXFyfG3WjyFW2k3W3JF1DXwnxJFy8Jr1j
        9r9rGr13GrWSy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8twCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqWSrDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Delete unused macro. Combine ipi_*_regs_init and mailbox_buf_init as
ipi_init to avoid redundant codes.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/loongson64/smp.c | 227 +++++++--------------------------------------
 arch/mips/loongson64/smp.h |  31 -------
 2 files changed, 36 insertions(+), 222 deletions(-)
 delete mode 100644 arch/mips/loongson64/smp.h

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e744e1b..f0de3c3 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -21,16 +21,27 @@
 #include <loongson_regs.h>
 #include <workarounds.h>
 
-#include "smp.h"
+/* for Loongson-3 smp support */
+extern unsigned long long smp_group[4];
+#define MAX_NODES         4
+#define CORES_PER_NODE    (loongson_sysconf.cores_per_node)
+#define SMP_CORE_DISTANCE (0x100)
+
+/* ipi registers offsets */
+#define OFF_STATUS        0x00
+#define OFF_ENABLE        0x04
+#define OFF_SET           0x08
+#define OFF_CLEAR         0x0c
+#define OFF_BUF           0x20
 
 DEFINE_PER_CPU(int, cpu_state);
 
 #define LS_IPI_IRQ (MIPS_CPU_IRQ_BASE + 6)
 
-static void *ipi_set0_regs[16];
-static void *ipi_clear0_regs[16];
-static void *ipi_status0_regs[16];
-static void *ipi_en0_regs[16];
+static void *ipi_set_regs[16];
+static void *ipi_clear_regs[16];
+static void *ipi_status_regs[16];
+static void *ipi_enable_regs[16];
 static void *ipi_mailbox_buf[16];
 static uint32_t core0_c0count[NR_CPUS];
 
@@ -84,16 +95,16 @@ static u32 legacy_ipi_read_clear(int cpu)
 	u32 action;
 
 	/* Load the ipi register to figure out what we're supposed to do */
-	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
+	action = loongson3_ipi_read32(ipi_status_regs[cpu_logical_map(cpu)]);
 	/* Clear the ipi register to clear the interrupt */
-	loongson3_ipi_write32(action, ipi_clear0_regs[cpu_logical_map(cpu)]);
+	loongson3_ipi_write32(action, ipi_clear_regs[cpu_logical_map(cpu)]);
 
 	return action;
 }
 
 static void legacy_ipi_write_action(int cpu, u32 action)
 {
-	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu]);
+	loongson3_ipi_write32((u32)action, ipi_set_regs[cpu]);
 }
 
 static void csr_ipi_probe(void)
@@ -107,184 +118,22 @@ static void csr_ipi_probe(void)
 	}
 }
 
-static void ipi_set0_regs_init(void)
+static void ipi_init(void)
 {
-	ipi_set0_regs[0] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE0_OFFSET + SET0);
-	ipi_set0_regs[1] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE1_OFFSET + SET0);
-	ipi_set0_regs[2] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE2_OFFSET + SET0);
-	ipi_set0_regs[3] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE3_OFFSET + SET0);
-	ipi_set0_regs[4] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE0_OFFSET + SET0);
-	ipi_set0_regs[5] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE1_OFFSET + SET0);
-	ipi_set0_regs[6] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE2_OFFSET + SET0);
-	ipi_set0_regs[7] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE3_OFFSET + SET0);
-	ipi_set0_regs[8] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE0_OFFSET + SET0);
-	ipi_set0_regs[9] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE1_OFFSET + SET0);
-	ipi_set0_regs[10] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE2_OFFSET + SET0);
-	ipi_set0_regs[11] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE3_OFFSET + SET0);
-	ipi_set0_regs[12] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE0_OFFSET + SET0);
-	ipi_set0_regs[13] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE1_OFFSET + SET0);
-	ipi_set0_regs[14] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE2_OFFSET + SET0);
-	ipi_set0_regs[15] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE3_OFFSET + SET0);
-}
-
-static void ipi_clear0_regs_init(void)
-{
-	ipi_clear0_regs[0] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE0_OFFSET + CLEAR0);
-	ipi_clear0_regs[1] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE1_OFFSET + CLEAR0);
-	ipi_clear0_regs[2] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE2_OFFSET + CLEAR0);
-	ipi_clear0_regs[3] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE3_OFFSET + CLEAR0);
-	ipi_clear0_regs[4] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE0_OFFSET + CLEAR0);
-	ipi_clear0_regs[5] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE1_OFFSET + CLEAR0);
-	ipi_clear0_regs[6] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE2_OFFSET + CLEAR0);
-	ipi_clear0_regs[7] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE3_OFFSET + CLEAR0);
-	ipi_clear0_regs[8] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE0_OFFSET + CLEAR0);
-	ipi_clear0_regs[9] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE1_OFFSET + CLEAR0);
-	ipi_clear0_regs[10] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE2_OFFSET + CLEAR0);
-	ipi_clear0_regs[11] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE3_OFFSET + CLEAR0);
-	ipi_clear0_regs[12] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE0_OFFSET + CLEAR0);
-	ipi_clear0_regs[13] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE1_OFFSET + CLEAR0);
-	ipi_clear0_regs[14] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE2_OFFSET + CLEAR0);
-	ipi_clear0_regs[15] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE3_OFFSET + CLEAR0);
-}
-
-static void ipi_status0_regs_init(void)
-{
-	ipi_status0_regs[0] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE0_OFFSET + STATUS0);
-	ipi_status0_regs[1] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE1_OFFSET + STATUS0);
-	ipi_status0_regs[2] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE2_OFFSET + STATUS0);
-	ipi_status0_regs[3] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE3_OFFSET + STATUS0);
-	ipi_status0_regs[4] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE0_OFFSET + STATUS0);
-	ipi_status0_regs[5] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE1_OFFSET + STATUS0);
-	ipi_status0_regs[6] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE2_OFFSET + STATUS0);
-	ipi_status0_regs[7] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE3_OFFSET + STATUS0);
-	ipi_status0_regs[8] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE0_OFFSET + STATUS0);
-	ipi_status0_regs[9] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE1_OFFSET + STATUS0);
-	ipi_status0_regs[10] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE2_OFFSET + STATUS0);
-	ipi_status0_regs[11] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE3_OFFSET + STATUS0);
-	ipi_status0_regs[12] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE0_OFFSET + STATUS0);
-	ipi_status0_regs[13] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE1_OFFSET + STATUS0);
-	ipi_status0_regs[14] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE2_OFFSET + STATUS0);
-	ipi_status0_regs[15] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE3_OFFSET + STATUS0);
-}
-
-static void ipi_en0_regs_init(void)
-{
-	ipi_en0_regs[0] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE0_OFFSET + EN0);
-	ipi_en0_regs[1] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE1_OFFSET + EN0);
-	ipi_en0_regs[2] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE2_OFFSET + EN0);
-	ipi_en0_regs[3] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE3_OFFSET + EN0);
-	ipi_en0_regs[4] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE0_OFFSET + EN0);
-	ipi_en0_regs[5] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE1_OFFSET + EN0);
-	ipi_en0_regs[6] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE2_OFFSET + EN0);
-	ipi_en0_regs[7] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE3_OFFSET + EN0);
-	ipi_en0_regs[8] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE0_OFFSET + EN0);
-	ipi_en0_regs[9] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE1_OFFSET + EN0);
-	ipi_en0_regs[10] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE2_OFFSET + EN0);
-	ipi_en0_regs[11] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE3_OFFSET + EN0);
-	ipi_en0_regs[12] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE0_OFFSET + EN0);
-	ipi_en0_regs[13] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE1_OFFSET + EN0);
-	ipi_en0_regs[14] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE2_OFFSET + EN0);
-	ipi_en0_regs[15] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE3_OFFSET + EN0);
-}
-
-static void ipi_mailbox_buf_init(void)
-{
-	ipi_mailbox_buf[0] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE0_OFFSET + BUF);
-	ipi_mailbox_buf[1] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE1_OFFSET + BUF);
-	ipi_mailbox_buf[2] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE2_OFFSET + BUF);
-	ipi_mailbox_buf[3] = (void *)
-		(SMP_CORE_GROUP0_BASE + SMP_CORE3_OFFSET + BUF);
-	ipi_mailbox_buf[4] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE0_OFFSET + BUF);
-	ipi_mailbox_buf[5] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE1_OFFSET + BUF);
-	ipi_mailbox_buf[6] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE2_OFFSET + BUF);
-	ipi_mailbox_buf[7] = (void *)
-		(SMP_CORE_GROUP1_BASE + SMP_CORE3_OFFSET + BUF);
-	ipi_mailbox_buf[8] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE0_OFFSET + BUF);
-	ipi_mailbox_buf[9] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE1_OFFSET + BUF);
-	ipi_mailbox_buf[10] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE2_OFFSET + BUF);
-	ipi_mailbox_buf[11] = (void *)
-		(SMP_CORE_GROUP2_BASE + SMP_CORE3_OFFSET + BUF);
-	ipi_mailbox_buf[12] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE0_OFFSET + BUF);
-	ipi_mailbox_buf[13] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE1_OFFSET + BUF);
-	ipi_mailbox_buf[14] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE2_OFFSET + BUF);
-	ipi_mailbox_buf[15] = (void *)
-		(SMP_CORE_GROUP3_BASE + SMP_CORE3_OFFSET + BUF);
+	int i, j, id;
+	unsigned long long off;
+
+	for (i = 0; i < MAX_NODES; i++) {
+		for (j = 0; j < CORES_PER_NODE; j++) {
+			id = i * CORES_PER_NODE + j;
+			off = smp_group[i] + j * SMP_CORE_DISTANCE;
+			ipi_set_regs[id] = (void *)(off + OFF_SET);
+			ipi_clear_regs[id] = (void *)(off + OFF_CLEAR);
+			ipi_status_regs[id] = (void *)(off + OFF_STATUS);
+			ipi_enable_regs[id] = (void *)(off + OFF_ENABLE);
+			ipi_mailbox_buf[id] = (void *)(off + OFF_BUF);
+		}
+	}
 }
 
 /*
@@ -349,7 +198,7 @@ static void loongson3_init_secondary(void)
 	change_c0_status(ST0_IM, imask);
 
 	for (i = 0; i < num_possible_cpus(); i++)
-		loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(i)]);
+		loongson3_ipi_write32(0xffffffff, ipi_enable_regs[cpu_logical_map(i)]);
 
 	per_cpu(cpu_state, cpu) = CPU_ONLINE;
 	cpu_set_core(&cpu_data[cpu],
@@ -415,11 +264,7 @@ static void __init loongson3_smp_setup(void)
 	}
 
 	csr_ipi_probe();
-	ipi_set0_regs_init();
-	ipi_clear0_regs_init();
-	ipi_status0_regs_init();
-	ipi_en0_regs_init();
-	ipi_mailbox_buf_init();
+	ipi_init();
 	cpu_set_core(&cpu_data[0],
 		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
diff --git a/arch/mips/loongson64/smp.h b/arch/mips/loongson64/smp.h
deleted file mode 100644
index 957bde8..0000000
--- a/arch/mips/loongson64/smp.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LOONGSON_SMP_H_
-#define __LOONGSON_SMP_H_
-
-/* for Loongson-3 smp support */
-extern unsigned long long smp_group[4];
-
-/* 4 groups(nodes) in maximum in numa case */
-#define SMP_CORE_GROUP0_BASE	(smp_group[0])
-#define SMP_CORE_GROUP1_BASE	(smp_group[1])
-#define SMP_CORE_GROUP2_BASE	(smp_group[2])
-#define SMP_CORE_GROUP3_BASE	(smp_group[3])
-
-/* 4 cores in each group(node) */
-#define SMP_CORE0_OFFSET  0x000
-#define SMP_CORE1_OFFSET  0x100
-#define SMP_CORE2_OFFSET  0x200
-#define SMP_CORE3_OFFSET  0x300
-
-/* ipi registers offsets */
-#define STATUS0  0x00
-#define EN0      0x04
-#define SET0     0x08
-#define CLEAR0   0x0c
-#define STATUS1  0x10
-#define MASK1    0x14
-#define SET1     0x18
-#define CLEAR1   0x1c
-#define BUF      0x20
-
-#endif
-- 
2.1.0

