Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE17A4A3D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfIAPwA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:52:00 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56982 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfIAPwA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:52:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 4774B402B7;
        Sun,  1 Sep 2019 17:42:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FRuh80TaW6ln; Sun,  1 Sep 2019 17:42:52 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D75C43F909;
        Sun,  1 Sep 2019 17:42:52 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:42:52 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 019/120] MIPS: R5900: Use SYNC.L for data cache and SYNC.P
 for instruction cache
Message-ID: <4908071c89e101af477fefb28cdd1ba69ffb63d1.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Toshiba TX79 manual programming notes[1]:

    For all CACHE sub-operations which operate on the instruction cache
    the following programming restrictions have to be followed:

    1. A sequence of CACHE instructions has to be directly preceded and
       followed by a SYNC.P instruction.
    2. Each individual FILL sub-operation has to be followed by a SYNC.L
       instruction.

    For all CACHE sub-operations which operate on the data cache the
    following programming restrictions have to be followed:

    1. A sequence of CACHE instructions have to be directly preceded and
       followed by a SYNC.L instruction.
    2. Each of the three WRITEBACK sub-operations have to be
       individually followed by a SYNC.L instruction.

    For all CACHE sub-operations which operate on the BTAC the following
    programming restrictions have to be followed:

    1. A sequence of CACHE instructions have to be directly preceded and
       followed by a SYNC.P instruction.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-13, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
This is perhaps the most complex change for the R5900. The code comes from
the Linux 2.6 port to the PlayStation 2.
---
 arch/mips/include/asm/r4kcache.h | 239 ++++++++++++++++++++++++-------
 arch/mips/mm/c-r4k.c             |   8 +-
 2 files changed, 189 insertions(+), 58 deletions(-)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index e00087db9d74..da9f55f36fcf 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -44,7 +44,7 @@ extern void (*r4k_blast_icache)(void);
 #define INDEX_BASE	CKSEG0
 #endif
 
-#define cache_op(op,addr)						\
+#define cache_op_s(op,addr)						\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	noreorder				\n"	\
@@ -53,56 +53,85 @@ extern void (*r4k_blast_icache)(void);
 	"	.set	pop					\n"	\
 	:								\
 	: "i" (op), "R" (*(unsigned char *)(addr)))
+#ifdef CONFIG_CPU_R5900
+#define cache_op_d(op,addr)						\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	noreorder				\n"	\
+	"	.set	mips3\n\t				\n"	\
+	"	sync.l						\n"	\
+	"	cache	%0, %1					\n"	\
+	"	sync.l						\n"	\
+	"	.set	pop					\n"	\
+	:								\
+	: "i" (op), "R" (*(unsigned char *)(addr)))
+#define cache_op_i(op,addr)						\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	noreorder				\n"	\
+	"	.set	mips3\n\t				\n"	\
+	"	sync.p						\n"	\
+	"	cache	%0, %1					\n"	\
+	"	sync.p						\n"	\
+	"	.set	pop					\n"	\
+	:								\
+	: "i" (op), "R" (*(unsigned char *)(addr)))
+#else
+#define cache_op_d cache_op_s
+#define cache_op_i cache_op_s
+#define cache_op cache_op_s
+#endif
+#define cache_op_t cache_op_s
 
 static inline void flush_icache_line_indexed(unsigned long addr)
 {
-	cache_op(Index_Invalidate_I, addr);
+	cache_op_i(Index_Invalidate_I, addr);
 }
 
 static inline void flush_dcache_line_indexed(unsigned long addr)
 {
-	cache_op(Index_Writeback_Inv_D, addr);
+	cache_op_d(Index_Writeback_Inv_D, addr);
 }
 
 static inline void flush_scache_line_indexed(unsigned long addr)
 {
-	cache_op(Index_Writeback_Inv_SD, addr);
+	cache_op_s(Index_Writeback_Inv_SD, addr);
 }
 
 static inline void flush_icache_line(unsigned long addr)
 {
 	switch (boot_cpu_type()) {
 	case CPU_LOONGSON2:
-		cache_op(Hit_Invalidate_I_Loongson2, addr);
+		cache_op_i(Hit_Invalidate_I_Loongson2, addr);
 		break;
 
 	default:
-		cache_op(Hit_Invalidate_I, addr);
+		cache_op_i(Hit_Invalidate_I, addr);
 		break;
 	}
 }
 
 static inline void flush_dcache_line(unsigned long addr)
 {
-	cache_op(Hit_Writeback_Inv_D, addr);
+	cache_op_d(Hit_Writeback_Inv_D, addr);
 }
 
 static inline void invalidate_dcache_line(unsigned long addr)
 {
-	cache_op(Hit_Invalidate_D, addr);
+	cache_op_d(Hit_Invalidate_D, addr);
 }
 
 static inline void invalidate_scache_line(unsigned long addr)
 {
-	cache_op(Hit_Invalidate_SD, addr);
+	cache_op_s(Hit_Invalidate_SD, addr);
 }
 
 static inline void flush_scache_line(unsigned long addr)
 {
-	cache_op(Hit_Writeback_Inv_SD, addr);
+	cache_op_s(Hit_Writeback_Inv_SD, addr);
 }
 
