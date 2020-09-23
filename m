Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9642756CF
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 13:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgIWLET (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 07:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWLEO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 07:04:14 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868E3C0613CE;
        Wed, 23 Sep 2020 04:04:13 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 57A85200D7;
        Wed, 23 Sep 2020 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1600859053; bh=8asDqMFGnyHv+zaMMoQjmPo/q0ysWR102+WRhXA5N/A=;
        h=From:To:Cc:Subject:Date:From;
        b=Zm550fZsKZy9av+LEG8w6Y99mHqMeialzLKz8FUe/YnJ7A1zl781sNByZ8HZtYG0h
         bGzPLBd1O7QWwL8M8OWi6jPuhZ/tNxB2fr8lG7ESv3IrHK47xOq3cjldmPtCyEoQeZ
         j/Z/w7eTY2kaKG8fbiurvcVfH2EQ/Yrdm1M5jl+f+aSorWSChzfKT8EJrz2i2o+dUS
         N+6/0OiY9HH/1KhYHYguCPLH9jj/wda/yxmETNEVeBoV4sW1Ho1LFCaQ+JgYDb76uL
         qDj+MeqVk9ZRoVo3b+Ylj+DkVwXuqQsKpopycUqUL0RXQau7H2Ozcg8zx/l7TOdYje
         7gJ/i0R1oQVcA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, Paul Cercueil <paul@crapouillou.net>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Convert cpuinfo options field to bitops based
Date:   Wed, 23 Sep 2020 19:03:36 +0800
Message-Id: <20200923110352.58386-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

options field of cpuinfo_mips was a single variable, it means
we can never have more than 64 options, while the diversity of MIPS
decided there will be more options.

Convert options to bitops based so we don't have to worry number
of options anymore.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu-features.h |  48 ++--
 arch/mips/include/asm/cpu-info.h     |  22 +-
 arch/mips/include/asm/cpu.h          | 142 +++++-----
 arch/mips/kernel/cpu-probe.c         | 371 ++++++++++++++++-----------
 arch/mips/kernel/proc.c              |   2 +-
 arch/mips/kernel/watch.c             |   2 +-
 arch/mips/loongson64/cpucfg-emul.c   |   6 +-
 arch/mips/mm/c-octeon.c              |   6 +-
 arch/mips/mm/c-r4k.c                 |  37 +--
 arch/mips/mm/sc-mips.c               |   2 +-
 arch/mips/mm/tlbex.c                 |   2 +-
 11 files changed, 364 insertions(+), 276 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index aec458eee2a5..70666773591f 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -16,7 +16,7 @@
 
 #define __ase(ase)			(cpu_data[0].ases & (ase))
 #define __isa(isa)			(cpu_data[0].isa_level & (isa))
-#define __opt(opt)			(cpu_data[0].options & (opt))
+#define __opt(opt)			(test_cpu_opt(&boot_cpu_data, opt))
 
 /*
  * Check if MIPS_ISA_REV is >= isa *and* an option or ASE is detected during
@@ -129,8 +129,8 @@
 /* Don't override `cpu_has_fpu' to 1 or the "nofpu" option won't work.  */
 #ifndef cpu_has_fpu
 # ifdef CONFIG_MIPS_FP_SUPPORT
-#  define cpu_has_fpu		(current_cpu_data.options & MIPS_CPU_FPU)
-#  define raw_cpu_has_fpu	(raw_current_cpu_data.options & MIPS_CPU_FPU)
+#  define cpu_has_fpu		test_cpu_opt(&current_cpu_data, MIPS_CPU_FPU)
+#  define raw_cpu_has_fpu	test_cpu_opt(&raw_current_cpu_data, MIPS_CPU_FPU)
 # else
 #  define cpu_has_fpu		0
 #  define raw_cpu_has_fpu	0
@@ -652,6 +652,9 @@
 /*
  * Guest capabilities
  */
+
+#define __gopt(opt)			(test_cpu_gopt(&boot_cpu_data, opt))
+
 #ifndef cpu_guest_has_conf1
 #define cpu_guest_has_conf1	(cpu_data[0].guest.conf & (1 << 1))
 #endif
@@ -674,31 +677,31 @@
 #define cpu_guest_has_conf7	(cpu_data[0].guest.conf & (1 << 7))
 #endif
 #ifndef cpu_guest_has_fpu
-#define cpu_guest_has_fpu	(cpu_data[0].guest.options & MIPS_CPU_FPU)
+#define cpu_guest_has_fpu	__gopt(MIPS_CPU_FPU)
 #endif
 #ifndef cpu_guest_has_watch
-#define cpu_guest_has_watch	(cpu_data[0].guest.options & MIPS_CPU_WATCH)
+#define cpu_guest_has_watch	__gopt(MIPS_CPU_WATCH)
 #endif
 #ifndef cpu_guest_has_contextconfig
-#define cpu_guest_has_contextconfig (cpu_data[0].guest.options & MIPS_CPU_CTXTC)
+#define cpu_guest_has_contextconfig __gopt(MIPS_CPU_CTXTC)
 #endif
 #ifndef cpu_guest_has_segments
-#define cpu_guest_has_segments	(cpu_data[0].guest.options & MIPS_CPU_SEGMENTS)
+#define cpu_guest_has_segments	__gopt(MIPS_CPU_SEGMENTS)
 #endif
 #ifndef cpu_guest_has_badinstr
-#define cpu_guest_has_badinstr	(cpu_data[0].guest.options & MIPS_CPU_BADINSTR)
+#define cpu_guest_has_badinstr	__gopt(MIPS_CPU_BADINSTR)
 #endif
 #ifndef cpu_guest_has_badinstrp
-#define cpu_guest_has_badinstrp	(cpu_data[0].guest.options & MIPS_CPU_BADINSTRP)
+#define cpu_guest_has_badinstrp	__gopt(MIPS_CPU_BADINSTRP)
 #endif
 #ifndef cpu_guest_has_htw
-#define cpu_guest_has_htw	(cpu_data[0].guest.options & MIPS_CPU_HTW)
+#define cpu_guest_has_htw	__gopt(MIPS_CPU_HTW)
 #endif
 #ifndef cpu_guest_has_ldpte
-#define cpu_guest_has_ldpte	(cpu_data[0].guest.options & MIPS_CPU_LDPTE)
+#define cpu_guest_has_ldpte	__gopt(MIPS_CPU_LDPTE)
 #endif
 #ifndef cpu_guest_has_mvh
-#define cpu_guest_has_mvh	(cpu_data[0].guest.options & MIPS_CPU_MVH)
+#define cpu_guest_has_mvh	__gopt(MIPS_CPU_MVH)
 #endif
 #ifndef cpu_guest_has_msa
 #define cpu_guest_has_msa	(cpu_data[0].guest.ases & MIPS_ASE_MSA)
@@ -707,38 +710,41 @@
 #define cpu_guest_has_kscr(n)	(cpu_data[0].guest.kscratch_mask & (1u << (n)))
 #endif
 #ifndef cpu_guest_has_rw_llb
-#define cpu_guest_has_rw_llb	(cpu_has_mips_r6 || (cpu_data[0].guest.options & MIPS_CPU_RW_LLB))
+#define cpu_guest_has_rw_llb	(cpu_has_mips_r6 || __gopt(MIPS_CPU_RW_LLB))
 #endif
 #ifndef cpu_guest_has_perf
-#define cpu_guest_has_perf	(cpu_data[0].guest.options & MIPS_CPU_PERF)
+#define cpu_guest_has_perf	__gopt(MIPS_CPU_PERF)
 #endif
 #ifndef cpu_guest_has_maar
-#define cpu_guest_has_maar	(cpu_data[0].guest.options & MIPS_CPU_MAAR)
+#define cpu_guest_has_maar	__gopt(MIPS_CPU_MAAR)
 #endif
 #ifndef cpu_guest_has_userlocal
-#define cpu_guest_has_userlocal	(cpu_data[0].guest.options & MIPS_CPU_ULRI)
+#define cpu_guest_has_userlocal	__gopt(MIPS_CPU_ULRI)
 #endif
 
 /*
  * Guest dynamic capabilities
  */
+
+#define __gopt_dyn(opt)		(test_cpu_gopt_dyn(&boot_cpu_data, opt))
+
 #ifndef cpu_guest_has_dyn_fpu
-#define cpu_guest_has_dyn_fpu	(cpu_data[0].guest.options_dyn & MIPS_CPU_FPU)
+#define cpu_guest_has_dyn_fpu	__gopt_dyn(MIPS_CPU_FPU)
 #endif
 #ifndef cpu_guest_has_dyn_watch
-#define cpu_guest_has_dyn_watch	(cpu_data[0].guest.options_dyn & MIPS_CPU_WATCH)
+#define cpu_guest_has_dyn_watch	__gopt_dyn(MIPS_CPU_WATCH)
 #endif
 #ifndef cpu_guest_has_dyn_contextconfig
-#define cpu_guest_has_dyn_contextconfig (cpu_data[0].guest.options_dyn & MIPS_CPU_CTXTC)
+#define cpu_guest_has_dyn_contextconfig __gopt_dyn(MIPS_CPU_CTXTC)
 #endif
 #ifndef cpu_guest_has_dyn_perf
-#define cpu_guest_has_dyn_perf	(cpu_data[0].guest.options_dyn & MIPS_CPU_PERF)
+#define cpu_guest_has_dyn_perf	__gopt_dyn(MIPS_CPU_PERF)
 #endif
 #ifndef cpu_guest_has_dyn_msa
 #define cpu_guest_has_dyn_msa	(cpu_data[0].guest.ases_dyn & MIPS_ASE_MSA)
 #endif
 #ifndef cpu_guest_has_dyn_maar
-#define cpu_guest_has_dyn_maar	(cpu_data[0].guest.options_dyn & MIPS_CPU_MAAR)
+#define cpu_guest_has_dyn_maar	__gopt_dyn(MIPS_CPU_MAAR)
 #endif
 
 #endif /* __ASM_CPU_FEATURES_H */
diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index a600670d00e9..284cf209c0d1 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -15,6 +15,7 @@
 #include <linux/cache.h>
 #include <linux/types.h>
 
+#include <asm/cpu.h>
 #include <asm/mipsregs.h>
 
 /*
@@ -32,8 +33,8 @@ struct cache_desc {
 struct guest_info {
 	unsigned long		ases;
 	unsigned long		ases_dyn;
-	unsigned long long	options;
-	unsigned long long	options_dyn;
+	unsigned long long	options[MIPS_CPU_OPTS_ULL_N];
+	unsigned long long	options_dyn[MIPS_CPU_OPTS_ULL_N];
 	int			tlbsize;
 	u8			conf;
 	u8			kscratch_mask;
@@ -59,7 +60,7 @@ struct cpuinfo_mips {
 	 * Capability and feature descriptor structure for MIPS CPU
 	 */
 	unsigned long		ases;
-	unsigned long long	options;
+	unsigned long long	options[MIPS_CPU_OPTS_ULL_N];
 	unsigned int		udelay_val;
 	unsigned int		processor_id;
 	unsigned int		fpu_id;
@@ -121,6 +122,21 @@ extern struct cpuinfo_mips cpu_data[];
 #define raw_current_cpu_data cpu_data[raw_smp_processor_id()]
 #define boot_cpu_data cpu_data[0]
 
+#define test_cpu_opt(c, bit)						\
+	 test_bit(bit, (unsigned long *)&((c)->options))
+#define set_cpu_opt(c, bit)	set_bit(bit, (unsigned long *)&((c)->options))
+#define clear_cpu_opt(c, bit)	clear_bit(bit, (unsigned long *)&((c)->options))
+
+#define test_cpu_gopt(c, bit)						\
+	 test_bit(bit, (unsigned long *)(&(c)->guest.options))
+#define set_cpu_gopt(c, bit)	set_bit(bit, (unsigned long *)&((c)->guest.options))
+#define clear_cpu_gopt(c, bit)	clear_bit(bit, (unsigned long *)&((c)->guest.options))
+
+#define test_cpu_gopt_dyn(c, bit)						\
+	 test_bit(bit, (unsigned long *)&((c)->guest.options_dyn))
+#define set_cpu_gopt_dyn(c, bit)	set_bit(bit, (unsigned long *)&((c)->guest.options_dyn))
+#define clear_cpu_gopt_dyn(c, bit)	clear_bit(bit, (unsigned long *)&((c)->guest.options_dyn))
+
 extern void cpu_probe(void);
 extern void cpu_report(void);
 
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 854e1b44254b..96595a8e7433 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -335,8 +335,6 @@ enum cpu_type_enum {
 	CPU_LAST
 };
 
-#endif /* !__ASSEMBLY */
-
 /*
  * ISA Level encodings
  *
@@ -363,73 +361,77 @@ enum cpu_type_enum {
 /*
  * CPU Option encodings
  */
-#define MIPS_CPU_TLB		BIT_ULL( 0)	/* CPU has TLB */
-#define MIPS_CPU_4KEX		BIT_ULL( 1)	/* "R4K" exception model */
-#define MIPS_CPU_3K_CACHE	BIT_ULL( 2)	/* R3000-style caches */
-#define MIPS_CPU_4K_CACHE	BIT_ULL( 3)	/* R4000-style caches */
-#define MIPS_CPU_TX39_CACHE	BIT_ULL( 4)	/* TX3900-style caches */
-#define MIPS_CPU_FPU		BIT_ULL( 5)	/* CPU has FPU */
-#define MIPS_CPU_32FPR		BIT_ULL( 6)	/* 32 dbl. prec. FP registers */
-#define MIPS_CPU_COUNTER	BIT_ULL( 7)	/* Cycle count/compare */
-#define MIPS_CPU_WATCH		BIT_ULL( 8)	/* watchpoint registers */
-#define MIPS_CPU_DIVEC		BIT_ULL( 9)	/* dedicated interrupt vector */
-#define MIPS_CPU_VCE		BIT_ULL(10)	/* virt. coherence conflict possible */
-#define MIPS_CPU_CACHE_CDEX_P	BIT_ULL(11)	/* Create_Dirty_Exclusive CACHE op */
-#define MIPS_CPU_CACHE_CDEX_S	BIT_ULL(12)	/* ... same for seconary cache ... */
-#define MIPS_CPU_MCHECK		BIT_ULL(13)	/* Machine check exception */
-#define MIPS_CPU_EJTAG		BIT_ULL(14)	/* EJTAG exception */
-#define MIPS_CPU_NOFPUEX	BIT_ULL(15)	/* no FPU exception */
-#define MIPS_CPU_LLSC		BIT_ULL(16)	/* CPU has ll/sc instructions */
-#define MIPS_CPU_INCLUSIVE_CACHES BIT_ULL(17)	/* P-cache subset enforced */
-#define MIPS_CPU_PREFETCH	BIT_ULL(18)	/* CPU has usable prefetch */
-#define MIPS_CPU_VINT		BIT_ULL(19)	/* CPU supports MIPSR2 vectored interrupts */
-#define MIPS_CPU_VEIC		BIT_ULL(20)	/* CPU supports MIPSR2 external interrupt controller mode */
-#define MIPS_CPU_ULRI		BIT_ULL(21)	/* CPU has ULRI feature */
-#define MIPS_CPU_PCI		BIT_ULL(22)	/* CPU has Perf Ctr Int indicator */
-#define MIPS_CPU_RIXI		BIT_ULL(23)	/* CPU has TLB Read/eXec Inhibit */
-#define MIPS_CPU_MICROMIPS	BIT_ULL(24)	/* CPU has microMIPS capability */
-#define MIPS_CPU_TLBINV		BIT_ULL(25)	/* CPU supports TLBINV/F */
-#define MIPS_CPU_SEGMENTS	BIT_ULL(26)	/* CPU supports Segmentation Control registers */
-#define MIPS_CPU_EVA		BIT_ULL(27)	/* CPU supports Enhanced Virtual Addressing */
-#define MIPS_CPU_HTW		BIT_ULL(28)	/* CPU support Hardware Page Table Walker */
-#define MIPS_CPU_RIXIEX		BIT_ULL(29)	/* CPU has unique exception codes for {Read, Execute}-Inhibit exceptions */
-#define MIPS_CPU_MAAR		BIT_ULL(30)	/* MAAR(I) registers are present */
-#define MIPS_CPU_FRE		BIT_ULL(31)	/* FRE & UFE bits implemented */
-#define MIPS_CPU_RW_LLB		BIT_ULL(32)	/* LLADDR/LLB writes are allowed */
-#define MIPS_CPU_LPA		BIT_ULL(33)	/* CPU supports Large Physical Addressing */
-#define MIPS_CPU_CDMM		BIT_ULL(34)	/* CPU has Common Device Memory Map */
-#define MIPS_CPU_BP_GHIST	BIT_ULL(35)	/* R12K+ Branch Prediction Global History */
-#define MIPS_CPU_SP		BIT_ULL(36)	/* Small (1KB) page support */
-#define MIPS_CPU_FTLB		BIT_ULL(37)	/* CPU has Fixed-page-size TLB */
-#define MIPS_CPU_NAN_LEGACY	BIT_ULL(38)	/* Legacy NaN implemented */
-#define MIPS_CPU_NAN_2008	BIT_ULL(39)	/* 2008 NaN implemented */
-#define MIPS_CPU_VP		BIT_ULL(40)	/* MIPSr6 Virtual Processors (multi-threading) */
-#define MIPS_CPU_LDPTE		BIT_ULL(41)	/* CPU has ldpte/lddir instructions */
-#define MIPS_CPU_MVH		BIT_ULL(42)	/* CPU supports MFHC0/MTHC0 */
-#define MIPS_CPU_EBASE_WG	BIT_ULL(43)	/* CPU has EBase.WG */
-#define MIPS_CPU_BADINSTR	BIT_ULL(44)	/* CPU has BadInstr register */
-#define MIPS_CPU_BADINSTRP	BIT_ULL(45)	/* CPU has BadInstrP register */
-#define MIPS_CPU_CTXTC		BIT_ULL(46)	/* CPU has [X]ConfigContext registers */
-#define MIPS_CPU_PERF		BIT_ULL(47)	/* CPU has MIPS performance counters */
-#define MIPS_CPU_GUESTCTL0EXT	BIT_ULL(48)	/* CPU has VZ GuestCtl0Ext register */
-#define MIPS_CPU_GUESTCTL1	BIT_ULL(49)	/* CPU has VZ GuestCtl1 register */
-#define MIPS_CPU_GUESTCTL2	BIT_ULL(50)	/* CPU has VZ GuestCtl2 register */
-#define MIPS_CPU_GUESTID	BIT_ULL(51)	/* CPU uses VZ ASE GuestID feature */
-#define MIPS_CPU_DRG		BIT_ULL(52)	/* CPU has VZ Direct Root to Guest (DRG) */
-#define MIPS_CPU_UFR		BIT_ULL(53)	/* CPU supports User mode FR switching */
-#define MIPS_CPU_SHARED_FTLB_RAM \
-				BIT_ULL(54)	/* CPU shares FTLB RAM with another */
-#define MIPS_CPU_SHARED_FTLB_ENTRIES \
-				BIT_ULL(55)	/* CPU shares FTLB entries with another */
-#define MIPS_CPU_MT_PER_TC_PERF_COUNTERS \
-				BIT_ULL(56)	/* CPU has perf counters implemented per TC (MIPSMT ASE) */
-#define MIPS_CPU_MMID		BIT_ULL(57)	/* CPU supports MemoryMapIDs */
-#define MIPS_CPU_MM_SYSAD	BIT_ULL(58)	/* CPU supports write-through SysAD Valid merge */
-#define MIPS_CPU_MM_FULL	BIT_ULL(59)	/* CPU supports write-through full merge */
-#define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support MAC2008 Fused multiply-add instruction */
-#define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity exception */
-#define MIPS_CPU_GSEXCEX	BIT_ULL(62)	/* CPU has GSExc exception */
-#define MIPS_CPU_EXTIMER	BIT_ULL(63)	/* CPU has External Timer (Loongson) */
+
+enum mips_cpu_options {
+	MIPS_CPU_TLB = 0,	/* CPU has TLB */
+	MIPS_CPU_4KEX,		/* "R4K" exception model */
+	MIPS_CPU_3K_CACHE,	/* R3000-style caches */
+	MIPS_CPU_4K_CACHE,	/* R4000-style caches */
+	MIPS_CPU_TX39_CACHE,	/* TX3900-style caches */
+	MIPS_CPU_FPU,		/* CPU has FPU */
+	MIPS_CPU_32FPR,		/* 32 dbl. prec. FP registers */
+	MIPS_CPU_COUNTER,	/* Cycle count/compare */
+	MIPS_CPU_WATCH,		/* watchpoint registers */
+	MIPS_CPU_DIVEC,		/* dedicated interrupt vector */
+	MIPS_CPU_VCE,		/* virt. coherence conflict possible */
+	MIPS_CPU_CACHE_CDEX_P,	/* Create_Dirty_Exclusive CACHE op */
+	MIPS_CPU_CACHE_CDEX_S,	/* ... same for seconary cache ... */
+	MIPS_CPU_MCHECK,	/* Machine check exception */
+	MIPS_CPU_EJTAG,		/* EJTAG exception */
+	MIPS_CPU_NOFPUEX,	/* no FPU exception */
+	MIPS_CPU_LLSC,		/* CPU has ll/sc instructions */
+	MIPS_CPU_INCLUSIVE_CACHES,	/* P-cache subset enforced */
+	MIPS_CPU_PREFETCH,	/* CPU has usable prefetch */
+	MIPS_CPU_VINT,		/* CPU supports MIPSR2 vectored interrupts */
+	MIPS_CPU_VEIC,		/* CPU supports MIPSR2 external interrupt controller mode */
+	MIPS_CPU_ULRI,		/* CPU has ULRI feature */
+	MIPS_CPU_PCI,		/* CPU has Perf Ctr Int indicator */
+	MIPS_CPU_RIXI,		/* CPU has TLB Read/eXec Inhibit */
+	MIPS_CPU_MICROMIPS,	/* CPU has microMIPS capability */
+	MIPS_CPU_TLBINV,	/* CPU supports TLBINV/F */
+	MIPS_CPU_SEGMENTS,	/* CPU supports Segmentation Control registers */
+	MIPS_CPU_EVA,		/* CPU supports Enhanced Virtual Addressing */
+	MIPS_CPU_HTW,		/* CPU support Hardware Page Table Walker */
+	MIPS_CPU_RIXIEX,	/* CPU has unique exception codes for {Read, Execute}-Inhibit exceptions */
+	MIPS_CPU_MAAR,		/* MAAR(I) registers are present */
+	MIPS_CPU_FRE,		/* FRE & UFE bits implemented */
+	MIPS_CPU_RW_LLB,	/* LLADDR/LLB writes are allowed */
+	MIPS_CPU_LPA,		/* CPU supports Large Physical Addressing */
+	MIPS_CPU_CDMM,		/* CPU has Common Device Memory Map */
+	MIPS_CPU_BP_GHIST,	/* R12K+ Branch Prediction Global History */
+	MIPS_CPU_SP,		/* Small (1KB) page support */
+	MIPS_CPU_FTLB,		/* CPU has Fixed-page-size TLB */
+	MIPS_CPU_NAN_LEGACY,	/* Legacy NaN implemented */
+	MIPS_CPU_NAN_2008,	/* 2008 NaN implemented */
+	MIPS_CPU_VP,		/* MIPSr6 Virtual Processors (multi-threading) */
+	MIPS_CPU_LDPTE,		/* CPU has ldpte/lddir instructions */
+	MIPS_CPU_MVH,		/* CPU supports MFHC0/MTHC0 */
+	MIPS_CPU_EBASE_WG,	/* CPU has EBase.WG */
+	MIPS_CPU_BADINSTR,	/* CPU has BadInstr register */
+	MIPS_CPU_BADINSTRP,	/* CPU has BadInstrP register */
+	MIPS_CPU_CTXTC,		/* CPU has [X]ConfigContext registers */
+	MIPS_CPU_PERF,		/* CPU has MIPS performance counters */
+	MIPS_CPU_GUESTCTL0EXT,	/* CPU has VZ GuestCtl0Ext register */
+	MIPS_CPU_GUESTCTL1,	/* CPU has VZ GuestCtl1 register */
+	MIPS_CPU_GUESTCTL2,	/* CPU has VZ GuestCtl2 register */
+	MIPS_CPU_GUESTID,	/* CPU uses VZ ASE GuestID feature */
+	MIPS_CPU_DRG,		/* CPU has VZ Direct Root to Guest (DRG) */
+	MIPS_CPU_UFR,		/* CPU supports User mode FR switching */
+	MIPS_CPU_SHARED_FTLB_RAM,	/* CPU shares FTLB RAM with another */
+	MIPS_CPU_SHARED_FTLB_ENTRIES,	/* CPU shares FTLB entries with another */
+	MIPS_CPU_MT_PER_TC_PERF_COUNTERS,	/* CPU has perf counters implemented per TC (MIPSMT ASE) */
+	MIPS_CPU_MMID,		/* CPU supports MemoryMapIDs */
+	MIPS_CPU_MM_SYSAD,	/* CPU supports write-through SysAD Valid merge */
+	MIPS_CPU_MM_FULL,	/* CPU supports write-through full merge */
+	MIPS_CPU_MAC_2008_ONLY,	/* CPU Only support MAC2008 Fused multiply-add instruction */
+	MIPS_CPU_FTLBPAREX,	/* CPU has FTLB parity exception */
+	MIPS_CPU_GSEXCEX,	/* CPU has GSExc exception */
+	MIPS_CPU_EXTIMER,	/* CPU has External Timer (Loongson) */
+	MIPS_CPU_OPTS_END
+};
+
+/* Number of unsigned long long options will occupy */
+#define MIPS_CPU_OPTS_ULL_N	(MIPS_CPU_OPTS_END / 64 + 1)
 
 /*
  * CPU ASE encodings
@@ -450,4 +452,6 @@ enum cpu_type_enum {
 #define MIPS_ASE_LOONGSON_EXT	0x00002000 /* Loongson EXTensions */
 #define MIPS_ASE_LOONGSON_EXT2	0x00004000 /* Loongson EXTensions R2 */
 
+#endif /* !__ASSEMBLY */
+
 #endif /* _ASM_CPU_H */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 4f1e9ef2644e..e52fb4fa3c3a 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -126,13 +126,13 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
 				 * so we only test for R2-R5.
 				 */
 				if (fcsr0 & FPU_CSR_MAC2008)
-					c->options |= MIPS_CPU_MAC_2008_ONLY;
+					set_cpu_opt(c, MIPS_CPU_MAC_2008_ONLY);
 			}
 
 			if (!(fcsr0 & FPU_CSR_NAN2008))
