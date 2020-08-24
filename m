Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3050250291
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgHXQd2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:33:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:50612 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbgHXQdY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E64E0AF7A;
        Mon, 24 Aug 2020 16:33:48 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] MIPS: Convert R4600_V2_HIT_CACHEOP into a config option
Date:   Mon, 24 Aug 2020 18:32:45 +0200
Message-Id: <20200824163257.44533-4-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enable R4600 V2 cacheop hit workaround
and remove define from different war.h files.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                              | 14 ++++++++++++++
 arch/mips/include/asm/mach-cavium-octeon/war.h |  1 -
 arch/mips/include/asm/mach-generic/war.h       |  1 -
 arch/mips/include/asm/mach-ip22/war.h          |  5 -----
 arch/mips/include/asm/mach-ip27/war.h          |  1 -
 arch/mips/include/asm/mach-ip28/war.h          |  1 -
 arch/mips/include/asm/mach-ip30/war.h          |  1 -
 arch/mips/include/asm/mach-ip32/war.h          |  1 -
 arch/mips/include/asm/mach-malta/war.h         |  1 -
 arch/mips/include/asm/mach-rc32434/war.h       |  1 -
 arch/mips/include/asm/mach-rm/war.h            |  5 -----
 arch/mips/include/asm/mach-sibyte/war.h        |  2 --
 arch/mips/include/asm/mach-tx49xx/war.h        |  1 -
 arch/mips/include/asm/war.h                    | 15 ---------------
 arch/mips/mm/c-r4k.c                           |  3 ++-
 arch/mips/mm/page.c                            | 10 ++++++----
 16 files changed, 22 insertions(+), 41 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4d3179b66456..3cbeca6da823 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -640,6 +640,7 @@ config SGI_IP22
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select WAR_R4600_V1_INDEX_ICACHEOP
 	select WAR_R4600_V1_HIT_CACHEOP
+	select WAR_R4600_V2_HIT_CACHEOP
 	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  This are the SGI Indy, Challenge S and Indigo2, as well as certain
@@ -877,6 +878,7 @@ config SNI_RM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select WAR_R4600_V2_HIT_CACHEOP
 	help
 	  The SNI RM200/300/400 are MIPS-based machines manufactured by
 	  Siemens Nixdorf Informationssysteme (SNI), parent company of Pyramid
@@ -2643,6 +2645,18 @@ config WAR_R4600_V1_INDEX_ICACHEOP
 config WAR_R4600_V1_HIT_CACHEOP
 	bool
 
+# Writeback and invalidate the primary cache dcache before DMA.
+#
+# R4600 v2.0 bug: "The CACHE instructions Hit_Writeback_Inv_D,
+# Hit_Writeback_D, Hit_Invalidate_D and Create_Dirty_Exclusive_D will only
+# operate correctly if the internal data cache refill buffer is empty.  These
+# CACHE instructions should be separated from any potential data cache miss
+# by a load instruction to an uncached address to empty the response buffer."
+# (Revision 2.0 device errata from IDT available on https://www.idt.com/
+# in .pdf format.)
+config WAR_R4600_V2_HIT_CACHEOP
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 915ce0352c20..4bc396d0fdd9 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -9,7 +9,6 @@
 #ifndef __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 #define __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 44d14be2e1e5..4d46a880b832 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MACH_GENERIC_WAR_H
 #define __ASM_MACH_GENERIC_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index 9154c54d428a..a5a1c41df74e 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -8,11 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP22_WAR_H
 #define __ASM_MIPS_MACH_IP22_WAR_H
 
-/*
- * R4600 CPU modules for the Indy come with both V1.7 and V2.0 processors.
- */
-
-#define R4600_V2_HIT_CACHEOP_WAR	1
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index e7c070c85b7c..5891d506cffd 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP27_WAR_H
 #define __ASM_MIPS_MACH_IP27_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index 22d9f78bf552..346fc567ebb3 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP28_WAR_H
 #define __ASM_MIPS_MACH_IP28_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index 1400b030982e..f887a0a53e18 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -5,7 +5,6 @@
 #ifndef __ASM_MIPS_MACH_IP30_WAR_H
 #define __ASM_MIPS_MACH_IP30_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index f91f4eddce8f..980dbd34355c 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP32_WAR_H
 #define __ASM_MIPS_MACH_IP32_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index a4d5d0926e81..29f56803e3e5 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	1
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 82ce2d313eed..749787bb6c8e 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	1
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index 192ec3358ad0..aded634ccb01 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -8,11 +8,6 @@
 #ifndef __ASM_MIPS_MACH_RM_WAR_H
 #define __ASM_MIPS_MACH_RM_WAR_H
 
