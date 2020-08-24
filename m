Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743F1250659
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 19:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgHXRbu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 13:31:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:50652 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728073AbgHXQd1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AEB03AF7F;
        Mon, 24 Aug 2020 16:33:51 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] MIPS: Convert TX49XX_ICACHE_INDEX_INV into a config option
Date:   Mon, 24 Aug 2020 18:32:47 +0200
Message-Id: <20200824163257.44533-6-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enable TX49XX I-cache index invalidate
workaround and remove define from different war.h files.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                              |  9 +++++++++
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
 arch/mips/include/asm/war.h                    | 11 -----------
 arch/mips/mm/c-r4k.c                           |  6 +++---
 15 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3cbeca6da823..7db9611d7800 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -890,6 +890,7 @@ config MACH_TX39XX
 
 config MACH_TX49XX
 	bool "Toshiba TX49 series based machines"
+	select WAR_TX49XX_ICACHE_INDEX_INV
 
 config MIKROTIK_RB532
 	bool "Mikrotik RB532 boards"
@@ -2657,6 +2658,14 @@ config WAR_R4600_V1_HIT_CACHEOP
 config WAR_R4600_V2_HIT_CACHEOP
 	bool
 
+# From TX49/H2 manual: "If the instruction (i.e. CACHE) is issued for
+# the line which this instruction itself exists, the following
+# operation is not guaranteed."
+#
+# Workaround: do two phase flushing for Index_Invalidate_I
+config WAR_TX49XX_ICACHE_INDEX_INV
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 5826fbf4d3a2..1cb30485dc94 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -11,7 +11,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 11b1f5e41af0..79530836cc79 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index e47a7e186ed2..35286ba3ec57 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index f3c5cc8ff2bc..a18293c16ade 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index f867697a1793..1a6092e5c7b3 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index acda1ee3fb62..031c7b9c5236 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -7,7 +7,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #ifdef CONFIG_CPU_R10000
 #define R10000_LLSC_WAR			1
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index ca381798f6ab..25552158fa3a 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	1
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index d22ca4a3ec72..9b0803537bce 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	1
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index fccf25dcc26f..924b51b9a340 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index 556e0223e60b..0536972b24c8 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 0e18f0753407..9e006fdcf38a 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -24,7 +24,6 @@ extern int sb1250_m3_workaround_needed(void);
 
 #endif
 
-#define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 7019ddc4c68d..9293c5f9ffb2 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define TX49XX_ICACHE_INDEX_INV_WAR	1
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 590bf2b16b33..7a69641de57b 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -93,17 +93,6 @@
 #error Check setting of SIBYTE_1956_WAR for your platform
 #endif
 
-/*
- * From TX49/H2 manual: "If the instruction (i.e. CACHE) is issued for
- * the line which this instruction itself exists, the following
- * operation is not guaranteed."
- *
- * Workaround: do two phase flushing for Index_Invalidate_I
- */
-#ifndef TX49XX_ICACHE_INDEX_INV_WAR
-#error Check setting of TX49XX_ICACHE_INDEX_INV_WAR for your platform
-#endif
-
 /*
  * The RM7000 processors and the E9000 cores have a bug (though PMC-Sierra
  * opposes it being called that) where invalid instructions in the same
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index df09a3653c4f..4b12081f9843 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -239,7 +239,7 @@ static void r4k_blast_dcache_setup(void)
 		r4k_blast_dcache = blast_dcache128;
 }
 
-/* force code alignment (used for TX49XX_ICACHE_INDEX_INV_WAR) */
+/* force code alignment (used for CONFIG_WAR_TX49XX_ICACHE_INDEX_INV) */
 #define JUMP_TO_ALIGN(order) \
 	__asm__ __volatile__( \
 		"b\t1f\n\t" \
@@ -371,7 +371,7 @@ static void r4k_blast_icache_page_indexed_setup(void)
 		    cpu_is_r4600_v1_x())
 			r4k_blast_icache_page_indexed =
 				blast_icache32_r4600_v1_page_indexed;
-		else if (TX49XX_ICACHE_INDEX_INV_WAR)
+		else if (IS_ENABLED(CONFIG_WAR_TX49XX_ICACHE_INDEX_INV))
 			r4k_blast_icache_page_indexed =
 				tx49_blast_icache32_page_indexed;
 		else if (current_cpu_type() == CPU_LOONGSON2EF)
@@ -399,7 +399,7 @@ static void r4k_blast_icache_setup(void)
 		if (IS_ENABLED(CONFIG_WAR_R4600_V1_INDEX_ICACHEOP) &&
 		    cpu_is_r4600_v1_x())
 			r4k_blast_icache = blast_r4600_v1_icache32;
-		else if (TX49XX_ICACHE_INDEX_INV_WAR)
+		else if (IS_ENABLED(CONFIG_WAR_TX49XX_ICACHE_INDEX_INV))
 			r4k_blast_icache = tx49_blast_icache32;
 		else if (current_cpu_type() == CPU_LOONGSON2EF)
 			r4k_blast_icache = loongson2_blast_icache32;
-- 
2.16.4