-				c->options |= MIPS_CPU_NAN_LEGACY;
+				set_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 			if (fcsr1 & FPU_CSR_NAN2008)
-				c->options |= MIPS_CPU_NAN_2008;
+				set_cpu_opt(c, MIPS_CPU_NAN_2008);
 
 			if ((fcsr0 ^ fcsr1) & FPU_CSR_ABS2008)
 				c->fpu_msk31 &= ~FPU_CSR_ABS2008;
@@ -144,12 +144,12 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
 			else
 				c->fpu_csr31 |= fcsr & FPU_CSR_NAN2008;
 		} else {
-			c->options |= MIPS_CPU_NAN_LEGACY;
+			set_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 		}
 
 		write_c0_status(sr);
 	} else {
-		c->options |= MIPS_CPU_NAN_LEGACY;
+		set_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 	}
 }
 
@@ -167,7 +167,8 @@ static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
  */
 static void cpu_set_nofpu_2008(struct cpuinfo_mips *c)
 {
-	c->options &= ~(MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY);
+	clear_cpu_opt(c, MIPS_CPU_NAN_2008);
+	clear_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 	c->fpu_csr31 &= ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
 	c->fpu_msk31 &= ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
 
@@ -177,23 +178,24 @@ static void cpu_set_nofpu_2008(struct cpuinfo_mips *c)
 				    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
 				    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
-			c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
+			set_cpu_opt(c, MIPS_CPU_NAN_2008);
+			set_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 		} else {
-			c->options |= MIPS_CPU_NAN_LEGACY;
+			set_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 			c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
 		}
 		break;
 	case LEGACY:
