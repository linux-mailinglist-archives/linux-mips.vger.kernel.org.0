Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0538E1DF7B1
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 15:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbgEWNhi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 09:37:38 -0400
Received: from [115.28.160.31] ([115.28.160.31]:60626 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S2387826AbgEWNhi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 May 2020 09:37:38 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8F06F6006D;
        Sat, 23 May 2020 21:37:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590241051; bh=bWRfxpzOLZNLHCWa4qDWap9WCorJpG248wQ401NBghY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P1S9LmXW9ToTJ/CbHRigJEXWm7QIhJpwZZ+FdJLHT8O4xcaVc51D0uc+yIys4Sycw
         CVlsJUjxSpwqChTqCPzBSZbSID2524AdLdFqBLRTIBss28VK30eD5QEgGY7VhzcAmi
         /CmbM2cGQ0h/h7Jw+CWWJkPA2Q8y6UZnz5o0N7Xs=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 1/1] MIPS: emulate CPUCFG instruction on older Loongson64 cores
Date:   Sat, 23 May 2020 21:37:01 +0800
Message-Id: <20200523133701.40367-2-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200523133701.40367-1-git@xen0n.name>
References: <20200523133701.40367-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPUCFG is the instruction for querying processor characteristics on
newer Loongson processors, much like CPUID of x86. Since the instruction
is supposedly designed to provide a unified way to do feature detection
(without having to, for example, parse /proc/cpuinfo which is too
heavyweight), it is important to provide compatibility for older cores
without native support. Fortunately, most of the fields can be
synthesized without changes to semantics. Performance is not really big
a concern, because feature detection logic is not expected to be
invoked very often in typical userland applications.

The instruction can't be emulated on LOONGSON_2EF cores, according to
FlyGoat's experiments. Because the LWC2 opcode is assigned to other
valid instructions on 2E and 2F, no RI exception is raised for us to
intercept. So compatibility is only extended back furthest to
Loongson-3A1000. Loongson-2K is covered too, as it is basically a remix
of various blocks from the 3A/3B models from a kernel perspective.

This is lightly based on Loongson's work on their Linux 3.10 fork, for
being the authority on the right feature flags to fill in, where things
aren't otherwise discoverable.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/Kconfig                             |  12 +
 arch/mips/include/asm/cpu-info.h              |   9 +
 .../include/asm/mach-loongson64/cpucfg-emul.h |  63 +++++
 arch/mips/kernel/cpu-probe.c                  |   9 +
 arch/mips/kernel/traps.c                      |  45 ++++
 arch/mips/loongson64/Makefile                 |   1 +
 arch/mips/loongson64/cpucfg-emul.c            | 217 ++++++++++++++++++
 7 files changed, 356 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
 create mode 100644 arch/mips/loongson64/cpucfg-emul.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f347312ecd74..c5fe30c78402 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1441,6 +1441,18 @@ config CPU_LOONGSON3_WORKAROUNDS
 
 	  If unsure, please say Y.
 
+config CPU_LOONGSON3_CPUCFG_EMULATION
+	bool "Emulate the CPUCFG instruction on older Loongson cores"
+	default y
+	depends on CPU_LOONGSON64
+	help
+	  Loongson-3A R4 and newer have the CPUCFG instruction available for
+	  userland to query CPU capabilities, much like CPUID on x86. This
+	  option provides emulation of the instruction on older Loongson
+	  cores, back to Loongson-3A1000.
+
+	  If unsure, please say Y.
+
 config CPU_LOONGSON2E
 	bool "Loongson 2E"
 	depends on SYS_HAS_CPU_LOONGSON2E
diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index bce3ea7fff7c..a600670d00e9 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -105,6 +105,15 @@ struct cpuinfo_mips {
 	unsigned int		gtoffset_mask;
 	unsigned int		guestid_mask;
 	unsigned int		guestid_cache;
+
+#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
+	/* CPUCFG data for this CPU, synthesized at probe time.
+	 *
+	 * CPUCFG select 0 is PRId, 4 and above are unimplemented for now.
+	 * So the only stored values are for CPUCFG selects 1-3 inclusive.
+	 */
+	u32 loongson3_cpucfg_data[3];
+#endif
 } __attribute__((aligned(SMP_CACHE_BYTES)));
 
 extern struct cpuinfo_mips cpu_data[];
