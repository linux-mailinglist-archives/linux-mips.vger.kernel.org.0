Return-Path: <linux-mips+bounces-1528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B1D858452
	for <lists+linux-mips@lfdr.de>; Fri, 16 Feb 2024 18:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C461F2218B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Feb 2024 17:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270EA1332B2;
	Fri, 16 Feb 2024 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CsHg0JEv"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEDF54BD3;
	Fri, 16 Feb 2024 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708105358; cv=none; b=MrVl2NykLSbtUf3vJQKgZWS2WvnY3+3JZPO4XV5TBU3pwXznJ/iZQpyfg8AexkBDMR/RhhKGBr/IZ9E+1CLIR8qIllmpya+tZ9QH3GjlCs91Z7an70pCNvfl2p/gtYgZNawYhp5BSB+FvqodKEOpdRZ+iAkWZjx2jEUwJnNAoWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708105358; c=relaxed/simple;
	bh=aczDnBlcH8thQTR/53Z5x2CXncmHDFHT9wZWb7bUsuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8FRoLOqbPlHJpfaKai11r52PU/GLL4lLibfLSIg+mXfZO4r+ygoLuj0ssv2DerDkCn8pNCQgsztDNcDv+QOO+NNVjz0uk3O7LFKXwT2yfdXW4eV5W5+iNLT6QXLJWKklYNv3Q/eJFENJxcddSjINie+I78XV6ofZpRal5MPFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CsHg0JEv; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22DA4E000D;
	Fri, 16 Feb 2024 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708105353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kc198qyFgEX3OgSqcmQcAO5uBI5gVex748ppakKaOAA=;
	b=CsHg0JEvv0rS7uhyB+XZXy3cRSlUJpXDrFNbVmKDlMmSQC11qR0FginMFgd/dsv2iR4A95
	dt9TmNlZN7egqepjKwtFWD+wTfj1vCIUl8pMDgfYLaEDsK6jtWPAFrkPfjVVIBsXm56vEt
	PjU3u+gQJ36jTj66/MWKCnuNn9katlJiHaSkkqASJUYcGo66h3tu1btyUp1tiJ2q8GDxxz
	YEtCdPWgh92jkSHGjt/JpOMwUP9by072XxxaDnyruEvKL83ey1VH0tyAiv7r2teD+mrZJV
	nbV4wvTB9pCYt7PjGfRt8nkr3rCCWt1ZFKr6ozmsoJQChf0R70lIQ60rczjmDg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v8 03/14] MIPS: Allows relocation exception vectors everywhere
Date: Fri, 16 Feb 2024 18:42:12 +0100
Message-ID: <20240216174227.409400-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216174227.409400-1-gregory.clement@bootlin.com>
References: <20240216174227.409400-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Now the exception vector for CPS systems are allocated on-fly
with memblock as well.

It will try to allocate from KSEG1 first, and then try to allocate
in low 4G if possible.

The main reset vector is now generated by uasm, to avoid tons
of patches to the code. Other vectors are copied to the location
later.

gc: use the new macro CKSEG[0A1]DDR_OR_64BIT()
    move 64bits fix in an other patch
    fix cache issue with mips_cps_core_entry
    rewrite the patch to reduce the diff stat
    move extern in header
    use cache address for copying vector
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/include/asm/mips-cm.h |   1 +
 arch/mips/include/asm/smp-cps.h |   9 +-
 arch/mips/kernel/cps-vec.S      |  48 ++---------
 arch/mips/kernel/smp-cps.c      | 141 ++++++++++++++++++++++++++------
 4 files changed, 133 insertions(+), 66 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 23c67c0871b17..15d8d69de4550 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -311,6 +311,7 @@ GCR_CX_ACCESSOR_RW(32, 0x018, other)
 /* GCR_Cx_RESET_BASE - Configure where powered up cores will fetch from */
 GCR_CX_ACCESSOR_RW(32, 0x020, reset_base)
 #define CM_GCR_Cx_RESET_BASE_BEVEXCBASE		GENMASK(31, 12)
+#define CM_GCR_Cx_RESET_BASE_MODE		BIT(1)
 
 /* GCR_Cx_ID - Identify the current core */
 GCR_CX_ACCESSOR_RO(32, 0x028, id)
diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index 22a572b70fe31..ab94e50f62b87 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -24,7 +24,7 @@ struct core_boot_config {
 
 extern struct core_boot_config *mips_cps_core_bootcfg;
 
-extern void mips_cps_core_entry(void);
+extern void mips_cps_core_boot(int cca, void __iomem *gcr_base);
 extern void mips_cps_core_init(void);
 
 extern void mips_cps_boot_vpes(struct core_boot_config *cfg, unsigned vpe);
@@ -32,7 +32,12 @@ extern void mips_cps_boot_vpes(struct core_boot_config *cfg, unsigned vpe);
 extern void mips_cps_pm_save(void);
 extern void mips_cps_pm_restore(void);
 
-extern void *mips_cps_core_entry_patch_end;
+extern void excep_tlbfill(void);
+extern void excep_xtlbfill(void);
+extern void excep_cache(void);
+extern void excep_genex(void);
+extern void excep_intex(void);
+extern void excep_ejtag(void);
 
 #ifdef CONFIG_MIPS_CPS
 
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 64ecfdac6580b..df610c006b443 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -4,6 +4,7 @@
  * Author: Paul Burton <paul.burton@mips.com>
  */
 
+#include <linux/init.h>
 #include <asm/addrspace.h>
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
@@ -82,39 +83,10 @@
 	.endm
 
 
-.balign 0x1000
-
-LEAF(mips_cps_core_entry)
-	/*
-	 * These first several instructions will be patched by cps_smp_setup to load the
-	 * CCA to use into register s0 and GCR base address to register s1.
-	 */
-	.rept   CPS_ENTRY_PATCH_INSNS
-	nop
-	.endr
-
-	.global mips_cps_core_entry_patch_end
-mips_cps_core_entry_patch_end:
-
-	/* Check whether we're here due to an NMI */
-	mfc0	k0, CP0_STATUS
-	and	k0, k0, ST0_NMI
-	beqz	k0, not_nmi
-	 nop
-
-	/* This is an NMI */
-	PTR_LA	k0, nmi_handler
-	jr	k0
-	 nop
-
-not_nmi:
-	/* Setup Cause */
-	li	t0, CAUSEF_IV
-	mtc0	t0, CP0_CAUSE
-
-	/* Setup Status */
-	li	t0, ST0_CU1 | ST0_CU0 | ST0_BEV | STATUS_BITDEPS
-	mtc0	t0, CP0_STATUS
+LEAF(mips_cps_core_boot)
+	/* Save  CCA and GCR base */
+	move   s0, a0
+	move   s1, a1
 
 	/* We don't know how to do coherence setup on earlier ISA */
 #if MIPS_ISA_REV > 0
@@ -178,49 +150,45 @@ not_nmi:
 	PTR_L	sp, VPEBOOTCFG_SP(v1)
 	jr	t1
 	 nop
-	END(mips_cps_core_entry)
+	END(mips_cps_core_boot)
 
-.org 0x200
+	__INIT
 LEAF(excep_tlbfill)
 	DUMP_EXCEP("TLB Fill")
 	b	.
 	 nop
 	END(excep_tlbfill)
 
-.org 0x280
 LEAF(excep_xtlbfill)
 	DUMP_EXCEP("XTLB Fill")
 	b	.
 	 nop
 	END(excep_xtlbfill)
 
-.org 0x300
 LEAF(excep_cache)
 	DUMP_EXCEP("Cache")
 	b	.
 	 nop
 	END(excep_cache)
 
-.org 0x380
 LEAF(excep_genex)
 	DUMP_EXCEP("General")
 	b	.
 	 nop
 	END(excep_genex)
 
-.org 0x400
 LEAF(excep_intex)
 	DUMP_EXCEP("Interrupt")
 	b	.
 	 nop
 	END(excep_intex)
 
-.org 0x480
 LEAF(excep_ejtag)
 	PTR_LA	k0, ejtag_debug_handler
 	jr	k0
 	 nop
 	END(excep_ejtag)
+	__FINIT
 
 LEAF(mips_cps_core_init)
 #ifdef CONFIG_MIPS_MT_SMP
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index f6c37d407f365..9cc087dd1c194 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -7,6 +7,7 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/memblock.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/hotplug.h>
 #include <linux/slab.h>
@@ -20,12 +21,24 @@
 #include <asm/mipsregs.h>
 #include <asm/pm-cps.h>
 #include <asm/r4kcache.h>
+#include <asm/regdef.h>
 #include <asm/smp.h>
 #include <asm/smp-cps.h>
 #include <asm/time.h>
 #include <asm/uasm.h>
 
+#define BEV_VEC_SIZE	0x500
+#define BEV_VEC_ALIGN	0x1000
+
+enum label_id {
+	label_not_nmi = 1,
+};
+
+UASM_L_LA(_not_nmi)
+
 static DECLARE_BITMAP(core_power, NR_CPUS);
+static uint32_t core_entry_reg;
+static phys_addr_t cps_vec_pa;
 
 struct core_boot_config *mips_cps_core_bootcfg;
 
@@ -34,10 +47,100 @@ static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 	return min(smp_max_threads, mips_cps_numvps(cluster, core));
 }
 
