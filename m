Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F667B8491
	for <lists+linux-mips@lfdr.de>; Wed,  4 Oct 2023 18:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243258AbjJDQK6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Oct 2023 12:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243065AbjJDQK4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Oct 2023 12:10:56 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C980DA7;
        Wed,  4 Oct 2023 09:10:50 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EA5C60007;
        Wed,  4 Oct 2023 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696435849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AdS05Ve7lxnDwdF1Yquti+PQQLRtSRrj8ca5Ty3LXvY=;
        b=cqOuAnAGGgrCcIVKDvmLu1lxyQCMpRYqkwrc3k7DLT7hZbNC2ZL3YGZaGMZ/iVL9WSU5pC
        //IznqjmCXq/VBVvor0Z/D0Tqu0M9tHYKJ9rcFNZ42VlWstgbPOzg7NFkHrVgDS2JpuNIM
        z9Mju2OoJIVlUGKbcT7q61MYT6w38/vhHlWEiK+a70nfz830F20F+5tRzMHmoUXMXmxKvs
        1ZWbcAuBIZPMIAIOUSM29IA80rhhc3NBRBmTexhi94Oj8AODnCOneT3XULZRJsY5veMoak
        XCy3oCBnjFRuq0xbyzDJIGs1hEIK/zr7H/SXViJhZ5MqBAG+lfQyqrRKUeuXTg==
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 02/11] MIPS: use virtual addresses from xkphys for MIPS64
Date:   Wed,  4 Oct 2023 18:10:29 +0200
Message-Id: <20231004161038.2818327-3-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004161038.2818327-1-gregory.clement@bootlin.com>
References: <20231004161038.2818327-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>

Now 64-bit MIPS uses 32-bit compatible segments KSEG0 and KSEG1
to trivially map first 1/2 GByte of physical memory. This memory
used to run kernel. This mean, one should have memory installed
in this area in order for Linux to work.

Kconfig CONFIG_USE_XKPHYS introduced; it adds support for kernel
to use virtual addresses from the XKPHYS segment for both cached
and uncached access. XKPHYS allows to access 2^48 bytes of
memory, thus allowing kernel to work with any memory
configuration.

MIPS CPU sets KX bit in the CP0 status register at reset
if RESET_BASE_MODE (BIT 1) set in the GCR_CL_RESET_BASE.

Reset vector should fit into 32-bit. If reset vector put outside of
KSEG1, BIT(1) should be set in this value.

IRQ handler for CPU updated to generate 64-bit address for jump

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig                 | 15 +++++++++++++
 arch/mips/Makefile                |  4 ++++
 arch/mips/generic/Platform        |  5 +++++
 arch/mips/include/asm/addrspace.h | 12 ++++++++--
 arch/mips/include/asm/mips-cm.h   |  1 +
 arch/mips/include/asm/page.h      | 10 +++++++++
 arch/mips/include/asm/vga.h       |  4 ++++
 arch/mips/kernel/cps-vec.S        |  8 +++++++
 arch/mips/kernel/genex.S          | 14 ++++++++++++
 arch/mips/kernel/smp-cps.c        | 37 +++++++++++++++++++++++--------
 arch/mips/kernel/traps.c          | 32 +++++++++++++++++++++++---
 arch/mips/lib/uncached.c          | 10 +++++++++
 arch/mips/mm/init.c               |  4 ++--
 13 files changed, 140 insertions(+), 16 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index bc8421859006..92832bbcca5d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2026,6 +2026,21 @@ config 64BIT
 
 endchoice
 
+config USE_XKPHYS
+	bool "use virtual address from XKPHYS"
+	depends on 64BIT
+	default n
+	help
+	 By default, MIPS uses 32-bit compatible segments KSEG0 and KSEG1
+	 to trivially map first 1/2 GByte of physical memory. This mean,
+	 one should have memory installed in this area in order for Linux to
+	 work. With this option selected, kernel uses virtual addresses from
+	 the XKPHYS segment for both cached and uncached access. XKPHYS allows
+	 to access 2^48 bytes of memory, thus allowing to work with any memory
+	 configuration.
+
+	 Say N if not sure
+
 config MIPS_VA_BITS_48
 	bool "48 bits virtual memory"
 	depends on 64BIT
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index f49807e1f19b..544ee8427cab 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -303,6 +303,10 @@ ifdef CONFIG_64BIT
     endif
   endif
 
