Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620A32502A3
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgHXQfE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:35:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:50612 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728107AbgHXQd1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 76960AF6E;
        Mon, 24 Aug 2020 16:33:56 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] MIPS: Convert MIPS34K_MISSED_ITLB_WAR into a config option
Date:   Mon, 24 Aug 2020 18:32:50 +0200
Message-Id: <20200824163257.44533-9-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enable MIPS 34K ITLB workaround and remove
define from different war.h files.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                              | 4 ++++
 arch/mips/include/asm/mach-cavium-octeon/war.h | 1 -
 arch/mips/include/asm/mach-generic/war.h       | 1 -
 arch/mips/include/asm/mach-ip22/war.h          | 1 -
 arch/mips/include/asm/mach-ip27/war.h          | 1 -
 arch/mips/include/asm/mach-ip28/war.h          | 1 -
 arch/mips/include/asm/mach-ip30/war.h          | 1 -
 arch/mips/include/asm/mach-ip32/war.h          | 1 -
 arch/mips/include/asm/mach-malta/war.h         | 1 -
 arch/mips/include/asm/mach-rc32434/war.h       | 1 -
 arch/mips/include/asm/mach-rm/war.h            | 1 -
 arch/mips/include/asm/mach-sibyte/war.h        | 2 --
 arch/mips/include/asm/mach-tx49xx/war.h        | 1 -
 arch/mips/include/asm/mipsregs.h               | 4 ++--
 arch/mips/include/asm/war.h                    | 7 -------
 15 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index acb790b556a8..7991a04274da 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2683,6 +2683,10 @@ config WAR_ICACHE_REFILLS
 config WAR_R10000_LLSC
 	bool
 
+# 34K core erratum: "Problems Executing the TLBR Instruction"
+config WAR_MIPS34K_MISSED_ITLB
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 52be3785e3e2..9aa4ea5522a9 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -11,7 +11,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #define CAVIUM_OCTEON_DCACHE_PREFETCH_WAR	\
 	OCTEON_IS_MODEL(OCTEON_CN6XXX)
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 2229c8377288..4f25636661d5 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MACH_GENERIC_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index f10efe589f93..09169cfbf932 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP22_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index 0a07cf6731c0..1c81d5464235 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP27_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index 9fdc6425c22c..ff66adbaaae5 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP28_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index 8a8ec5578083..b00469a39835 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -7,6 +7,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP30_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index 9e8c0c2a4c26..c57a9cd2e50b 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP32_WAR_H */
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index 76f7de21b7dd..73c9e6d84a8f 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 76f7de21b7dd..73c9e6d84a8f 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index dcb80b558321..c396a31706ac 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_RM_WAR_H */
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 0cf25eea846f..fa9bbc228dd7 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -24,6 +24,4 @@ extern int sb1250_m3_workaround_needed(void);
 
 #endif
 
-#define MIPS34K_MISSED_ITLB_WAR		0
-
 #endif /* __ASM_MIPS_MACH_SIBYTE_WAR_H */
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 8e572d7d2b6e..7213d9334f3f 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -10,6 +10,5 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_TX49XX_WAR_H */
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 1a03fdc2c74a..3a7379b8f31c 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2716,7 +2716,7 @@ static inline void tlb_probe(void)
 
 static inline void tlb_read(void)
 {
-#if MIPS34K_MISSED_ITLB_WAR
+#ifdef CONFIG_WAR_MIPS34K_MISSED_ITLB
 	int res = 0;
 
 	__asm__ __volatile__(
@@ -2738,7 +2738,7 @@ static inline void tlb_read(void)
 		"tlbr\n\t"
 		".set reorder");
 
-#if MIPS34K_MISSED_ITLB_WAR
+#ifdef CONFIG_WAR_MIPS34K_MISSED_ITLB
 	if ((res & _ULCAST_(1)))
 		__asm__ __volatile__(
 		"	.set	push				\n"
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index d405ecb78cbd..4f4d37b3dd07 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -93,11 +93,4 @@
 #error Check setting of SIBYTE_1956_WAR for your platform
 #endif
 
-/*
- * 34K core erratum: "Problems Executing the TLBR Instruction"
- */
-#ifndef MIPS34K_MISSED_ITLB_WAR
-#error Check setting of MIPS34K_MISSED_ITLB_WAR for your platform
-#endif
-
 #endif /* _ASM_WAR_H */
-- 
2.16.4