-		c->options |= MIPS_CPU_NAN_LEGACY;
+		set_cpu_opt(c, MIPS_CPU_NAN_LEGACY);
 		c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
 		break;
 	case STD2008:
-		c->options |= MIPS_CPU_NAN_2008;
+		set_cpu_opt(c, MIPS_CPU_NAN_2008);
 		c->fpu_csr31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
 		c->fpu_msk31 |= FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
 		break;
 	case RELAXED:
-		c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
+		set_cpu_opt(c, MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY);
 		break;
 	}
 }
@@ -248,7 +250,7 @@ static int __init ieee754_setup(char *s)
 	else
 		return -1;
 
-	if (!(boot_cpu_data.options & MIPS_CPU_FPU))
+	if (!test_cpu_opt(&boot_cpu_data, MIPS_CPU_FPU))
 		cpu_set_nofpu_2008(&boot_cpu_data);
 	cpu_set_nan_2008(&boot_cpu_data);
 
@@ -274,7 +276,7 @@ static void cpu_set_nofpu_id(struct cpuinfo_mips *c)
 			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
 		value |= MIPS_FPIR_F64 | MIPS_FPIR_L | MIPS_FPIR_W;
-	if (c->options & MIPS_CPU_NAN_2008)
+	if (test_cpu_opt(c, MIPS_CPU_NAN_2008))
 		value |= MIPS_FPIR_HAS2008;
 	c->fpu_id = value;
 }
