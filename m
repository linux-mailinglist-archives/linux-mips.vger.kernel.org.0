Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56048250293
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbgHXQdg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:33:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:50580 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbgHXQdT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C7EA0AF76;
        Mon, 24 Aug 2020 16:33:45 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] MIPS: Convert R4600_V1_INDEX_ICACHEOP into a config option
Date:   Mon, 24 Aug 2020 18:32:43 +0200
Message-Id: <20200824163257.44533-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enable R4600 V1 index I-cacheop workaround
and remove define from different war.h files.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                              |  8 ++++++++
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
 arch/mips/include/asm/war.h                    | 10 ----------
 arch/mips/mm/c-r4k.c                           |  6 ++++--
 15 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 99220e7e465e..90f8aa04e2ec 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -638,6 +638,7 @@ config SGI_IP22
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
+	select WAR_R4600_V1_INDEX_ICACHEOP
 	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  This are the SGI Indy, Challenge S and Indigo2, as well as certain
@@ -2607,6 +2608,13 @@ config MIPS_ASID_BITS_VARIABLE
 config MIPS_CRC_SUPPORT
 	bool
 
+# R4600 erratum.  Due to the lack of errata information the exact
+# technical details aren't known.  I've experimentally found that disabling
+# interrupts during indexed I-cache flushes seems to be sufficient to deal
+# with the issue.
+config WAR_R4600_V1_INDEX_ICACHEOP
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 2421411b7636..1e01e2f20086 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -9,7 +9,6 @@
 #ifndef __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 #define __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index f0f4a35d0870..7614a1545d1c 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MACH_GENERIC_WAR_H
 #define __ASM_MACH_GENERIC_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index b48eb4ac362d..3424c1e8a24f 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -12,7 +12,6 @@
  * R4600 CPU modules for the Indy come with both V1.7 and V2.0 processors.
  */
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	1
 #define R4600_V1_HIT_CACHEOP_WAR	1
 #define R4600_V2_HIT_CACHEOP_WAR	1
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index ef3efce0094a..5a91a7564fb9 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP27_WAR_H
 #define __ASM_MIPS_MACH_IP27_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index 61cd67354829..0dc70d59909e 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP28_WAR_H
 #define __ASM_MIPS_MACH_IP28_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index a1fa0c1f5300..9f5c3305674c 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -5,7 +5,6 @@
 #ifndef __ASM_MIPS_MACH_IP30_WAR_H
 #define __ASM_MIPS_MACH_IP30_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index e77b9d1b6c96..ac933b9119bb 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_IP32_WAR_H
 #define __ASM_MIPS_MACH_IP32_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index d62d2ffe515e..12c6393b6f31 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index af430d26f713..62e04bea61b3 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index eca16d167c2f..fe3c17f38650 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -12,7 +12,6 @@
  * The RM200C seems to have been shipped only with V2.0 R4600s
  */
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	1
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 4755b6116807..d34f3c1d6741 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_SIBYTE_WAR_H
 #define __ASM_MIPS_MACH_SIBYTE_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 445abb4eb769..eb0375da266a 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -8,7 +8,6 @@
 #ifndef __ASM_MIPS_MACH_TX49XX_WAR_H
 #define __ASM_MIPS_MACH_TX49XX_WAR_H
 
-#define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
 #define BCM1250_M3_WAR			0
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index e43f800e662d..3c8923692fca 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -72,16 +72,6 @@
 #define DADDI_WAR 0
 #endif
 
-/*
- * Another R4600 erratum.  Due to the lack of errata information the exact
- * technical details aren't known.  I've experimentally found that disabling
- * interrupts during indexed I-cache flushes seems to be sufficient to deal
- * with the issue.
- */
-#ifndef R4600_V1_INDEX_ICACHEOP_WAR
-#error Check setting of R4600_V1_INDEX_ICACHEOP_WAR for your platform
-#endif
-
 /*
  * Pleasures of the R4600 V1.x.	 Cite from the IDT R4600 V1.7 errata:
  *
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index fc5a6d25f74f..bf454da84a9b 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -366,7 +366,8 @@ static void r4k_blast_icache_page_indexed_setup(void)
 	else if (ic_lsize == 16)
 		r4k_blast_icache_page_indexed = blast_icache16_page_indexed;
 	else if (ic_lsize == 32) {
-		if (R4600_V1_INDEX_ICACHEOP_WAR && cpu_is_r4600_v1_x())
+		if (IS_ENABLED(CONFIG_WAR_R4600_V1_INDEX_ICACHEOP) &&
+		    cpu_is_r4600_v1_x())
 			r4k_blast_icache_page_indexed =
 				blast_icache32_r4600_v1_page_indexed;
 		else if (TX49XX_ICACHE_INDEX_INV_WAR)
@@ -394,7 +395,8 @@ static void r4k_blast_icache_setup(void)
 	else if (ic_lsize == 16)
 		r4k_blast_icache = blast_icache16;
 	else if (ic_lsize == 32) {
-		if (R4600_V1_INDEX_ICACHEOP_WAR && cpu_is_r4600_v1_x())
+		if (IS_ENABLED(CONFIG_WAR_R4600_V1_INDEX_ICACHEOP) &&
+		    cpu_is_r4600_v1_x())
 			r4k_blast_icache = blast_r4600_v1_icache32;
 		else if (TX49XX_ICACHE_INDEX_INV_WAR)
 			r4k_blast_icache = tx49_blast_icache32;
-- 
2.16.4

