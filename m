Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41925475478
	for <lists+linux-mips@lfdr.de>; Wed, 15 Dec 2021 09:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbhLOIp0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Dec 2021 03:45:26 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38892 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240892AbhLOIp0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Dec 2021 03:45:26 -0500
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrNwUq7lh0P4AAA--.1916S6;
        Wed, 15 Dec 2021 16:45:18 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH 4/4] MIPS: retire "asm/llsc.h"
Date:   Wed, 15 Dec 2021 16:45:00 +0800
Message-Id: <20211215084500.24444-5-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215084500.24444-1-huangpei@loongson.cn>
References: <20211215084500.24444-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxrNwUq7lh0P4AAA--.1916S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4UAF4kCrW8Zr18AryDAwb_yoWfKr4UpF
        nFka1kKayYvFyfAa4vyF40yr12vr4ktrZFkFyYgryUA3Z0qF1rXr92kwnYyrykAayvv3WU
        WFWruFy5Z3ZrA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUjEoGPUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

all that "asm/llsc.h" does is just to help inline asm, which can be
stringifyed from "asm/asm.h"

+. Since "asm/asm.h" has all we need, retire "asm/llsc.h"

+. remove unused header file

Inspired-by:   Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/asm.h      |  4 +++
 arch/mips/include/asm/atomic.h   | 10 +++-----
 arch/mips/include/asm/bitops.h   | 24 ++++++++----------
 arch/mips/include/asm/cmpxchg.h  |  8 +++---
 arch/mips/include/asm/kvm_host.h | 12 ++++-----
 arch/mips/include/asm/llsc.h     | 43 --------------------------------
 6 files changed, 28 insertions(+), 73 deletions(-)
 delete mode 100644 arch/mips/include/asm/llsc.h

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index f3302b13d3e0..ed74a6032ec8 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -182,6 +182,8 @@ symbol		=	value
 #define INT_SRLV	srlv
 #define INT_SRA		sra
 #define INT_SRAV	srav
+#define LONG_INS	ins
+#define LONG_EXT	ext
 #endif
 
 #if (_MIPS_SZINT == 64)
@@ -199,6 +201,8 @@ symbol		=	value
 #define INT_SRLV	dsrlv
 #define INT_SRA		dsra
 #define INT_SRAV	dsrav
+#define LONG_INS	dins
+#define LONG_EXT	dext
 #endif
 
 /*
diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index a0b9e7c1e4fc..77ba1e36701f 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -20,9 +20,7 @@
 #include <asm/compiler.h>
 #include <asm/cpu-features.h>
 #include <asm/cmpxchg.h>
-#include <asm/llsc.h>
 #include <asm/sync.h>
-#include <asm/war.h>
 
 #define ATOMIC_OPS(pfx, type)						\
 static __always_inline type arch_##pfx##_read(const pfx##_t *v)		\
@@ -74,7 +72,7 @@ static __inline__ void arch_##pfx##_##op(type i, pfx##_t * v)		\
 	"1:	" #ll "	%0, %1		# " #pfx "_" #op "	\n"	\
 	"	" #asm_op " %0, %2				\n"	\
 	"	" #sc "	%0, %1					\n"	\
-	"\t" __SC_BEQZ "%0, 1b					\n"	\
+	"\t" __stringify(SC_BEQZ) "	%0, 1b			\n"	\
 	"	.set	pop					\n"	\
 	: "=&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)		\
 	: "Ir" (i) : __LLSC_CLOBBER);					\
@@ -104,7 +102,7 @@ arch_##pfx##_##op##_return_relaxed(type i, pfx##_t * v)			\
 	"1:	" #ll "	%1, %2		# " #pfx "_" #op "_return\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
 	"	" #sc "	%0, %2					\n"	\
-	"\t" __SC_BEQZ "%0, 1b					\n"	\
+	"\t" __stringify(SC_BEQZ) "	%0, 1b			\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
 	"	.set	pop					\n"	\
 	: "=&r" (result), "=&r" (temp),					\
@@ -137,7 +135,7 @@ arch_##pfx##_fetch_##op##_relaxed(type i, pfx##_t * v)			\
 	"1:	" #ll "	%1, %2		# " #pfx "_fetch_" #op "\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
 	"	" #sc "	%0, %2					\n"	\
-	"\t" __SC_BEQZ "%0, 1b					\n"	\
+	"\t" __stringify(SC_BEQZ) "	%0, 1b			\n"	\
 	"	.set	pop					\n"	\
 	"	move	%0, %1					\n"	\
 	: "=&r" (result), "=&r" (temp),					\
@@ -237,7 +235,7 @@ static __inline__ type arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
 	"	.set	push					\n"	\
 	"	.set	" MIPS_ISA_LEVEL "			\n"	\
 	"	" #sc "	%1, %2					\n"	\
-	"	" __SC_BEQZ "%1, 1b				\n"	\
+	"	" __stringify(SC_BEQZ) "	%1, 1b		\n"	\
 	"2:	" __SYNC(full, loongson3_war) "			\n"	\
 	"	.set	pop					\n"	\
 	: "=&r" (result), "=&r" (temp),					\
diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index dc2a6234dd3c..3812082b8295 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -16,14 +16,12 @@
 #include <linux/bits.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <asm/asm.h>
 #include <asm/barrier.h>
 #include <asm/byteorder.h>		/* sigh ... */
 #include <asm/compiler.h>
 #include <asm/cpu-features.h>