@@ -297,9 +299,9 @@ static void cpu_set_fpu_opts(struct cpuinfo_mips *c)
 		if (c->fpu_id & MIPS_FPIR_3D)
 			c->ases |= MIPS_ASE_MIPS3D;
 		if (c->fpu_id & MIPS_FPIR_UFRP)
-			c->options |= MIPS_CPU_UFR;
+			set_cpu_opt(c, MIPS_CPU_UFR);
 		if (c->fpu_id & MIPS_FPIR_FREP)
-			c->options |= MIPS_CPU_FRE;
+			set_cpu_opt(c, MIPS_CPU_FRE);
 	}
 
 	cpu_set_fpu_fcsr_mask(c);
@@ -312,7 +314,7 @@ static void cpu_set_fpu_opts(struct cpuinfo_mips *c)
  */
 static void cpu_set_nofpu_opts(struct cpuinfo_mips *c)
 {
-	c->options &= ~MIPS_CPU_FPU;
+	clear_cpu_opt(c, MIPS_CPU_FPU);
 	c->fpu_msk31 = mips_nofpu_msk31;
 
 	cpu_set_nofpu_2008(c);
@@ -388,7 +390,7 @@ static int mips_htw_disabled;
 static int __init htw_disable(char *s)
 {
 	mips_htw_disabled = 1;
-	cpu_data[0].options &= ~MIPS_CPU_HTW;
+	clear_cpu_opt(&boot_cpu_data, MIPS_CPU_HTW);
 	write_c0_pwctl(read_c0_pwctl() &
 		       ~(1 << MIPS_PWCTL_PWEN_SHIFT));
 
@@ -465,7 +467,7 @@ __setup("noftlb", ftlb_disable);
 static inline void cpu_set_mt_per_tc_perf(struct cpuinfo_mips *c)
 {
 	if (read_c0_config7() & MTI_CONF7_PTC)
-		c->options |= MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
+		set_cpu_opt(c, MIPS_CPU_MT_PER_TC_PERF_COUNTERS);
 }
 
 static inline void check_errata(void)
@@ -694,7 +696,7 @@ static int mm_config(struct cpuinfo_mips *c)
 	case CPU_74K:
 	case CPU_P5600:
 	case CPU_P6600:
-		c->options |= MIPS_CPU_MM_FULL;
+		set_cpu_opt(c, MIPS_CPU_MM_FULL);
 		update = MIPS_CONF_MM_FULL;
 		break;
 	case CPU_1004K:
@@ -712,9 +714,9 @@ static int mm_config(struct cpuinfo_mips *c)
 		config0 = (config0 & ~MIPS_CONF_MM) | update;
 		write_c0_config(config0);
 	} else if (mm == MIPS_CONF_MM_SYSAD) {
-		c->options |= MIPS_CPU_MM_SYSAD;
+		set_cpu_opt(c, MIPS_CPU_MM_SYSAD);
 	} else if (mm == MIPS_CONF_MM_FULL) {
-		c->options |= MIPS_CPU_MM_FULL;
+		set_cpu_opt(c, MIPS_CPU_MM_FULL);
 	}
 
 	return 0;
@@ -732,9 +734,11 @@ static inline unsigned int decode_config0(struct cpuinfo_mips *c)
 	 */
 	mt = config0 & MIPS_CONF_MT;
 	if (mt == MIPS_CONF_MT_TLB)
-		c->options |= MIPS_CPU_TLB;
-	else if (mt == MIPS_CONF_MT_FTLB)
-		c->options |= MIPS_CPU_TLB | MIPS_CPU_FTLB;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+	else if (mt == MIPS_CONF_MT_FTLB) {
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_FTLB);
+	}
 
 	isa = (config0 & MIPS_CONF_AT) >> 13;
 	switch (isa) {
@@ -787,16 +791,16 @@ static inline unsigned int decode_config1(struct cpuinfo_mips *c)
 	if (config1 & MIPS_CONF1_MD)
 		c->ases |= MIPS_ASE_MDMX;
 	if (config1 & MIPS_CONF1_PC)
-		c->options |= MIPS_CPU_PERF;
+		set_cpu_opt(c, MIPS_CPU_PERF);
 	if (config1 & MIPS_CONF1_WR)
-		c->options |= MIPS_CPU_WATCH;
+		set_cpu_opt(c, MIPS_CPU_WATCH);
 	if (config1 & MIPS_CONF1_CA)
 		c->ases |= MIPS_ASE_MIPS16;
 	if (config1 & MIPS_CONF1_EP)
-		c->options |= MIPS_CPU_EJTAG;
+		set_cpu_opt(c, MIPS_CPU_EJTAG);
 	if (config1 & MIPS_CONF1_FP) {
-		c->options |= MIPS_CPU_FPU;
-		c->options |= MIPS_CPU_32FPR;
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
 	}
 	if (cpu_has_tlb) {
 		c->tlbsize = ((config1 & MIPS_CONF1_TLBS) >> 25) + 1;
@@ -827,12 +831,13 @@ static inline unsigned int decode_config3(struct cpuinfo_mips *c)
 
 	if (config3 & MIPS_CONF3_SM) {
 		c->ases |= MIPS_ASE_SMARTMIPS;
-		c->options |= MIPS_CPU_RIXI | MIPS_CPU_CTXTC;
+		set_cpu_opt(c, MIPS_CPU_RIXI);
+		set_cpu_opt(c, MIPS_CPU_CTXTC);
 	}
 	if (config3 & MIPS_CONF3_RXI)
-		c->options |= MIPS_CPU_RIXI;
+		set_cpu_opt(c, MIPS_CPU_RIXI);
 	if (config3 & MIPS_CONF3_CTXTC)
-		c->options |= MIPS_CPU_CTXTC;
+		set_cpu_opt(c, MIPS_CPU_CTXTC);
 	if (config3 & MIPS_CONF3_DSP)
 		c->ases |= MIPS_ASE_DSP;
 	if (config3 & MIPS_CONF3_DSP2P) {
@@ -841,35 +846,35 @@ static inline unsigned int decode_config3(struct cpuinfo_mips *c)
 			c->ases |= MIPS_ASE_DSP3;
 	}
 	if (config3 & MIPS_CONF3_VINT)
-		c->options |= MIPS_CPU_VINT;
+		set_cpu_opt(c, MIPS_CPU_VINT);
 	if (config3 & MIPS_CONF3_VEIC)
-		c->options |= MIPS_CPU_VEIC;
+		set_cpu_opt(c, MIPS_CPU_VEIC);
 	if (config3 & MIPS_CONF3_LPA)
-		c->options |= MIPS_CPU_LPA;
+		set_cpu_opt(c, MIPS_CPU_LPA);
 	if (config3 & MIPS_CONF3_MT)
 		c->ases |= MIPS_ASE_MIPSMT;
 	if (config3 & MIPS_CONF3_ULRI)
-		c->options |= MIPS_CPU_ULRI;
+		set_cpu_opt(c, MIPS_CPU_ULRI);
 	if (config3 & MIPS_CONF3_ISA)
-		c->options |= MIPS_CPU_MICROMIPS;
+		set_cpu_opt(c, MIPS_CPU_MICROMIPS);
 	if (config3 & MIPS_CONF3_VZ)
 		c->ases |= MIPS_ASE_VZ;
 	if (config3 & MIPS_CONF3_SC)
-		c->options |= MIPS_CPU_SEGMENTS;
+		set_cpu_opt(c, MIPS_CPU_SEGMENTS);
 	if (config3 & MIPS_CONF3_BI)
-		c->options |= MIPS_CPU_BADINSTR;
+		set_cpu_opt(c, MIPS_CPU_BADINSTR);
 	if (config3 & MIPS_CONF3_BP)
-		c->options |= MIPS_CPU_BADINSTRP;
+		set_cpu_opt(c, MIPS_CPU_BADINSTRP);
 	if (config3 & MIPS_CONF3_MSA)
 		c->ases |= MIPS_ASE_MSA;
 	if (config3 & MIPS_CONF3_PW) {
 		c->htw_seq = 0;
-		c->options |= MIPS_CPU_HTW;
+		set_cpu_opt(c, MIPS_CPU_HTW);
 	}
 	if (config3 & MIPS_CONF3_CDMM)
-		c->options |= MIPS_CPU_CDMM;
+		set_cpu_opt(c, MIPS_CPU_CDMM);
 	if (config3 & MIPS_CONF3_SP)
-		c->options |= MIPS_CPU_SP;
+		set_cpu_opt(c, MIPS_CPU_SP);
 
 	return config3 & MIPS_CONF_M;
 }
@@ -886,7 +891,7 @@ static inline unsigned int decode_config4(struct cpuinfo_mips *c)
 
 	if (cpu_has_tlb) {
 		if (((config4 & MIPS_CONF4_IE) >> 29) == 2)
-			c->options |= MIPS_CPU_TLBINV;
+			set_cpu_opt(c, MIPS_CPU_TLBINV);
 
 		/*
 		 * R6 has dropped the MMUExtDef field from config4.
@@ -976,15 +981,15 @@ static inline unsigned int decode_config5(struct cpuinfo_mips *c)
 	write_c0_config5(config5);
 
 	if (config5 & MIPS_CONF5_EVA)
-		c->options |= MIPS_CPU_EVA;
+		set_cpu_opt(c, MIPS_CPU_EVA);
 	if (config5 & MIPS_CONF5_MRP)
-		c->options |= MIPS_CPU_MAAR;
+		set_cpu_opt(c, MIPS_CPU_MAAR);
 	if (config5 & MIPS_CONF5_LLB)
-		c->options |= MIPS_CPU_RW_LLB;
+		set_cpu_opt(c, MIPS_CPU_RW_LLB);
 	if (config5 & MIPS_CONF5_MVH)
-		c->options |= MIPS_CPU_MVH;
+		set_cpu_opt(c, MIPS_CPU_MVH);
 	if (cpu_has_mips_r6 && (config5 & MIPS_CONF5_VP))
-		c->options |= MIPS_CPU_VP;
+		set_cpu_opt(c, MIPS_CPU_VP);
 	if (config5 & MIPS_CONF5_CA2)
 		c->ases |= MIPS_ASE_MIPS16E2;
 
@@ -998,7 +1003,7 @@ static inline unsigned int decode_config5(struct cpuinfo_mips *c)
 		/* Check whether we successfully enabled MMID support */
 		config5 = read_c0_config5();
 		if (config5 & MIPS_CONF5_MI)
-			c->options |= MIPS_CPU_MMID;
+			set_cpu_opt(c, MIPS_CPU_MMID);
 
 		/*
 		 * Warn if we've hardcoded cpu_has_mmid to a value unsuitable
@@ -1043,8 +1048,12 @@ static void decode_configs(struct cpuinfo_mips *c)
 	int ok;
 
 	/* MIPS32 or MIPS64 compliant CPU.  */
-	c->options = MIPS_CPU_4KEX | MIPS_CPU_4K_CACHE | MIPS_CPU_COUNTER |
-		     MIPS_CPU_DIVEC | MIPS_CPU_LLSC | MIPS_CPU_MCHECK;
+	set_cpu_opt(c, MIPS_CPU_4KEX);
+	set_cpu_opt(c, MIPS_CPU_4K_CACHE);
+	set_cpu_opt(c, MIPS_CPU_COUNTER);
+	set_cpu_opt(c, MIPS_CPU_DIVEC);
+	set_cpu_opt(c, MIPS_CPU_LLSC);
+	set_cpu_opt(c, MIPS_CPU_MCHECK);
 
 	c->scache.flags = MIPS_CACHE_NOT_PRESENT;
 
@@ -1074,7 +1083,7 @@ static void decode_configs(struct cpuinfo_mips *c)
 					 : (s32)read_c0_ebase();
 		if (ebase & MIPS_EBASE_WG) {
 			/* WG bit already set, we can avoid the clumsy probe */
-			c->options |= MIPS_CPU_EBASE_WG;
+			set_cpu_opt(c, MIPS_CPU_EBASE_WG);
 		} else {
 			/* Its UNDEFINED to change EBase while BEV=0 */
 			status = read_c0_status();
@@ -1093,7 +1102,7 @@ static void decode_configs(struct cpuinfo_mips *c)
 			/* Restore BEV */
 			write_c0_status(status);
 			if (read_c0_ebase() & MIPS_EBASE_WG) {
-				c->options |= MIPS_CPU_EBASE_WG;
+				set_cpu_opt(c, MIPS_CPU_EBASE_WG);
 				write_c0_ebase(ebase);
 			}
 		}
@@ -1164,19 +1173,19 @@ static inline unsigned int decode_guest_config1(struct cpuinfo_mips *c)
 			     MIPS_CONF1_FP);
 
 	if (config1 & MIPS_CONF1_FP)
-		c->guest.options |= MIPS_CPU_FPU;
+		set_cpu_gopt(c, MIPS_CPU_FPU);
 	if (config1_dyn & MIPS_CONF1_FP)
-		c->guest.options_dyn |= MIPS_CPU_FPU;
+		set_cpu_gopt_dyn(c, MIPS_CPU_FPU);
 
 	if (config1 & MIPS_CONF1_WR)
-		c->guest.options |= MIPS_CPU_WATCH;
+		set_cpu_gopt(c, MIPS_CPU_WATCH);
 	if (config1_dyn & MIPS_CONF1_WR)
-		c->guest.options_dyn |= MIPS_CPU_WATCH;
+		set_cpu_gopt_dyn(c, MIPS_CPU_WATCH);
 
 	if (config1 & MIPS_CONF1_PC)
-		c->guest.options |= MIPS_CPU_PERF;
+		set_cpu_gopt(c, MIPS_CPU_PERF);
 	if (config1_dyn & MIPS_CONF1_PC)
-		c->guest.options_dyn |= MIPS_CPU_PERF;
+		set_cpu_gopt_dyn(c, MIPS_CPU_PERF);
 
 	if (config1 & MIPS_CONF_M)
 		c->guest.conf |= BIT(2);
@@ -1203,23 +1212,23 @@ static inline unsigned int decode_guest_config3(struct cpuinfo_mips *c)
 			     MIPS_CONF3_CTXTC);
 
 	if (config3 & MIPS_CONF3_CTXTC)
