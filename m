Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381A47DA334
	for <lists+linux-mips@lfdr.de>; Sat, 28 Oct 2023 00:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346649AbjJ0WLh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Oct 2023 18:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346662AbjJ0WL3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Oct 2023 18:11:29 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2076A1BC;
        Fri, 27 Oct 2023 15:11:25 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 1301032008FE;
        Fri, 27 Oct 2023 18:11:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 27 Oct 2023 18:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1698444683; x=
        1698531083; bh=B/eSduiT5SSuDZgp+rtGBx4PnZ8+7CU6vuXEb/G0fc4=; b=m
        N9rnu7TkUZnABboEAbBSpLOUbZO8DRmpIJZCIg4UlizjaOiHmOk74QoeX9/yxQdt
        jeAgCwWB3rAl6maepDTbAVvr3s1T3GBL0s73+jeIkoPcPu2du6NRVNHnQfGRNKBF
        3em1J7RQ1KIHDWKLTP30Jdej1KhmB669bebGwHdkVMZX6o2P/5zUgOel0yFwga+i
        P1Sg9Pu+7pXtJseN7FDKgTC1UU5Aelx5SW5wQHkexLoWzwtd1ShjvNNTsedcRrqa
        Kt3L8ez4wIf3Pfej31cC3fiSJ3W6WbEgF/PF3nWkqr/ncO3XivsbJ2irzDwskwGx
        606wXrdS/48+pmjkefdSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1698444683; x=
        1698531083; bh=B/eSduiT5SSuDZgp+rtGBx4PnZ8+7CU6vuXEb/G0fc4=; b=T
        MpResMzWITJRydGI1GgCvy1enxguXuef6bgLjaYrskbag7X0iEK7kLGSDX1/mpMc
        kEJQlNF4uVJbgqWNrxkpo4lF1gGK+SjAkcEpv3GDncRqEgXFzlre95X6kXZ3yUwQ
        6s/tv/OycMEDudF9LKT3rdTGqswzwKoMMeRqxNbuNBenplljPYHZ4NI6PK2pCy0k
        Fk4uS09/EFrNabNV1Sy0f0uizFPsEqNdE1pz/A0NCYwSXwrTu2BCmaidifAYYG0n
        jZEmlXwdywn6LnIQRtX7WmKPxrF5Vq/kTifvLSwcwydTVdw1lG/eMER+Lve7s/Jq
        z6guz22B+zyTWD+dsHZSg==
X-ME-Sender: <xms:izU8ZXQS8QnPvJx3G1RdFpGsRvK_FytgqjdtAr8du9Voz5gVmIY5pw>
    <xme:izU8ZYwvH7XC1uvQCX9iPSKJTZFQLk3wWU8gyIDPkUryckhaH6jkOhqZsOQZeDTZn
    qLCC9o5e9WvvKYDH2U>
X-ME-Received: <xmr:izU8Zc1eb1cEW2Oju8fiz7KgigDf4PPI0ks5MDO48WgyO8_BeAhoNXc4YyD_Y0SXy7ti7SBbw7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleehgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdtleegudehgeeiud
    ejtdfgtedvudejleevheduhfdvieegtddvvdevffdvhfenucffohhmrghinheptghpshdq
    vhgvtgdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:izU8ZXD3drlmvzM89O9ttryQenGEbDQ6gKeDC_zdkUjdTWevRzRRzA>
    <xmx:izU8ZQi_eVHGGbWqxQbxkCYVuDlpKYyRJo4XDXU_EuSLw7wBZX-wIQ>
    <xmx:izU8Zboivp5eS6I6N18cS6pxRHF3aGRV9TiUJXUg0sX_nCuFXGdJKg>
    <xmx:izU8ZYckMqbNqw8vnf1SZK1GfFl-XyQkgXNvjBGeqE1L_saX8cZFtA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Oct 2023 18:11:22 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
        gregory.clement@bootlin.com, vladimir.kondratiev@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 05/10] MIPS: Refactor mips_cps_core_entry implementation
Date:   Fri, 27 Oct 2023 23:11:01 +0100
Message-Id: <20231027221106.405666-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027221106.405666-1-jiaxun.yang@flygoat.com>
References: <20231027221106.405666-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now the exception vector for CPS systems are allocated on-fly
with memblock as well.

