Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F10250299
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgHXQeG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:34:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:50708 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728120AbgHXQdc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 49EBAAF7A;
        Mon, 24 Aug 2020 16:33:59 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] MIPS: Get rid of BCM1250_M3_WAR
Date:   Mon, 24 Aug 2020 18:32:52 +0200
Message-Id: <20200824163257.44533-11-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM1250_M3_WAR is depending on CONFIG_CONFIG_SB1_PASS_2_WORKAROUNDS.
So using this option directly lets and remove define.

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
 arch/mips/include/asm/mach-sibyte/war.h        | 14 --------------
 arch/mips/include/asm/mach-tx49xx/war.h        |  2 --
 arch/mips/include/asm/war.h                    | 14 --------------
 arch/mips/mm/tlbex.c                           |  6 +++++-
 14 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 0a2bf6b7af94..616de70e697c 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -9,8 +9,6 @@
 #ifndef __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 #define __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #define CAVIUM_OCTEON_DCACHE_PREFETCH_WAR	\
 	OCTEON_IS_MODEL(OCTEON_CN6XXX)
 
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 6b7de91435e3..94796ad7e7de 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MACH_GENERIC_WAR_H
 #define __ASM_MACH_GENERIC_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MACH_GENERIC_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index 70de6a5008d3..12cf05dd46d3 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_IP22_WAR_H
 #define __ASM_MIPS_MACH_IP22_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_IP22_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index 5b01e8fe245f..0852fe64594d 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_IP27_WAR_H
 #define __ASM_MIPS_MACH_IP27_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_IP27_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index ba4267e2d34d..32796925700a 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_IP28_WAR_H
 #define __ASM_MIPS_MACH_IP28_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_IP28_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index f404e22b7798..ea77545f5128 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -5,6 +5,4 @@
 #ifndef __ASM_MIPS_MACH_IP30_WAR_H
 #define __ASM_MIPS_MACH_IP30_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_IP30_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index 01475db746ec..3e81408795b4 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_IP32_WAR_H
 #define __ASM_MIPS_MACH_IP32_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_IP32_WAR_H */
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index 68b204ff59a6..0f5401c0e888 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 68b204ff59a6..0f5401c0e888 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_MIPS_WAR_H
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index 093a3894ae41..723c9de79ea1 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_RM_WAR_H
 #define __ASM_MIPS_MACH_RM_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_RM_WAR_H */
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 71eff5bc3f53..157eca1be328 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -8,18 +8,4 @@
 #ifndef __ASM_MIPS_MACH_SIBYTE_WAR_H
 #define __ASM_MIPS_MACH_SIBYTE_WAR_H
 
-#if defined(CONFIG_SB1_PASS_2_WORKAROUNDS)
-
-#ifndef __ASSEMBLY__
-extern int sb1250_m3_workaround_needed(void);
-#endif
-
-#define BCM1250_M3_WAR	sb1250_m3_workaround_needed()
-
-#else
-
-#define BCM1250_M3_WAR	0
-
-#endif
-
 #endif /* __ASM_MIPS_MACH_SIBYTE_WAR_H */
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 0dc2beb5bf5a..edf50e2bbb34 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -8,6 +8,4 @@
 #ifndef __ASM_MIPS_MACH_TX49XX_WAR_H
 #define __ASM_MIPS_MACH_TX49XX_WAR_H
 
-#define BCM1250_M3_WAR			0
-
 #endif /* __ASM_MIPS_MACH_TX49XX_WAR_H */
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 2ce5cd61a072..c20c04855089 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -72,18 +72,4 @@
 #define DADDI_WAR 0
 #endif
 
-/*
- * Workaround for the Sibyte M3 errata the text of which can be found at
- *
- *   http://sibyte.broadcom.com/hw/bcm1250/docs/pass2errata.txt
- *
- * This will enable the use of a special TLB refill handler which does a
- * consistency check on the information in c0_badvaddr and c0_entryhi and
- * will just return and take the exception again if the information was
- * found to be inconsistent.
- */
-#ifndef BCM1250_M3_WAR
-#error Check setting of BCM1250_M3_WAR for your platform
-#endif
-
 #endif /* _ASM_WAR_H */
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index e931eb06af57..a7521b8f7658 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -83,9 +83,13 @@ static inline int r4k_250MHZhwbug(void)
 	return 0;
 }
 
+extern int sb1250_m3_workaround_needed(void);
+
 static inline int __maybe_unused bcm1250_m3_war(void)
 {
-	return BCM1250_M3_WAR;
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
+		return sb1250_m3_workaround_needed();
+	return 0;
 }
 
 static inline int __maybe_unused r10000_llsc_war(void)
-- 
2.16.4

