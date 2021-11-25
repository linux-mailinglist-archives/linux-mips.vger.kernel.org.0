Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F745D8A6
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 12:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhKYLFf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 06:05:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35072 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1354907AbhKYLDf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 06:03:35 -0500
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeNK1bJ9hjVcBAA--.2229S3;
        Thu, 25 Nov 2021 19:00:13 +0800 (CST)
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
Subject: [PATCH 1/4] MIPS: rework local_t operation on MIPS64
Date:   Thu, 25 Nov 2021 18:59:46 +0800
Message-Id: <20211125105949.27147-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125105949.27147-1-huangpei@loongson.cn>
References: <20211125105949.27147-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxeNK1bJ9hjVcBAA--.2229S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1ktrW5Ww4UArWrCFW7Arb_yoWrurW8pF
        srCan7KrWqvF43A3Z2vF4Svr13Wr4fGrWYkFnF9rWvy3W8t3W8ZrZ3KanYyrykZFZ8X3W8
        XFW7ur15X3ZrA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUU
        U
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+. use "daddu/dsubu" for long int on MIPS64 instead of "addu/subu"

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
index ecda7295ddcd..c1e109357110 100644
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