-		c->guest.options |= MIPS_CPU_CTXTC;
+		set_cpu_gopt(c, MIPS_CPU_CTXTC);
 	if (config3_dyn & MIPS_CONF3_CTXTC)
-		c->guest.options_dyn |= MIPS_CPU_CTXTC;
+		set_cpu_gopt_dyn(c, MIPS_CPU_CTXTC);
 
 	if (config3 & MIPS_CONF3_PW)
-		c->guest.options |= MIPS_CPU_HTW;
+		set_cpu_gopt(c, MIPS_CPU_HTW);
 
 	if (config3 & MIPS_CONF3_ULRI)
-		c->guest.options |= MIPS_CPU_ULRI;
+		set_cpu_gopt(c, MIPS_CPU_ULRI);
 
 	if (config3 & MIPS_CONF3_SC)
-		c->guest.options |= MIPS_CPU_SEGMENTS;
+		set_cpu_gopt(c, MIPS_CPU_SEGMENTS);
 
 	if (config3 & MIPS_CONF3_BI)
-		c->guest.options |= MIPS_CPU_BADINSTR;
+		set_cpu_gopt(c, MIPS_CPU_BADINSTR);
 	if (config3 & MIPS_CONF3_BP)
-		c->guest.options |= MIPS_CPU_BADINSTRP;
+		set_cpu_gopt(c, MIPS_CPU_BADINSTRP);
 
 	if (config3 & MIPS_CONF3_MSA)
 		c->guest.ases |= MIPS_ASE_MSA;
@@ -1254,15 +1263,15 @@ static inline unsigned int decode_guest_config5(struct cpuinfo_mips *c)
 			 MIPS_CONF_M | MIPS_CONF5_MVH | MIPS_CONF5_MRP);
 
 	if (config5 & MIPS_CONF5_MRP)
-		c->guest.options |= MIPS_CPU_MAAR;
+		set_cpu_gopt(c, MIPS_CPU_MAAR);
 	if (config5_dyn & MIPS_CONF5_MRP)
-		c->guest.options_dyn |= MIPS_CPU_MAAR;
+		set_cpu_gopt(c, MIPS_CPU_MAAR);
 
 	if (config5 & MIPS_CONF5_LLB)
-		c->guest.options |= MIPS_CPU_RW_LLB;
+		set_cpu_gopt(c, MIPS_CPU_RW_LLB);
 
 	if (config5 & MIPS_CONF5_MVH)
-		c->guest.options |= MIPS_CPU_MVH;
+		set_cpu_gopt(c, MIPS_CPU_MVH);
 
 	if (config5 & MIPS_CONF_M)
 		c->guest.conf |= BIT(6);
@@ -1293,13 +1302,13 @@ static inline void cpu_probe_guestctl0(struct cpuinfo_mips *c)
 	guestctl0 = read_c0_guestctl0();
 
 	if (guestctl0 & MIPS_GCTL0_G0E)
