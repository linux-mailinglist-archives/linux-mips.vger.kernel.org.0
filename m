Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D98AD253
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2019 05:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbfIIDlI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Sep 2019 23:41:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39257 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbfIIDlI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Sep 2019 23:41:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id s12so8271066pfe.6
        for <linux-mips@vger.kernel.org>; Sun, 08 Sep 2019 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=bNh1RagaNmk+mawVUoE7ysB93szXp1ih53+M2GfhhEg=;
        b=c3h4kzNcfU/5kjgyxNOAFigu/7846ZfOspcecQ7Ei8LBe9Mhs8TBdV7VQY+cNnTfyO
         Iott/BzjOn0YTJ/jleUNjEzS1zWdN44XNowmpNP69EPWQ6WgpHJgmtYTL6jxuAoLaUc+
         ebqvST5RWPuBdRdXRVL1Ejc5CwnhvDxkszfkYZGsv1YQVpcRWw9/COBfe+Bxp+bd6n0v
         mgq0VlJ6IXb7pZmPpJ78iWq1dt7ZEwdZxqi6B1/h0oHud+d601yWlnVueTV6I8jV1FqJ
         1ZChW78gVsjPUAAJO7WX5fiGF2xoabrQNZ9lOfMdF7prsqMU94WUbsQqM2jyorYA44UI
         Bxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=bNh1RagaNmk+mawVUoE7ysB93szXp1ih53+M2GfhhEg=;
        b=PPtiYKHN5cN8cFhDDauIF4DLzfhH7/AFR4pVVpruU97ohComrrn68g/HhTiR40TOVF
         MsN0GJei9NBHF414mj1B86gWX3/yHFdii4PKD2UyWqiPIyvkzr4ODMKYHf4qYz4xap1H
         exxw1yVUraElkD2cyXgM0oEUZBnzq/TPMMJ56mV1kjkcAViACFK3dQ8uhkzTdILII4sq
         te7a3e6HA0GzewK0WKCEtxVD40iRN9dsdtWbCsiShrET5/Dc6LTsXtdZ/Se3LMF9TAHv
         M+JG1/FZMF0zaQsEcbnJ5r3yYlul1LVSoeKiSbGJquU2RLD3dgSdeyqQY9TbCXy6obTf
         Fz3w==
X-Gm-Message-State: APjAAAV8s+u0aLqZEeqskWJ+cPw95s2uFjHcFLGIfu2NN7u663Ao/zwm
        GLuTPdDbzWzYnNaTR9QtGfk=
X-Google-Smtp-Source: APXvYqyJsyvOMQSKSLIL+4p328X2OZPQ4AaV5K4ZWSKsUBXQCbwD4sI+vwadqoMYtt0+WA1LEJU6Gg==
X-Received: by 2002:a62:e915:: with SMTP id j21mr25539143pfh.239.1568000467415;
        Sun, 08 Sep 2019 20:41:07 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id z6sm12386781pgk.18.2019.09.08.20.41.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 20:41:06 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Huang Pei <huangpei@loongson.cn>,
        Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] MIPS: Loongson: remove unnecessary loongson_llsc_mb()
Date:   Mon,  9 Sep 2019 11:42:38 +0800
Message-Id: <1568000558-11823-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 1c6c1ca318585f1 ("mips/atomic: Fix loongson_llsc_mb() wreckage")
fix the description of Loongson-3's llsc bug and try to add all missing
loongson_llsc_mb(). This is a good job but there are some unnecessary
memory barries:

loongson_llsc_mb() is a Loongson-specific problem. smp_llsc_mb(),
smp_mb__before_llsc(), loongson_llsc_mb() and and other memory barriers
are essentially the same thing on Loongson-3. So we don't need to add
loongson_llsc_mb() if there is already a smp_mb__before_llsc() or other
types of memory barriers.

So, most of loongson_llsc_mb() in Peter's patch is superfluous and can
be removed, except the one in test_and_set_bit_lock().

mips_atomic_set() is not used on Loongson-3, and if in some cases we use
it, the user-to-kernel context switching probably has the same effect of
a memory barrier. But anyway, add a memory barrier in mips_atomic_set()
is harmless, so I keep this one.

For cmpxchg.h, the 32-bit version of cmpxchg64() doesn't need to be care
about because Loongson64 can support 64-bit kernel only, cmpxchg() need
memory barriers and it already has, cmpxchg_local() doesn't need memory
barriers because only the local cpu can write, which is the same as all
other local_t ops. So I remove all loongson_llsc_mb() in cmpxchg.h from
Peter's patch.

To summarize:
I keep Peter's comments and also keep necessary loongson_llsc_mb() in
test_and_set_bit_lock()/mips_atomic_set() from Peter's patch, but all
superfluous memory barries are removed.

Cc: Huang Pei <huangpei@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/atomic.h  | 5 ++---
 arch/mips/include/asm/bitops.h  | 4 ----
 arch/mips/include/asm/cmpxchg.h | 5 -----
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index bb8658cc..4f6e538 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -193,7 +193,6 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
 	if (kernel_uses_llsc) {
 		int temp;
 
-		loongson_llsc_mb();
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_LEVEL"			\n"
@@ -201,12 +200,12 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
 		"	.set	pop					\n"
 		"	subu	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	bltz	%0, 2f					\n"
+		"	bltz	%0, 1f					\n"
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	sc	%1, %2					\n"
 		"\t" __scbeqz "	%1, 1b					\n"
-		"2:							\n"
+		"1:							\n"
 		"	.set	pop					\n"
 		: "=&r" (result), "=&r" (temp),
 		  "+" GCC_OFF_SMALL_ASM() (v->counter)
diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 985d6a0..5016b96 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -257,7 +257,6 @@ static inline int test_and_set_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
-		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
@@ -374,7 +373,6 @@ static inline int test_and_clear_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
-		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	" __LL	"%0, %1 # test_and_clear_bit	\n"
@@ -390,7 +388,6 @@ static inline int test_and_clear_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
-		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
@@ -450,7 +447,6 @@ static inline int test_and_change_bit(unsigned long nr,
 		unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
 		unsigned long temp;
 
-		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 79bf34e..dd39bae 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -46,7 +46,6 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
 	__typeof(*(m)) __ret;						\
 									\
 	if (kernel_uses_llsc) {						\
-		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
@@ -118,7 +117,6 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 	__typeof(*(m)) __ret;						\
 									\
 	if (kernel_uses_llsc) {						\
-		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
@@ -136,7 +134,6 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 		: "=&r" (__ret), "=" GCC_OFF_SMALL_ASM() (*m)		\
 		: GCC_OFF_SMALL_ASM() (*m), "Jr" (old), "Jr" (new)	\
 		: __LLSC_CLOBBER);					\
-		loongson_llsc_mb();					\
 	} else {							\
 		unsigned long __flags;					\
 									\
@@ -232,7 +229,6 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
 	 */
 	local_irq_save(flags);
 
-	loongson_llsc_mb();
 	asm volatile(
 	"	.set	push				\n"
 	"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"
@@ -278,7 +274,6 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
 	  "r" (old),
 	  "r" (new)
 	: "memory");
-	loongson_llsc_mb();
 
 	local_irq_restore(flags);
 	return ret;
-- 
2.7.0

