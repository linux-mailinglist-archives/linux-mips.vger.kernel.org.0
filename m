Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415BD191610
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 17:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgCXQTw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 12:19:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55444 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCXQTw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 12:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=UtULx5L9tTkKUjNc3EavCQG/o3g4X2jMZn5gHRuZvMM=; b=AjaNNAvlu6x3i3GgMPQfhSfRxL
        fisn9fmLvBIUREG9VrP7B+p/8rtfSGF0PmAQEA+Dd2MUI4T+n0ckiVWDQUggu/XstiB+a80Y7ahDz
        qkEOJNhqRPyVp0DnhV1pyCBU4k97Plum6Z61L4xZFDFIE+yCd3aOp9V6lDXxV64EBqorKfa+bqlqW
        X8in/4mJVWmBRvW5540mt32Eetw1gz+r5sUbk7TFYSbAg6jeXDl8btn+gzWprVbkrlANYuiwLdweo
        A7f9gGVQdb1xZ3nsQT0eQfDFjStigxyLge1Kbl6cIJk0MHvhaA/e1ydTGI+OH3di4HjoypZNAzHQ9
        j8vJE22Q==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmHP-0003FP-KG; Tue, 24 Mar 2020 16:19:52 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and cpu_has_64bit_addresses
Date:   Tue, 24 Mar 2020 17:15:20 +0100
Message-Id: <20200324161525.754181-2-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324161525.754181-1-hch@lst.de>
References: <20200324161525.754181-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Both macros are always identical to CONFIG_64BIT.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/cpu-features.h                 | 12 ------------
 arch/mips/include/asm/io.h                           |  4 ++--
 .../include/asm/mach-ath25/cpu-feature-overrides.h   |  2 --
 .../include/asm/mach-ath79/cpu-feature-overrides.h   |  2 --
 .../asm/mach-lantiq/falcon/cpu-feature-overrides.h   |  2 --
 .../asm/mach-ralink/mt7620/cpu-feature-overrides.h   |  2 --
 .../asm/mach-ralink/mt7621/cpu-feature-overrides.h   |  2 --
 .../asm/mach-ralink/rt288x/cpu-feature-overrides.h   |  2 --
 .../asm/mach-ralink/rt305x/cpu-feature-overrides.h   |  2 --
 .../asm/mach-ralink/rt3883/cpu-feature-overrides.h   |  2 --
 .../include/asm/mach-rc32434/cpu-feature-overrides.h |  2 --
 arch/mips/mm/page.c                                  | 12 ++++++------
 12 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index de44c92b1c1f..2798ea0d5fff 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -432,12 +432,6 @@
 # ifndef cpu_has_64bit_zero_reg
 # define cpu_has_64bit_zero_reg	(cpu_data[0].isa_level & MIPS_CPU_ISA_64BIT)
 # endif
-# ifndef cpu_has_64bit_gp_regs
-# define cpu_has_64bit_gp_regs		0
-# endif
-# ifndef cpu_has_64bit_addresses
-# define cpu_has_64bit_addresses	0
-# endif
 # ifndef cpu_vmbits
 # define cpu_vmbits 31
 # endif
@@ -453,12 +447,6 @@
 # ifndef cpu_has_64bit_zero_reg
 # define cpu_has_64bit_zero_reg		1
 # endif
-# ifndef cpu_has_64bit_gp_regs
-# define cpu_has_64bit_gp_regs		1
-# endif
-# ifndef cpu_has_64bit_addresses
-# define cpu_has_64bit_addresses	1
-# endif
 # ifndef cpu_vmbits
 # define cpu_vmbits cpu_data[0].vmbits
 # define __NEED_VMBITS_PROBE
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index cf1f2a4a2418..7be323ed2bfd 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -166,7 +166,7 @@ static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long si
 
 #define __IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
 