-#define protected_cache_op(op,addr)				\
+#define protected_cache_op_s(op,addr)				\
 ({								\
 	int __err = 0;						\
 	__asm__ __volatile__(					\
@@ -124,6 +153,49 @@ static inline void flush_scache_line(unsigned long addr)
 	__err;							\
 })
 
+#ifdef CONFIG_CPU_R5900
+#define protected_cache_op_d(op,addr)				\
+({								\
+	int __err = 0;						\
+	__asm__ __volatile__(					\
+	"	.set	push			\n"		\
+	"	.set	noreorder		\n"		\
+	"	.set	mips3			\n"		\
+	"	sync.l				\n"		\
+	"1:	cache	%0, (%1)		\n"		\
+	"	sync.l				\n"		\
+	"2:	.set	pop			\n"		\
+	"	.section __ex_table,\"a\"	\n"		\
+	"	"STR(PTR)" 1b, 2b		\n"		\
+	"	.previous"					\
+	:							\
+	: "i" (op), "r" (addr));				\
+	__err;							\
+})
+
+#define protected_cache_op_i(op,addr)				\
+({								\
+	int __err = 0;						\
+	__asm__ __volatile__(					\
+	"	.set	push			\n"		\
+	"	.set	noreorder		\n"		\
+	"	.set	mips3			\n"		\
+	"	sync.p				\n"		\
+	"1:	cache	%0, (%1)		\n"		\
+	"	sync.p				\n"		\
+	"2:	.set	pop			\n"		\
+	"	.section __ex_table,\"a\"	\n"		\
+	"	"STR(PTR)" 1b, 2b		\n"		\
+	"	.previous"					\
+	:							\
+	: "i" (op), "r" (addr));				\
+	__err;							\
+})
+#else
+#define protected_cache_op_i protected_cache_op_s
+#define protected_cache_op_d protected_cache_op_s
+#define protected_cache_op protected_cache_op_s
+#endif
 
 #define protected_cachee_op(op,addr)				\
 ({								\
@@ -155,13 +227,13 @@ static inline int protected_flush_icache_line(unsigned long addr)
 {
 	switch (boot_cpu_type()) {
 	case CPU_LOONGSON2:
-		return protected_cache_op(Hit_Invalidate_I_Loongson2, addr);
+		return protected_cache_op_i(Hit_Invalidate_I_Loongson2, addr);
 
 	default:
 #ifdef CONFIG_EVA
-		return protected_cachee_op(Hit_Invalidate_I, addr);
+		return protected_cachee_op_i(Hit_Invalidate_I, addr);
 #else
-		return protected_cache_op(Hit_Invalidate_I, addr);
+		return protected_cache_op_i(Hit_Invalidate_I, addr);
 #endif
 	}
 }
@@ -175,18 +247,18 @@ static inline int protected_flush_icache_line(unsigned long addr)
 static inline int protected_writeback_dcache_line(unsigned long addr)
 {
 #ifdef CONFIG_EVA
-	return protected_cachee_op(Hit_Writeback_Inv_D, addr);
+	return protected_cachee_op_d(Hit_Writeback_Inv_D, addr);
 #else
-	return protected_cache_op(Hit_Writeback_Inv_D, addr);
+	return protected_cache_op_d(Hit_Writeback_Inv_D, addr);
 #endif
 }
 
 static inline int protected_writeback_scache_line(unsigned long addr)
 {
 #ifdef CONFIG_EVA
-	return protected_cachee_op(Hit_Writeback_Inv_SD, addr);
+	return protected_cachee_op_s(Hit_Writeback_Inv_SD, addr);
 #else
-	return protected_cache_op(Hit_Writeback_Inv_SD, addr);
+	return protected_cache_op_s(Hit_Writeback_Inv_SD, addr);
 #endif
 }
 
@@ -195,7 +267,7 @@ static inline int protected_writeback_scache_line(unsigned long addr)
  */
 static inline void invalidate_tcache_page(unsigned long addr)
 {
-	cache_op(Page_Invalidate_T, addr);
+	cache_op_t(Page_Invalidate_T, addr);
 }
 
 #ifndef CONFIG_CPU_MIPSR6
@@ -276,6 +348,65 @@ static inline void invalidate_tcache_page(unsigned long addr)
 		:							\
 		: "r" (base),						\
 		  "i" (op));
+#ifdef CONFIG_CPU_R5900
+#define cache64_unroll32_d(base,op)					\
+	__asm__ __volatile__(						\
+	"	.set push					\n"	\
+	"	.set noreorder					\n"	\
+	"	.set mips3					\n"	\
+	"	sync.l						\n"	\
+	"	cache %1, 0x000(%0); sync.l; cache %1, 0x040(%0); sync.l	\n"	\
+	"	cache %1, 0x080(%0); sync.l; cache %1, 0x0c0(%0); sync.l	\n"	\
+	"	cache %1, 0x100(%0); sync.l; cache %1, 0x140(%0); sync.l	\n"	\
+	"	cache %1, 0x180(%0); sync.l; cache %1, 0x1c0(%0); sync.l	\n"	\
+	"	cache %1, 0x200(%0); sync.l; cache %1, 0x240(%0); sync.l	\n"	\
+	"	cache %1, 0x280(%0); sync.l; cache %1, 0x2c0(%0); sync.l	\n"	\
+	"	cache %1, 0x300(%0); sync.l; cache %1, 0x340(%0); sync.l	\n"	\
+	"	cache %1, 0x380(%0); sync.l; cache %1, 0x3c0(%0); sync.l	\n"	\
+	"	cache %1, 0x400(%0); sync.l; cache %1, 0x440(%0); sync.l	\n"	\
+	"	cache %1, 0x480(%0); sync.l; cache %1, 0x4c0(%0); sync.l	\n"	\
+	"	cache %1, 0x500(%0); sync.l; cache %1, 0x540(%0); sync.l	\n"	\
+	"	cache %1, 0x580(%0); sync.l; cache %1, 0x5c0(%0); sync.l	\n"	\
+	"	cache %1, 0x600(%0); sync.l; cache %1, 0x640(%0); sync.l	\n"	\
+	"	cache %1, 0x680(%0); sync.l; cache %1, 0x6c0(%0); sync.l	\n"	\
+	"	cache %1, 0x700(%0); sync.l; cache %1, 0x740(%0); sync.l	\n"	\
+	"	cache %1, 0x780(%0); sync.l; cache %1, 0x7c0(%0); sync.l	\n"	\
+	"	.set pop					\n"	\
+		:							\
+		: "r" (base),						\
+		  "i" (op));
+
+#define cache64_unroll32_i(base,op)					\
+	__asm__ __volatile__(						\
+	"	.set push					\n"	\
+	"	.set noreorder					\n"	\
+	"	.set mips3					\n"	\
+	"	sync.p						\n"	\
+	"	cache %1, 0x000(%0); cache %1, 0x040(%0)	\n"	\
+	"	cache %1, 0x080(%0); cache %1, 0x0c0(%0)	\n"	\
+	"	cache %1, 0x100(%0); cache %1, 0x140(%0)	\n"	\
+	"	cache %1, 0x180(%0); cache %1, 0x1c0(%0)	\n"	\
+	"	cache %1, 0x200(%0); cache %1, 0x240(%0)	\n"	\
+	"	cache %1, 0x280(%0); cache %1, 0x2c0(%0)	\n"	\
+	"	cache %1, 0x300(%0); cache %1, 0x340(%0)	\n"	\
+	"	cache %1, 0x380(%0); cache %1, 0x3c0(%0)	\n"	\
+	"	cache %1, 0x400(%0); cache %1, 0x440(%0)	\n"	\
+	"	cache %1, 0x480(%0); cache %1, 0x4c0(%0)	\n"	\
+	"	cache %1, 0x500(%0); cache %1, 0x540(%0)	\n"	\
+	"	cache %1, 0x580(%0); cache %1, 0x5c0(%0)	\n"	\
+	"	cache %1, 0x600(%0); cache %1, 0x640(%0)	\n"	\
+	"	cache %1, 0x680(%0); cache %1, 0x6c0(%0)	\n"	\
+	"	cache %1, 0x700(%0); cache %1, 0x740(%0)	\n"	\
+	"	cache %1, 0x780(%0); cache %1, 0x7c0(%0)	\n"	\
+	"	sync.p						\n"	\
+	"	.set pop					\n"	\
+		:							\
+		: "r" (base),						\
+		  "i" (op));
+#else
+#define cache64_unroll32_i cache64_unroll32
+#define cache64_unroll32_d cache64_unroll32
+#endif
 
 #define cache128_unroll32(base,op)					\
 	__asm__ __volatile__(						\
@@ -532,7 +663,7 @@ static inline void invalidate_tcache_page(unsigned long addr)
 		  "i" (op));
 
 /* build blast_xxx, blast_xxx_page, blast_xxx_page_indexed */
-#define __BUILD_BLAST_CACHE(pfx, desc, indexop, hitop, lsize, extra)	\
+#define __BUILD_BLAST_CACHE(fn_pfx, pfx, desc, indexop, hitop, lsize, extra)	\
 static inline void extra##blast_##pfx##cache##lsize(void)		\
 {									\
 	unsigned long start = INDEX_BASE;				\
@@ -544,7 +675,7 @@ static inline void extra##blast_##pfx##cache##lsize(void)		\
 									\
 	for (ws = 0; ws < ws_end; ws += ws_inc)				\
 		for (addr = start; addr < end; addr += lsize * 32)	\
-			cache##lsize##_unroll32(addr|ws, indexop);	\
+			cache##lsize##_unroll32##fn_pfx(addr|ws, indexop);	\
 }									\
 									\
 static inline void extra##blast_##pfx##cache##lsize##_page(unsigned long page) \
@@ -553,7 +684,7 @@ static inline void extra##blast_##pfx##cache##lsize##_page(unsigned long page) \
 	unsigned long end = page + PAGE_SIZE;				\
 									\
 	do {								\
-		cache##lsize##_unroll32(start, hitop);			\
+		cache##lsize##_unroll32##fn_pfx(start, hitop);			\
 		start += lsize * 32;					\
 	} while (start < end);						\
 }									\
@@ -570,29 +701,29 @@ static inline void extra##blast_##pfx##cache##lsize##_page_indexed(unsigned long
 									\
 	for (ws = 0; ws < ws_end; ws += ws_inc)				\
 		for (addr = start; addr < end; addr += lsize * 32)	\
-			cache##lsize##_unroll32(addr|ws, indexop);	\
+			cache##lsize##_unroll32##fn_pfx(addr|ws, indexop);	\
 }
 