-/*
- * The RM200C seems to have been shipped only with V2.0 R4600s
- */
-
-#define R4600_V2_HIT_CACHEOP_WAR	1
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index bf793d36c890..78fd2ad4930b 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -8,8 +8,6 @@
 #ifndef __ASM_MIPS_MACH_SIBYTE_WAR_H
 #define __ASM_MIPS_MACH_SIBYTE_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
-
 #if defined(CONFIG_SB1_PASS_2_WORKAROUNDS)
 
 #ifndef __ASSEMBLY__
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 7da1a3ea54c7..0b1666e0391a 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_TX49XX_WAR_H
 #define __ASM_MIPS_MACH_TX49XX_WAR_H
 
-#define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index d336a0e57093..37092c2c68e1 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -72,21 +72,6 @@
 #define DADDI_WAR 0
 #endif
 
-/*
- * Writeback and invalidate the primary cache dcache before DMA.
- *
- * R4600 v2.0 bug: "The CACHE instructions Hit_Writeback_Inv_D,
- * Hit_Writeback_D, Hit_Invalidate_D and Create_Dirty_Exclusive_D will only
- * operate correctly if the internal data cache refill buffer is empty.	 These
- * CACHE instructions should be separated from any potential data cache miss
- * by a load instruction to an uncached address to empty the response buffer."
- * (Revision 2.0 device errata from IDT available on https://www.idt.com/
- * in .pdf format.)
- */
-#ifndef R4600_V2_HIT_CACHEOP_WAR
-#error Check setting of R4600_V2_HIT_CACHEOP_WAR for your platform
-#endif
-
 /*
  * Workaround for the Sibyte M3 errata the text of which can be found at
  *
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 814a295a2df2..df09a3653c4f 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -130,7 +130,8 @@ struct bcache_ops *bcops = &no_sc_ops;
 
 #define R4600_HIT_CACHEOP_WAR_IMPL					\
 do {									\
-	if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())		\
+	if (IS_ENABLED(CONFIG_WAR_R4600_V2_HIT_CACHEOP) &&		\
+	    cpu_is_r4600_v2_x())					\
 		*(volatile unsigned long *)CKSEG1;			\
 	if (IS_ENABLED(CONFIG_WAR_R4600_V1_HIT_CACHEOP))					\
 		__asm__ __volatile__("nop;nop;nop;nop");		\
diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index ecad11f5c67c..504bc4047c4c 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -258,7 +258,8 @@ static inline void build_clear_pref(u32 **buf, int off)
 				uasm_i_nop(buf);
 			}
 
-			if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())
+			if (IS_ENABLED(CONFIG_WAR_R4600_V2_HIT_CACHEOP) &&
+			    cpu_is_r4600_v2_x())
 				uasm_i_lw(buf, ZERO, ZERO, AT);
 
 			uasm_i_cache(buf, Create_Dirty_Excl_D, off, A0);
@@ -303,7 +304,7 @@ void build_clear_page(void)
 	else
 		uasm_i_ori(&buf, A2, A0, off);
 
-	if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())
+	if (IS_ENABLED(CONFIG_WAR_R4600_V2_HIT_CACHEOP) && cpu_is_r4600_v2_x())
 		uasm_i_lui(&buf, AT, uasm_rel_hi(0xa0000000));
 
 	off = cache_line_size ? min(8, pref_bias_clear_store / cache_line_size)
@@ -411,7 +412,8 @@ static inline void build_copy_store_pref(u32 **buf, int off)
 				uasm_i_nop(buf);
 			}
 
-			if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())
+			if (IS_ENABLED(CONFIG_WAR_R4600_V2_HIT_CACHEOP) &&
+			    cpu_is_r4600_v2_x())
 				uasm_i_lw(buf, ZERO, ZERO, AT);
 
 			uasm_i_cache(buf, Create_Dirty_Excl_D, off, A0);
@@ -455,7 +457,7 @@ void build_copy_page(void)
 	else
 		uasm_i_ori(&buf, A2, A0, off);
 
-	if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())
+	if (IS_ENABLED(CONFIG_WAR_R4600_V2_HIT_CACHEOP) && cpu_is_r4600_v2_x())
 		uasm_i_lui(&buf, AT, uasm_rel_hi(0xa0000000));
 
 	off = cache_line_size ? min(8, pref_bias_copy_load / cache_line_size) *
-- 
2.16.4