-	if (cpu_has_64bit_addresses) {
+	if (IS_ENABLED(CONFIG_64BIT)) {
 		u64 base = UNCAC_BASE;
 
 		/*
@@ -275,7 +275,7 @@ static inline void iounmap(const volatile void __iomem *addr)
 
 #define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
 
-	if (cpu_has_64bit_addresses ||
+	if (IS_ENABLED(CONFIG_64BIT) ||
 	    (__builtin_constant_p(addr) && __IS_KSEG1(addr)))
 		return;
 
diff --git a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
index 95a0b580909d..91f638ee68e0 100644
--- a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
@@ -55,7 +55,5 @@
 
 #define cpu_has_64bits			0
 #define cpu_has_64bit_zero_reg		0
-#define cpu_has_64bit_gp_regs		0
-#define cpu_has_64bit_addresses		0
 
 #endif /* __ASM_MACH_ATH25_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
index e7c972fccd9f..bc52a75d77a8 100644
--- a/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
@@ -44,8 +44,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses 0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h b/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
index f03c1c42dd90..0fdec83af64b 100644
--- a/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
@@ -45,8 +45,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
index 6ea5908f0c11..945e0fd4a884 100644
--- a/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
@@ -44,8 +44,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
index e06f517b2588..21f73ef8f695 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
@@ -45,8 +45,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
index 9c069646d0bd..c314c3cec130 100644
--- a/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
@@ -43,8 +43,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	16
 #define cpu_icache_line_size()	16
diff --git a/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
index 2e423fd15384..9fb175dc9b78 100644
--- a/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
@@ -43,8 +43,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
index 7cee0e232580..57857566e5df 100644
--- a/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
@@ -42,8 +42,6 @@
 
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
-#define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h b/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
index bc46179fdf40..852f15c8853b 100644
--- a/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
@@ -53,8 +53,6 @@
 /* #define cpu_has_nofpuex		? */
 #define cpu_has_64bits			0
 #define cpu_has_64bit_zero_reg		0
-#define cpu_has_64bit_gp_regs		0
-#define cpu_has_64bit_addresses		0
 
 #define cpu_has_inclusive_pcaches	0
 
diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index c5578897a4fa..6bc6540dc9de 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -104,7 +104,7 @@ static int cache_line_size;
 static inline void
 pg_addiu(u32 **buf, unsigned int reg1, unsigned int reg2, unsigned int off)
 {
-	if (cpu_has_64bit_gp_regs && DADDI_WAR && r4k_daddiu_bug()) {
+	if (IS_ENABLED(CONFIG_64BIT) && DADDI_WAR && r4k_daddiu_bug()) {
 		if (off > 0x7fff) {
 			uasm_i_lui(buf, T9, uasm_rel_hi(off));
 			uasm_i_addiu(buf, T9, T9, uasm_rel_lo(off));
@@ -123,12 +123,12 @@ pg_addiu(u32 **buf, unsigned int reg1, unsigned int reg2, unsigned int off)
 
 static void set_prefetch_parameters(void)
 {
-	if (cpu_has_64bit_gp_regs || cpu_has_64bit_zero_reg)
+	if (IS_ENABLED(CONFIG_64BIT) || cpu_has_64bit_zero_reg)
 		clear_word_size = 8;
 	else
 		clear_word_size = 4;
 
-	if (cpu_has_64bit_gp_regs)
+	if (IS_ENABLED(CONFIG_64BIT))
 		copy_word_size = 8;
 	else
 		copy_word_size = 4;
@@ -232,7 +232,7 @@ static void set_prefetch_parameters(void)
 
 static void build_clear_store(u32 **buf, int off)
 {
-	if (cpu_has_64bit_gp_regs || cpu_has_64bit_zero_reg) {
+	if (IS_ENABLED(CONFIG_64BIT) || cpu_has_64bit_zero_reg) {
 		uasm_i_sd(buf, ZERO, off, A0);
 	} else {
 		uasm_i_sw(buf, ZERO, off, A0);
@@ -366,7 +366,7 @@ void build_clear_page(void)
 
 static void build_copy_load(u32 **buf, int reg, int off)
 {
-	if (cpu_has_64bit_gp_regs) {
+	if (IS_ENABLED(CONFIG_64BIT)) {
 		uasm_i_ld(buf, reg, off, A1);
 	} else {
 		uasm_i_lw(buf, reg, off, A1);
@@ -375,7 +375,7 @@ static void build_copy_load(u32 **buf, int reg, int off)
 
 static void build_copy_store(u32 **buf, int reg, int off)
 {
-	if (cpu_has_64bit_gp_regs) {
+	if (IS_ENABLED(CONFIG_64BIT)) {
 		uasm_i_sd(buf, reg, off, A0);
 	} else {
 		uasm_i_sw(buf, reg, off, A0);
-- 
2.25.1