+  ifdef CONFIG_USE_XKPHYS
+      KBUILD_SYM32 = n
+  endif
+
   ifeq ($(KBUILD_SYM32), y)
     cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
   else
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 0c03623f3897..2be9947814ad 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -12,7 +12,12 @@
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
+ifndef (CONFIG_USE_XKPHYS)
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
+else
+load-$(CONFIG_MIPS_GENERIC)	+= 0xa800000080100000
+endif
+
 all-$(CONFIG_MIPS_GENERIC)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c60a065..8dc500d8e66d 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -65,10 +65,15 @@
 #define XKSSEG			_CONST64_(0x4000000000000000)
 #define XKPHYS			_CONST64_(0x8000000000000000)
 #define XKSEG			_CONST64_(0xc000000000000000)
+#if !defined(CONFIG_USE_XKPHYS)
 #define CKSEG0			_CONST64_(0xffffffff80000000)
 #define CKSEG1			_CONST64_(0xffffffffa0000000)
 #define CKSSEG			_CONST64_(0xffffffffc0000000)
 #define CKSEG3			_CONST64_(0xffffffffe0000000)
+#else
+#define CKSEG0			XKPHYS_CM_CACHED
+#define CKSEG1			XKPHYS_CM_UNCACHED
+#endif /* !defined(CONFIG_USE_XKPHYS) */
 
 #define CKSEG0ADDR(a)		(CPHYSADDR(a) | CKSEG0)
 #define CKSEG1ADDR(a)		(CPHYSADDR(a) | CKSEG1)
@@ -126,8 +131,11 @@
 #define PHYS_TO_XKSEG_UNCACHED(p)	PHYS_TO_XKPHYS(K_CALG_UNCACHED, (p))
 #define PHYS_TO_XKSEG_CACHED(p)		PHYS_TO_XKPHYS(K_CALG_COH_SHAREABLE, (p))
 #define XKPHYS_TO_PHYS(p)		((p) & TO_PHYS_MASK)
-#define PHYS_TO_XKPHYS(cm, a)		(XKPHYS | (_ACAST64_(cm) << 59) | (a))
-
+#define XKPHYS_CM(cm)			(XKPHYS | (_ACAST64_(cm) << 59))
+#define PHYS_TO_XKPHYS(cm, a)		(XKPHYS_CM(cm) | (a))
+#define XKPHYS_CM_CACHED		(XKPHYS_CM(K_CALG_COH_SHAREABLE))
+#define XKPHYS_CM_UNCACHED		(XKPHYS_CM(K_CALG_UNCACHED))
+#define IS_XKPHYS(a)			(((a) >> 62) == 2)
 /*
  * The ultimate limited of the 64-bit MIPS architecture:  2 bits for selecting
  * the region, 3 bits for the CCA mode.  This leaves 59 bits of which the
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
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 5978a8dfb917..53b8306da571 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -176,7 +176,11 @@ static inline unsigned long ___pa(unsigned long x)
 		 * the compatibility segements ckseg0 or ckseg1, or it may
 		 * be in xkphys.
 		 */
+#if defined(CONFIG_USE_XKPHYS)
+		return XPHYSADDR(x);
+#else
 		return x < CKSEG0 ? XPHYSADDR(x) : CPHYSADDR(x);
+#endif
 	}
 
 	if (!IS_ENABLED(CONFIG_EVA)) {
@@ -196,7 +200,11 @@ static inline unsigned long ___pa(unsigned long x)
 	return x - PAGE_OFFSET + PHYS_OFFSET;
 }
 #define __pa(x)		___pa((unsigned long)(x))
+#if IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_USE_XKPHYS)
+#define __va(x)		((void *)PHYS_TO_XKSEG_CACHED(x))
+#else
 #define __va(x)		((void *)((unsigned long)(x) + PAGE_OFFSET - PHYS_OFFSET))
