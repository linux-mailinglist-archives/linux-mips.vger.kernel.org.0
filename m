Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557072A3D4F
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 08:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgKCHMQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 02:12:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37274 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727687AbgKCHMQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 02:12:16 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79PGAqFfIKEEAA--.12977S6;
        Tue, 03 Nov 2020 15:12:10 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: [PATCH v3 4/6] MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
Date:   Tue,  3 Nov 2020 15:12:03 +0800
Message-Id: <1604387525-23400-5-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx79PGAqFfIKEEAA--.12977S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKry8ZFy5uw4DXr4xWr18Grg_yoW3AFW8pF
        ZIkw15GFWrta48u398GFyfXr1rGw1DWa9rtF47tFWjgFs8A3ZrWF97G3WUAw1DCa95XF1f
        Zr1vkFWUKanrCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JrI_JrylYx0Ec7CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxVW8
        JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5c
        I20VAGYxC7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUasjbUUUUU=
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

v2: Add some callbacks in csr_ipi_probe()
v3: No changes

 .../include/asm/mach-loongson64/loongson_regs.h    |  10 ++
 arch/mips/loongson64/smp.c                         | 120 +++++++++++++++++----
 2 files changed, 107 insertions(+), 23 deletions(-)

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
index 7d58853..736e98d 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -53,6 +53,29 @@ static uint32_t core0_c0count[NR_CPUS];
 
 u32 (*ipi_read_clear)(int cpu);
 void (*ipi_write_action)(int cpu, u32 action);
+void (*ipi_write_enable)(int cpu);
+void (*ipi_clear_buf)(int cpu);
+void (*ipi_write_buf)(int cpu, struct task_struct *idle);
+
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
 
 static u32 csr_ipi_read_clear(int cpu)
 {
@@ -79,6 +102,35 @@ static void csr_ipi_write_action(int cpu, u32 action)
 	}
 }
 
+static void csr_ipi_write_enable(int cpu)
+{
+	csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);
+}
+
+static void csr_ipi_clear_buf(int cpu)
+{
+	csr_writeq(0, LOONGSON_CSR_MAIL_BUF0);
+}
+
+static void csr_ipi_write_buf(int cpu, struct task_struct *idle)
+{
+	unsigned long startargs[4];
+
+	/* startargs[] are initial PC, SP and GP for secondary CPU */
+	startargs[0] = (unsigned long)&smp_bootstrap;
+	startargs[1] = (unsigned long)__KSTK_TOS(idle);
+	startargs[2] = (unsigned long)task_thread_info(idle);
+	startargs[3] = 0;
+
+	pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
+		cpu, startargs[0], startargs[1], startargs[2]);
+
+	csr_mail_send(startargs[3], cpu_logical_map(cpu), 3);
+	csr_mail_send(startargs[2], cpu_logical_map(cpu), 2);
+	csr_mail_send(startargs[1], cpu_logical_map(cpu), 1);
+	csr_mail_send(startargs[0], cpu_logical_map(cpu), 0);
+}
+
 static u32 legacy_ipi_read_clear(int cpu)
 {
 	u32 action;
@@ -96,14 +148,53 @@ static void legacy_ipi_write_action(int cpu, u32 action)
 	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu]);
 }
 
+static void legacy_ipi_write_enable(int cpu)
+{
+	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
+}
+
+static void legacy_ipi_clear_buf(int cpu)
+{
+	loongson3_ipi_write64(0, ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+}
+
+static void legacy_ipi_write_buf(int cpu, struct task_struct *idle)
+{
+	unsigned long startargs[4];
+
+	/* startargs[] are initial PC, SP and GP for secondary CPU */
+	startargs[0] = (unsigned long)&smp_bootstrap;
+	startargs[1] = (unsigned long)__KSTK_TOS(idle);
+	startargs[2] = (unsigned long)task_thread_info(idle);
+	startargs[3] = 0;
+
+	pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
+			cpu, startargs[0], startargs[1], startargs[2]);
+
+	loongson3_ipi_write64(startargs[3],
+			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
+	loongson3_ipi_write64(startargs[2],
+			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
+	loongson3_ipi_write64(startargs[1],
+			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
+	loongson3_ipi_write64(startargs[0],
+			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+}
+
 static void csr_ipi_probe(void)
 {
 	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
 		ipi_read_clear = csr_ipi_read_clear;
 		ipi_write_action = csr_ipi_write_action;
+		ipi_write_enable = csr_ipi_write_enable;
+		ipi_clear_buf = csr_ipi_clear_buf;
+		ipi_write_buf = csr_ipi_write_buf;
 	} else {
 		ipi_read_clear = legacy_ipi_read_clear;
 		ipi_write_action = legacy_ipi_write_action;
+		ipi_write_enable = legacy_ipi_write_enable;
+		ipi_clear_buf = legacy_ipi_clear_buf;
+		ipi_write_buf = legacy_ipi_write_buf;
 	}
 }
 
@@ -347,8 +438,7 @@ static void loongson3_init_secondary(void)
 
 	/* Set interrupt mask, but don't enable */
 	change_c0_status(ST0_IM, imask);
-
-	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
+	ipi_write_enable(cpu);
 
 	per_cpu(cpu_state, cpu) = CPU_ONLINE;
 	cpu_set_core(&cpu_data[cpu],
@@ -380,8 +470,8 @@ static void loongson3_smp_finish(void)
 
 	write_c0_compare(read_c0_count() + mips_hpt_frequency/HZ);
 	local_irq_enable();
-	loongson3_ipi_write64(0,
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
+	ipi_clear_buf(cpu);
+
 	pr_info("CPU#%d finished, CP0_ST=%x\n",
 			smp_processor_id(), read_c0_status());
 }
@@ -419,7 +509,8 @@ static void __init loongson3_smp_setup(void)
 	ipi_status0_regs_init();
 	ipi_en0_regs_init();
 	ipi_mailbox_buf_init();
-	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(0)]);
+	ipi_write_enable(0);
+
 	cpu_set_core(&cpu_data[0],
 		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
@@ -439,27 +530,10 @@ static void __init loongson3_prepare_cpus(unsigned int max_cpus)
  */
 static int loongson3_boot_secondary(int cpu, struct task_struct *idle)
 {
-	unsigned long startargs[4];
-
 	pr_info("Booting CPU#%d...\n", cpu);
 
-	/* startargs[] are initial PC, SP and GP for secondary CPU */
-	startargs[0] = (unsigned long)&smp_bootstrap;
-	startargs[1] = (unsigned long)__KSTK_TOS(idle);
-	startargs[2] = (unsigned long)task_thread_info(idle);
-	startargs[3] = 0;
-
-	pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
-			cpu, startargs[0], startargs[1], startargs[2]);
+	ipi_write_buf(cpu, idle);
 
-	loongson3_ipi_write64(startargs[3],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
-	loongson3_ipi_write64(startargs[2],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
-	loongson3_ipi_write64(startargs[1],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
-	loongson3_ipi_write64(startargs[0],
-			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
 	return 0;
 }
 
-- 
2.1.0

