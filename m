Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22286250666
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 19:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728403AbgHXRcf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 13:32:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:50642 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbgHXQd0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 41B68AF7E;
        Mon, 24 Aug 2020 16:33:50 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] MIPS: Remove MIPS4K_ICACHE_REFILL_WAR and MIPS_CACHE_SYNC_WAR
Date:   Mon, 24 Aug 2020 18:32:46 +0200
Message-Id: <20200824163257.44533-5-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Neither MIPS4K_ICACHE_REFILL_WAR nor MIPS_CACHE_SYNC_WAR are implemented,
so removing defines for it won't change anything.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-cavium-octeon/war.h |  2 --
 arch/mips/include/asm/mach-generic/war.h       |  2 --
 arch/mips/include/asm/mach-ip22/war.h          |  2 --
 arch/mips/include/asm/mach-ip27/war.h          |  2 --
 arch/mips/include/asm/mach-ip28/war.h          |  2 --
 arch/mips/include/asm/mach-ip30/war.h          |  2 --
 arch/mips/include/asm/mach-ip32/war.h          |  2 --
 arch/mips/include/asm/mach-malta/war.h         |  2 --
 arch/mips/include/asm/mach-rc32434/war.h       |  2 --
 arch/mips/include/asm/mach-rm/war.h            |  2 --
 arch/mips/include/asm/mach-sibyte/war.h        |  2 --
 arch/mips/include/asm/mach-tx49xx/war.h        |  2 --
 arch/mips/include/asm/war.h                    | 35 --------------------------
 13 files changed, 59 deletions(-)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 4bc396d0fdd9..5826fbf4d3a2 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -11,8 +11,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 4d46a880b832..11b1f5e41af0 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index a5a1c41df74e..e47a7e186ed2 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index 5891d506cffd..f3c5cc8ff2bc 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			1
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index 346fc567ebb3..f867697a1793 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			1
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index f887a0a53e18..acda1ee3fb62 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -7,8 +7,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #ifdef CONFIG_CPU_R10000
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index 980dbd34355c..ca381798f6ab 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	1
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index 29f56803e3e5..d22ca4a3ec72 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	1
-#define MIPS_CACHE_SYNC_WAR		1
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	1
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 749787bb6c8e..fccf25dcc26f 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	1
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index aded634ccb01..556e0223e60b 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 78fd2ad4930b..0e18f0753407 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -24,8 +24,6 @@ extern int sb1250_m3_workaround_needed(void);
 
 #endif
 
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 0b1666e0391a..7019ddc4c68d 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -10,8 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	1
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 37092c2c68e1..590bf2b16b33 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -93,41 +93,6 @@
 #error Check setting of SIBYTE_1956_WAR for your platform
 #endif
 
-/*
- * Fill buffers not flushed on CACHE instructions
- *
- * Hit_Invalidate_I cacheops invalidate an icache line but the refill
- * for that line can get stale data from the fill buffer instead of
- * accessing memory if the previous icache miss was also to that line.
- *
- * Workaround: generate an icache refill from a different line
- *
- * Affects:
- *  MIPS 4K		RTL revision <3.0, PRID revision <4
- */
-#ifndef MIPS4K_ICACHE_REFILL_WAR
-#error Check setting of MIPS4K_ICACHE_REFILL_WAR for your platform
-#endif
-
-/*
- * Missing implicit forced flush of evictions caused by CACHE
- * instruction
- *
- * Evictions caused by a CACHE instructions are not forced on to the
- * bus. The BIU gives higher priority to fetches than to the data from
- * the eviction buffer and no collision detection is performed between
- * fetches and pending data from the eviction buffer.
- *
- * Workaround: Execute a SYNC instruction after the cache instruction
- *
- * Affects:
- *   MIPS 5Kc,5Kf	RTL revision <2.3, PRID revision <8
- *   MIPS 20Kc		RTL revision <4.0, PRID revision <?
- */
-#ifndef MIPS_CACHE_SYNC_WAR
-#error Check setting of MIPS_CACHE_SYNC_WAR for your platform
-#endif
-
 /*
  * From TX49/H2 manual: "If the instruction (i.e. CACHE) is issued for
  * the line which this instruction itself exists, the following
-- 
2.16.4

