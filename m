Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1F5475477
	for <lists+linux-mips@lfdr.de>; Wed, 15 Dec 2021 09:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240891AbhLOIpX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Dec 2021 03:45:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38828 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240897AbhLOIpW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Dec 2021 03:45:22 -0500
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrNwUq7lh0P4AAA--.1916S5;
        Wed, 15 Dec 2021 16:45:16 +0800 (CST)
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
Subject: [PATCH 3/4] MIPS: rework local_t operation on MIPS64
Date:   Wed, 15 Dec 2021 16:44:59 +0800
Message-Id: <20211215084500.24444-4-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215084500.24444-1-huangpei@loongson.cn>
References: <20211215084500.24444-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxrNwUq7lh0P4AAA--.1916S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1ktrW5Ww4UArWrCFW7Arb_yoWrZw1rpF
        srCan7KrWqva13Aas7ZF4Svr13Wr4fGrWFkFnFvrWvy3W0q3W8ZrnakanYyrykZFZ8X3W8
        XFW7uw15u3ZrA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfU5wIDUUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+. remove "asm/war.h" since R10000_LLSC_WAR became a config option

+. clean up

Suggested-by:  Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/asm.h   | 18 ++++++++++
 arch/mips/include/asm/local.h | 62 +++++++++--------------------------
 2 files changed, 33 insertions(+), 47 deletions(-)

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
index 608651d9affe..c1e109357110 100644
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
@@ -31,34 +31,18 @@ static __inline__ long local_add_return(long i, local_t * l)
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
-			__ADDU	"%0, %1, %3				\n"
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
-			__ADDU	"%0, %1, %3				\n"
-			__SC	"%0, %2					\n"
-		"	beqz	%0, 1b					\n"
-		"	addu	%0, %1, %3				\n"
+			__SYNC(full, loongson3_war) "                   \n"
+		"1:"	__stringify(LONG_LL)	"	%1, %2		\n"
+		"	"__stringify(LONG_ADDU)	"	%0, %1, %3	\n"
+		"	"__stringify(LONG_SC)	"	%0, %2		\n"
+		"	"__stringify(SC_BEQZ)	"	%0, 1b		\n"
+		"	"__stringify(LONG_ADDU)	"	%0, %1, %3	\n"
 		"	.set	pop					\n"
 		: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
 		: "Ir" (i), "m" (l->a.counter)
@@ -80,34 +64,18 @@ static __inline__ long local_sub_return(long i, local_t * l)
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
-			__SUBU	"%0, %1, %3				\n"
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
-			__SUBU	"%0, %1, %3				\n"
-			__SC	"%0, %2					\n"
-		"	beqz	%0, 1b					\n"
-		"	subu	%0, %1, %3				\n"
+			__SYNC(full, loongson3_war) "                   \n"
+		"1:"	__stringify(LONG_LL)	"	%1, %2		\n"
+		"	"__stringify(LONG_SUBU)	"	%0, %1, %3	\n"
+		"	"__stringify(LONG_SC)	"	%0, %2		\n"
+		"	"__stringify(SC_BEQZ)	"	%0, 1b		\n"
+		"	"__stringify(LONG_SUBU)	"	%0, %1, %3	\n"
 		"	.set	pop					\n"
 		: "=&r" (result), "=&r" (temp), "=m" (l->a.counter)
 		: "Ir" (i), "m" (l->a.counter)
-- 
2.20.1