-#include <asm/isa-rev.h>
-#include <asm/llsc.h>
 #include <asm/sgidefs.h>
-#include <asm/war.h>
 
 #define __bit_op(mem, insn, inputs...) do {			\
 	unsigned long __temp;					\
@@ -32,10 +30,10 @@
 	"	.set		push			\n"	\
 	"	.set		" MIPS_ISA_LEVEL "	\n"	\
 	"	" __SYNC(full, loongson3_war) "		\n"	\
-	"1:	" __LL		"%0, %1			\n"	\
+	"1:	" __stringify(LONG_LL)	"	%0, %1	\n"	\
 	"	" insn		"			\n"	\
-	"	" __SC		"%0, %1			\n"	\
-	"	" __SC_BEQZ	"%0, 1b			\n"	\
+	"	" __stringify(LONG_SC)	"	%0, %1	\n"	\
+	"	" __stringify(SC_BEQZ)	"	%0, 1b	\n"	\
 	"	.set		pop			\n"	\
 	: "=&r"(__temp), "+" GCC_OFF_SMALL_ASM()(mem)		\
 	: inputs						\
@@ -49,10 +47,10 @@
 	"	.set		push			\n"	\
 	"	.set		" MIPS_ISA_LEVEL "	\n"	\
 	"	" __SYNC(full, loongson3_war) "		\n"	\
-	"1:	" __LL		ll_dst ", %2		\n"	\
+	"1:	" __stringify(LONG_LL) " "	ll_dst ", %2\n"	\
 	"	" insn		"			\n"	\
-	"	" __SC		"%1, %2			\n"	\
-	"	" __SC_BEQZ	"%1, 1b			\n"	\
+	"	" __stringify(LONG_SC)	"	%1, %2	\n"	\
+	"	" __stringify(SC_BEQZ)	"	%1, 1b	\n"	\
 	"	.set		pop			\n"	\
 	: "=&r"(__orig), "=&r"(__temp),				\
 	  "+" GCC_OFF_SMALL_ASM()(mem)				\
@@ -98,7 +96,7 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 	}
 
 	if ((MIPS_ISA_REV >= 2) && __builtin_constant_p(bit) && (bit >= 16)) {
-		__bit_op(*m, __INS "%0, %3, %2, 1", "i"(bit), "r"(~0));
+		__bit_op(*m, __stringify(LONG_INS) " %0, %3, %2, 1", "i"(bit), "r"(~0));
 		return;
 	}
 
@@ -126,7 +124,7 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 	}
 
 	if ((MIPS_ISA_REV >= 2) && __builtin_constant_p(bit)) {
-		__bit_op(*m, __INS "%0, $0, %2, 1", "i"(bit));
+		__bit_op(*m, __stringify(LONG_INS) " %0, $0, %2, 1", "i"(bit));
 		return;
 	}
 
