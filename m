Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48297C16CF
	for <lists+linux-mips@lfdr.de>; Sun, 29 Sep 2019 19:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbfI2RdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Sep 2019 13:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729950AbfI2RdJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 29 Sep 2019 13:33:09 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 784422086A;
        Sun, 29 Sep 2019 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569778387;
        bh=DZQTAFBv84UMcgg36CfvV0xG1zQ/bXlkAiu9bQLbMO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J/lF1sAhU+ZuAvHWpE7O1zcT0Rslr7ZkmFoZzQvDhumGiUeIGo7s131NH+JDhs35w
         2eHKl1Q8kEx4u3Ej8Zz42AWHLV/JOv4Uxs3tRnrFyb1NkL8Yu7a7HhQDZ2/Qa5xbxQ
         g+nhk/VO7URf6RJvsgl36nRfEP3RhDgqT6nSEWng=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Huacai Chen <chenhc@lemote.com>,
        Huang Pei <huangpei@loongson.cn>,
        Paul Burton <paul.burton@mips.com>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 09/42] mips/atomic: Fix loongson_llsc_mb() wreckage
Date:   Sun, 29 Sep 2019 13:32:08 -0400
Message-Id: <20190929173244.8918-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190929173244.8918-1-sashal@kernel.org>
References: <20190929173244.8918-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Peter Zijlstra <peterz@infradead.org>

[ Upstream commit 1c6c1ca318585f1096d4d04bc722297c85e9fb8a ]

The comment describing the loongson_llsc_mb() reorder case doesn't
make any sense what so ever. Instruction re-ordering is not an SMP
artifact, but rather a CPU local phenomenon. Clarify the comment by
explaining that these issue cause a coherence fail.

For the branch speculation case; if futex_atomic_cmpxchg_inatomic()
needs one at the bne branch target, then surely the normal
__cmpxch_asm() implementation does too. We cannot rely on the
barriers from cmpxchg() because cmpxchg_local() is implemented with
the same macro, and branch prediction and speculation are, too, CPU
local.