diff --git a/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
new file mode 100644
index 000000000000..d21f786653c5
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_
+#define _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_
+
+#include <asm/cpu-info.h>
+
+#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
+
+#include <loongson_regs.h>
+
+#define LOONGSON_FPREV_MASK 0x7
+
+void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c);
+
+static inline u32 loongson3_cpucfg_read_synthesized(struct cpuinfo_mips *c,
+	__u64 sel)
+{
+	switch (sel) {
+	case LOONGSON_CFG0:
+		return c->processor_id;
+	case LOONGSON_CFG1:
+	case LOONGSON_CFG2:
+	case LOONGSON_CFG3:
+		return c->loongson3_cpucfg_data[sel - 1];
+	case LOONGSON_CFG4:
+	case LOONGSON_CFG5:
+		/* CPUCFG selects 4 and 5 are related to the input clock
+		 * signal.
+		 *
+		 * Unimplemented for now.
+		 */
+		return 0;
+	case LOONGSON_CFG6:
+		/* CPUCFG select 6 is for the undocumented Safe Extension. */
+		return 0;
+	case LOONGSON_CFG7:
+		/* CPUCFG select 7 is for the virtualization extension.
+		 * We don't know if the two currently known features are
+		 * supported on older cores according to the public
+		 * documentation, so leave this at zero.
+		 */
+		return 0;
+	}
+
+	/*
+	 * Return 0 for unrecognized CPUCFG selects, which is real hardware
+	 * behavior observed on Loongson 3A R4.
+	 */
+	return 0;
+}
+#else
+static void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
+{
+}
+
+static inline u32 loongson3_cpucfg_read_synthesized(struct cpuinfo_mips *c,
+	__u64 sel)
+{
+	return 0;
+}
+#endif
+
+#endif /* _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_ */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b8ec35737606..e661db5bb067 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -28,6 +28,8 @@
 #include <asm/spram.h>
 #include <linux/uaccess.h>
 
+#include <asm/mach-loongson64/cpucfg-emul.h>
+
 /* Hardware capabilities */
 unsigned int elf_hwcap __read_mostly;
 EXPORT_SYMBOL_GPL(elf_hwcap);
@@ -2400,6 +2402,13 @@ void cpu_probe(void)
 
 	cpu_probe_vmbits(c);
 
+	/* Synthesize CPUCFG data if running on Loongson processors;
+	 * no-op otherwise.
+	 *
+	 * This looks at previously probed features, so keep this at bottom.
+	 */
+	loongson3_cpucfg_synthesize_data(c);
+
 #ifdef CONFIG_64BIT
 	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vmbits) - 1);
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 89eb82f6c837..2d5b16daf331 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -71,6 +71,8 @@
 #include <asm/tlbex.h>
 #include <asm/uasm.h>
 
+#include <asm/mach-loongson64/cpucfg-emul.h>
+
 extern void check_wait(void);
 extern asmlinkage void rollback_handle_int(void);
 extern asmlinkage void handle_int(void);
@@ -693,6 +695,44 @@ static int simulate_sync(struct pt_regs *regs, unsigned int opcode)
 	return -1;			/* Must be something else ... */
 }
 
+/*
+ * Loongson-3 CSR instructions emulation
+ */
+
+#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
+
+#define LWC2             0xc8000000
+#define RS               BASE
+#define CSR_OPCODE2      0x00000118
+#define CSR_OPCODE2_MASK 0x000007ff
+#define CSR_FUNC_MASK    RT
+#define CSR_FUNC_CPUCFG  0x8
+
+static int simulate_loongson3_cpucfg(struct pt_regs *regs,
+				     unsigned int opcode)
+{
+	int op = opcode & OPCODE;
+	int op2 = opcode & CSR_OPCODE2_MASK;
+	int csr_func = (opcode & CSR_FUNC_MASK) >> 16;
+
+	if (op == LWC2 && op2 == CSR_OPCODE2 && csr_func == CSR_FUNC_CPUCFG) {
+		int rd = (opcode & RD) >> 11;
+		int rs = (opcode & RS) >> 21;
+		__u64 sel = regs->regs[rs];
+
+		perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, 0);
+
+		regs->regs[rd] = loongson3_cpucfg_read_synthesized(
+			&current_cpu_data, sel);
+
+		return 0;
+	}
+
+	/* Not ours.  */
+	return -1;
+}
+#endif /* CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION */
+
 asmlinkage void do_ov(struct pt_regs *regs)
 {
 	enum ctx_state prev_state;
@@ -1166,6 +1206,11 @@ asmlinkage void do_ri(struct pt_regs *regs)
 
 		if (status < 0)
 			status = simulate_fp(regs, opcode, old_epc, old31);
+
+#ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
+		if (status < 0)
+			status = simulate_loongson3_cpucfg(regs, opcode);
+#endif
 	} else if (cpu_has_mmips) {
 		unsigned short mmop[2] = { 0 };
 
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 6f3c2b47f66f..61f6add20530 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_NUMA)	+= numa.o
 obj-$(CONFIG_RS780_HPET) += hpet.o
 obj-$(CONFIG_PCI) += pci.o
 obj-$(CONFIG_SUSPEND) += pm.o