@@ -234,8 +232,8 @@ static inline int test_and_clear_bit(unsigned long nr,
 		res = __mips_test_and_clear_bit(nr, addr);
 	} else if ((MIPS_ISA_REV >= 2) && __builtin_constant_p(nr)) {
 		res = __test_bit_op(*m, "%1",
-				    __EXT "%0, %1, %3, 1;"
-				    __INS "%1, $0, %3, 1",
+				    __stringify(LONG_EXT) " %0, %1, %3, 1;"
+				    __stringify(LONG_INS) " %1, $0, %3, 1",
 				    "i"(bit));
 	} else {
 		orig = __test_bit_op(*m, "%0",
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 66a8b293fd80..b47a5e49f519 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -11,9 +11,7 @@
 #include <linux/bug.h>
 #include <linux/irqflags.h>
 #include <asm/compiler.h>
-#include <asm/llsc.h>
 #include <asm/sync.h>
-#include <asm/war.h>
 
 /*
  * These functions doesn't exist, so if they are called you'll either:
@@ -48,7 +46,7 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
 		"	move	$1, %z3				\n"	\
 		"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"	\
 		"	" st "	$1, %1				\n"	\
-		"\t" __SC_BEQZ	"$1, 1b				\n"	\
+		"\t" __stringify(SC_BEQZ)	"	$1, 1b	\n"	\
 		"	.set	pop				\n"	\
 		: "=&r" (__ret), "=" GCC_OFF_SMALL_ASM() (*m)		\
 		: GCC_OFF_SMALL_ASM() (*m), "Jr" (val)			\
@@ -127,7 +125,7 @@ unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
 		"	move	$1, %z4				\n"	\
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"	\
 		"	" st "	$1, %1				\n"	\
-		"\t" __SC_BEQZ	"$1, 1b				\n"	\
+		"\t" __stringify(SC_BEQZ)	"	$1, 1b	\n"	\
 		"	.set	pop				\n"	\
 		"2:	" __SYNC(full, loongson3_war) "		\n"	\
 		: "=&r" (__ret), "=" GCC_OFF_SMALL_ASM() (*m)		\
@@ -282,7 +280,7 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
 	/* Attempt to store new at ptr */
 	"	scd	%L1, %2				\n"
 	/* If we failed, loop! */
-	"\t" __SC_BEQZ "%L1, 1b				\n"
+	"\t" __stringify(SC_BEQZ) "	%L1, 1b		\n"
 	"2:	" __SYNC(full, loongson3_war) "		\n"
 	"	.set	pop				\n"
 	: "=&r"(ret),
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 696f6b009377..bfe6d9e48dbf 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -379,9 +379,9 @@ static inline void _kvm_atomic_set_c0_guest_reg(unsigned long *reg,
 		__asm__ __volatile__(
 		"	.set	push				\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-		"	" __LL "%0, %1				\n"
+		"	"__stringify(LONG_LL)	" %0, %1	\n"
 		"	or	%0, %2				\n"
-		"	" __SC	"%0, %1				\n"
+		"	"__stringify(LONG_SC)	" %0, %1	\n"
 		"	.set	pop				\n"
 		: "=&r" (temp), "+m" (*reg)
 		: "r" (val));
@@ -396,9 +396,9 @@ static inline void _kvm_atomic_clear_c0_guest_reg(unsigned long *reg,
 		__asm__ __volatile__(
 		"	.set	push				\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-		"	" __LL "%0, %1				\n"
+		"	"__stringify(LONG_LL)	" %0, %1	\n"
 		"	and	%0, %2				\n"
-		"	" __SC	"%0, %1				\n"
+		"	"__stringify(LONG_SC)	" %0, %1	\n"
 		"	.set	pop				\n"
 		: "=&r" (temp), "+m" (*reg)
 		: "r" (~val));
@@ -414,10 +414,10 @@ static inline void _kvm_atomic_change_c0_guest_reg(unsigned long *reg,
 		__asm__ __volatile__(
 		"	.set	push				\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-		"	" __LL "%0, %1				\n"
+		"	"__stringify(LONG_LL)	" %0, %1	\n"
 		"	and	%0, %2				\n"
 		"	or	%0, %3				\n"
-		"	" __SC	"%0, %1				\n"
+		"	"__stringify(LONG_SC)	" %0, %1	\n"
 		"	.set	pop				\n"
 		: "=&r" (temp), "+m" (*reg)
 		: "r" (~change), "r" (val & change));
diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
deleted file mode 100644
index 8cc28177c37f..000000000000
--- a/arch/mips/include/asm/llsc.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Macros for 32/64-bit neutral inline assembler
- */
-
-#ifndef __ASM_LLSC_H
-#define __ASM_LLSC_H
-
-#include <asm/isa-rev.h>
-
-#if _MIPS_SZLONG == 32
-#define __LL		"ll	"
-#define __SC		"sc	"
-#define __ADDU		"addu	"
-#define __SUBU		"subu	"
-#define __INS		"ins	"
-#define __EXT		"ext	"
-#elif _MIPS_SZLONG == 64
-#define __LL		"lld	"
-#define __ADDU		"daddu	"
-#define __SUBU		"dsubu	"
-#define __SC		"scd	"
-#define __INS		"dins	"
-#define __EXT		"dext	"
-#endif
-
-/*
- * Using a branch-likely instruction to check the result of an sc instruction
- * works around a bug present in R10000 CPUs prior to revision 3.0 that could
- * cause ll-sc sequences to execute non-atomically.
- */
-#ifdef CONFIG_WAR_R10000_LLSC
-# define __SC_BEQZ "beqzl	"
-#elif MIPS_ISA_REV >= 6
-# define __SC_BEQZ "beqzc	"
-#else
-# define __SC_BEQZ "beqz	"
-#endif
-
-#endif /* __ASM_LLSC_H  */
-- 
2.20.1