+#endif
 #include <asm/io.h>
 
 /*
@@ -239,6 +247,8 @@ static inline unsigned long kaslr_offset(void)
 	return __kaslr_offset;
 }
 
+#define UNCAC_ADDR(addr)       (UNCAC_BASE + __pa(addr))
+
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/mips/include/asm/vga.h b/arch/mips/include/asm/vga.h
index 0136e0366698..e338e57d0784 100644
--- a/arch/mips/include/asm/vga.h
+++ b/arch/mips/include/asm/vga.h
@@ -16,7 +16,11 @@
  *	access the videoram directly without any black magic.
  */
 
+#if defined(CONFIG_USE_XKPHYS)
+#define VGA_MAP_MEM(x, s)	UNCAC_ADDR(0x10000000L + (unsigned long)(x))
+#else
 #define VGA_MAP_MEM(x, s)	CKSEG1ADDR(0x10000000L + (unsigned long)(x))
+#endif
 
 #define vga_readb(x)	(*(x))
 #define vga_writeb(x, y)	(*(y) = (x))
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 64ecfdac6580..541f31a43a7f 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -554,7 +554,11 @@ LEAF(mips_cps_cache_init)
 	mul	t1, t1, t0
 	mul	t1, t1, t2
 
+#if defined(CONFIG_USE_XKPHYS)
+	PTR_LI	a0, XKPHYS_CM_CACHED
+#else
 	li	a0, CKSEG0
+#endif
 	PTR_ADD	a1, a0, t1
 1:	cache	Index_Store_Tag_I, 0(a0)
 	PTR_ADD	a0, a0, t0
@@ -581,7 +585,11 @@ icache_done:
 	mul	t1, t1, t0
 	mul	t1, t1, t2
 
+#if defined(CONFIG_USE_XKPHYS)
+	PTR_LI	a0, XKPHYS_CM_CACHED
+#else
 	li	a0, CKSEG0
+#endif
 	PTR_ADDU a1, a0, t1
 	PTR_SUBU a1, a1, t0
 1:	cache	Index_Store_Tag_D, 0(a0)
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index b6de8e88c1bd..a002058e1838 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -272,11 +272,25 @@ NESTED(except_vec_vi, 0, sp)
 	.set	push
 	.set	noreorder
 	PTR_LA	v1, except_vec_vi_handler
+#if defined(CONFIG_USE_XKPHYS)
+FEXPORT(except_vec_vi_63_48)
+	lui	v0, 0		/* Patched - bits 63:48 */
+FEXPORT(except_vec_vi_47_32)
+	ori	v0, 0		/* Patched - bits 47:32 */
+	dsll	v0, v0, 0x10
+FEXPORT(except_vec_vi_31_16)
+	ori	v0, 0		/* Patched - bits 31:16 */
+	dsll	v0, v0, 0x10
+	jr	v1
+FEXPORT(except_vec_vi_15_0)
+	ori	v0, 0		/* Patched - bits 15:0 */
+#else /* defined(CONFIG_USE_XKPHYS) */
 FEXPORT(except_vec_vi_lui)
 	lui	v0, 0		/* Patched */
 	jr	v1
 FEXPORT(except_vec_vi_ori)
 	 ori	v0, 0		/* Patched */
+#endif /* defined(CONFIG_USE_XKPHYS) */
 	.set	pop
 	END(except_vec_vi)
 EXPORT(except_vec_vi_end)
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index dd55d59b88db..47e76722a306 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -34,10 +34,33 @@ static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 	return min(smp_max_threads, mips_cps_numvps(cluster, core));
 }
 