+obj-$(CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION) += cpucfg-emul.o
diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
new file mode 100644
index 000000000000..a179cb39bf44
--- /dev/null
+++ b/arch/mips/loongson64/cpucfg-emul.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/smp.h>
+#include <linux/types.h>
+#include <asm/cpu.h>
+#include <asm/cpu-info.h>
+
+#include <loongson_regs.h>
+#include <cpucfg-emul.h>
+
+static bool is_loongson(struct cpuinfo_mips *c)
+{
+	switch (c->processor_id & PRID_COMP_MASK) {
+	case PRID_COMP_LEGACY:
+		return ((c->processor_id & PRID_IMP_MASK) ==
+			PRID_IMP_LOONGSON_64C);
+
+	case PRID_COMP_LOONGSON:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static u32 get_loongson_fprev(struct cpuinfo_mips *c)
+{
+	return c->fpu_id & LOONGSON_FPREV_MASK;
+}
+
+static bool cpu_has_uca(void)
+{
+	u32 diag = read_c0_diag();
+	u32 new_diag;
+
+	if (diag & LOONGSON_DIAG_UCAC)
+		/* UCA is already enabled. */
+		return true;
+
+	/* See if UCAC bit can be flipped on. This should be safe. */
+	new_diag = diag | LOONGSON_DIAG_UCAC;
+	write_c0_diag(new_diag);
+	new_diag = read_c0_diag();
+	write_c0_diag(diag);
+
+	return (new_diag & LOONGSON_DIAG_UCAC) != 0;
+}
+
+static void probe_uca(struct cpuinfo_mips *c)
+{
+	if (cpu_has_uca())
+		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LSUCA;
+}
+
+static void decode_loongson_config6(struct cpuinfo_mips *c)
+{
+	u32 config6 = read_c0_config6();
+
+	if (config6 & MIPS_CONF6_LOONGSON_STFILL)
+		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SFBP;
+	if (config6 & MIPS_CONF6_LOONGSON_LLEXC)
+		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LLEXC;
+	if (config6 & MIPS_CONF6_LOONGSON_SCRAND)
+		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SCRAND;
+}
+
+static void patch_cpucfg_sel1(struct cpuinfo_mips *c)
+{
+	u64 ases = c->ases;
+	u64 options = c->options;
+	u32 data = c->loongson3_cpucfg_data[0];
+
+	if (options & MIPS_CPU_FPU) {
+		data |= LOONGSON_CFG1_FP;
+		data |= get_loongson_fprev(c) << LOONGSON_CFG1_FPREV_OFFSET;
+	}
+	if (ases & MIPS_ASE_LOONGSON_MMI)
+		data |= LOONGSON_CFG1_MMI;
+	if (ases & MIPS_ASE_MSA)
+		data |= LOONGSON_CFG1_MSA1;
+
+	c->loongson3_cpucfg_data[0] = data;
+}
+
+static void patch_cpucfg_sel2(struct cpuinfo_mips *c)
+{
+	u64 ases = c->ases;
+	u64 options = c->options;
+	u32 data = c->loongson3_cpucfg_data[1];
+
+	if (ases & MIPS_ASE_LOONGSON_EXT)
+		data |= LOONGSON_CFG2_LEXT1;
+	if (ases & MIPS_ASE_LOONGSON_EXT2)
+		data |= LOONGSON_CFG2_LEXT2;
+	if (options & MIPS_CPU_LDPTE)
+		data |= LOONGSON_CFG2_LSPW;
+
+	if (ases & MIPS_ASE_VZ)
+		data |= LOONGSON_CFG2_LVZP;
+	else
+		data &= ~LOONGSON_CFG2_LVZREV;
+
+	c->loongson3_cpucfg_data[1] = data;
+}
+
+static void patch_cpucfg_sel3(struct cpuinfo_mips *c)
+{
+	u64 ases = c->ases;
+	u32 data = c->loongson3_cpucfg_data[2];
+
+	if (ases & MIPS_ASE_LOONGSON_CAM) {
+		data |= LOONGSON_CFG3_LCAMP;
+	} else {
+		data &= ~LOONGSON_CFG3_LCAMREV;
+		data &= ~LOONGSON_CFG3_LCAMNUM;
+		data &= ~LOONGSON_CFG3_LCAMKW;
+		data &= ~LOONGSON_CFG3_LCAMVW;
+	}
+
+	c->loongson3_cpucfg_data[2] = data;
+}
+
+void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
+{
+	/* Only engage the logic on Loongson processors. */
+	if (!is_loongson(c))
+		return;
+
+	/* CPUs with CPUCFG support don't need to synthesize anything. */
+	if (cpu_has_cfg())
+		return;
+
+	c->loongson3_cpucfg_data[0] = 0;
+	c->loongson3_cpucfg_data[1] = 0;
+	c->loongson3_cpucfg_data[2] = 0;
+
+	/* Add CPUCFG features non-discoverable otherwise.
+	 *
+	 * All Loongson processors covered by CPUCFG emulation have distinct
+	 * PRID_REV, so take advantage of this.
+	 */
+	switch (c->processor_id & PRID_REV_MASK) {
+	case PRID_REV_LOONGSON3A_R1:
+		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
+			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
+			LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
+		c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
+			LOONGSON_CFG2_LPMP | LOONGSON_CFG2_LPM_REV1);
+		c->loongson3_cpucfg_data[2] |= (
+			LOONGSON_CFG3_LCAM_REV1 |
+			LOONGSON_CFG3_LCAMNUM_REV1 |
+			LOONGSON_CFG3_LCAMKW_REV1 |
+			LOONGSON_CFG3_LCAMVW_REV1);
+		break;
+
+	case PRID_REV_LOONGSON3B_R1:
+	case PRID_REV_LOONGSON3B_R2:
+		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
+			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
+			LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
+		c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
+			LOONGSON_CFG2_LPMP | LOONGSON_CFG2_LPM_REV1);
+		c->loongson3_cpucfg_data[2] |= (
+			LOONGSON_CFG3_LCAM_REV1 |
+			LOONGSON_CFG3_LCAMNUM_REV1 |
+			LOONGSON_CFG3_LCAMKW_REV1 |
+			LOONGSON_CFG3_LCAMVW_REV1);
+		break;
+
+	case PRID_REV_LOONGSON2K_R1_0:
+	case PRID_REV_LOONGSON2K_R1_1:
+	case PRID_REV_LOONGSON2K_R1_2:
+	case PRID_REV_LOONGSON2K_R1_3:
+		decode_loongson_config6(c);
+		probe_uca(c);
+
+		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
+			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LLSYNC |
+			LOONGSON_CFG1_TGTSYNC);
+		c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
+			LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LPMP |
+			LOONGSON_CFG2_LPM_REV2);
+		c->loongson3_cpucfg_data[2] = 0;
+		break;
+
+	case PRID_REV_LOONGSON3A_R2_0:
+	case PRID_REV_LOONGSON3A_R2_1:
+	case PRID_REV_LOONGSON3A_R3_0:
+	case PRID_REV_LOONGSON3A_R3_1:
+		decode_loongson_config6(c);
+		probe_uca(c);
+
+		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_CNT64 |
+			LOONGSON_CFG1_LSLDR0 | LOONGSON_CFG1_LSPREF |
+			LOONGSON_CFG1_LSPREFX | LOONGSON_CFG1_LSSYNCI |
+			LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
+		c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
+			LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LBTMMU |
+			LOONGSON_CFG2_LPMP | LOONGSON_CFG2_LPM_REV1 |
+			LOONGSON_CFG2_LVZ_REV1);
+		c->loongson3_cpucfg_data[2] |= (LOONGSON_CFG3_LCAM_REV1 |
+			LOONGSON_CFG3_LCAMNUM_REV1 |
+			LOONGSON_CFG3_LCAMKW_REV1 |
+			LOONGSON_CFG3_LCAMVW_REV1);
+		break;
+	}
+
+	/* This feature is set by firmware, but all known Loongson-64 systems
+	 * are configured this way.
+	 */
+	c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_CDMAP;
+
+	/* Patch in dynamically probed bits. */
+	patch_cpucfg_sel1(c);
+	patch_cpucfg_sel2(c);
+	patch_cpucfg_sel3(c);
+}
-- 
2.21.0