-__BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
-__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
-__BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
-__BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 32, )
-__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 32, )
-__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I_Loongson2, 32, loongson2_)
-__BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 32, )
-__BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 64, )
-__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64, )
-__BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 64, )
-__BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 128, )
-__BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 128, )
-__BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 128, )
-
-__BUILD_BLAST_CACHE(inv_d, dcache, Index_Writeback_Inv_D, Hit_Invalidate_D, 16, )
-__BUILD_BLAST_CACHE(inv_d, dcache, Index_Writeback_Inv_D, Hit_Invalidate_D, 32, )
-__BUILD_BLAST_CACHE(inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 16, )
-__BUILD_BLAST_CACHE(inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 32, )
-__BUILD_BLAST_CACHE(inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 64, )
-__BUILD_BLAST_CACHE(inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 128, )
+__BUILD_BLAST_CACHE(, d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
+__BUILD_BLAST_CACHE(, i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
+__BUILD_BLAST_CACHE(, s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
+__BUILD_BLAST_CACHE(, d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 32, )
+__BUILD_BLAST_CACHE(, i, icache, Index_Invalidate_I, Hit_Invalidate_I, 32, )
+__BUILD_BLAST_CACHE(, i, icache, Index_Invalidate_I, Hit_Invalidate_I_Loongson2, 32, loongson2_)
+__BUILD_BLAST_CACHE(, s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 32, )
+__BUILD_BLAST_CACHE(_d, d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 64, )
+__BUILD_BLAST_CACHE(_i, i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64, )
+__BUILD_BLAST_CACHE(, s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 64, )
+__BUILD_BLAST_CACHE(, d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 128, )
+__BUILD_BLAST_CACHE(, i, icache, Index_Invalidate_I, Hit_Invalidate_I, 128, )
+__BUILD_BLAST_CACHE(, s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 128, )
+
+__BUILD_BLAST_CACHE(, inv_d, dcache, Index_Writeback_Inv_D, Hit_Invalidate_D, 16, )
+__BUILD_BLAST_CACHE(, inv_d, dcache, Index_Writeback_Inv_D, Hit_Invalidate_D, 32, )
+__BUILD_BLAST_CACHE(, inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 16, )
+__BUILD_BLAST_CACHE(, inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 32, )
+__BUILD_BLAST_CACHE(, inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 64, )
+__BUILD_BLAST_CACHE(, inv_s, scache, Index_Writeback_Inv_SD, Hit_Invalidate_SD, 128, )
 
 #define __BUILD_BLAST_USER_CACHE(pfx, desc, indexop, hitop, lsize) \
 static inline void blast_##pfx##cache##lsize##_user_page(unsigned long page) \
@@ -617,7 +748,7 @@ __BUILD_BLAST_USER_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D,
 __BUILD_BLAST_USER_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 64)
 
 /* build blast_xxx_range, protected_blast_xxx_range */
-#define __BUILD_BLAST_CACHE_RANGE(pfx, desc, hitop, prot, extra)	\
+#define __BUILD_BLAST_CACHE_RANGE(fn_pfx, pfx, desc, hitop, prot, extra)	\
 static inline void prot##extra##blast_##pfx##cache##_range(unsigned long start, \
 						    unsigned long end)	\
 {									\
@@ -626,7 +757,7 @@ static inline void prot##extra##blast_##pfx##cache##_range(unsigned long start,
 	unsigned long aend = (end - 1) & ~(lsize - 1);			\
 									\
 	while (1) {							\
-		prot##cache_op(hitop, addr);				\
+		prot##cache_op##fn_pfx(hitop, addr);			\
 		if (addr == aend)					\
 			break;						\
 		addr += lsize;						\
@@ -635,8 +766,8 @@ static inline void prot##extra##blast_##pfx##cache##_range(unsigned long start,
 
 #ifndef CONFIG_EVA
 
-__BUILD_BLAST_CACHE_RANGE(d, dcache, Hit_Writeback_Inv_D, protected_, )
-__BUILD_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I, protected_, )
+__BUILD_BLAST_CACHE_RANGE(_d, d, dcache, Hit_Writeback_Inv_D, protected_, )
+__BUILD_BLAST_CACHE_RANGE(_i, i, icache, Hit_Invalidate_I, protected_, )
 
 #else
 
@@ -670,15 +801,15 @@ __BUILD_PROT_BLAST_CACHE_RANGE(d, dcache, Hit_Writeback_Inv_D)
 __BUILD_PROT_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I)
 
 #endif
-__BUILD_BLAST_CACHE_RANGE(s, scache, Hit_Writeback_Inv_SD, protected_, )
-__BUILD_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I_Loongson2, \
+__BUILD_BLAST_CACHE_RANGE(_s, s, scache, Hit_Writeback_Inv_SD, protected_, )
+__BUILD_BLAST_CACHE_RANGE(_i, i, icache, Hit_Invalidate_I_Loongson2, \
 	protected_, loongson2_)
-__BUILD_BLAST_CACHE_RANGE(d, dcache, Hit_Writeback_Inv_D, , )
-__BUILD_BLAST_CACHE_RANGE(i, icache, Hit_Invalidate_I, , )
-__BUILD_BLAST_CACHE_RANGE(s, scache, Hit_Writeback_Inv_SD, , )
+__BUILD_BLAST_CACHE_RANGE(_d, d, dcache, Hit_Writeback_Inv_D, , )
+__BUILD_BLAST_CACHE_RANGE(_i, i, icache, Hit_Invalidate_I, , )
+__BUILD_BLAST_CACHE_RANGE(_s, s, scache, Hit_Writeback_Inv_SD, , )
 /* blast_inv_dcache_range */
-__BUILD_BLAST_CACHE_RANGE(inv_d, dcache, Hit_Invalidate_D, , )
-__BUILD_BLAST_CACHE_RANGE(inv_s, scache, Hit_Invalidate_SD, , )
+__BUILD_BLAST_CACHE_RANGE(_d, inv_d, dcache, Hit_Invalidate_D, , )
+__BUILD_BLAST_CACHE_RANGE(_d, inv_s, scache, Hit_Invalidate_SD, , )
 
 /* Currently, this is very specific to Loongson-3 */
 #define __BUILD_BLAST_CACHE_NODE(pfx, desc, indexop, hitop, lsize)	\
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 4f2cecbec722..ae79a78f3002 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1557,14 +1557,14 @@ static int probe_scache(void)
 	write_c0_taglo(0);
 	write_c0_taghi(0);
 	__asm__ __volatile__("nop; nop; nop; nop;"); /* avoid the hazard */
-	cache_op(Index_Store_Tag_I, begin);
-	cache_op(Index_Store_Tag_D, begin);
-	cache_op(Index_Store_Tag_SD, begin);
+	cache_op_i(Index_Store_Tag_I, begin);
+	cache_op_d(Index_Store_Tag_D, begin);
+	cache_op_s(Index_Store_Tag_SD, begin);
 
 	/* Now search for the wrap around point. */
 	pow2 = (128 * 1024);
 	for (addr = begin + (128 * 1024); addr < end; addr = begin + pow2) {
-		cache_op(Index_Load_Tag_SD, addr);
+		cache_op_s(Index_Load_Tag_SD, addr);
 		__asm__ __volatile__("nop; nop; nop; nop;"); /* hazard... */
 		if (!read_c0_taglo())
 			break;
-- 
2.21.0

