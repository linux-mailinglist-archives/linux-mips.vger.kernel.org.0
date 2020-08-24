Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111A2250290
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgHXQd0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:33:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:50592 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727999AbgHXQdT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 61D61AF6E;
        Mon, 24 Aug 2020 16:33:47 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] MIPS: Convert R4600_V1_HIT_CACHEOP into a config option
Date:   Mon, 24 Aug 2020 18:32:44 +0200
Message-Id: <20200824163257.44533-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enable R4600 V1 cacheop hit workaround
and remove define from the different war.h files.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                              | 28 +++++++++++++++++++++++
 arch/mips/include/asm/mach-cavium-octeon/war.h |  1 -
 arch/mips/include/asm/mach-generic/war.h       |  1 -
 arch/mips/include/asm/mach-ip22/war.h          |  1 -
 arch/mips/include/asm/mach-ip27/war.h          |  1 -
 arch/mips/include/asm/mach-ip28/war.h          |  1 -
 arch/mips/include/asm/mach-ip30/war.h          |  1 -
 arch/mips/include/asm/mach-ip32/war.h          |  1 -
 arch/mips/include/asm/mach-malta/war.h         |  1 -
 arch/mips/include/asm/mach-rc32434/war.h       |  1 -
 arch/mips/include/asm/mach-rm/war.h            |  1 -
 arch/mips/include/asm/mach-sibyte/war.h        |  1 -
 arch/mips/include/asm/mach-tx49xx/war.h        |  1 -
 arch/mips/include/asm/war.h                    | 31 --------------------------
 arch/mips/mm/c-r4k.c                           |  2 +-
 arch/mips/mm/page.c                            |  6 +++--
 16 files changed, 33 insertions(+), 46 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 90f8aa04e2ec..4d3179b66456 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -639,6 +639,7 @@ config SGI_IP22
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select WAR_R4600_V1_INDEX_ICACHEOP
+	select WAR_R4600_V1_HIT_CACHEOP
 	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  This are the SGI Indy, Challenge S and Indigo2, as well as certain
@@ -2615,6 +2616,33 @@ config MIPS_CRC_SUPPORT
 config WAR_R4600_V1_INDEX_ICACHEOP
 	bool
 
+# Pleasures of the R4600 V1.x.  Cite from the IDT R4600 V1.7 errata:
+#
+#  18. The CACHE instructions Hit_Writeback_Invalidate_D, Hit_Writeback_D,
+#      Hit_Invalidate_D and Create_Dirty_Excl_D should only be
+#      executed if there is no other dcache activity. If the dcache is
+#      accessed for another instruction immeidately preceding when these
+#      cache instructions are executing, it is possible that the dcache
+#      tag match outputs used by these cache instructions will be
+#      incorrect. These cache instructions should be preceded by at least
+#      four instructions that are not any kind of load or store
+#      instruction.
+#
+#      This is not allowed:    lw
+#                              nop
+#                              nop
+#                              nop
+#                              cache       Hit_Writeback_Invalidate_D
+#
+#      This is allowed:        lw
+#                              nop
+#                              nop
+#                              nop
+#                              nop
+#                              cache       Hit_Writeback_Invalidate_D
+config WAR_R4600_V1_HIT_CACHEOP
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 1e01e2f20086..915ce0352c20 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -9,7 +9,6 @@
 #ifndef __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 #define __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 7614a1545d1c..44d14be2e1e5 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MACH_GENERIC_WAR_H
 #define __ASM_MACH_GENERIC_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index 3424c1e8a24f..9154c54d428a 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -12,7 +12,6 @@
  * R4600 CPU modules for the Indy come with both V1.7 and V2.0 processors.
  */
 