-		c->options |= MIPS_CPU_GUESTCTL0EXT;
+		set_cpu_opt(c, MIPS_CPU_GUESTCTL0EXT);
 	if (guestctl0 & MIPS_GCTL0_G1)
-		c->options |= MIPS_CPU_GUESTCTL1;
+		set_cpu_opt(c, MIPS_CPU_GUESTCTL1);
 	if (guestctl0 & MIPS_GCTL0_G2)
-		c->options |= MIPS_CPU_GUESTCTL2;
+		set_cpu_opt(c, MIPS_CPU_GUESTCTL2);
 	if (!(guestctl0 & MIPS_GCTL0_RAD)) {
-		c->options |= MIPS_CPU_GUESTID;
+		set_cpu_opt(c, MIPS_CPU_GUESTID);
 
 		/*
 		 * Probe for Direct Root to Guest (DRG). Set GuestCtl1.RID = 0
@@ -1315,7 +1324,7 @@ static inline void cpu_probe_guestctl0(struct cpuinfo_mips *c)
 
 		if (temp & MIPS_GCTL0_DRG) {
 			write_c0_guestctl0(guestctl0);
-			c->options |= MIPS_CPU_DRG;
+			set_cpu_opt(c, MIPS_CPU_DRG);
 		}
 	}
 }
@@ -1352,8 +1361,13 @@ static inline void cpu_probe_vz(struct cpuinfo_mips *c)
 	decode_guest_configs(c);
 }
 
-#define R4K_OPTS (MIPS_CPU_TLB | MIPS_CPU_4KEX | MIPS_CPU_4K_CACHE \
-		| MIPS_CPU_COUNTER)
+static inline void set_r4k_opts(struct cpuinfo_mips *c)
+{
+	set_cpu_opt(c, MIPS_CPU_TLB);
+	set_cpu_opt(c, MIPS_CPU_4KEX);
+	set_cpu_opt(c, MIPS_CPU_4K_CACHE);
+	set_cpu_opt(c, MIPS_CPU_COUNTER);
+}
 
 static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 {
@@ -1362,10 +1376,11 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_R2000;
 		__cpu_name[cpu] = "R2000";
 		c->fpu_msk31 |= FPU_CSR_CONDX | FPU_CSR_FS;
-		c->options = MIPS_CPU_TLB | MIPS_CPU_3K_CACHE |
-			     MIPS_CPU_NOFPUEX;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_3K_CACHE);
+		set_cpu_opt(c, MIPS_CPU_NOFPUEX);
 		if (__cpu_has_fpu())
-			c->options |= MIPS_CPU_FPU;
+			set_cpu_opt(c, MIPS_CPU_FPU);
 		c->tlbsize = 64;
 		break;
 	case PRID_IMP_R3000:
@@ -1382,10 +1397,11 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "R3000";
 		}
 		c->fpu_msk31 |= FPU_CSR_CONDX | FPU_CSR_FS;
-		c->options = MIPS_CPU_TLB | MIPS_CPU_3K_CACHE |
-			     MIPS_CPU_NOFPUEX;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_3K_CACHE);
+		set_cpu_opt(c, MIPS_CPU_NOFPUEX);
 		if (__cpu_has_fpu())
-			c->options |= MIPS_CPU_FPU;
+			set_cpu_opt(c, MIPS_CPU_FPU);
 		c->tlbsize = 64;
 		break;
 	case PRID_IMP_R4000:
@@ -1431,15 +1447,18 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 
 		set_isa(c, MIPS_CPU_ISA_III);
 		c->fpu_msk31 |= FPU_CSR_CONDX;
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_WATCH | MIPS_CPU_VCE |
-			     MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_WATCH);
+		set_cpu_opt(c, MIPS_CPU_VCE);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	case PRID_IMP_VR41XX:
 		set_isa(c, MIPS_CPU_ISA_III);
 		c->fpu_msk31 |= FPU_CSR_CONDX;
-		c->options = R4K_OPTS;
+		set_r4k_opts(c);
 		c->tlbsize = 32;
 		switch (c->processor_id & 0xf0) {
 		case PRID_REV_VR4111:
@@ -1465,7 +1484,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 				__cpu_name[cpu] = "NEC VR4131";
 			} else {
 				c->cputype = CPU_VR4133;
-				c->options |= MIPS_CPU_LLSC;
+				set_cpu_opt(c, MIPS_CPU_LLSC);
 				__cpu_name[cpu] = "NEC VR4133";
 			}
 			break;
@@ -1481,8 +1500,10 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "R4600";
 		set_isa(c, MIPS_CPU_ISA_III);
 		c->fpu_msk31 |= FPU_CSR_CONDX;
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	#if 0
@@ -1497,13 +1518,16 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "R4650";
 		set_isa(c, MIPS_CPU_ISA_III);
 		c->fpu_msk31 |= FPU_CSR_CONDX;
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	#endif
 	case PRID_IMP_TX39:
 		c->fpu_msk31 |= FPU_CSR_CONDX | FPU_CSR_FS;
-		c->options = MIPS_CPU_TLB | MIPS_CPU_TX39_CACHE;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_TX39_CACHE);
 
 		if ((c->processor_id & 0xf0) == (PRID_REV_TX3927 & 0xf0)) {
 			c->cputype = CPU_TX3927;
@@ -1529,8 +1553,10 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "R4700";
 		set_isa(c, MIPS_CPU_ISA_III);
 		c->fpu_msk31 |= FPU_CSR_CONDX;
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	case PRID_IMP_TX49:
@@ -1538,41 +1564,54 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "R49XX";
 		set_isa(c, MIPS_CPU_ISA_III);
 		c->fpu_msk31 |= FPU_CSR_CONDX;
-		c->options = R4K_OPTS | MIPS_CPU_LLSC;
-		if (!(c->processor_id & 0x08))
-			c->options |= MIPS_CPU_FPU | MIPS_CPU_32FPR;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
+		if (!(c->processor_id & 0x08)) {
+			set_cpu_opt(c, MIPS_CPU_FPU);
+			set_cpu_opt(c, MIPS_CPU_32FPR);
+		}
 		c->tlbsize = 48;
 		break;
 	case PRID_IMP_R5000:
 		c->cputype = CPU_R5000;
 		__cpu_name[cpu] = "R5000";
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	case PRID_IMP_R5500:
 		c->cputype = CPU_R5500;
 		__cpu_name[cpu] = "R5500";
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_WATCH | MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_WATCH);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	case PRID_IMP_NEVADA:
 		c->cputype = CPU_NEVADA;
 		__cpu_name[cpu] = "Nevada";
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_DIVEC | MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_DIVEC);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 48;
 		break;
 	case PRID_IMP_RM7000:
 		c->cputype = CPU_RM7000;
 		__cpu_name[cpu] = "RM7000";
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_LLSC;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		/*
 		 * Undocumented RM7000:	 Bit 29 in the info register of
 		 * the RM7000 v2.0 indicates if the TLB has 48 or 64
@@ -1587,20 +1626,29 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_R10000;
 		__cpu_name[cpu] = "R10000";
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = MIPS_CPU_TLB | MIPS_CPU_4K_CACHE | MIPS_CPU_4KEX |
-			     MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_COUNTER | MIPS_CPU_WATCH |
-			     MIPS_CPU_LLSC;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_4K_CACHE);
+		set_cpu_opt(c, MIPS_CPU_4KEX);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_COUNTER);
+		set_cpu_opt(c, MIPS_CPU_WATCH);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
 		c->tlbsize = 64;
 		break;
 	case PRID_IMP_R12000:
 		c->cputype = CPU_R12000;
 		__cpu_name[cpu] = "R12000";
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = MIPS_CPU_TLB | MIPS_CPU_4K_CACHE | MIPS_CPU_4KEX |
-			     MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_COUNTER | MIPS_CPU_WATCH |
-			     MIPS_CPU_LLSC | MIPS_CPU_BP_GHIST;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_4K_CACHE);
+		set_cpu_opt(c, MIPS_CPU_4KEX);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_COUNTER);
+		set_cpu_opt(c, MIPS_CPU_WATCH);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
+		set_cpu_opt(c, MIPS_CPU_BP_GHIST);
 		c->tlbsize = 64;
 		break;
 	case PRID_IMP_R14000:
@@ -1612,10 +1660,15 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "R14000";
 		}
 		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options = MIPS_CPU_TLB | MIPS_CPU_4K_CACHE | MIPS_CPU_4KEX |
-			     MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_COUNTER | MIPS_CPU_WATCH |
-			     MIPS_CPU_LLSC | MIPS_CPU_BP_GHIST;
+		set_cpu_opt(c, MIPS_CPU_TLB);
+		set_cpu_opt(c, MIPS_CPU_4K_CACHE);
+		set_cpu_opt(c, MIPS_CPU_4KEX);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
+		set_cpu_opt(c, MIPS_CPU_COUNTER);
+		set_cpu_opt(c, MIPS_CPU_WATCH);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
+		set_cpu_opt(c, MIPS_CPU_BP_GHIST);
 		c->tlbsize = 64;
 		break;
 	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
@@ -1653,9 +1706,10 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			break;
 		}
 
-		c->options = R4K_OPTS |
-			     MIPS_CPU_FPU | MIPS_CPU_LLSC |
-			     MIPS_CPU_32FPR;
+		set_r4k_opts(c);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_LLSC);
+		set_cpu_opt(c, MIPS_CPU_32FPR);
 		c->tlbsize = 64;
 		set_cpu_asid_mask(c, MIPS_ENTRYHI_ASID);
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
@@ -1819,10 +1873,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 		set_isa(c, MIPS_CPU_ISA_M32R5);
 		break;
 	case CPU_I6500:
-		c->options |= MIPS_CPU_SHARED_FTLB_ENTRIES;
+		set_cpu_opt(c, MIPS_CPU_SHARED_FTLB_ENTRIES);
 		fallthrough;
 	case CPU_I6400:
-		c->options |= MIPS_CPU_SHARED_FTLB_RAM;
+		set_cpu_opt(c, MIPS_CPU_SHARED_FTLB_RAM);
 		fallthrough;
 	default:
 		break;
@@ -1837,7 +1891,7 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 	case CPU_P6600:
 	case CPU_I6400:
 	case CPU_I6500:
-		c->options |= MIPS_CPU_FTLBPAREX;
+		set_cpu_opt(c, MIPS_CPU_FTLBPAREX);
 		break;
 	}
 }
@@ -1889,7 +1943,8 @@ static inline void cpu_probe_sibyte(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "SiByte SB1";
 		/* FPU in pass1 is known to have issues. */
 		if ((c->processor_id & PRID_REV_MASK) < 0x02)
-			c->options &= ~(MIPS_CPU_FPU | MIPS_CPU_32FPR);
+			clear_cpu_opt(c, MIPS_CPU_FPU);
+			clear_cpu_opt(c, MIPS_CPU_32FPR);
 		break;
 	case PRID_IMP_SB1A:
 		c->cputype = CPU_SB1A;
@@ -1948,7 +2003,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			c->cputype = CPU_BMIPS4380;
 			__cpu_name[cpu] = "Broadcom BMIPS4380";
 			set_elf_platform(cpu, "bmips4380");
-			c->options |= MIPS_CPU_RIXI;
+			set_cpu_opt(c, MIPS_CPU_RIXI);
 		} else {
 			c->cputype = CPU_BMIPS4350;
 			__cpu_name[cpu] = "Broadcom BMIPS4350";
@@ -1964,7 +2019,8 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 		else
 			__cpu_name[cpu] = "Broadcom BMIPS5000";
 		set_elf_platform(cpu, "bmips5000");
-		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
+		set_cpu_opt(c, MIPS_CPU_ULRI);
+		set_cpu_opt(c, MIPS_CPU_RIXI);
 		break;
 	}
 }
