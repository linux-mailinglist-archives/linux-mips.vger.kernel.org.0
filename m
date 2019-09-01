Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DAFA4A15
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbfIAPqW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:46:22 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56560 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfIAPqV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:46:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 793DB40F37;
        Sun,  1 Sep 2019 17:46:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LAhCrnRSKkBy; Sun,  1 Sep 2019 17:46:18 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8775E40C35;
        Sun,  1 Sep 2019 17:46:18 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:46:18 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 022/120] MIPS: R5900: Support 64-bit inq() and outq() macros
 in 32-bit kernels
Message-ID: <7ea8b1211bceb8193154b51ad4241e7c0b86547d.1567326213.git.noring@nocrew.org>
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

PlayStation 2 hardware such as the Graphics Synthesizer requires 64-bit
register reads and writes[1], also in 32-bit kernels. Interrupts must be
disabled when manipulating 64-bit registers unless the kernel saves and
restores 64-bit registers in the interrupt and context switch handlers.

References:

[1] "EE User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 26: GS privileged registers must be accessed using LD/SD
    instructions.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/io.h | 54 +++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 97a280640daf..f7115472f530 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -420,10 +420,32 @@ static inline void pfx##out##bwlq##p(type val, unsigned long port)	\
 									\
 	__val = pfx##ioswab##bwlq(__addr, val);				\
 									\
-	/* Really, we want this to be atomic */				\
-	BUILD_BUG_ON(sizeof(type) > sizeof(unsigned long));		\
+	if (sizeof(type) != sizeof(u64) || sizeof(u64) == sizeof(long))	{ \
+		*__addr = __val;					\
+	} else if (cpu_has_64bits) {					\
+		unsigned long __flags;					\
+		type __tmp;						\
 									\
-	*__addr = __val;						\
+		/* Manipulating 64-bit registers in a 32-bit kernel */	\
+		/* requires disabling interrupts, since only 32-bit */	\
+		/* registers are saved/restored by interrupts. */	\
+		local_irq_save(__flags);				\
+		__asm__ __volatile__(					\
+			".set	push"		"\t\t# __writeq""\n\t"	\
+			".set	mips3"				"\n\t"	\
+			"dsll32	%L0, %L0, 0"			"\n\t"	\
+			"dsrl32	%L0, %L0, 0"			"\n\t"	\
+			"dsll32	%M0, %M0, 0"			"\n\t"	\
+			"or	%L0, %L0, %M0"			"\n\t"	\
+			"sd	%L0, %2"			"\n\t"	\
+			"sll	%L0, %L0, 0"			"\n\t"	\
+			"sll	%M0, %M0, 0"			"\n\t"	\
+			".set	pop"				"\n"	\
+			: "=r" (__tmp)					\
+			: "0" (__val), "m" (*__addr));			\
+		local_irq_restore(__flags);				\
+	} else								\
+		BUG();							\
 }									\
 									\
 static inline type pfx##in##bwlq##p(unsigned long port)			\
@@ -433,12 +455,30 @@ static inline type pfx##in##bwlq##p(unsigned long port)			\
 									\
 	__addr = (void *)__swizzle_addr_##bwlq(mips_io_port_base + port); \
 									\
-	BUILD_BUG_ON(sizeof(type) > sizeof(unsigned long));		\
-									\
 	if (barrier)							\
 		iobarrier_rw();						\
 									\
-	__val = *__addr;						\
+	if (sizeof(type) != sizeof(u64) || sizeof(u64) == sizeof(long))	{ \
+		__val = *__addr;					\
+	} else if (cpu_has_64bits) {					\
+		unsigned long __flags;					\
+									\
+		/* Manipulating 64-bit registers in a 32-bit kernel */	\
+		/* requires disabling interrupts, since only 32-bit */	\
+		/* registers are saved/restored by interrupts. */	\
+		local_irq_save(__flags);				\
+		__asm__ __volatile__(					\
+			".set	push"		"\t\t# __outq"	"\n\t"	\
+			".set	mips3"				"\n\t"	\
+			"ld	%L0, %1"			"\n\t"	\
+			"dsra32	%M0, %L0, 0"			"\n\t"	\
+			"sll	%L0, %L0, 0"			"\n\t"	\
+			".set	pop"				"\n"	\
+			: "=r" (__val)					\
+			: "m" (*__addr));				\
+		local_irq_restore(__flags);				\
+	} else								\
+		BUG();							\
 									\
 	/* prevent prefetching of coherent DMA data prematurely */	\
 	if (!relax)							\
@@ -478,7 +518,7 @@ __BUILD_MEMORY_PFX(__mem_, q, u64, 0)
 BUILDIO_IOPORT(b, u8)
 BUILDIO_IOPORT(w, u16)
 BUILDIO_IOPORT(l, u32)
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) || defined(CONFIG_CPU_R5900)
 BUILDIO_IOPORT(q, u64)
 #endif
 
-- 
2.21.0