-#define R4600_V1_HIT_CACHEOP_WAR	1
 #define R4600_V2_HIT_CACHEOP_WAR	1
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index 5a91a7564fb9..e7c070c85b7c 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP27_WAR_H
 #define __ASM_MIPS_MACH_IP27_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index 0dc70d59909e..22d9f78bf552 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP28_WAR_H
 #define __ASM_MIPS_MACH_IP28_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index 9f5c3305674c..1400b030982e 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -5,7 +5,6 @@
 #ifndef __ASM_MIPS_MACH_IP30_WAR_H
 #define __ASM_MIPS_MACH_IP30_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index ac933b9119bb..f91f4eddce8f 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP32_WAR_H
 #define __ASM_MIPS_MACH_IP32_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index 12c6393b6f31..a4d5d0926e81 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 62e04bea61b3..82ce2d313eed 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index fe3c17f38650..192ec3358ad0 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -12,7 +12,6 @@
  * The RM200C seems to have been shipped only with V2.0 R4600s
  */
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	1
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index d34f3c1d6741..bf793d36c890 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_SIBYTE_WAR_H
 #define __ASM_MIPS_MACH_SIBYTE_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 
 #if defined(CONFIG_SB1_PASS_2_WORKAROUNDS)
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index eb0375da266a..7da1a3ea54c7 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_TX49XX_WAR_H
 #define __ASM_MIPS_MACH_TX49XX_WAR_H
 
-#define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 3c8923692fca..d336a0e57093 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -72,37 +72,6 @@
 #define DADDI_WAR 0
 #endif
 
-/*
- * Pleasures of the R4600 V1.x.	 Cite from the IDT R4600 V1.7 errata:
- *
- *  18. The CACHE instructions Hit_Writeback_Invalidate_D, Hit_Writeback_D,
- *	Hit_Invalidate_D and Create_Dirty_Excl_D should only be
- *	executed if there is no other dcache activity. If the dcache is
- *	accessed for another instruction immeidately preceding when these
- *	cache instructions are executing, it is possible that the dcache
- *	tag match outputs used by these cache instructions will be
- *	incorrect. These cache instructions should be preceded by at least
- *	four instructions that are not any kind of load or store
- *	instruction.
- *
- *	This is not allowed:	lw
- *				nop
- *				nop
- *				nop
- *				cache	    Hit_Writeback_Invalidate_D
- *
- *	This is allowed:	lw
- *				nop
- *				nop
- *				nop
- *				nop
- *				cache	    Hit_Writeback_Invalidate_D
- */
-#ifndef R4600_V1_HIT_CACHEOP_WAR
-#error Check setting of R4600_V1_HIT_CACHEOP_WAR for your platform
-#endif
-
-
 /*
  * Writeback and invalidate the primary cache dcache before DMA.
  *
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index bf454da84a9b..814a295a2df2 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -132,7 +132,7 @@ struct bcache_ops *bcops = &no_sc_ops;
 do {									\
 	if (R4600_V2_HIT_CACHEOP_WAR && cpu_is_r4600_v2_x())		\
 		*(volatile unsigned long *)CKSEG1;			\
-	if (R4600_V1_HIT_CACHEOP_WAR)					\
+	if (IS_ENABLED(CONFIG_WAR_R4600_V1_HIT_CACHEOP))					\
 		__asm__ __volatile__("nop;nop;nop;nop");		\
 } while (0)
 
diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index cd805b005509..ecad11f5c67c 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -250,7 +250,8 @@ static inline void build_clear_pref(u32 **buf, int off)
 		if (cpu_has_cache_cdex_s) {
 			uasm_i_cache(buf, Create_Dirty_Excl_SD, off, A0);
 		} else if (cpu_has_cache_cdex_p) {
-			if (R4600_V1_HIT_CACHEOP_WAR && cpu_is_r4600_v1_x()) {
+			if (IS_ENABLED(CONFIG_WAR_R4600_V1_HIT_CACHEOP) &&
+			    cpu_is_r4600_v1_x()) {
 				uasm_i_nop(buf);
 				uasm_i_nop(buf);
 				uasm_i_nop(buf);
@@ -402,7 +403,8 @@ static inline void build_copy_store_pref(u32 **buf, int off)
 		if (cpu_has_cache_cdex_s) {
 			uasm_i_cache(buf, Create_Dirty_Excl_SD, off, A0);
 		} else if (cpu_has_cache_cdex_p) {
-			if (R4600_V1_HIT_CACHEOP_WAR && cpu_is_r4600_v1_x()) {
+			if (IS_ENABLED(CONFIG_WAR_R4600_V1_HIT_CACHEOP) &&
+			    cpu_is_r4600_v1_x()) {
 				uasm_i_nop(buf);
 				uasm_i_nop(buf);
 				uasm_i_nop(buf);
-- 
2.16.4