@@ -2031,11 +2087,11 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
 		c->ases |= MIPS_ASE_LOONGSON_EXT2;
 
 	if (cfg2 & LOONGSON_CFG2_LLFTP)
-		c->options |= MIPS_CPU_EXTIMER;
+		set_cpu_opt(c, MIPS_CPU_EXTIMER);
 
 	if (cfg2 & LOONGSON_CFG2_LSPW) {
-		c->options |= MIPS_CPU_LDPTE;
-		c->guest.options |= MIPS_CPU_LDPTE;
+		set_cpu_opt(c, MIPS_CPU_LDPTE);
+		set_cpu_gopt(c, MIPS_CPU_LDPTE);
 	}
 
 	if (cfg3 & LOONGSON_CFG3_LCAMP)
@@ -2047,7 +2103,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 	decode_configs(c);
 
 	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
-	c->options |= MIPS_CPU_GSEXCEX;
+	set_cpu_opt(c, MIPS_CPU_GSEXCEX);
 
 	switch (c->processor_id & PRID_IMP_MASK) {
 	case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
@@ -2083,16 +2139,20 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 			set_isa(c, MIPS_CPU_ISA_M64R2);
 			break;
 		}
+
+		/*
+		 * Some early Loongson-3A2000 had wrong TLB type in Config
+		 * register, we correct it here.
+		 */
+		set_cpu_opt(c, MIPS_CPU_FTLB);
 		/*
 		 * Loongson-3 Classic did not implement MIPS standard TLBINV
 		 * but implemented TLBINVF and EHINV. As currently we're only
 		 * using these two features, enable MIPS_CPU_TLBINV as well.
-		 *
-		 * Also some early Loongson-3A2000 had wrong TLB type in Config
-		 * register, we correct it here.
 		 */
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE |
-			      MIPS_CPU_EXTIMER;
+		set_cpu_opt(c, MIPS_CPU_TLBINV);
+		set_cpu_opt(c, MIPS_CPU_LDPTE);
+		set_cpu_opt(c, MIPS_CPU_EXTIMER);
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
@@ -2126,7 +2186,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	decode_config3(c);
 
 	/* XBurst does not implement the CP0 counter. */
-	c->options &= ~MIPS_CPU_COUNTER;
+	clear_cpu_opt(MIPS_CPU_COUNTER);
 	BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
 
 	/* XBurst has virtually tagged icache */
@@ -2205,13 +2265,13 @@ static inline void cpu_probe_netlogic(struct cpuinfo_mips *c, int cpu)
 		return;
 	}
 