+static void __init *mips_cps_build_core_entry(void *addr)
+{
+	extern void (*nmi_handler)(void);
+	u32 *p = addr;
+	u32 val;
+	struct uasm_label labels[2];
+	struct uasm_reloc relocs[2];
+	struct uasm_label *l = labels;
+	struct uasm_reloc *r = relocs;
+
+	memset(labels, 0, sizeof(labels));
+	memset(relocs, 0, sizeof(relocs));
+
+	uasm_i_mfc0(&p, GPR_K0, C0_STATUS);
+	UASM_i_LA(&p, GPR_T9, ST0_NMI);
+	uasm_i_and(&p, GPR_K0, GPR_K0, GPR_T9);
+
+	uasm_il_bnez(&p, &r, GPR_K0, label_not_nmi);
+	uasm_i_nop(&p);
+	UASM_i_LA(&p, GPR_K0, (long)&nmi_handler);
+
+	uasm_l_not_nmi(&l, p);
+
+	val = CAUSEF_IV;
+	uasm_i_lui(&p, GPR_K0, val >> 16);
+	uasm_i_ori(&p, GPR_K0, GPR_K0, val & 0xffff);
+	uasm_i_mtc0(&p, GPR_K0, C0_CAUSE);
+	val = ST0_CU1 | ST0_CU0 | ST0_BEV | ST0_KX_IF_64;
+	uasm_i_lui(&p, GPR_K0, val >> 16);
+	uasm_i_ori(&p, GPR_K0, GPR_K0, val & 0xffff);
+	uasm_i_mtc0(&p, GPR_K0, C0_STATUS);
+	uasm_i_ehb(&p);
+	uasm_i_ori(&p, GPR_A0, 0, read_c0_config() & CONF_CM_CMASK);
+	UASM_i_LA(&p, GPR_A1, (long)mips_gcr_base);
+#if defined(KBUILD_64BIT_SYM32) || defined(CONFIG_32BIT)
+	UASM_i_LA(&p, GPR_T9, CKSEG1ADDR(__pa_symbol(mips_cps_core_boot)));
+#else
+	UASM_i_LA(&p, GPR_T9, TO_UNCAC(__pa_symbol(mips_cps_core_boot)));
+#endif
+	uasm_i_jr(&p, GPR_T9);
+	uasm_i_nop(&p);
+
+	uasm_resolve_relocs(relocs, labels);
+
+	return p;
+}
+
+static int __init allocate_cps_vecs(void)
+{
+	/* Try to allocate in KSEG1 first */
+	cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
+						0x0, CSEGX_SIZE - 1);
+
+	if (cps_vec_pa)
+		core_entry_reg = CKSEG1ADDR(cps_vec_pa) &
+					CM_GCR_Cx_RESET_BASE_BEVEXCBASE;
+
+	if (!cps_vec_pa && mips_cm_is64) {
+		cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
+							0x0, SZ_4G - 1);
+		if (cps_vec_pa)
+			core_entry_reg = (cps_vec_pa & CM_GCR_Cx_RESET_BASE_BEVEXCBASE) |
+					CM_GCR_Cx_RESET_BASE_MODE;
+	}
+
+	if (!cps_vec_pa)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void __init setup_cps_vecs(void)
+{
+	void *cps_vec;
+
+	cps_vec = (void *)CKSEG1ADDR_OR_64BIT(cps_vec_pa);
+	mips_cps_build_core_entry(cps_vec);
+
+	memcpy(cps_vec + 0x200, &excep_tlbfill, 0x80);
+	memcpy(cps_vec + 0x280, &excep_xtlbfill, 0x80);
+	memcpy(cps_vec + 0x300, &excep_cache, 0x80);
+	memcpy(cps_vec + 0x380, &excep_genex, 0x80);
+	memcpy(cps_vec + 0x400, &excep_intex, 0x80);
+	memcpy(cps_vec + 0x480, &excep_ejtag, 0x80);
+
+	/* Make sure no prefetched data in cache */
+	blast_inv_dcache_range(CKSEG0ADDR_OR_64BIT(cps_vec_pa), CKSEG0ADDR_OR_64BIT(cps_vec_pa) + BEV_VEC_SIZE);
+	bc_inv(CKSEG0ADDR_OR_64BIT(cps_vec_pa), BEV_VEC_SIZE);
+	__sync();
+}
+
 static void __init cps_smp_setup(void)
 {
 	unsigned int nclusters, ncores, nvpes, core_vpes;
-	unsigned long core_entry;
 	int cl, c, v;
 
 	/* Detect & record VPE topology */
@@ -94,10 +197,11 @@ static void __init cps_smp_setup(void)
 	/* Make core 0 coherent with everything */
 	write_gcr_cl_coherence(0xff);
 
-	if (mips_cm_revision() >= CM_REV_CM3) {
-		core_entry = CKSEG1ADDR((unsigned long)mips_cps_core_entry);
-		write_gcr_bev_base(core_entry);
-	}
+	if (allocate_cps_vecs())
+		pr_err("Failed to allocate CPS vectors\n");
+
+	if (core_entry_reg && mips_cm_revision() >= CM_REV_CM3)
+		write_gcr_bev_base(core_entry_reg);
 
 #ifdef CONFIG_MIPS_MT_FPAFF
 	/* If we have an FPU, enroll ourselves in the FPU-full mask */
@@ -110,10 +214,14 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
 	unsigned ncores, core_vpes, c, cca;
 	bool cca_unsuitable, cores_limited;
-	u32 *entry_code;
 
 	mips_mt_set_cpuoptions();
 
+	if (!core_entry_reg) {
+		pr_err("core_entry address unsuitable, disabling smp-cps\n");
+		goto err_out;
+	}
+
 	/* Detect whether the CCA is unsuited to multi-core SMP */
 	cca = read_c0_config() & CONF_CM_CMASK;
 	switch (cca) {
@@ -145,20 +253,7 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 			(cca_unsuitable && cpu_has_dc_aliases) ? " & " : "",
 			cpu_has_dc_aliases ? "dcache aliasing" : "");
 
-	/*
-	 * Patch the start of mips_cps_core_entry to provide:
-	 *
-	 * s0 = kseg0 CCA
-	 */
-	entry_code = (u32 *)&mips_cps_core_entry;
-	uasm_i_addiu(&entry_code, 16, 0, cca);
-	UASM_i_LA(&entry_code, 17, (long)mips_gcr_base);
-	BUG_ON((void *)entry_code > (void *)&mips_cps_core_entry_patch_end);
-	blast_dcache_range((unsigned long)&mips_cps_core_entry,
-			   (unsigned long)entry_code);
-	bc_wback_inv((unsigned long)&mips_cps_core_entry,
-		     (void *)entry_code - (void *)&mips_cps_core_entry);
-	__sync();
+	setup_cps_vecs();
 
 	/* Allocate core boot configuration structs */
 	ncores = mips_cps_numcores(0);
@@ -213,7 +308,7 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
-	write_gcr_co_reset_base(CKSEG1ADDR((unsigned long)mips_cps_core_entry));
+	write_gcr_co_reset_base(core_entry_reg);
 
 	/* Ensure its coherency is disabled */
 	write_gcr_co_coherence(0);
@@ -290,7 +385,6 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 	unsigned vpe_id = cpu_vpe_id(&cpu_data[cpu]);
 	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
 	struct vpe_boot_config *vpe_cfg = &core_cfg->vpe_config[vpe_id];
-	unsigned long core_entry;
 	unsigned int remote;
 	int err;
 
@@ -314,8 +408,7 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 	if (cpu_has_vp) {
 		mips_cm_lock_other(0, core, vpe_id, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
-		core_entry = CKSEG1ADDR((unsigned long)mips_cps_core_entry);
-		write_gcr_co_reset_base(core_entry);
+		write_gcr_co_reset_base(core_entry_reg);
 		mips_cm_unlock_other();
 	}
 
-- 
2.43.0


