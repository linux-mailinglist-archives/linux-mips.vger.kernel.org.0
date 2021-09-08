Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E02B4036A0
	for <lists+linux-mips@lfdr.de>; Wed,  8 Sep 2021 11:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348655AbhIHJJ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Sep 2021 05:09:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58976 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348455AbhIHJJz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Sep 2021 05:09:55 -0400
Received: from localhost.localdomain (unknown [89.187.161.160])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx5OWIfThh6pUBAA--.2216S3;
        Wed, 08 Sep 2021 17:08:41 +0800 (CST)
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
Subject: [PATCH 1/2] MIPS: rework local_t operation on MIPS64
Date:   Wed,  8 Sep 2021 17:08:17 +0800
Message-Id: <20210908090818.923791-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908090818.923791-1-huangpei@loongson.cn>
References: <20210908090818.923791-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cx5OWIfThh6pUBAA--.2216S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw45Zr1DurykKF1ktw1UWrg_yoWrZFykpF
        srCan7KrWqvF4fA3Z2vF4Svr13Wr4fGrWYkFyqvrWvy3W0q3W8Zrs3KanYyrykZFZ8X3W8
        JFW7ur15Z3WDAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
        IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAF-wCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
        JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jrAwxUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+. Use daddu/dsubu for long int on MIPS64.

+. remove "asm/war.h" since R10000_LLSC_WAR became a config option

+. clean up, no function changed

Suggested-by:  "Maciej W. Rozycki" <macro@orcam.me.uk>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/asm.h   | 18 +++++++++++
 arch/mips/include/asm/local.h | 60 ++++++++---------------------------
 2 files changed, 31 insertions(+), 47 deletions(-)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 2f8ce94ebaaf..f3302b13d3e0 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -19,6 +19,7 @@
 
 #include <asm/sgidefs.h>
 #include <asm/asm-eva.h>
+#include <asm/isa-rev.h>
 
 #ifndef __VDSO__
 /*
@@ -211,6 +212,8 @@ symbol		=	value
 #define LONG_SUB	sub
 #define LONG_SUBU	subu
 #define LONG_L		lw
+#define LONG_LL		ll
+#define LONG_SC		sc
 #define LONG_S		sw
 #define LONG_SP		swp
 #define LONG_SLL	sll
@@ -236,6 +239,8 @@ symbol		=	value
 #define LONG_SUB	dsub
 #define LONG_SUBU	dsubu
 #define LONG_L		ld
+#define LONG_LL		lld
+#define LONG_SC		scd
 #define LONG_S		sd
 #define LONG_SP		sdp
 #define LONG_SLL	dsll
@@ -320,6 +325,19 @@ symbol		=	value
 
 #define SSNOP		sll zero, zero, 1
 
+/*
+ * Using a branch-likely instruction to check the result of an sc instruction
+ * works around a bug present in R10000 CPUs prior to revision 3.0 that could
+ * cause ll-sc sequences to execute non-atomically.
+ */
+#ifdef CONFIG_WAR_R10000_LLSC
+# define SC_BEQZ	beqzl
+#elif MIPS_ISA_REV >= 6
+# define SC_BEQZ	beqzc
+#else
+# define SC_BEQZ	beqz
+#endif
+
 #ifdef CONFIG_SGI_IP28
 /* Inhibit speculative stores to volatile (e.g.DMA) or invalid addresses. */
 #include <asm/cacheops.h>
diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index ecda7295ddcd..44b320583f04 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -7,7 +7,7 @@
 #include <linux/atomic.h>
 #include <asm/cmpxchg.h>
 #include <asm/compiler.h>
-#include <asm/war.h>
+#include <asm/asm.h>
 
 typedef struct
 {
@@ -31,34 +31,17 @@ static __inline__ long local_add_return(long i, local_t * l)
 {
 	unsigned long result;
 
-	if (kernel_uses_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {
-		unsigned long temp;
-
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=r4000				\n"
-			__SYNC(full, loongson3_war) "			\n"
-		"1:"	__LL	"%1, %2		# local_add_return	\n"
-		"	addu	%0, %1, %3				\n"
-			__SC	"%0, %2					\n"
-		"	beqzl	%0, 1b					\n"
-		"	addu	%0, %1, %3				\n"
-		"	.set	pop					\n"
-		: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
-		: "Ir" (i), "m" (l->a.counter)
-		: "memory");
-	} else if (kernel_uses_llsc) {
+	if (kernel_uses_llsc) {
 		unsigned long temp;
 
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
-			__SYNC(full, loongson3_war) "			\n"
-		"1:"	__LL	"%1, %2		# local_add_return	\n"
-		"	addu	%0, %1, %3				\n"
-			__SC	"%0, %2					\n"
-		"	beqz	%0, 1b					\n"
-		"	addu	%0, %1, %3				\n"
+		"1:"	__stringify(LONG_LL)	"	%1, %2		\n"
+		"	"__stringify(LONG_ADDU)	"	%0, %1, %3	\n"
+		"	"__stringify(LONG_SC)	"	%0, %2		\n"
+		"	"__stringify(SC_BEQZ)	"	%0, 1b		\n"
+		"	"__stringify(LONG_ADDU)	"	%0, %1, %3	\n"
 		"	.set	pop					\n"
 		: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
 		: "Ir" (i), "m" (l->a.counter)
@@ -80,34 +63,17 @@ static __inline__ long local_sub_return(long i, local_t * l)
 {
 	unsigned long result;
 
-	if (kernel_uses_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {
-		unsigned long temp;
-
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=r4000				\n"
-			__SYNC(full, loongson3_war) "			\n"
-		"1:"	__LL	"%1, %2		# local_sub_return	\n"
-		"	subu	%0, %1, %3				\n"
-			__SC	"%0, %2					\n"
-		"	beqzl	%0, 1b					\n"
-		"	subu	%0, %1, %3				\n"
-		"	.set	pop					\n"
-		: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
-		: "Ir" (i), "m" (l->a.counter)
-		: "memory");
-	} else if (kernel_uses_llsc) {
+	if (kernel_uses_llsc) {
 		unsigned long temp;
 
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
-			__SYNC(full, loongson3_war) "			\n"
-		"1:"	__LL	"%1, %2		# local_sub_return	\n"
-		"	subu	%0, %1, %3				\n"
-			__SC	"%0, %2					\n"
-		"	beqz	%0, 1b					\n"
-		"	subu	%0, %1, %3				\n"
+		"1:"	__stringify(LONG_LL)	"	%1, %2		\n"
+		"	"__stringify(LONG_SUBU)	"	%0, %1, %3	\n"
+		"	"__stringify(LONG_SC)	"	%0, %2		\n"
+		"	"__stringify(SC_BEQZ)	"	%0, 1b		\n"
+		"	"__stringify(LONG_SUBU)	"	%0, %1, %3	\n"
 		"	.set	pop					\n"
 		: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
 		: "Ir" (i), "m" (l->a.counter)
-- 
2.25.1