-	c->options = (MIPS_CPU_TLB	 |
-			MIPS_CPU_4KEX	 |
-			MIPS_CPU_COUNTER |
-			MIPS_CPU_DIVEC	 |
-			MIPS_CPU_WATCH	 |
-			MIPS_CPU_EJTAG	 |
-			MIPS_CPU_LLSC);
+	set_cpu_opt(c, MIPS_CPU_TLB);
+	set_cpu_opt(c, MIPS_CPU_4KEX);
+	set_cpu_opt(c, MIPS_CPU_COUNTER);
+	set_cpu_opt(c, MIPS_CPU_DIVEC);
+	set_cpu_opt(c, MIPS_CPU_WATCH);
+	set_cpu_opt(c, MIPS_CPU_EJTAG);
+	set_cpu_opt(c, MIPS_CPU_LLSC);
 
 	switch (c->processor_id & PRID_IMP_MASK) {
 	case PRID_IMP_NETLOGIC_XLP2XX:
@@ -2265,7 +2325,9 @@ static inline void cpu_probe_netlogic(struct cpuinfo_mips *c, int cpu)
 
 	if (c->cputype == CPU_XLP) {
 		set_isa(c, MIPS_CPU_ISA_M64R2);
-		c->options |= (MIPS_CPU_FPU | MIPS_CPU_ULRI | MIPS_CPU_MCHECK);
+		set_cpu_opt(c, MIPS_CPU_FPU);
+		set_cpu_opt(c, MIPS_CPU_ULRI);
+		set_cpu_opt(c, MIPS_CPU_MCHECK);
 		/* This will be updated again after all threads are woken up */
 		c->tlbsize = ((read_c0_config6() >> 16) & 0xffff) + 1;
 	} else {
@@ -2360,22 +2422,23 @@ void cpu_probe(void)
 		back_to_back_c0_hazard();
 		/* Verify the IEC bit is set */
 		if (read_c0_pagegrain() & PG_IEC)
-			c->options |= MIPS_CPU_RIXIEX;
+			set_cpu_opt(c, MIPS_CPU_RIXIEX);
 	}
 
 	if (mips_fpu_disabled)
-		c->options &= ~MIPS_CPU_FPU;
-
-	if (mips_dsp_disabled)
-		c->ases &= ~(MIPS_ASE_DSP | MIPS_ASE_DSP2P);
+		clear_cpu_opt(c, MIPS_CPU_FPU);
 
+	if (mips_dsp_disabled) {
+		clear_cpu_opt(c, MIPS_ASE_DSP);
+		clear_cpu_opt(c, MIPS_ASE_DSP2P);
+	}
 	if (mips_htw_disabled) {
-		c->options &= ~MIPS_CPU_HTW;
+		clear_cpu_opt(c, MIPS_CPU_HTW);
 		write_c0_pwctl(read_c0_pwctl() &
 			       ~(1 << MIPS_PWCTL_PWEN_SHIFT));
 	}
 
-	if (c->options & MIPS_CPU_FPU)
+	if (test_cpu_opt(c, MIPS_CPU_FPU))
 		cpu_set_fpu_opts(c);
 	else
 		cpu_set_nofpu_opts(c);
@@ -2387,7 +2450,7 @@ void cpu_probe(void)
 	if (cpu_has_mips_r2_r6) {
 		c->srsets = ((read_c0_srsctl() >> 26) & 0x0f) + 1;
 		/* R2 has Performance Counter Interrupt indicator */
-		c->options |= MIPS_CPU_PCI;
+		set_cpu_opt(c, MIPS_CPU_PCI);
 	}
 	else
 		c->srsets = 1;
@@ -2459,7 +2522,7 @@ void cpu_report(void)
 
 	pr_info("CPU%d revision is: %08x (%s)\n",
 		smp_processor_id(), c->processor_id, cpu_name_string());
-	if (c->options & MIPS_CPU_FPU)
+	if (test_cpu_opt(c, MIPS_CPU_FPU))
 		printk(KERN_INFO "FPU revision is: %08x\n", c->fpu_id);
 	if (cpu_has_msa)
 		pr_info("MSA revision is: %08x\n", c->msa_id);
diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 4184d641f05e..b319ff87a192 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -59,7 +59,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	seq_printf(m, "processor\t\t: %ld\n", n);
 	sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
-		      cpu_data[n].options & MIPS_CPU_FPU ? "  FPU V%d.%d" : "");
+		      test_cpu_opt(&cpu_data[n], MIPS_CPU_FPU) ? "  FPU V%d.%d" : "");
 	seq_printf(m, fmt, __cpu_name[n],
 		      (version >> 4) & 0x0f, version & 0x0f,
 		      (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
diff --git a/arch/mips/kernel/watch.c b/arch/mips/kernel/watch.c
index c9263b95cb2e..ead13bc2ff63 100644
--- a/arch/mips/kernel/watch.c
+++ b/arch/mips/kernel/watch.c
@@ -119,7 +119,7 @@ void mips_probe_watch_registers(struct cpuinfo_mips *c)
 {
 	unsigned int t;
 
-	if ((c->options & MIPS_CPU_WATCH) == 0)
+	if (!cpu_has_watch)
 		return;
 	/*
 	 * Check which of the I,R and W bits are supported, then
diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
index 630927e46d3b..87c71724e7f3 100644
--- a/arch/mips/loongson64/cpucfg-emul.c
+++ b/arch/mips/loongson64/cpucfg-emul.c
@@ -68,10 +68,9 @@ static void decode_loongson_config6(struct cpuinfo_mips *c)
 static void patch_cpucfg_sel1(struct cpuinfo_mips *c)
 {
 	u64 ases = c->ases;
-	u64 options = c->options;
 	u32 data = c->loongson3_cpucfg_data[0];
 
-	if (options & MIPS_CPU_FPU) {
+	if (cpu_has_fpu) {
 		data |= LOONGSON_CFG1_FP;
 		data |= get_loongson_fprev(c) << LOONGSON_CFG1_FPREV_OFFSET;
 	}
@@ -86,14 +85,13 @@ static void patch_cpucfg_sel1(struct cpuinfo_mips *c)
 static void patch_cpucfg_sel2(struct cpuinfo_mips *c)
 {
 	u64 ases = c->ases;
-	u64 options = c->options;
 	u32 data = c->loongson3_cpucfg_data[1];
 
 	if (ases & MIPS_ASE_LOONGSON_EXT)
 		data |= LOONGSON_CFG2_LEXT1;
 	if (ases & MIPS_ASE_LOONGSON_EXT2)
 		data |= LOONGSON_CFG2_LEXT2;
-	if (options & MIPS_CPU_LDPTE)
+	if (cpu_has_ldpte)
 		data |= LOONGSON_CFG2_LSPW;
 
 	if (ases & MIPS_ASE_VZ)
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index 8ae181e08311..26c94c117d84 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -192,7 +192,7 @@ static void probe_octeon(void)
 		dcache_size =
 			c->dcache.sets * c->dcache.ways * c->dcache.linesz;
 		c->dcache.waybit = ffs(dcache_size / c->dcache.ways) - 1;
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_CAVIUM_OCTEON2:
@@ -206,7 +206,7 @@ static void probe_octeon(void)
 		c->dcache.ways = 32;
 		c->dcache.sets = 8;
 		dcache_size = c->dcache.sets * c->dcache.ways * c->dcache.linesz;
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_CAVIUM_OCTEON3:
@@ -220,7 +220,7 @@ static void probe_octeon(void)
 		c->dcache.ways = 32;
 		c->dcache.sets = 8;
 		dcache_size = c->dcache.sets * c->dcache.ways * c->dcache.linesz;
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	default:
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 4b12081f9843..070e260666f7 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1126,7 +1126,7 @@ static void probe_pcache(void)
 		c->dcache.ways = 2;
 		c->dcache.waybit= __ffs(dcache_size/2);
 
-		c->options |= MIPS_CPU_CACHE_CDEX_P;
+		set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
 		break;
 
 	case CPU_R5500:
@@ -1140,7 +1140,8 @@ static void probe_pcache(void)
 		c->dcache.ways = 2;
 		c->dcache.waybit = 0;
 
-		c->options |= MIPS_CPU_CACHE_CDEX_P | MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_TX49XX:
@@ -1154,8 +1155,8 @@ static void probe_pcache(void)
 		c->dcache.ways = 4;
 		c->dcache.waybit = 0;
 
-		c->options |= MIPS_CPU_CACHE_CDEX_P;
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_R4000PC:
@@ -1174,7 +1175,7 @@ static void probe_pcache(void)
 		c->dcache.ways = 1;
 		c->dcache.waybit = 0;	/* does not matter */
 
-		c->options |= MIPS_CPU_CACHE_CDEX_P;
+		set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
 		break;
 
 	case CPU_R10000:
@@ -1191,7 +1192,7 @@ static void probe_pcache(void)
 		c->dcache.ways = 2;
 		c->dcache.waybit = 0;
 
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_VR4133:
@@ -1206,7 +1207,7 @@ static void probe_pcache(void)
 				config |= VR41_CONF_BP;
 			write_c0_config(config);
 		} else
-			c->options |= MIPS_CPU_CACHE_CDEX_P;
+			set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
 
 		icache_size = 1 << (10 + ((config & CONF_IC) >> 9));
 		c->icache.linesz = 16 << ((config & CONF_IB) >> 5);
@@ -1235,7 +1236,7 @@ static void probe_pcache(void)
 		c->dcache.ways = 1;
 		c->dcache.waybit = 0;	/* does not matter */
 
-		c->options |= MIPS_CPU_CACHE_CDEX_P;
+		set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
 		break;
 
 	case CPU_RM7000:
@@ -1251,8 +1252,8 @@ static void probe_pcache(void)
 		c->dcache.ways = 4;
 		c->dcache.waybit = __ffs(dcache_size / c->dcache.ways);
 
-		c->options |= MIPS_CPU_CACHE_CDEX_P;
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_P);
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_LOONGSON2EF:
@@ -1301,7 +1302,7 @@ static void probe_pcache(void)
 		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
 				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
 				(c->processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
-			c->options |= MIPS_CPU_PREFETCH;
+			set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	case CPU_CAVIUM_OCTEON3:
@@ -1316,7 +1317,7 @@ static void probe_pcache(void)
 		c->dcache.ways = 8;
 		c->dcache.sets = 8;
 		dcache_size = c->dcache.sets * c->dcache.ways * c->dcache.linesz;
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 
 	default:
@@ -1369,7 +1370,7 @@ static void probe_pcache(void)
 			      c->dcache.linesz;
 		c->dcache.waybit = __ffs(dcache_size/c->dcache.ways);
 
-		c->options |= MIPS_CPU_PREFETCH;
+		set_cpu_opt(c, MIPS_CPU_PREFETCH);
 		break;
 	}
 
@@ -1606,7 +1607,7 @@ static void __init loongson2_sc_init(void)
 	pr_info("Unified secondary cache %ldkB %s, linesize %d bytes.\n",
 	       scache_size >> 10, way_string[c->scache.ways], c->scache.linesz);
 
-	c->options |= MIPS_CPU_INCLUSIVE_CACHES;
+	set_cpu_opt(c, MIPS_CPU_INCLUSIVE_CACHES);
 }
 
 static void __init loongson3_sc_init(void)
@@ -1638,7 +1639,7 @@ static void __init loongson3_sc_init(void)
 	pr_info("Unified secondary cache %ldkB %s, linesize %d bytes.\n",
 	       scache_size >> 10, way_string[c->scache.ways], c->scache.linesz);
 	if (scache_size)
-		c->options |= MIPS_CPU_INCLUSIVE_CACHES;
+		set_cpu_opt(c, MIPS_CPU_INCLUSIVE_CACHES);
 	return;
 }
 
@@ -1664,7 +1665,7 @@ static void setup_scache(void)
 	case CPU_R4400MC:
 		sc_present = run_uncached(probe_scache);
 		if (sc_present)
-			c->options |= MIPS_CPU_CACHE_CDEX_S;
+			set_cpu_opt(c, MIPS_CPU_CACHE_CDEX_S);
 		break;
 
 	case CPU_R10000:
@@ -1736,7 +1737,7 @@ static void setup_scache(void)
 	printk("Unified secondary cache %ldkB %s, linesize %d bytes.\n",
 	       scache_size >> 10, way_string[c->scache.ways], c->scache.linesz);
 
-	c->options |= MIPS_CPU_INCLUSIVE_CACHES;
+	set_cpu_opt(c, MIPS_CPU_INCLUSIVE_CACHES);
 }
 
 void au1x00_fixup_config_od(void)
@@ -1963,7 +1964,7 @@ void r4k_cache_init(void)
 
 
 		/* Optimization: an L2 flush implicitly flushes the L1 */
-		current_cpu_data.options |= MIPS_CPU_INCLUSIVE_CACHES;
+		set_cpu_opt(&current_cpu_data, MIPS_CPU_INCLUSIVE_CACHES);
 		break;
 	case CPU_LOONGSON64:
 		/* Loongson-3 maintains cache coherency by hardware */
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 97dc0511e63f..4a421fc2af4d 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -173,7 +173,7 @@ static int __init mips_sc_probe_cm3(void)
 
 	if (c->scache.linesz) {
 		c->scache.flags &= ~MIPS_CACHE_NOT_PRESENT;
-		c->options |= MIPS_CPU_INCLUSIVE_CACHES;
+		set_cpu_opt(c, MIPS_CPU_INCLUSIVE_CACHES);
 		return 1;
 	}
 
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index a7521b8f7658..98ccce0e9885 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -2511,7 +2511,7 @@ static void config_htw_params(void)
 		 * Drop option to avoid HTW being enabled via another path
 		 * (eg htw_reset())
 		 */
-		current_cpu_data.options &= ~MIPS_CPU_HTW;
+		clear_cpu_opt(&current_cpu_data, MIPS_CPU_HTW);
 		return;
 	}
 
-- 
2.28.0