+/**
+ * plat_core_entry - query reset vector for NMI/reset
+ *
+ * Returns low 32 bits of the reset vector
+ *
+ * This is used to fill 2 registers:
+ * - BEV Base (GCR_BEV_BASE) Offset: 0x0680
+ * - VP Local Reset Exception Base (GCR_CL_RESET_BASE,GCR_CO_RESET_BASE)
+ *   Offset: 0x0020 (0x2020 relative to GCR_BASE_ADDR)
+ *
+ * In both registers, BIT(1) should be set in case it uses address in XKPHYS
+ * (as opposed to KSEG1). This bit defined as CM_GCR_Cx_RESET_BASE_MODE,
+ * using it unconditionally because for GCR_BEV_BASE its value is the same
+ */
+static u32 plat_core_entry(void)
+{
+#if defined(CONFIG_USE_XKPHYS)
+	return (UNCAC_ADDR(mips_cps_core_entry) & 0xffffffff)
+			| CM_GCR_Cx_RESET_BASE_MODE;
+#else
+	return CKSEG1ADDR((unsigned long)mips_cps_core_entry);
+#endif
+}
+
 static void __init cps_smp_setup(void)
 {
 	unsigned int nclusters, ncores, nvpes, core_vpes;
-	unsigned long core_entry;
 	int cl, c, v;
 
 	/* Detect & record VPE topology */
@@ -94,10 +117,8 @@ static void __init cps_smp_setup(void)
 	/* Make core 0 coherent with everything */
 	write_gcr_cl_coherence(0xff);
 
-	if (mips_cm_revision() >= CM_REV_CM3) {
-		core_entry = CKSEG1ADDR((unsigned long)mips_cps_core_entry);
-		write_gcr_bev_base(core_entry);
-	}
+	if (mips_cm_revision() >= CM_REV_CM3)
+		write_gcr_bev_base(plat_core_entry());
 
 #ifdef CONFIG_MIPS_MT_FPAFF
 	/* If we have an FPU, enroll ourselves in the FPU-full mask */
@@ -213,7 +234,7 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
-	write_gcr_co_reset_base(CKSEG1ADDR((unsigned long)mips_cps_core_entry));
+	write_gcr_co_reset_base(plat_core_entry());
 
 	/* Ensure its coherency is disabled */
 	write_gcr_co_coherence(0);
@@ -290,7 +311,6 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 	unsigned vpe_id = cpu_vpe_id(&cpu_data[cpu]);
 	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
 	struct vpe_boot_config *vpe_cfg = &core_cfg->vpe_config[vpe_id];
-	unsigned long core_entry;
 	unsigned int remote;
 	int err;
 
@@ -314,8 +334,7 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 	if (cpu_has_vp) {
 		mips_cm_lock_other(0, core, vpe_id, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
-		core_entry = CKSEG1ADDR((unsigned long)mips_cps_core_entry);
-		write_gcr_co_reset_base(core_entry);
+		write_gcr_co_reset_base(plat_core_entry());
 		mips_cm_unlock_other();
 	}
 
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 246c6a6b0261..875594843626 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2091,11 +2091,20 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 		 * If no shadow set is selected then use the default handler
 		 * that does normal register saving and standard interrupt exit
 		 */
-		extern const u8 except_vec_vi[], except_vec_vi_lui[];
-		extern const u8 except_vec_vi_ori[], except_vec_vi_end[];
+		extern const u8 except_vec_vi[], except_vec_vi_end[];
 		extern const u8 rollback_except_vec_vi[];
 		const u8 *vec_start = using_rollback_handler() ?
 				      rollback_except_vec_vi : except_vec_vi;
+		const int handler_len = except_vec_vi_end - vec_start;
+#if defined(CONFIG_USE_XKPHYS)
+		extern const u8 except_vec_vi_63_48[], except_vec_vi_47_32[];
+		extern const u8 except_vec_vi_31_16[], except_vec_vi_15_0[];
+		const int offset_63_48 = except_vec_vi_63_48 - vec_start;
+		const int offset_47_32 = except_vec_vi_47_32 - vec_start;
+		const int offset_31_16 = except_vec_vi_31_16 - vec_start;
+		const int offset_15_0  = except_vec_vi_15_0  - vec_start;
+#else /* defined(CONFIG_USE_XKPHYS) */
+		extern const u8 except_vec_vi_lui[], except_vec_vi_ori[];
 #if defined(CONFIG_CPU_MICROMIPS) || defined(CONFIG_CPU_BIG_ENDIAN)
 		const int lui_offset = except_vec_vi_lui - vec_start + 2;
 		const int ori_offset = except_vec_vi_ori - vec_start + 2;
@@ -2103,7 +2112,7 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 		const int lui_offset = except_vec_vi_lui - vec_start;
 		const int ori_offset = except_vec_vi_ori - vec_start;
 #endif
-		const int handler_len = except_vec_vi_end - vec_start;
+#endif /* defined(CONFIG_USE_XKPHYS) */
 
 		if (handler_len > VECTORSPACING) {
 			/*
@@ -2119,10 +2128,21 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 #else
 				handler_len);
 #endif
+#if defined(CONFIG_USE_XKPHYS)
+		h = (u16 *)(b + offset_63_48);
+		*h = (handler >> 48) & 0xffff;
+		h = (u16 *)(b + offset_47_32);
+		*h = (handler >> 32) & 0xffff;
+		h = (u16 *)(b + offset_31_16);
+		*h = (handler >> 16) & 0xffff;
+		h = (u16 *)(b + offset_15_0);
+		*h = (handler >> 0) & 0xffff;
+#else /* defined(CONFIG_USE_XKPHYS) */
 		h = (u16 *)(b + lui_offset);
 		*h = (handler >> 16) & 0xffff;
 		h = (u16 *)(b + ori_offset);
 		*h = (handler & 0xffff);
+#endif /* defined(CONFIG_USE_XKPHYS) */
 		local_flush_icache_range((unsigned long)b,
 					 (unsigned long)(b+handler_len));
 	}
@@ -2332,7 +2352,11 @@ static const char panic_null_cerr[] =
 void set_uncached_handler(unsigned long offset, void *addr,
 	unsigned long size)
 {
+#if IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_USE_XKPHYS)
+	unsigned long uncached_ebase = UNCAC_ADDR(ebase);
+#else
 	unsigned long uncached_ebase = CKSEG1ADDR(ebase);
+#endif
 
 	if (!addr)
 		panic(panic_null_cerr);
@@ -2384,9 +2408,11 @@ void __init trap_init(void)
 		 * EVA is special though as it allows segments to be rearranged
 		 * and to become uncached during cache error handling.
 		 */
+#if !defined(CONFIG_USE_XKPHYS)
 		if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
 			ebase = CKSEG0ADDR(ebase_pa);
 		else
+#endif
 			ebase = (unsigned long)phys_to_virt(ebase_pa);
 	}
 
diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
index f80a67c092b6..8a78348a2dd7 100644
--- a/arch/mips/lib/uncached.c
+++ b/arch/mips/lib/uncached.c
@@ -44,6 +44,10 @@ unsigned long run_uncached(void *func)
 
 	__asm__("move %0, $sp" : "=r" (sp));
 
+#if defined(CONFIG_USE_XKPHYS)
+	if (IS_XKPHYS(sp))
+		usp = UNCAC_ADDR(sp);
+#else /* defined(CONFIG_USE_XKPHYS) */
 	if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
 		usp = CKSEG1ADDR(sp);
 #ifdef CONFIG_64BIT
@@ -52,10 +56,15 @@ unsigned long run_uncached(void *func)
 		usp = PHYS_TO_XKPHYS(K_CALG_UNCACHED,
 				     XKPHYS_TO_PHYS((long long)sp));
 #endif
+#endif /* defined(CONFIG_USE_XKPHYS) */
 	else {
 		BUG();
 		usp = sp;
 	}
+#if defined(CONFIG_USE_XKPHYS)
+	if (IS_XKPHYS(lfunc))
+		ufunc = UNCAC_ADDR(lfunc);
+#else /* defined(CONFIG_USE_XKPHYS) */
 	if (lfunc >= (long)CKSEG0 && lfunc < (long)CKSEG2)
 		ufunc = CKSEG1ADDR(lfunc);
 #ifdef CONFIG_64BIT
@@ -64,6 +73,7 @@ unsigned long run_uncached(void *func)
 		ufunc = PHYS_TO_XKPHYS(K_CALG_UNCACHED,
 				       XKPHYS_TO_PHYS((long long)lfunc));
 #endif
+#endif /* defined(CONFIG_USE_XKPHYS) */
 	else {
 		BUG();
 		ufunc = lfunc;
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 5dcb525a8995..eb57283ec4e0 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -427,7 +427,7 @@ void __init paging_init(void)
 	free_area_init(max_zone_pfns);
 }
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && !defined(CONFIG_USE_XKPHYS)
 static struct kcore_list kcore_kseg0;
 #endif
 
@@ -470,7 +470,7 @@ void __init mem_init(void)
 	setup_zero_pages();	/* Setup zeroed pages.  */
 	mem_init_free_highmem();
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && !defined(CONFIG_USE_XKPHYS)
 	if ((unsigned long) &_text > (unsigned long) CKSEG0)
 		/* The -4 is a hack so that user tools don't have to handle
 		   the overflow.  */
-- 
2.40.1