Fixes: e02e07e3127d ("MIPS: Loongson: Introduce and use loongson_llsc_mb()")
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Huang Pei <huangpei@loongson.cn>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/atomic.h  |  5 +++--
 arch/mips/include/asm/barrier.h | 32 ++++++++++++++++++--------------
 arch/mips/include/asm/bitops.h  |  5 +++++
 arch/mips/include/asm/cmpxchg.h |  5 +++++
 arch/mips/kernel/syscall.c      |  1 +
 5 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index 94096299fc569..c85405afba5ed 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -193,6 +193,7 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
 	if (kernel_uses_llsc) {
 		int temp;
 
+		loongson_llsc_mb();
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_LEVEL"			\n"
@@ -200,12 +201,12 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
 		"	.set	pop					\n"
 		"	subu	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	bltz	%0, 1f					\n"
+		"	bltz	%0, 2f					\n"
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	sc	%1, %2					\n"
 		"\t" __scbeqz "	%1, 1b					\n"
-		"1:							\n"
+		"2:							\n"
 		"	.set	pop					\n"
 		: "=&r" (result), "=&r" (temp),
 		  "+" GCC_OFF_SMALL_ASM() (v->counter)
diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
index b865e317a14f7..f9a6da96aae12 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -238,36 +238,40 @@
 
 /*
  * Some Loongson 3 CPUs have a bug wherein execution of a memory access (load,
- * store or pref) in between an ll & sc can cause the sc instruction to
+ * store or prefetch) in between an LL & SC can cause the SC instruction to
  * erroneously succeed, breaking atomicity. Whilst it's unusual to write code
  * containing such sequences, this bug bites harder than we might otherwise
  * expect due to reordering & speculation:
  *
- * 1) A memory access appearing prior to the ll in program order may actually
- *    be executed after the ll - this is the reordering case.
+ * 1) A memory access appearing prior to the LL in program order may actually
+ *    be executed after the LL - this is the reordering case.
  *
- *    In order to avoid this we need to place a memory barrier (ie. a sync
- *    instruction) prior to every ll instruction, in between it & any earlier
- *    memory access instructions. Many of these cases are already covered by
- *    smp_mb__before_llsc() but for the remaining cases, typically ones in
- *    which multiple CPUs may operate on a memory location but ordering is not
- *    usually guaranteed, we use loongson_llsc_mb() below.
+ *    In order to avoid this we need to place a memory barrier (ie. a SYNC
+ *    instruction) prior to every LL instruction, in between it and any earlier
+ *    memory access instructions.
  *
  *    This reordering case is fixed by 3A R2 CPUs, ie. 3A2000 models and later.
  *
- * 2) If a conditional branch exists between an ll & sc with a target outside
- *    of the ll-sc loop, for example an exit upon value mismatch in cmpxchg()
+ * 2) If a conditional branch exists between an LL & SC with a target outside
+ *    of the LL-SC loop, for example an exit upon value mismatch in cmpxchg()
  *    or similar, then misprediction of the branch may allow speculative
- *    execution of memory accesses from outside of the ll-sc loop.
+ *    execution of memory accesses from outside of the LL-SC loop.
  *
- *    In order to avoid this we need a memory barrier (ie. a sync instruction)
+ *    In order to avoid this we need a memory barrier (ie. a SYNC instruction)
  *    at each affected branch target, for which we also use loongson_llsc_mb()
  *    defined below.
  *
  *    This case affects all current Loongson 3 CPUs.
+ *
+ * The above described cases cause an error in the cache coherence protocol;
+ * such that the Invalidate of a competing LL-SC goes 'missing' and SC
+ * erroneously observes its core still has Exclusive state and lets the SC
+ * proceed.
+ *
+ * Therefore the error only occurs on SMP systems.
  */
 #ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS /* Loongson-3's LLSC workaround */
-#define loongson_llsc_mb()	__asm__ __volatile__(__WEAK_LLSC_MB : : :"memory")
+#define loongson_llsc_mb()	__asm__ __volatile__("sync" : : :"memory")
 #else
 #define loongson_llsc_mb()	do { } while (0)
 #endif
diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 9a466dde9b96a..7bd35e5e2a9e4 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -249,6 +249,7 @@ static inline int test_and_set_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
@@ -305,6 +306,7 @@ static inline int test_and_set_bit_lock(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
@@ -364,6 +366,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	" __LL	"%0, %1 # test_and_clear_bit	\n"
@@ -379,6 +382,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
@@ -438,6 +442,7 @@ static inline int test_and_change_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
+		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index f345a873742d9..f5994a332673b 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -46,6 +46,7 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
 	__typeof(*(m)) __ret;						\
 									\
 	if (kernel_uses_llsc) {						\
+		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
@@ -117,6 +118,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 	__typeof(*(m)) __ret;						\
 									\
 	if (kernel_uses_llsc) {						\
+		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
@@ -134,6 +136,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 		: "=&r" (__ret), "=" GCC_OFF_SMALL_ASM() (*m)		\
 		: GCC_OFF_SMALL_ASM() (*m), "Jr" (old), "Jr" (new)		\
 		: "memory");						\
+		loongson_llsc_mb();					\
 	} else {							\
 		unsigned long __flags;					\
 									\
@@ -229,6 +232,7 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
 	 */
 	local_irq_save(flags);
 
+	loongson_llsc_mb();
 	asm volatile(
 	"	.set	push				\n"
 	"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"
@@ -274,6 +278,7 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
 	  "r" (old),
 	  "r" (new)
 	: "memory");
+	loongson_llsc_mb();
 
 	local_irq_restore(flags);
 	return ret;
diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index b6dc78ad5d8c0..b0e25e913bdb9 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -132,6 +132,7 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 		  [efault] "i" (-EFAULT)
 		: "memory");
 	} else if (cpu_has_llsc) {
+		loongson_llsc_mb();
 		__asm__ __volatile__ (
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
-- 
2.20.1

