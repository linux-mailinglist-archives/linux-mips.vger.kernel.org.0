Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F707A4A14
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfIAPqS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:46:18 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41314 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfIAPqS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:46:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E841D3F684;
        Sun,  1 Sep 2019 17:39:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FH1Ujhf59uMM; Sun,  1 Sep 2019 17:39:32 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id A22E63F672;
        Sun,  1 Sep 2019 17:39:32 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:39:32 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 009/120] MIPS: R5900: Add mandatory SYNC.P to all M[FT]C0
 instructions
Message-ID: <4775699bfc809a6a8b40749f82be890515303bdd.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Toshiba TX79 manual specifies that all MTC0 instructions must be
followed by a SYNC.P instruction as a barrier to guarantee COP0 register
updates[1]. There is one exception to this rule:

An MTC0 instruction which loads the EntryHi COP0 register can be followed
by a TLBWI or a TLBWR instruction without having an intervening SYNC.P.
This special case is handled by a hardware interlock.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-28, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
The Linux 2.6 port to the PlayStation 2 has SYNC.P preceding all MFC0
instructions, but I have not found any documentation stating that is
necessary. Perhaps this case can be removed?
---
 arch/mips/include/asm/asmmacro.h   | 12 ++++++
 arch/mips/include/asm/irqflags.h   | 15 +++++++
 arch/mips/include/asm/mipsregs.h   | 69 ++++++++++++++++++++++++++++++
 arch/mips/include/asm/stackframe.h | 54 +++++++++++++++++++++++
 arch/mips/kernel/genex.S           | 60 ++++++++++++++++++++++++++
 arch/mips/kernel/head.S            |  9 ++++
 arch/mips/kernel/r4k_switch.S      |  9 ++++
 arch/mips/mm/cex-gen.S             |  6 +++
 arch/mips/mm/tlbex-fault.S         |  3 ++
 arch/mips/mm/tlbex.c               | 14 ++++--
 10 files changed, 247 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index aa58474c739f..67e77c0b64aa 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -56,9 +56,15 @@
 	.endm
 #else
 	.macro	local_irq_enable reg=t0
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	\reg, CP0_STATUS
 	ori	\reg, \reg, 1
 	mtc0	\reg, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	irq_enable_hazard
 	.endm
 
@@ -67,11 +73,17 @@
 	lw      \reg, TI_PRE_COUNT($28)
 	addi    \reg, \reg, 1
 	sw      \reg, TI_PRE_COUNT($28)
+#endif
+#ifdef CONFIG_CPU_R5900
+	sync.p
 #endif
 	mfc0	\reg, CP0_STATUS
 	ori	\reg, \reg, 1
 	xori	\reg, \reg, 1
 	mtc0	\reg, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	irq_disable_hazard
 #ifdef CONFIG_PREEMPT
 	lw      \reg, TI_PRE_COUNT($28)
diff --git a/arch/mips/include/asm/irqflags.h b/arch/mips/include/asm/irqflags.h
index f0b862a83816..e0c0265b2719 100644
--- a/arch/mips/include/asm/irqflags.h
+++ b/arch/mips/include/asm/irqflags.h
@@ -78,9 +78,15 @@ static inline void arch_local_irq_restore(unsigned long flags)
 	/*
 	 * Fast, dangerous.  Life is fun, life is good.
 	 */
+#ifdef CONFIG_CPU_R5900
+	"	sync.p							\n"
+#endif
 	"	mfc0	$1, $12						\n"
 	"	ins	$1, %[flags], 0, 1				\n"
 	"	mtc0	$1, $12						\n"
+#ifdef CONFIG_CPU_R5900
+	"	sync.p							\n"
+#endif
 #endif
 	"	" __stringify(__irq_disable_hazard) "			\n"
 	"	.set	pop						\n"
@@ -105,10 +111,16 @@ static inline void arch_local_irq_enable(void)
 #if   defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	"	ei							\n"
 #else
