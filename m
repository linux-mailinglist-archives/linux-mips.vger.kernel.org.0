Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685E4316AF0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 17:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBJQRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 11:17:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:42974 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230229AbhBJQRS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 11:17:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 24738AC97;
        Wed, 10 Feb 2021 16:16:36 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Simplify EVA cache handling
Date:   Wed, 10 Feb 2021 17:16:14 +0100
Message-Id: <20210210161615.21228-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210161615.21228-1-tsbogend@alpha.franken.de>
References: <20210210161615.21228-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

protected_cache_op is only used for flushing user addresses, so
we only need to define protected_cache_op different in EVA mode and
be done with it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/r4kcache.h | 67 ++++++--------------------------
 1 file changed, 11 insertions(+), 56 deletions(-)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 15ab16f99f28..af3788589ee6 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -23,7 +23,6 @@
 #include <asm/mipsmtregs.h>
 #include <asm/mmzone.h>
 #include <asm/unroll.h>
-#include <linux/uaccess.h> /* for uaccess_kernel() */
 
 extern void (*r4k_blast_dcache)(void);
 extern void (*r4k_blast_icache)(void);
@@ -102,14 +101,17 @@ static inline void flush_scache_line(unsigned long addr)
 	cache_op(Hit_Writeback_Inv_SD, addr);
 }
 
-#define protected_cache_op(op,addr)				\
+#ifdef CONFIG_EVA
+
+#define protected_cache_op(op, addr)				\
 ({								\
 	int __err = 0;						\
 	__asm__ __volatile__(					\
 	"	.set	push			\n"		\
 	"	.set	noreorder		\n"		\
-	"	.set "MIPS_ISA_ARCH_LEVEL"	\n"		\
-	"1:	cache	%1, (%2)		\n"		\
+	"	.set	mips0			\n"		\
+	"	.set	eva			\n"		\
+	"1:	cachee	%1, (%2)		\n"		\
 	"2:	.insn				\n"		\
 	"	.set	pop			\n"		\
 	"	.section .fixup,\"ax\"		\n"		\
@@ -123,17 +125,16 @@ static inline void flush_scache_line(unsigned long addr)
 	: "i" (op), "r" (addr), "i" (-EFAULT));			\
 	__err;							\
 })
+#else
 
-
-#define protected_cachee_op(op,addr)				\
+#define protected_cache_op(op, addr)				\
 ({								\
 	int __err = 0;						\
 	__asm__ __volatile__(					\
 	"	.set	push			\n"		\
 	"	.set	noreorder		\n"		\
-	"	.set	mips0			\n"		\
-	"	.set	eva			\n"		\
-	"1:	cachee	%1, (%2)		\n"		\
+	"	.set "MIPS_ISA_ARCH_LEVEL"	\n"		\
+	"1:	cache	%1, (%2)		\n"		\
 	"2:	.insn				\n"		\
 	"	.set	pop			\n"		\
 	"	.section .fixup,\"ax\"		\n"		\
@@ -147,6 +148,7 @@ static inline void flush_scache_line(unsigned long addr)
 	: "i" (op), "r" (addr), "i" (-EFAULT));			\
 	__err;							\
 })
+#endif
 
 /*
  * The next two are for badland addresses like signal trampolines.
@@ -158,11 +160,7 @@ static inline int protected_flush_icache_line(unsigned long addr)
 		return protected_cache_op(Hit_Invalidate_I_Loongson2, addr);
 
 	default:
-#ifdef CONFIG_EVA
-		return protected_cachee_op(Hit_Invalidate_I, addr);
-#else
 		return protected_cache_op(Hit_Invalidate_I, addr);
-#endif
 	}
 }
 
@@ -174,20 +172,12 @@ static inline int protected_flush_icache_line(unsigned long addr)
  */
 static inline int protected_writeback_dcache_line(unsigned long addr)
 {
-#ifdef CONFIG_EVA
-	return protected_cachee_op(Hit_Writeback_Inv_D, addr);
-#else
 	return protected_cache_op(Hit_Writeback_Inv_D, addr);
-#endif
 }
 
 static inline int protected_writeback_scache_line(unsigned long addr)
 {
-#ifdef CONFIG_EVA
-	return protected_cachee_op(Hit_Writeback_Inv_SD, addr);
-#else
 	return protected_cache_op(Hit_Writeback_Inv_SD, addr);
-#endif
 }
 
 /*
@@ -307,43 +297,8 @@ static inline void prot##extra##blast_##pfx##cache##_range(unsigned long start,
 	}								\
 }
 
-#ifndef CONFIG_EVA
-
 __BUILD_BLAST_CACHE_RANGE(d, dcache, Hit_Writeback_Inv_D, protected_, )
 __BUILD_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I, protected_, )
-
-#else
-
-#define __BUILD_PROT_BLAST_CACHE_RANGE(pfx, desc, hitop)		\
-static inline void protected_blast_##pfx##cache##_range(unsigned long start,\
-							unsigned long end) \
-{									\
-	unsigned long lsize = cpu_##desc##_line_size();			\
-	unsigned long addr = start & ~(lsize - 1);			\
-	unsigned long aend = (end - 1) & ~(lsize - 1);			\
-									\
-	if (!uaccess_kernel()) {					\
-		while (1) {						\
-			protected_cachee_op(hitop, addr);		\
-			if (addr == aend)				\
-				break;					\
-			addr += lsize;					\
-		}							\
-	} else {							\
-		while (1) {						\
-			protected_cache_op(hitop, addr);		\
-			if (addr == aend)				\
-				break;					\
-			addr += lsize;					\
-		}                                                       \
-									\
-	}								\
-}
-
-__BUILD_PROT_BLAST_CACHE_RANGE(d, dcache, Hit_Writeback_Inv_D)
-__BUILD_PROT_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I)
-
-#endif
 __BUILD_BLAST_CACHE_RANGE(s, scache, Hit_Writeback_Inv_SD, protected_, )
 __BUILD_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I_Loongson2, \
 	protected_, loongson2_)
-- 
2.29.2