It will try to allocate from KSEG1 first, and then try to allocate
in low 4G if possible.

The main reset vector is now generated by uasm, to avoid tons
of patches to the code. Other vectors are copied to the location
later.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mips-cm.h |   1 +
 arch/mips/include/asm/smp-cps.h |   4 +-
 arch/mips/kernel/cps-vec.S      | 110 ++++++++-------------
 arch/mips/kernel/smp-cps.c      | 167 +++++++++++++++++++++++++++-----
 arch/mips/kernel/traps.c        |   2 +
 5 files changed, 186 insertions(+), 98 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 23c67c0871b1..15d8d69de455 100644
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
index 22a572b70fe3..39a602e5fecc 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -24,7 +24,7 @@ struct core_boot_config {
 
 extern struct core_boot_config *mips_cps_core_bootcfg;
 
-extern void mips_cps_core_entry(void);
+extern void mips_cps_core_boot(int cca, void __iomem *gcr_base);
 extern void mips_cps_core_init(void);
 
 extern void mips_cps_boot_vpes(struct core_boot_config *cfg, unsigned vpe);
@@ -32,8 +32,6 @@ extern void mips_cps_boot_vpes(struct core_boot_config *cfg, unsigned vpe);
 extern void mips_cps_pm_save(void);
 extern void mips_cps_pm_restore(void);
 
-extern void *mips_cps_core_entry_patch_end;
-
 #ifdef CONFIG_MIPS_CPS
 
 extern bool mips_cps_smp_in_use(void);
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 64ecfdac6580..8870a2dbc35a 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -4,6 +4,8 @@
  * Author: Paul Burton <paul.burton@mips.com>
  */
 
+#include <linux/init.h>
+
 #include <asm/addrspace.h>
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
@@ -81,40 +83,48 @@
 	 nop
 	.endm
 
+	__INIT
+LEAF(excep_tlbfill)
+	DUMP_EXCEP("TLB Fill")
+	b	.
+	 nop
+	END(excep_tlbfill)
 
-.balign 0x1000
+LEAF(excep_xtlbfill)
+	DUMP_EXCEP("XTLB Fill")
+	b	.
+	 nop
+	END(excep_xtlbfill)
 
-LEAF(mips_cps_core_entry)
-	/*
-	 * These first several instructions will be patched by cps_smp_setup to load the
-	 * CCA to use into register s0 and GCR base address to register s1.
-	 */
-	.rept   CPS_ENTRY_PATCH_INSNS
-	nop
-	.endr
+LEAF(excep_cache)
+	DUMP_EXCEP("Cache")
+	b	.
+	 nop
+	END(excep_cache)
 
-	.global mips_cps_core_entry_patch_end
-mips_cps_core_entry_patch_end:
+LEAF(excep_genex)
+	DUMP_EXCEP("General")
+	b	.
+	 nop
+	END(excep_genex)
 
-	/* Check whether we're here due to an NMI */
-	mfc0	k0, CP0_STATUS
-	and	k0, k0, ST0_NMI
-	beqz	k0, not_nmi
+LEAF(excep_intex)
+	DUMP_EXCEP("Interrupt")
+	b	.
 	 nop
+	END(excep_intex)
 
-	/* This is an NMI */
-	PTR_LA	k0, nmi_handler
+LEAF(excep_ejtag)
+	PTR_LA	k0, ejtag_debug_handler
 	jr	k0
 	 nop
+	END(excep_ejtag)
+	__FINIT
 
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
@@ -178,49 +188,7 @@ not_nmi:
 	PTR_L	sp, VPEBOOTCFG_SP(v1)
 	jr	t1
 	 nop
-	END(mips_cps_core_entry)
-
-.org 0x200
-LEAF(excep_tlbfill)
-	DUMP_EXCEP("TLB Fill")
-	b	.
-	 nop
-	END(excep_tlbfill)
-
-.org 0x280
-LEAF(excep_xtlbfill)
-	DUMP_EXCEP("XTLB Fill")
-	b	.
-	 nop
-	END(excep_xtlbfill)
-
-.org 0x300
-LEAF(excep_cache)
-	DUMP_EXCEP("Cache")
-	b	.
-	 nop
-	END(excep_cache)
-
-.org 0x380
-LEAF(excep_genex)
-	DUMP_EXCEP("General")
-	b	.
-	 nop
-	END(excep_genex)
-
-.org 0x400
-LEAF(excep_intex)
-	DUMP_EXCEP("Interrupt")
-	b	.
-	 nop
-	END(excep_intex)
-
-.org 0x480
-LEAF(excep_ejtag)
-	PTR_LA	k0, ejtag_debug_handler
-	jr	k0
-	 nop
-	END(excep_ejtag)
+	END(mips_cps_core_boot)
 
 LEAF(mips_cps_core_init)
 #ifdef CONFIG_MIPS_MT_SMP
@@ -428,7 +396,7 @@ LEAF(mips_cps_boot_vpes)
 	/* Calculate a pointer to the VPEs struct vpe_boot_config */
 	li	t0, VPEBOOTCFG_SIZE
 	mul	t0, t0, ta1
-	addu	t0, t0, ta3
+	PTR_ADDU t0, t0, ta3
 
 	/* Set the TC restart PC */
 	lw	t1, VPEBOOTCFG_PC(t0)
@@ -603,10 +571,10 @@ dcache_done:
 	lw	$1, TI_CPU(gp)
 	sll	$1, $1, LONGLOG
 	PTR_LA	\dest, __per_cpu_offset
-	addu	$1, $1, \dest
+	PTR_ADDU $1, $1, \dest
 	lw	$1, 0($1)
 	PTR_LA	\dest, cps_cpu_state
-	addu	\dest, \dest, $1
+	PTR_ADDU \dest, \dest, $1
 	.set	pop
 	.endm
 
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index dd55d59b88db..9aad678a32bd 100644
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
@@ -25,7 +26,33 @@
 #include <asm/time.h>
 #include <asm/uasm.h>
 
+#define BEV_VEC_SIZE	0x500
+#define BEV_VEC_ALIGN	0x1000
+
+#define A0		4
+#define A1		5
+#define T9		25
+#define K0		26
+#define K1		27
+
+#define C0_STATUS	12, 0
+#define C0_CAUSE	13, 0
+
+#define ST0_NMI_BIT	19
+#ifdef CONFIG_64BIT
+#define ST0_KX_IF_64	ST0_KX
+#else
+#define ST0_KX_IF_64	0
+#endif
+
+enum label_id {
+	label_not_nmi = 1,
+};
+
+UASM_L_LA(_not_nmi)
+
 static DECLARE_BITMAP(core_power, NR_CPUS);
+static uint32_t core_entry_reg;
 
 struct core_boot_config *mips_cps_core_bootcfg;
 
@@ -34,10 +61,113 @@ static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
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
+	uasm_i_mfc0(&p, K0, C0_STATUS);
+	if (cpu_has_mips_r2_r6)
+		uasm_i_ext(&p, K0, K0, ST0_NMI_BIT, 1);
+	else {
+		uasm_i_srl(&p, K0, K0, ST0_NMI_BIT);
+		uasm_i_andi(&p, K0, K0, 0x1);
+	}
+
+	uasm_il_bnez(&p, &r, K0, label_not_nmi);
+	uasm_i_nop(&p);
+	UASM_i_LA(&p, K0, (long)&nmi_handler);
+
+	uasm_l_not_nmi(&l, p);
+
+	val = CAUSEF_IV;
+	uasm_i_lui(&p, K0, val >> 16);
+	uasm_i_ori(&p, K0, K0, val & 0xffff);
+	uasm_i_mtc0(&p, K0, C0_CAUSE);
+	val = ST0_CU1 | ST0_CU0 | ST0_BEV | ST0_KX_IF_64;
+	uasm_i_lui(&p, K0, val >> 16);
+	uasm_i_ori(&p, K0, K0, val & 0xffff);
+	uasm_i_mtc0(&p, K0, C0_STATUS);
+	uasm_i_ehb(&p);
+	uasm_i_ori(&p, A0, 0, read_c0_config() & CONF_CM_CMASK);
+	UASM_i_LA(&p, A1, (long)mips_gcr_base);
+#if defined(KBUILD_64BIT_SYM32) || defined(CONFIG_32BIT)
+	UASM_i_LA(&p, T9, CKSEG1ADDR(__pa_symbol(mips_cps_core_boot)));
+#else
+	UASM_i_LA(&p, T9, TO_UNCAC(__pa_symbol(mips_cps_core_boot)));
+#endif
+	uasm_i_jr(&p, T9);
+	uasm_i_nop(&p);
+
+	uasm_resolve_relocs(relocs, labels);
+
+	return p;
+}
+
+static int __init setup_cps_vecs(void)
+{
+	extern void excep_tlbfill(void);
+	extern void excep_xtlbfill(void);
+	extern void excep_cache(void);
+	extern void excep_genex(void);
+	extern void excep_intex(void);
+	extern void excep_ejtag(void);
+	phys_addr_t cps_vec_pa;
+	void *cps_vec;
+
+	/* Try to allocate in KSEG1 first */
+	cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
+						0x0, KSEGX_SIZE - 1);
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
+	/* We want to ensure cache is clean before writing uncached mem */
+	blast_dcache_range(TO_CAC(cps_vec_pa), TO_CAC(cps_vec_pa) + BEV_VEC_SIZE);
+	bc_wback_inv(TO_CAC(cps_vec_pa), BEV_VEC_SIZE);
+	__sync();
+
+	cps_vec = (void *)TO_UNCAC(cps_vec_pa);
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
+	blast_inv_dcache_range(TO_CAC(cps_vec_pa), TO_CAC(cps_vec_pa) + BEV_VEC_SIZE);
+	bc_inv(TO_CAC(cps_vec_pa), BEV_VEC_SIZE);
+	__sync();
+
+	return 0;
+}
+
 static void __init cps_smp_setup(void)
 {
 	unsigned int nclusters, ncores, nvpes, core_vpes;
-	unsigned long core_entry;
 	int cl, c, v;
 
 	/* Detect & record VPE topology */
@@ -94,10 +224,11 @@ static void __init cps_smp_setup(void)
 	/* Make core 0 coherent with everything */
 	write_gcr_cl_coherence(0xff);
 
-	if (mips_cm_revision() >= CM_REV_CM3) {
-		core_entry = CKSEG1ADDR((unsigned long)mips_cps_core_entry);
-		write_gcr_bev_base(core_entry);
-	}
+	if (setup_cps_vecs())
+		pr_err("Failed to setup CPS vectors\n");
+
+	if (core_entry_reg && mips_cm_revision() >= CM_REV_CM3)
+		write_gcr_bev_base(core_entry_reg);
 
 #ifdef CONFIG_MIPS_MT_FPAFF
 	/* If we have an FPU, enroll ourselves in the FPU-full mask */
@@ -110,10 +241,14 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
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
@@ -145,20 +280,6 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
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
 
 	/* Allocate core boot configuration structs */
 	ncores = mips_cps_numcores(0);
@@ -213,7 +334,7 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
-	write_gcr_co_reset_base(CKSEG1ADDR((unsigned long)mips_cps_core_entry));
+	write_gcr_co_reset_base(core_entry_reg);
 
 	/* Ensure its coherency is disabled */
 	write_gcr_co_coherence(0);
@@ -290,7 +411,6 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 	unsigned vpe_id = cpu_vpe_id(&cpu_data[cpu]);
 	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
 	struct vpe_boot_config *vpe_cfg = &core_cfg->vpe_config[vpe_id];
-	unsigned long core_entry;
 	unsigned int remote;
 	int err;
 
@@ -314,8 +434,7 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 	if (cpu_has_vp) {
 		mips_cm_lock_other(0, core, vpe_id, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
-		core_entry = CKSEG1ADDR((unsigned long)mips_cps_core_entry);
-		write_gcr_co_reset_base(core_entry);
+		write_gcr_co_reset_base(core_entry_reg);
 		mips_cm_unlock_other();
 	}
 
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 230728d76d11..ea59d321f713 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -74,6 +74,8 @@
 
 #include "access-helper.h"
 
+#define MAX(a, b) ((a) >= (b) ? (a) : (b))
+
 extern void check_wait(void);
 extern asmlinkage void rollback_handle_int(void);
 extern asmlinkage void handle_int(void);
-- 
2.34.1

