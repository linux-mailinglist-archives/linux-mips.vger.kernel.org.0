Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8644225063F
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 19:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgHXQfU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:35:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:50666 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728078AbgHXQd1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3508CAF85;
        Mon, 24 Aug 2020 16:33:53 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] MIPS: Convert ICACHE_REFILLS_WORKAROUND_WAR into a config option
Date:   Mon, 24 Aug 2020 18:32:48 +0200
Message-Id: <20200824163257.44533-7-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enable I-cache refill workaround and remove
define from different war.h files.

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
 arch/mips/include/asm/war.h                    | 10 ----------
 arch/mips/kernel/signal.c                      |  8 +++++++-
 15 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7db9611d7800..c32f6160f854 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -568,6 +568,7 @@ config MIPS_MALTA
 	select SYS_SUPPORTS_VPE_LOADER
 	select SYS_SUPPORTS_ZBOOT
 	select USE_OF
+	select WAR_ICACHE_REFILLS
 	select ZONE_DMA32 if 64BIT
 	help
 	  This enables support for the MIPS Technologies Malta evaluation
@@ -756,6 +757,7 @@ config SGI_IP32
 	select SYS_HAS_CPU_NEVADA
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
+	select WAR_ICACHE_REFILLS
 	help
 	  If you want this kernel to run on SGI O2 workstation, say Y here.
 
@@ -2666,6 +2668,13 @@ config WAR_R4600_V2_HIT_CACHEOP
 config WAR_TX49XX_ICACHE_INDEX_INV
 	bool
 
+# The RM7000 processors and the E9000 cores have a bug (though PMC-Sierra
+# opposes it being called that) where invalid instructions in the same
+# I-cache line worth of instructions being fetched may case spurious
+# exceptions.
+config WAR_ICACHE_REFILLS
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 1cb30485dc94..1061917152c6 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -11,7 +11,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 79530836cc79..966f40aedf16 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index 35286ba3ec57..99f6531e5b9b 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index a18293c16ade..d8dfa7258bea 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index 1a6092e5c7b3..f252df761ec8 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index 031c7b9c5236..58ff9ca345b7 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -7,7 +7,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #ifdef CONFIG_CPU_R10000
 #define R10000_LLSC_WAR			1
 #else
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index 25552158fa3a..ca3efe457ae0 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	1
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index 9b0803537bce..b7827eb09375 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	1
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 924b51b9a340..b7827eb09375 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index 0536972b24c8..fe04d059dd0c 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 9e006fdcf38a..7c376f6eee9b 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -24,7 +24,6 @@ extern int sb1250_m3_workaround_needed(void);
 
 #endif
 
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 9293c5f9ffb2..5768889c20a7 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define ICACHE_REFILLS_WORKAROUND_WAR	0
 #define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 7a69641de57b..a0942821d67d 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -93,16 +93,6 @@
 #error Check setting of SIBYTE_1956_WAR for your platform
 #endif
 
-/*
- * The RM7000 processors and the E9000 cores have a bug (though PMC-Sierra
- * opposes it being called that) where invalid instructions in the same
- * I-cache line worth of instructions being fetched may case spurious
- * exceptions.
- */
-#ifndef ICACHE_REFILLS_WORKAROUND_WAR
-#error Check setting of ICACHE_REFILLS_WORKAROUND_WAR for your platform
-#endif
-
 /*
  * On the R10000 up to version 2.6 (not sure about 2.7) there is a bug that
  * may cause ll / sc and lld / scd sequences to execute non-atomically.
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index a0262729cd4c..f44265025281 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -545,6 +545,12 @@ int restore_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
 	return err ?: protected_restore_fp_context(sc);
 }
 
+#ifdef CONFIG_WAR_ICACHE_REFILLS
+#define SIGMASK		~(cpu_icache_line_size()-1)
+#else
+#define SIGMASK		ALMASK
+#endif
+
 void __user *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
 			  size_t frame_size)
 {
@@ -565,7 +571,7 @@ void __user *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
 
 	sp = sigsp(sp, ksig);
 
-	return (void __user *)((sp - frame_size) & (ICACHE_REFILLS_WORKAROUND_WAR ? ~(cpu_icache_line_size()-1) : ALMASK));
+	return (void __user *)((sp - frame_size) & SIGMASK);
 }
 
 /*
-- 
2.16.4

