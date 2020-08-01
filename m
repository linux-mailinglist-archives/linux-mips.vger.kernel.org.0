Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9782350D0
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 08:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgHAGes (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Aug 2020 02:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHAGer (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Aug 2020 02:34:47 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65860C06174A
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 23:34:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 15DD51FF00;
        Sat,  1 Aug 2020 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1596263687; bh=UW0FRfMncZCae3N4/foSv0LHrVdTr9KMuPbLe2WPEXc=;
        h=From:To:Cc:Subject:Date:From;
        b=M67iX/Bxn3bepQuuP42oKaHvPgoF5dd1JVlxsokDm4asIEP4mNXW5f+7xQFUnmcOo
         XdIY/d2lvQRc/J8l8Cv7PPReYAvhxS3t4hd8mRfVXm50ZUlG0g+p8Jx2/bzpXCVPmD
         1F4LfWnxFwcLpFk3+hNQJK6a7AUwuLCtHqu3zUJn72Y7NmINApdOZdURHlXzJ5AC9K
         ATP2dGVWe8I9HsW/wTSSgUNs9irWkA1xygzWMp67hqOdt95VGrxp28V7xj6xLFYdQ1
         S5eCpbXwe6MvlyZOkd+H2wmtewYGJLze0+jhLld6m89SfCnPvVsh97CGN5vkgXF0Xt
         MYzNX9vzvIkng==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     stable@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        gregkh@linuxfoundation.org
Subject: [PATCH stable] MIPS: Loongson: Introduce and use loongson_llsc_mb()
Date:   Sat,  1 Aug 2020 14:34:43 +0800
Message-Id: <20200801063443.1438289-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

commit e02e07e3127d8aec1f4bcdfb2fc52a2d99b4859e upstream.

On the Loongson-2G/2H/3A/3B there is a hardware flaw that ll/sc and
lld/scd is very weak ordering. We should add sync instructions "before
each ll/lld" and "at the branch-target between ll/sc" to workaround.
Otherwise, this flaw will cause deadlock occasionally (e.g. when doing
heavy load test with LTP).

Below is the explaination of CPU designer:

"For Loongson 3 family, when a memory access instruction (load, store,
or prefetch)'s executing occurs between the execution of LL and SC, the
success or failure of SC is not predictable. Although programmer would
not insert memory access instructions between LL and SC, the memory
instructions before LL in program-order, may dynamically executed
between the execution of LL/SC, so a memory fence (SYNC) is needed
before LL/LLD to avoid this situation.

Since Loongson-3A R2 (3A2000), we have improved our hardware design to
handle this case. But we later deduce a rarely circumstance that some
speculatively executed memory instructions due to branch misprediction
between LL/SC still fall into the above case, so a memory fence (SYNC)
at branch-target (if its target is not between LL/SC) is needed for
Loongson 3A1000, 3B1500, 3A2000 and 3A3000.

Our processor is continually evolving and we aim to to remove all these
workaround-SYNCs around LL/SC for new-come processor."

Here is an example:

Both cpu1 and cpu2 simutaneously run atomic_add by 1 on same atomic var,
this bug cause both 'sc' run by two cpus (in atomic_add) succeed at same
time('sc' return 1), and the variable is only *added by 1*, sometimes,
which is wrong and unacceptable(it should be added by 2).

Why disable fix-loongson3-llsc in compiler?
Because compiler fix will cause problems in kernel's __ex_table section.

This patch fix all the cases in kernel, but:

+. the fix at the end of futex_atomic_cmpxchg_inatomic is for branch-target
of 'bne', there other cases which smp_mb__before_llsc() and smp_llsc_mb() fix
the ll and branch-target coincidently such as atomic_sub_if_positive/
cmpxchg/xchg, just like this one.

+. Loongson 3 does support CONFIG_EDAC_ATOMIC_SCRUB, so no need to touch
edac.h

+. local_ops and cmpxchg_local should not be affected by this bug since
only the owner can write.

+. mips_atomic_set for syscall.c is deprecated and rarely used, just let
it go

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
[paul.burton@mips.com:
  - Simplify the addition of -mno-fix-loongson3-llsc to cflags, and add
    a comment describing why it's there.
  - Make loongson_llsc_mb() a no-op when
    CONFIG_CPU_LOONGSON3_WORKAROUNDS=n, rather than a compiler memory
    barrier.
  - Add a comment describing the bug & how loongson_llsc_mb() helps
    in asm/barrier.h.]
Signed-off-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: ambrosehua@gmail.com
Cc: Steven J . Hill <Steven.Hill@cavium.com>
Cc: linux-mips@linux-mips.org
Cc: Fuxin Zhang <zhangfx@lemote.com>
Cc: Zhangjin Wu <wuzhangjin@gmail.com>
Cc: Li Xuefeng <lixuefeng@loongson.cn>
Cc: Xu Chenghua <xuchenghua@loongson.cn>
Cc: stable@vger.kernel.org # 4.19

---
Backport to stable according to request from Debian downstream.
---
 arch/mips/Kconfig               | 15 ++++++++++++++
 arch/mips/include/asm/atomic.h  |  6 ++++++
 arch/mips/include/asm/barrier.h | 36 +++++++++++++++++++++++++++++++++
 arch/mips/include/asm/bitops.h  |  5 +++++
 arch/mips/include/asm/futex.h   |  3 +++
 arch/mips/include/asm/pgtable.h |  2 ++
 arch/mips/loongson64/Platform   | 23 +++++++++++++++++++++
 arch/mips/mm/tlbex.c            | 10 +++++++++
 8 files changed, 100 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a830a9701e50..864a2d2fd054 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1398,6 +1398,21 @@ config LOONGSON3_ENHANCEMENT
 	  please say 'N' here. If you want a high-performance kernel to run on
 	  new Loongson 3 machines only, please say 'Y' here.
 
+config CPU_LOONGSON3_WORKAROUNDS
+	bool "Old Loongson 3 LLSC Workarounds"
+	default y if SMP
+	depends on CPU_LOONGSON3
+	help
+	  Loongson 3 processors have the llsc issues which require workarounds.
+	  Without workarounds the system may hang unexpectedly.
+
+	  Newer Loongson 3 will fix these issues and no workarounds are needed.
+	  The workarounds have no significant side effect on them but may
+	  decrease the performance of the system so this option should be
+	  disabled unless the kernel is intended to be run on old systems.
+
+	  If unsure, please say Y.
+
 config CPU_LOONGSON2E
 	bool "Loongson 2E"
 	depends on SYS_HAS_CPU_LOONGSON2E
diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index 9e805317847d..1fc6f04e85a1 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -58,6 +58,7 @@ static __inline__ void atomic_##op(int i, atomic_t * v)			      \
 	if (kernel_uses_llsc) {						      \
 		int temp;						      \
 									      \
+		loongson_llsc_mb();					      \
 		__asm__ __volatile__(					      \
 		"	.set	"MIPS_ISA_LEVEL"			\n"   \
 		"1:	ll	%0, %1		# atomic_" #op "	\n"   \
@@ -84,6 +85,7 @@ static __inline__ int atomic_##op##_return_relaxed(int i, atomic_t * v)	      \
 	if (kernel_uses_llsc) {						      \
 		int temp;						      \
 									      \
+		loongson_llsc_mb();					      \
 		__asm__ __volatile__(					      \
 		"	.set	"MIPS_ISA_LEVEL"			\n"   \
 		"1:	ll	%1, %2		# atomic_" #op "_return	\n"   \
@@ -116,6 +118,7 @@ static __inline__ int atomic_fetch_##op##_relaxed(int i, atomic_t * v)	      \
 	if (kernel_uses_llsc) {						      \
 		int temp;						      \
 									      \
+		loongson_llsc_mb();					      \
 		__asm__ __volatile__(					      \
 		"	.set	"MIPS_ISA_LEVEL"			\n"   \
 		"1:	ll	%1, %2		# atomic_fetch_" #op "	\n"   \
@@ -251,6 +254,7 @@ static __inline__ void atomic64_##op(long i, atomic64_t * v)		      \
 	if (kernel_uses_llsc) {						      \
 		long temp;						      \
 									      \
+		loongson_llsc_mb();					      \
 		__asm__ __volatile__(					      \
 		"	.set	"MIPS_ISA_LEVEL"			\n"   \
 		"1:	lld	%0, %1		# atomic64_" #op "	\n"   \
@@ -277,6 +281,7 @@ static __inline__ long atomic64_##op##_return_relaxed(long i, atomic64_t * v) \
 	if (kernel_uses_llsc) {						      \
 		long temp;						      \
 									      \
+		loongson_llsc_mb();					      \
 		__asm__ __volatile__(					      \
 		"	.set	"MIPS_ISA_LEVEL"			\n"   \
 		"1:	lld	%1, %2		# atomic64_" #op "_return\n"  \
@@ -309,6 +314,7 @@ static __inline__ long atomic64_fetch_##op##_relaxed(long i, atomic64_t * v)  \
 	if (kernel_uses_llsc) {						      \
 		long temp;						      \
 									      \
+		loongson_llsc_mb();					      \
 		__asm__ __volatile__(					      \
 		"	.set	"MIPS_ISA_LEVEL"			\n"   \
 		"1:	lld	%1, %2		# atomic64_fetch_" #op "\n"   \
diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
index a5eb1bb199a7..b7f6ac5e513c 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -222,6 +222,42 @@
 #define __smp_mb__before_atomic()	__smp_mb__before_llsc()
 #define __smp_mb__after_atomic()	smp_llsc_mb()
 
+/*
+ * Some Loongson 3 CPUs have a bug wherein execution of a memory access (load,
+ * store or pref) in between an ll & sc can cause the sc instruction to
+ * erroneously succeed, breaking atomicity. Whilst it's unusual to write code
+ * containing such sequences, this bug bites harder than we might otherwise
+ * expect due to reordering & speculation:
+ *
+ * 1) A memory access appearing prior to the ll in program order may actually
+ *    be executed after the ll - this is the reordering case.
+ *
+ *    In order to avoid this we need to place a memory barrier (ie. a sync
+ *    instruction) prior to every ll instruction, in between it & any earlier
+ *    memory access instructions. Many of these cases are already covered by
+ *    smp_mb__before_llsc() but for the remaining cases, typically ones in
+ *    which multiple CPUs may operate on a memory location but ordering is not
+ *    usually guaranteed, we use loongson_llsc_mb() below.
+ *
+ *    This reordering case is fixed by 3A R2 CPUs, ie. 3A2000 models and later.
+ *
+ * 2) If a conditional branch exists between an ll & sc with a target outside
+ *    of the ll-sc loop, for example an exit upon value mismatch in cmpxchg()
+ *    or similar, then misprediction of the branch may allow speculative
+ *    execution of memory accesses from outside of the ll-sc loop.
+ *
+ *    In order to avoid this we need a memory barrier (ie. a sync instruction)
+ *    at each affected branch target, for which we also use loongson_llsc_mb()
+ *    defined below.
+ *
+ *    This case affects all current Loongson 3 CPUs.
+ */
+#ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS /* Loongson-3's LLSC workaround */
+#define loongson_llsc_mb()	__asm__ __volatile__(__WEAK_LLSC_MB : : :"memory")
+#else
+#define loongson_llsc_mb()	do { } while (0)
+#endif
+
 #include <asm-generic/barrier.h>
 
 #endif /* __ASM_BARRIER_H */
diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index da1b8718861e..2a40ecd69ac4 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -68,6 +68,7 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 		: "ir" (1UL << bit), GCC_OFF_SMALL_ASM() (*m));
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	" __LL "%0, %1		# set_bit	\n"
@@ -78,6 +79,7 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 		} while (unlikely(!temp));
 #endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
 	} else if (kernel_uses_llsc) {
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
@@ -120,6 +122,7 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 		: "ir" (~(1UL << bit)));
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	" __LL "%0, %1		# clear_bit	\n"
@@ -130,6 +133,7 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 		} while (unlikely(!temp));
 #endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
 	} else if (kernel_uses_llsc) {
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
@@ -188,6 +192,7 @@ static inline void change_bit(unsigned long nr, volatile unsigned long *addr)
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
diff --git a/arch/mips/include/asm/futex.h b/arch/mips/include/asm/futex.h
index a9e61ea54ca9..0a62a91b592d 100644
--- a/arch/mips/include/asm/futex.h
+++ b/arch/mips/include/asm/futex.h
@@ -50,6 +50,7 @@
 		  "i" (-EFAULT)						\
 		: "memory");						\
 	} else if (cpu_has_llsc) {					\
+		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
@@ -162,6 +163,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 		  "i" (-EFAULT)
 		: "memory");
 	} else if (cpu_has_llsc) {
+		loongson_llsc_mb();
 		__asm__ __volatile__(
 		"# futex_atomic_cmpxchg_inatomic			\n"
 		"	.set	push					\n"
@@ -190,6 +192,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 		: GCC_OFF_SMALL_ASM() (*uaddr), "Jr" (oldval), "Jr" (newval),
 		  "i" (-EFAULT)
 		: "memory");
+		loongson_llsc_mb();
 	} else
 		return -ENOSYS;
 
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 129e0328367f..6a35bbf46b93 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -229,6 +229,7 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 			: [buddy] "+m" (buddy->pte), [tmp] "=&r" (tmp)
 			: [global] "r" (page_global));
 		} else if (kernel_uses_llsc) {
+			loongson_llsc_mb();
 			__asm__ __volatile__ (
 			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
 			"	.set	push				\n"
@@ -244,6 +245,7 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 			"	.set	mips0				\n"
 			: [buddy] "+m" (buddy->pte), [tmp] "=&r" (tmp)
 			: [global] "r" (page_global));
+			loongson_llsc_mb();
 		}
 #else /* !CONFIG_SMP */
 		if (pte_none(*buddy))
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index 12abf14aed4a..9f79908f5063 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -23,6 +23,29 @@ ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
 endif
 
 cflags-$(CONFIG_CPU_LOONGSON3)	+= -Wa,--trap
+
+#
+# Some versions of binutils, not currently mainline as of 2019/02/04, support
+# an -mfix-loongson3-llsc flag which emits a sync prior to each ll instruction
+# to work around a CPU bug (see loongson_llsc_mb() in asm/barrier.h for a
+# description).
+#
+# We disable this in order to prevent the assembler meddling with the
+# instruction that labels refer to, ie. if we label an ll instruction:
+#
+# 1: ll v0, 0(a0)
+#
+# ...then with the assembler fix applied the label may actually point at a sync
+# instruction inserted by the assembler, and if we were using the label in an
+# exception table the table would no longer contain the address of the ll
+# instruction.
+#
+# Avoid this by explicitly disabling that assembler behaviour. If upstream
+# binutils does not merge support for the flag then we can revisit & remove
+# this later - for now it ensures vendor toolchains don't cause problems.
+#
+cflags-$(CONFIG_CPU_LOONGSON3)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+
 #
 # binutils from v2.25 on and gcc starting from v4.9.0 treat -march=loongson3a
 # as MIPS64 R2; older versions as just R1.  This leaves the possibility open
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 620abc968624..c99c53ba8338 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -943,6 +943,8 @@ build_get_pgd_vmalloc64(u32 **p, struct uasm_label **l, struct uasm_reloc **r,
 		 * to mimic that here by taking a load/istream page
 		 * fault.
 		 */
+		if (IS_ENABLED(CONFIG_CPU_LOONGSON3_WORKAROUNDS))
+			uasm_i_sync(p, 0);
 		UASM_i_LA(p, ptr, (unsigned long)tlb_do_page_fault_0);
 		uasm_i_jr(p, ptr);
 
@@ -1666,6 +1668,8 @@ static void
 iPTE_LW(u32 **p, unsigned int pte, unsigned int ptr)
 {
 #ifdef CONFIG_SMP
+	if (IS_ENABLED(CONFIG_CPU_LOONGSON3_WORKAROUNDS))
+		uasm_i_sync(p, 0);
 # ifdef CONFIG_PHYS_ADDR_T_64BIT
 	if (cpu_has_64bits)
 		uasm_i_lld(p, pte, 0, ptr);
@@ -2279,6 +2283,8 @@ static void build_r4000_tlb_load_handler(void)
 #endif
 
 	uasm_l_nopage_tlbl(&l, p);
+	if (IS_ENABLED(CONFIG_CPU_LOONGSON3_WORKAROUNDS))
+		uasm_i_sync(&p, 0);
 	build_restore_work_registers(&p);
 #ifdef CONFIG_CPU_MICROMIPS
 	if ((unsigned long)tlb_do_page_fault_0 & 1) {
@@ -2333,6 +2339,8 @@ static void build_r4000_tlb_store_handler(void)
 #endif
 
 	uasm_l_nopage_tlbs(&l, p);
+	if (IS_ENABLED(CONFIG_CPU_LOONGSON3_WORKAROUNDS))
+		uasm_i_sync(&p, 0);
 	build_restore_work_registers(&p);
 #ifdef CONFIG_CPU_MICROMIPS
 	if ((unsigned long)tlb_do_page_fault_1 & 1) {
@@ -2388,6 +2396,8 @@ static void build_r4000_tlb_modify_handler(void)
 #endif
 
 	uasm_l_nopage_tlbm(&l, p);
+	if (IS_ENABLED(CONFIG_CPU_LOONGSON3_WORKAROUNDS))
+		uasm_i_sync(&p, 0);
 	build_restore_work_registers(&p);
 #ifdef CONFIG_CPU_MICROMIPS
 	if ((unsigned long)tlb_do_page_fault_1 & 1) {
-- 
2.28.0.rc1

