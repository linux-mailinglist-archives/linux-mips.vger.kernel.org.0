Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82C54036A4
	for <lists+linux-mips@lfdr.de>; Wed,  8 Sep 2021 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351328AbhIHJKG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Sep 2021 05:10:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59020 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1351239AbhIHJKE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Sep 2021 05:10:04 -0400
Received: from localhost.localdomain (unknown [89.187.161.160])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx5OWIfThh6pUBAA--.2216S4;
        Wed, 08 Sep 2021 17:08:48 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        linux-rt-users@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH 2/2] MIPS: retire "asm/llsc.h"
Date:   Wed,  8 Sep 2021 17:08:18 +0800
Message-Id: <20210908090818.923791-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908090818.923791-1-huangpei@loongson.cn>
References: <20210908090818.923791-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cx5OWIfThh6pUBAA--.2216S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyDXw4rJF4rWFyktFWrKrg_yoW3trW5pa
        nFka1kKayYva4fAas2vF40yr4jvrs5trZFkFyY9ryUA3Z0qFyrXr9akwnYyrykAayvv3WU
        WFy5WFy5A3ZrA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE1syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
        xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
        1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
        6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
        AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
        vjTRCa0PUUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

all that "asm/llsc.h" does is just to help inline asm, which can be
stringifyed from "asm/asm.h"

+. Since "asm/asm.h" has all we need, just stringify it and retire
   "asm/llsc.h"

+. remove unused header file

Inspired-by:   "Maciej W. Rozycki" <macro@orcam.me.uk>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/asm.h      |  4 ++++
 arch/mips/include/asm/atomic.h   | 10 ++++------
 arch/mips/include/asm/bitops.h   | 24 +++++++++++-------------
 arch/mips/include/asm/cmpxchg.h  |  8 +++-----
 arch/mips/include/asm/kvm_host.h | 12 ++++++------
 5 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index f3302b13d3e0..6ffdd4b5e1d0 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -222,6 +222,8 @@ symbol		=	value
 #define LONG_SRLV	srlv
 #define LONG_SRA	sra
 #define LONG_SRAV	srav
+#define LONG_INS	ins
+#define LONG_EXT	ext
 
 #ifdef __ASSEMBLY__
 #define LONG		.word
@@ -249,6 +251,8 @@ symbol		=	value
 #define LONG_SRLV	dsrlv
 #define LONG_SRA	dsra
 #define LONG_SRAV	dsrav
+#define LONG_INS	dins
+#define LONG_EXT	dext
 
 #ifdef __ASSEMBLY__
 #define LONG		.dword
diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index 95e1f7f3597f..ebeda04cb0e3 100644
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
@@ -237,7 +235,7 @@ static __inline__ int arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
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
index 0b983800f48b..fbfd5c5667e0 100644
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
@@ -279,7 +277,7 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
 	/* Attempt to store new at ptr */
 	"	scd	%L1, %2				\n"
 	/* If we failed, loop! */
-	"\t" __SC_BEQZ "%L1, 1b				\n"
+	"\t" __stringify(SC_BEQZ) "	%L1, 1b		\n"
 	"	.set	pop				\n"
 	"2:	" __SYNC(full, loongson3_war) "		\n"
 	: "=&r"(ret),
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 696f6b009377..12202521dfbd 100644
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
+		"	"__stringify(LONG_LL) "	%0, %1		\n"
 		"	and	%0, %2				\n"
 		"	or	%0, %3				\n"
-		"	" __SC	"%0, %1				\n"
+		"	"__stringify(LONG_SC) " %0, %1		\n"
 		"	.set	pop				\n"
 		: "=&r" (temp), "+m" (*reg)
 		: "r" (~change), "r" (val & change));
-- 
2.25.1

