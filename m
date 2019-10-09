Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C584D1000
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731444AbfJIN1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:27:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:47434 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731343AbfJIN1b (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 09:27:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 12F30AC7B;
        Wed,  9 Oct 2019 13:27:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] MIPS: fw: arc: use call_o32 to call ARC prom from 64bit kernel
Date:   Wed,  9 Oct 2019 15:27:13 +0200
Message-Id: <20191009132718.25346-3-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When using a 64bit kernel with generic spaces setup stack is
also placed in XKPYHS, which the 32bit PROM can't handle.
By using call_o32 for ARC_CALLs a stack placed in KSEG0 is used
when calling PROM.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/fw/arc/init.c         |   5 ++
 arch/mips/include/asm/sgiarcs.h | 103 ++++++++++++----------------------------
 2 files changed, 35 insertions(+), 73 deletions(-)

diff --git a/arch/mips/fw/arc/init.c b/arch/mips/fw/arc/init.c
index 008555969534..7b663455de6b 100644
--- a/arch/mips/fw/arc/init.c
+++ b/arch/mips/fw/arc/init.c
@@ -21,6 +21,11 @@ struct linux_romvec *romvec;
 int prom_argc;
 LONG *_prom_argv, *_prom_envp;
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_FW_ARC32)
+/* stack for calling 32bit ARC prom */
+u64 o32_stk[4096];
+#endif
+
 void __init prom_init(void)
 {
 	PSYSTEM_PARAMETER_BLOCK pb = PROMBLOCK;
diff --git a/arch/mips/include/asm/sgiarcs.h b/arch/mips/include/asm/sgiarcs.h
index 105a9479ac5f..e1512cab180b 100644
--- a/arch/mips/include/asm/sgiarcs.h
+++ b/arch/mips/include/asm/sgiarcs.h
@@ -12,6 +12,8 @@
 #ifndef _ASM_SGIARCS_H
 #define _ASM_SGIARCS_H
 
+#include <linux/kernel.h>
+
 #include <asm/types.h>
 #include <asm/fw/arc/types.h>
 
@@ -368,110 +370,65 @@ struct linux_smonblock {
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_FW_ARC32)
 
-#define __arc_clobbers							\
-	"$2", "$3" /* ... */, "$8", "$9", "$10", "$11",				\
-	"$12", "$13", "$14", "$15", "$16", "$24", "$25", "$31"
+extern long call_o32(long vec, void *stack, ...);
+
+extern u64 o32_stk[4096];
+#define O32_STK	(&o32_stk[ARRAY_SIZE(o32_stk)])
 
 #define ARC_CALL0(dest)							\
 ({	long __res;							\
 	long __vec = (long) romvec->dest;				\
-	__asm__ __volatile__(						\
-	"dsubu\t$29, 32\n\t"						\
-	"jalr\t%1\n\t"							\
-	"daddu\t$29, 32\n\t"						\
-	"move\t%0, $2"							\
-	: "=r" (__res), "=r" (__vec)					\
-	: "1" (__vec)							\
-	: __arc_clobbers, "$4", "$5", "$6", "$7");			\
-	(unsigned long) __res;						\
+	__res = call_o32(__vec, O32_STK);				\
+	__res;								\
 })
 
 #define ARC_CALL1(dest, a1)						\
 ({	long __res;							\
-	register signed int __a1 __asm__("$4") = (int) (long) (a1);	\
+	int  __a1 = (int) (long) (a1);					\
 	long __vec = (long) romvec->dest;				\
-	__asm__ __volatile__(						\
-	"dsubu\t$29, 32\n\t"						\
-	"jalr\t%1\n\t"							\
-	"daddu\t$29, 32\n\t"						\
-	"move\t%0, $2"							\
-	: "=r" (__res), "=r" (__vec)					\
-	: "1" (__vec), "r" (__a1)					\
-	: __arc_clobbers, "$5", "$6", "$7");				\
-	(unsigned long) __res;						\
+	__res = call_o32(__vec, O32_STK, __a1);				\
+	__res;								\
 })
 
 #define ARC_CALL2(dest, a1, a2)						\
 ({	long __res;							\
-	register signed int __a1 __asm__("$4") = (int) (long) (a1);	\
-	register signed int __a2 __asm__("$5") = (int) (long) (a2);	\
+	int  __a1 = (int) (long) (a1);					\
+	int  __a2 = (int) (long) (a2);					\
 	long __vec = (long) romvec->dest;				\
-	__asm__ __volatile__(						\
-	"dsubu\t$29, 32\n\t"						\
-	"jalr\t%1\n\t"							\
-	"daddu\t$29, 32\n\t"						\
-	"move\t%0, $2"							\
-	: "=r" (__res), "=r" (__vec)					\
-	: "1" (__vec), "r" (__a1), "r" (__a2)				\
-	: __arc_clobbers, "$6", "$7");					\
+	__res = call_o32(__vec, O32_STK, __a1, __a2);			\
 	__res;								\
 })
 
 #define ARC_CALL3(dest, a1, a2, a3)					\
 ({	long __res;							\
-	register signed int __a1 __asm__("$4") = (int) (long) (a1);	\
-	register signed int __a2 __asm__("$5") = (int) (long) (a2);	\
-	register signed int __a3 __asm__("$6") = (int) (long) (a3);	\
+	int  __a1 = (int) (long) (a1);					\
+	int  __a2 = (int) (long) (a2);					\
+	int  __a3 = (int) (long) (a3);					\
 	long __vec = (long) romvec->dest;				\
-	__asm__ __volatile__(						\
-	"dsubu\t$29, 32\n\t"						\
-	"jalr\t%1\n\t"							\
-	"daddu\t$29, 32\n\t"						\
-	"move\t%0, $2"							\
-	: "=r" (__res), "=r" (__vec)					\
-	: "1" (__vec), "r" (__a1), "r" (__a2), "r" (__a3)		\
-	: __arc_clobbers, "$7");					\
+	__res = call_o32(__vec, O32_STK, __a1, __a2, __a3);		\
 	__res;								\
 })
 
 #define ARC_CALL4(dest, a1, a2, a3, a4)					\
 ({	long __res;							\
-	register signed int __a1 __asm__("$4") = (int) (long) (a1);	\
-	register signed int __a2 __asm__("$5") = (int) (long) (a2);	\
-	register signed int __a3 __asm__("$6") = (int) (long) (a3);	\
-	register signed int __a4 __asm__("$7") = (int) (long) (a4);	\
+	int  __a1 = (int) (long) (a1);					\
+	int  __a2 = (int) (long) (a2);					\
+	int  __a3 = (int) (long) (a3);					\
+	int  __a4 = (int) (long) (a4);					\
 	long __vec = (long) romvec->dest;				\
-	__asm__ __volatile__(						\
-	"dsubu\t$29, 32\n\t"						\
-	"jalr\t%1\n\t"							\
-	"daddu\t$29, 32\n\t"						\
-	"move\t%0, $2"							\
-	: "=r" (__res), "=r" (__vec)					\
-	: "1" (__vec), "r" (__a1), "r" (__a2), "r" (__a3),		\
-	  "r" (__a4)							\
-	: __arc_clobbers);						\
+	__res = call_o32(__vec, O32_STK, __a1, __a2, __a3, __a4);	\
 	__res;								\
 })
 
-#define ARC_CALL5(dest, a1, a2, a3, a4, a5)					\
+#define ARC_CALL5(dest, a1, a2, a3, a4, a5)				\
 ({	long __res;							\
-	register signed int __a1 __asm__("$4") = (int) (long) (a1);	\
-	register signed int __a2 __asm__("$5") = (int) (long) (a2);	\
-	register signed int __a3 __asm__("$6") = (int) (long) (a3);	\
-	register signed int __a4 __asm__("$7") = (int) (long) (a4);	\
-	register signed int __a5 = (int) (long) (a5);			\
+	int  __a1 = (int) (long) (a1);					\
+	int  __a2 = (int) (long) (a2);					\
+	int  __a3 = (int) (long) (a3);					\
+	int  __a4 = (int) (long) (a4);					\
+	int  __a5 = (int) (long) (a5);					\
 	long __vec = (long) romvec->dest;				\
-	__asm__ __volatile__(						\
-	"dsubu\t$29, 32\n\t"						\
-	"sw\t%7, 16($29)\n\t"						\
-	"jalr\t%1\n\t"							\
-	"daddu\t$29, 32\n\t"						\
-	"move\t%0, $2"							\
-	: "=r" (__res), "=r" (__vec)					\
-	: "1" (__vec),							\
-	  "r" (__a1), "r" (__a2), "r" (__a3), "r" (__a4),		\
-	  "r" (__a5)							\
-	: __arc_clobbers);						\
+	__res = call_o32(__vec, O32_STK, __a1, __a2, __a3, __a4, __a5);	\
 	__res;								\
 })
 
-- 
2.16.4

