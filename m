Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2F829E5AE
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 09:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgJ2IEx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 04:04:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58442 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725300AbgJ2IDh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 04:03:37 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JJd5pfmHcCAA--.10240S6;
        Thu, 29 Oct 2020 16:03:32 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: [PATCH 4/6] MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
Date:   Thu, 29 Oct 2020 16:02:59 +0800
Message-Id: <1603958581-4723-5-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_9JJd5pfmHcCAA--.10240S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKry8ZFyruw13JF4DXF1xGrg_yoW7trWUpF
        ZFya45GrWFg3Z7uws5Jay5Xr1rJryDCanFyF42yF4jgas8GwnrWFn7G3WUZw4Dta98XF1f
        ZFn2kFW8K3Zru3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUCVW8JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnLvKUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson 3A4000+ CPU has per-core Mail_Send register to send mail,
there is no need to maintain register address of each core and node,
just simply specify cpu number.

Signed-off-by: Lu Zeng <zenglu@loongson.cn>
Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../include/asm/mach-loongson64/loongson_regs.h    | 10 +++
 arch/mips/loongson64/smp.c                         | 75 +++++++++++++++++-----
 2 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 83dbb9f..1659935 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -227,6 +227,16 @@ static inline void csr_writeq(u64 val, u32 reg)
 #define CSR_IPI_SEND_CPU_SHIFT	16
 #define CSR_IPI_SEND_BLOCK	BIT(31)
 
+#define LOONGSON_CSR_MAIL_BUF0		0x1020
+#define LOONGSON_CSR_MAIL_SEND		0x1048
+#define CSR_MAIL_SEND_BLOCK		BIT_ULL(31)
+#define CSR_MAIL_SEND_BOX_LOW(box)	(box << 1)
+#define CSR_MAIL_SEND_BOX_HIGH(box)	((box << 1) + 1)
+#define CSR_MAIL_SEND_BOX_SHIFT		2
+#define CSR_MAIL_SEND_CPU_SHIFT		16
+#define CSR_MAIL_SEND_BUF_SHIFT		32
+#define CSR_MAIL_SEND_H32_MASK		0xFFFFFFFF00000000ULL
+
 static inline u64 drdtime(void)
 {
 	int rID = 0;
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 7d58853..33597d2 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -54,6 +54,26 @@ static uint32_t core0_c0count[NR_CPUS];
 u32 (*ipi_read_clear)(int cpu);
 void (*ipi_write_action)(int cpu, u32 action);
 
+/* send mail via Mail_Send register for 3A4000+ CPU */
+static void csr_mail_send(uint64_t data, int cpu, int mailbox)
+{
+	uint64_t val;
+
+	/* send high 32 bits */
+	val = CSR_MAIL_SEND_BLOCK;
+	val |= (CSR_MAIL_SEND_BOX_HIGH(mailbox) << CSR_MAIL_SEND_BOX_SHIFT);
+	val |= (cpu << CSR_MAIL_SEND_CPU_SHIFT);
+	val |= (data & CSR_MAIL_SEND_H32_MASK);
+	csr_writeq(val, LOONGSON_CSR_MAIL_SEND);
+
+	/* send low 32 bits */
+	val = CSR_MAIL_SEND_BLOCK;
+	val |= (CSR_MAIL_SEND_BOX_LOW(mailbox) << CSR_MAIL_SEND_BOX_SHIFT);
+	val |= (cpu << CSR_MAIL_SEND_CPU_SHIFT);
+	val |= (data << CSR_MAIL_SEND_BUF_SHIFT);
+	csr_writeq(val, LOONGSON_CSR_MAIL_SEND);
+};
+
 static u32 csr_ipi_read_clear(int cpu)
 {
 	u32 action;
@@ -348,7 +368,10 @@ static void loongson3_init_secondary(void)
 	/* Set interrupt mask, but don't enable */
 	change_c0_status(ST0_IM, imask);
 
-	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI)
+		csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);
+	else
+		loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
 
 	per_cpu(cpu_state, cpu) = CPU_ONLINE;
 	cpu_set_core(&cpu_data[cpu],
@@ -380,8 +403,12 @@ static void loongson3_smp_finish(void)
 
 	write_c0_compare(read_c0_count() + mips_hpt_frequency/HZ);
 	local_irq_enable();
-	loongson3_ipi_write64(0,
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI)
+		csr_writel(0, LOONGSON_CSR_MAIL_BUF0);
+	else
+		loongson3_ipi_write64(0, ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+
 	pr_info("CPU#%d finished, CP0_ST=%x\n",
 			smp_processor_id(), read_c0_status());
 }
@@ -414,12 +441,18 @@ static void __init loongson3_smp_setup(void)
 	}
 
 	csr_ipi_probe();
-	ipi_set0_regs_init();
-	ipi_clear0_regs_init();
-	ipi_status0_regs_init();
-	ipi_en0_regs_init();
-	ipi_mailbox_buf_init();
-	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(0)]);
+
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
+		csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);
+	} else {
+		ipi_set0_regs_init();
+		ipi_clear0_regs_init();
+		ipi_status0_regs_init();
+		ipi_en0_regs_init();
+		ipi_mailbox_buf_init();
+		loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(0)]);
+	}
+
 	cpu_set_core(&cpu_data[0],
 		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
@@ -452,14 +485,22 @@ static int loongson3_boot_secondary(int cpu, struct task_struct *idle)
 	pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
 			cpu, startargs[0], startargs[1], startargs[2]);
 
-	loongson3_ipi_write64(startargs[3],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
-	loongson3_ipi_write64(startargs[2],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
-	loongson3_ipi_write64(startargs[1],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
-	loongson3_ipi_write64(startargs[0],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
+		csr_mail_send(startargs[3], cpu_logical_map(cpu), 3);
+		csr_mail_send(startargs[2], cpu_logical_map(cpu), 2);
+		csr_mail_send(startargs[1], cpu_logical_map(cpu), 1);
+		csr_mail_send(startargs[0], cpu_logical_map(cpu), 0);
+	} else {
+		loongson3_ipi_write64(startargs[3],
+				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
+		loongson3_ipi_write64(startargs[2],
+				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
+		loongson3_ipi_write64(startargs[1],
+				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
+		loongson3_ipi_write64(startargs[0],
+				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+	}
+
 	return 0;
 }
 
-- 
2.1.0