+#ifdef CONFIG_CPU_R5900
+	"	sync.p							\n"
+#endif
 	"	mfc0	$1,$12						\n"
 	"	ori	$1,0x1f						\n"
 	"	xori	$1,0x1e						\n"
 	"	mtc0	$1,$12						\n"
+#ifdef CONFIG_CPU_R5900
+	"	sync.p							\n"
+#endif
 #endif
 	"	" __stringify(__irq_enable_hazard) "			\n"
 	"	.set	pop						\n"
@@ -124,6 +136,9 @@ static inline unsigned long arch_local_save_flags(void)
 	asm __volatile__(
 	"	.set	push						\n"
 	"	.set	reorder						\n"
+#ifdef CONFIG_CPU_R5900
+	"	sync.p							\n"
+#endif
 	"	mfc0	%[flags], $12					\n"
 	"	.set	pop						\n"
 	: [flags] "=r" (flags));
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 1e6966e8527e..2aa947b3d0d1 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1345,6 +1345,29 @@ do {								\
  * Macros to access the system control coprocessor
  */
 
+#ifdef CONFIG_CPU_R5900
+#define ___read_32bit_c0_register(source, sel, vol)			\
+({ int __res;								\
+	if (sel == 0)							\
+		__asm__ vol(						\
+			".set push\n\t"					\
+			".set noreorder\n\t"				\
+			"sync.p\n\t"					\
+			"mfc0\t%0, " #source "\n\t"			\
+			".set pop\n\t"					\
+			: "=r" (__res));				\
+	else								\
+		__asm__ vol(						\
+			".set push\n\t"					\
+			".set noreorder\n\t"				\
+			".set\tmips32\n\t"				\
+			"sync.p\n\t"					\
+			"mfc0\t%0, " #source ", " #sel "\n\t"		\
+			".set pop\n\t"					\
+			: "=r" (__res));				\
+	__res;								\
+})
+#else
 #define ___read_32bit_c0_register(source, sel, vol)			\
 ({ unsigned int __res;							\
 	if (sel == 0)							\
@@ -1360,6 +1383,7 @@ do {								\
 			: "=r" (__res));				\
 	__res;								\
 })
+#endif
 
 #define ___read_64bit_c0_register(source, sel, vol)			\
 ({ unsigned long long __res;						\
@@ -1394,6 +1418,28 @@ do {								\
 #define __read_const_64bit_c0_register(source, sel)			\
 	___read_64bit_c0_register(source, sel,)
 
+#ifdef CONFIG_CPU_R5900
+#define __write_32bit_c0_register(register, sel, value)			\
+do {									\
+	if (sel == 0)							\
+		__asm__ __volatile__(					\
+			".set push\n\t"					\
+			".set noreorder\n\t"				\
+			"mtc0\t%z0, " #register "\n\t"			\
+			"sync.p\n\t"					\
+			".set pop\n\t"					\
+			: : "Jr" ((unsigned int)(value)));		\
+	else								\
+		__asm__ __volatile__(					\
+			".set push\n\t"					\
+			".set noreorder\n\t"				\
+			".set\tmips32\n\t"				\
+			"mtc0\t%z0, " #register ", " #sel "\n\t"	\
+			"sync.p\n\t"					\
+			".set pop\n\t"					\
+			: : "Jr" ((unsigned int)(value)));		\
+} while (0)
+#else
 #define __write_32bit_c0_register(register, sel, value)			\
 do {									\
 	if (sel == 0)							\
@@ -1408,6 +1454,7 @@ do {									\
 			".set\tpop"					\
 			: : "Jr" ((unsigned int)(value)));		\
 } while (0)
+#endif
 
 #define __write_64bit_c0_register(register, sel, value)			\
 do {									\
@@ -2649,6 +2696,14 @@ static inline void tlb_probe(void)
 	__asm__ __volatile__(
 		".set noreorder\n\t"
 		"tlbp\n\t"
+#ifdef CONFIG_CPU_R5900
+		/* No memory access behind the tlbp instruction. */
+		"sync.p\n\t"
+		"nop\n\t"
+		"nop\n\t"
+		"nop\n\t"
+		"nop\n\t"
+#endif
 		".set reorder");
 }
 
@@ -2674,6 +2729,14 @@ static inline void tlb_read(void)
 	__asm__ __volatile__(
 		".set noreorder\n\t"
 		"tlbr\n\t"
+#ifdef CONFIG_CPU_R5900
+		"sync.p\n\t"
+		/* No branch behind tlbr. */
+		"nop\n\t"
+		"nop\n\t"
+		"nop\n\t"
+		"nop\n\t"
+#endif
 		".set reorder");
 
 #if MIPS34K_MISSED_ITLB_WAR
@@ -2694,6 +2757,9 @@ static inline void tlb_write_indexed(void)
 	__asm__ __volatile__(
 		".set noreorder\n\t"
 		"tlbwi\n\t"
+#ifdef CONFIG_CPU_R5900
+		"sync.p\n\t"
+#endif
 		".set reorder");
 }
 
@@ -2702,6 +2768,9 @@ static inline void tlb_write_random(void)
 	__asm__ __volatile__(
 		".set noreorder\n\t"
 		"tlbwr\n\t"
+#ifdef CONFIG_CPU_R5900
+		"sync.p\n\t"
+#endif
 		".set reorder");
 }
 
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 2fbead2e86d1..4a0f6639fde8 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -116,6 +116,9 @@
 
 		/* SMP variation */
 		.macro	get_saved_sp docfi=0 tosp=0
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		ASM_CPUID_MFC0	k0, ASM_SMP_CPUID_REG
 #if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
 		lui	k1, %hi(kernelsp)
@@ -140,6 +143,9 @@
 		.endm
 
 		.macro	set_saved_sp stackp temp temp2
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		ASM_CPUID_MFC0	\temp, ASM_SMP_CPUID_REG
 		LONG_SRL	\temp, SMP_CPUID_PTRSHIFT
 		LONG_S	\stackp, kernelsp(\temp)
@@ -165,6 +171,9 @@
 1:		move	ra, k0
 		li	k0, 3
 		mtc0	k0, $22
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 #endif /* CONFIG_CPU_JUMP_WORKAROUNDS */
 #if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
 		lui	k1, %hi(kernelsp)
@@ -195,6 +204,9 @@
 		.set	push
 		.set	noat
 		.set	reorder
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	k0, CP0_STATUS
 		sll	k0, 3		/* extract cu0 bit */
 		.set	noreorder
@@ -251,15 +263,24 @@
 		 * need it to operate correctly
 		 */
 		LONG_S	$0, PT_R0(sp)
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	v1, CP0_STATUS
 		cfi_st	v0, PT_R2, \docfi
 		LONG_S	v1, PT_STATUS(sp)
 		cfi_st	$4, PT_R4, \docfi
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	v1, CP0_CAUSE
 		cfi_st	$5, PT_R5, \docfi
 		LONG_S	v1, PT_CAUSE(sp)
 		cfi_st	$6, PT_R6, \docfi
 		cfi_st	ra, PT_R31, \docfi
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		MFC0	ra, CP0_EPC
 		cfi_st	$7, PT_R7, \docfi
 #ifdef CONFIG_64BIT
@@ -273,6 +294,9 @@
 		cfi_st	$25, PT_R25, \docfi
 		cfi_st	$28, PT_R28, \docfi
 
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		/* Set thread_info if we're coming from user mode */
 		mfc0	k0, CP0_STATUS
 		sll	k0, 3		/* extract cu0 bit */
@@ -447,10 +471,16 @@
 		.set	reorder
 		.set	noat
 		RESET_MMR
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	a0, CP0_STATUS
 		ori	a0, STATMASK
 		xori	a0, STATMASK
 		mtc0	a0, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		li	v1, ST0_CU1 | ST0_FR | ST0_IM
 		and	a0, v1
 		LONG_L	v0, PT_STATUS(sp)
@@ -458,8 +488,14 @@
 		and	v0, v1
 		or	v0, a0
 		mtc0	v0, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		LONG_L	v1, PT_EPC(sp)
 		MTC0	v1, CP0_EPC
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		cfi_ld	$31, PT_R31, \docfi
 		cfi_ld	$28, PT_R28, \docfi
 		cfi_ld	$25, PT_R25, \docfi
@@ -503,11 +539,17 @@
  * Set cp0 enable bit as sign that we're running on the kernel stack
  */
 		.macro	CLI
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	t0, CP0_STATUS
 		li	t1, ST0_CU0 | STATMASK
 		or	t0, t1
 		xori	t0, STATMASK
 		mtc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		irq_disable_hazard
 		.endm
 
@@ -516,11 +558,17 @@
  * Set cp0 enable bit as sign that we're running on the kernel stack
  */
 		.macro	STI
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	t0, CP0_STATUS
 		li	t1, ST0_CU0 | STATMASK
 		or	t0, t1
 		xori	t0, STATMASK & ~1
 		mtc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		irq_enable_hazard
 		.endm
 
@@ -530,6 +578,9 @@
  * Set cp0 enable bit as sign that we're running on the kernel stack
  */
 		.macro	KMODE
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		mfc0	t0, CP0_STATUS
 		li	t1, ST0_CU0 | (STATMASK & ~1)
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
@@ -540,6 +591,9 @@
 		or	t0, t1
 		xori	t0, STATMASK & ~1
 		mtc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+		sync.p
+#endif
 		irq_disable_hazard
 		.endm
 
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 398b905b027d..6eaf057e5d95 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -33,7 +33,13 @@ NESTED(except_vec3_generic, 0, sp)
 	.set	push
 	.set	noat
 #if R5432_CP0_INTERRUPT_WAR
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k0, CP0_INDEX
+#endif
+#ifdef CONFIG_CPU_R5900
+	sync.p
 #endif
 	mfc0	k1, CP0_CAUSE
 	andi	k1, k1, 0x7c
@@ -55,6 +61,9 @@ NESTED(except_vec3_r4000, 0, sp)
 	.set	push
 	.set	arch=r4000
 	.set	noat
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k1, CP0_CAUSE
 	li	k0, 31<<2
 	andi	k1, k1, 0x7c
@@ -78,10 +87,16 @@ NESTED(except_vec3_r4000, 0, sp)
 	 * load / store will be re-executed.
 	 */
 handle_vced:
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k0, CP0_BADVADDR
 	li	k1, -4					# Is this ...
 	and	k0, k1					# ... really needed?
 	mtc0	zero, CP0_TAGLO
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	cache	Index_Store_Tag_D, (k0)
 	cache	Hit_Writeback_Inv_SD, (k0)
 #ifdef CONFIG_PROC_FS
@@ -93,6 +108,9 @@ handle_vced:
 	eret
 
 handle_vcei:
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k0, CP0_BADVADDR
 	cache	Hit_Writeback_Inv_SD, (k0)		# also cleans pi
 #ifdef CONFIG_PROC_FS
@@ -138,12 +156,18 @@ LEAF(__r4k_wait)
 	FEXPORT(rollback_\handler)
 	.set	push
 	.set	noat
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k0, CP0_EPC
 	PTR_LA	k1, __r4k_wait
 	ori	k0, 0x1f	/* 32 byte rollback region */
 	xori	k0, 0x1f
 	bne	k0, k1, \handler
 	MTC0	k0, CP0_EPC
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	.set pop
 	.endm
 
@@ -164,11 +188,17 @@ NESTED(handle_int, PT_SIZE, sp)
 	 */
 	.set	push
 	.set	noat
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k0, CP0_STATUS
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 	and	k0, ST0_IEP
 	bnez	k0, 1f
 
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k0, CP0_EPC
 	.set	noreorder
 	j	k0
@@ -349,6 +379,9 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
 	.set	push
 	.set	noat
 	MTC0	k0, CP0_DESAVE
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k0, CP0_DEBUG
 
 	sll	k0, k0, 30	# Check for SDBBP.
@@ -404,6 +437,9 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
 
 ejtag_return:
 	back_to_back_c0_hazard
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k0, CP0_DESAVE
 	.set	mips32
 	deret
@@ -494,6 +530,9 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.endm
 
 	.macro	__build_clear_ade
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	t0, CP0_BADVADDR
 	PTR_S	t0, PT_BVADDR(sp)
 	KMODE
@@ -579,16 +618,28 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.set	noat
 	.set	noreorder
 	/* check if TLB contains a entry for EPC */
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k1, CP0_ENTRYHI
 	andi	k1, MIPS_ENTRYHI_ASID | MIPS_ENTRYHI_ASIDX
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k0, CP0_EPC
 	PTR_SRL	k0, _PAGE_SHIFT + 1
 	PTR_SLL	k0, _PAGE_SHIFT + 1
 	or	k1, k0
 	MTC0	k1, CP0_ENTRYHI
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mtc0_tlbw_hazard
 	tlbp
 	tlb_probe_hazard
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k1, CP0_INDEX
 	.set	pop
 	bltz	k1, handle_ri	/* slow path */
@@ -601,6 +652,9 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.set	noreorder
 	/* MIPS32:    0x7c03e83b: rdhwr v1,$29 */
 	/* microMIPS: 0x007d6b3c: rdhwr v1,$29 */
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k1, CP0_EPC
 #if defined(CONFIG_CPU_MICROMIPS) || defined(CONFIG_CPU_MIPS32_R2) || defined(CONFIG_CPU_MIPS64_R2)
 	and	k0, k1, 1
@@ -631,6 +685,9 @@ isrdhwr:
 	/* The insn is rdhwr.  No need to check CAUSE.BD here. */
 	get_saved_sp	/* k1 := current_thread_info */
 	.set	noreorder
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	k0, CP0_EPC
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 	ori	k1, _THREAD_MASK
@@ -648,6 +705,9 @@ isrdhwr:
 	.set	noat
 #endif
 	MTC0	k0, CP0_EPC
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	/* I hope three instructions between MTC0 and ERET are enough... */
 	ori	k1, _THREAD_MASK
 	xori	k1, _THREAD_MASK
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 351d40fe0859..aae4b17a33d0 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -34,10 +34,16 @@
 	 */
 	.macro	setup_c0_status set clr
 	.set	push
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	t0, CP0_STATUS
 	or	t0, ST0_CU0|\set|0x1f|\clr
 	xor	t0, 0x1f|\clr
 	mtc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	.set	noreorder
 	sll	zero,3				# ehb
 	.set	pop
@@ -132,6 +138,9 @@ dtb_found:
 #endif
 
 	MTC0		zero, CP0_CONTEXT	# clear context register
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	PTR_LA		$28, init_thread_union
 	/* Set the SP after an empty pt_regs.  */
 	PTR_LI		sp, _THREAD_SIZE - 32 - PT_SIZE
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 58232ae6cfae..de4a1880e9a8 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -26,6 +26,9 @@
  */
 	.align	5
 	LEAF(resume)
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	t1, CP0_STATUS
 	LONG_S	t1, THREAD_STATUS(a0)
 	cpu_save_nonscratch a0
@@ -46,6 +49,9 @@
 
 	PTR_ADDU	t0, $28, _THREAD_SIZE - 32
 	set_saved_sp	t0, t1, t2
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	t1, CP0_STATUS		/* Do we really need this? */
 	li	a3, 0xff01
 	and	t1, a3
@@ -54,6 +60,9 @@
 	and	a2, a3
 	or	a2, t1
 	mtc0	a2, CP0_STATUS
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	move	v0, a0
 	jr	ra
 	END(resume)
diff --git a/arch/mips/mm/cex-gen.S b/arch/mips/mm/cex-gen.S
index 45dff5cd4b8e..c5075651229c 100644
--- a/arch/mips/mm/cex-gen.S
+++ b/arch/mips/mm/cex-gen.S
@@ -27,11 +27,17 @@
 	 * in the cache, we may not be able to recover.	 As a
 	 * first-order desperate measure, turn off KSEG0 cacheing.
 	 */
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	mfc0	k0,CP0_CONFIG
 	li	k1,~CONF_CM_CMASK
 	and	k0,k0,k1
 	ori	k0,k0,CONF_CM_UNCACHED
 	mtc0	k0,CP0_CONFIG
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	/* Give it a few cycles to sink in... */
 	nop
 	nop
diff --git a/arch/mips/mm/tlbex-fault.S b/arch/mips/mm/tlbex-fault.S
index 77db401fc620..fe2b2c61cca7 100644
--- a/arch/mips/mm/tlbex-fault.S
+++ b/arch/mips/mm/tlbex-fault.S
@@ -14,6 +14,9 @@
 	NESTED(tlb_do_page_fault_\write, PT_SIZE, sp)
 	.cfi_signal_frame
 	SAVE_ALL docfi=1
+#ifdef CONFIG_CPU_R5900
+	sync.p
+#endif
 	MFC0	a2, CP0_BADVADDR
 	KMODE
 	move	a0, sp
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 144ceb0fba88..543ddb22b0d9 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -691,6 +691,9 @@ static void build_restore_pagemask(u32 **p, struct uasm_reloc **r,
 			uasm_i_mtc0(p, 0, C0_PAGEMASK);
 		}
 	}
+#ifdef CONFIG_CPU_R5900
+	uasm_i_syncp(p);
+#endif
 }
 
 static void build_huge_tlb_write_entry(u32 **p, struct uasm_label **l,
@@ -703,6 +706,9 @@ static void build_huge_tlb_write_entry(u32 **p, struct uasm_label **l,
 	uasm_i_lui(p, tmp, PM_HUGE_MASK >> 16);
 	uasm_i_ori(p, tmp, tmp, PM_HUGE_MASK & 0xffff);
 	uasm_i_mtc0(p, tmp, C0_PAGEMASK);
+#ifdef CONFIG_CPU_R5900
+	uasm_i_syncp(p);
+#endif
 
 	build_tlb_write_entry(p, l, r, wmode);
 
@@ -963,21 +969,21 @@ void build_get_pgde32(u32 **p, unsigned int tmp, unsigned int ptr)
 {
 	if (pgd_reg != -1) {
 		/* pgd is in pgd_reg */
-		uasm_i_mfc0(p, ptr, c0_kscratch(), pgd_reg);
-		uasm_i_mfc0(p, tmp, C0_BADVADDR); /* get faulting address */
+		UASM_i_MFC0(p, ptr, c0_kscratch(), pgd_reg);
+		UASM_i_MFC0(p, tmp, C0_BADVADDR); /* get faulting address */
 	} else {
 		long pgdc = (long)pgd_current;
 
 		/* 32 bit SMP has smp_processor_id() stored in CONTEXT. */
 #ifdef CONFIG_SMP
-		uasm_i_mfc0(p, ptr, SMP_CPUID_REG);
+		UASM_i_MFC0(p, ptr, SMP_CPUID_REG);
 		UASM_i_LA_mostly(p, tmp, pgdc);
 		uasm_i_srl(p, ptr, ptr, SMP_CPUID_PTRSHIFT);
 		uasm_i_addu(p, ptr, tmp, ptr);
 #else
 		UASM_i_LA_mostly(p, ptr, pgdc);
 #endif
-		uasm_i_mfc0(p, tmp, C0_BADVADDR); /* get faulting address */
+		UASM_i_MFC0(p, tmp, C0_BADVADDR); /* get faulting address */
 		uasm_i_lw(p, ptr, uasm_rel_lo(pgdc), ptr);
 	}
 	uasm_i_srl(p, tmp, tmp, PGDIR_SHIFT); /* get pgd only bits */
-- 
2.21.0

