Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC40250665
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 19:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgHXRcc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 13:32:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:50592 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbgHXQd0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F3377AF86;
        Mon, 24 Aug 2020 16:33:54 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] MIPS: Convert R10000_LLSC_WAR info a config option
Date:   Mon, 24 Aug 2020 18:32:49 +0200
Message-Id: <20200824163257.44533-8-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use a new config option to enabel R1000_LLSC workaound and remove
define from different war.h files.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig                              | 8 ++++++++
 arch/mips/include/asm/futex.h                  | 4 ++--
 arch/mips/include/asm/llsc.h                   | 2 +-
 arch/mips/include/asm/local.h                  | 4 ++--
 arch/mips/include/asm/mach-cavium-octeon/war.h | 1 -
 arch/mips/include/asm/mach-generic/war.h       | 1 -
 arch/mips/include/asm/mach-ip22/war.h          | 1 -
 arch/mips/include/asm/mach-ip27/war.h          | 1 -
 arch/mips/include/asm/mach-ip28/war.h          | 1 -
 arch/mips/include/asm/mach-ip30/war.h          | 5 -----
 arch/mips/include/asm/mach-ip32/war.h          | 1 -
 arch/mips/include/asm/mach-malta/war.h         | 1 -
 arch/mips/include/asm/mach-rc32434/war.h       | 1 -
 arch/mips/include/asm/mach-rm/war.h            | 1 -
 arch/mips/include/asm/mach-sibyte/war.h        | 1 -
 arch/mips/include/asm/mach-tx49xx/war.h        | 1 -
 arch/mips/include/asm/war.h                    | 8 --------
 arch/mips/kernel/syscall.c                     | 2 +-
 arch/mips/mm/tlbex.c                           | 2 +-
 19 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c32f6160f854..acb790b556a8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -669,6 +669,7 @@ config SGI_IP27
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_NUMA
 	select SYS_SUPPORTS_SMP
+	select WAR_R10000_LLSC
 	select MIPS_L1_CACHE_SHIFT_7
 	select NUMA
 	help
@@ -704,6 +705,7 @@ config SGI_IP28
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
+	select WAR_R10000_LLSC
 	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  This is the SGI Indigo2 with R10000 processor.  To compile a Linux
@@ -730,6 +732,7 @@ config SGI_IP30
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_SMP
+	select WAR_R10000_LLSC
 	select MIPS_L1_CACHE_SHIFT_7
 	select ARC_MEMORY
 	help
@@ -2675,6 +2678,11 @@ config WAR_TX49XX_ICACHE_INDEX_INV
 config WAR_ICACHE_REFILLS
 	bool
 
+# On the R10000 up to version 2.6 (not sure about 2.7) there is a bug that
+# may cause ll / sc and lld / scd sequences to execute non-atomically.
+config WAR_R10000_LLSC
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/futex.h b/arch/mips/include/asm/futex.h
index 2bf8f6014579..d85248404c52 100644
--- a/arch/mips/include/asm/futex.h
+++ b/arch/mips/include/asm/futex.h
@@ -21,7 +21,7 @@
 
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
 {									\
-	if (cpu_has_llsc && R10000_LLSC_WAR) {				\
+	if (cpu_has_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {	\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
@@ -133,7 +133,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
-	if (cpu_has_llsc && R10000_LLSC_WAR) {
+	if (cpu_has_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {
 		__asm__ __volatile__(
 		"# futex_atomic_cmpxchg_inatomic			\n"
 		"	.set	push					\n"
diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
index c49738bc3bda..ec09fe5d6d6c 100644
--- a/arch/mips/include/asm/llsc.h
+++ b/arch/mips/include/asm/llsc.h
@@ -28,7 +28,7 @@
  * works around a bug present in R10000 CPUs prior to revision 3.0 that could
  * cause ll-sc sequences to execute non-atomically.
  */
-#if R10000_LLSC_WAR
+#ifdef CONFIG_WAR_R10000_LLSC
 # define __SC_BEQZ "beqzl	"
 #elif MIPS_ISA_REV >= 6
 # define __SC_BEQZ "beqzc	"
diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index fef0fda8f82f..ecda7295ddcd 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -31,7 +31,7 @@ static __inline__ long local_add_return(long i, local_t * l)
 {
 	unsigned long result;
 
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
+	if (kernel_uses_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {
 		unsigned long temp;
 
 		__asm__ __volatile__(
@@ -80,7 +80,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
 {
 	unsigned long result;
 
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
+	if (kernel_uses_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {
 		unsigned long temp;
 
 		__asm__ __volatile__(
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 1061917152c6..52be3785e3e2 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -11,7 +11,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #define CAVIUM_OCTEON_DCACHE_PREFETCH_WAR	\
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 966f40aedf16..2229c8377288 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MACH_GENERIC_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index 99f6531e5b9b..f10efe589f93 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP22_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index d8dfa7258bea..0a07cf6731c0 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP27_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index f252df761ec8..9fdc6425c22c 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			1
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP28_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index 58ff9ca345b7..8a8ec5578083 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -7,11 +7,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#ifdef CONFIG_CPU_R10000
-#define R10000_LLSC_WAR			1
-#else
-#define R10000_LLSC_WAR			0
-#endif
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP30_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index ca3efe457ae0..9e8c0c2a4c26 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP32_WAR_H */
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index b7827eb09375..76f7de21b7dd 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index b7827eb09375..76f7de21b7dd 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index fe04d059dd0c..dcb80b558321 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_RM_WAR_H */
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index 7c376f6eee9b..0cf25eea846f 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -24,7 +24,6 @@ extern int sb1250_m3_workaround_needed(void);
 
 #endif
 
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_SIBYTE_WAR_H */
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 5768889c20a7..8e572d7d2b6e 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -10,7 +10,6 @@
 
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
-#define R10000_LLSC_WAR			0
 #define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_TX49XX_WAR_H */
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index a0942821d67d..d405ecb78cbd 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -93,14 +93,6 @@
 #error Check setting of SIBYTE_1956_WAR for your platform
 #endif
 
-/*
- * On the R10000 up to version 2.6 (not sure about 2.7) there is a bug that
- * may cause ll / sc and lld / scd sequences to execute non-atomically.
- */
-#ifndef R10000_LLSC_WAR
-#error Check setting of R10000_LLSC_WAR for your platform
-#endif
-
 /*
  * 34K core erratum: "Problems Executing the TLBR Instruction"
  */
diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index c333e5788664..2afa3eef486a 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -106,7 +106,7 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 	if (unlikely(!access_ok((const void __user *)addr, 4)))
 		return -EINVAL;
 
-	if (cpu_has_llsc && R10000_LLSC_WAR) {
+	if (cpu_has_llsc && IS_ENABLED(CONFIG_WAR_R10000_LLSC)) {
 		__asm__ __volatile__ (
 		"	.set	push					\n"
 		"	.set	arch=r4000				\n"
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 14f8ba93367f..e931eb06af57 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -90,7 +90,7 @@ static inline int __maybe_unused bcm1250_m3_war(void)
 
 static inline int __maybe_unused r10000_llsc_war(void)
 {
-	return R10000_LLSC_WAR;
+	return IS_ENABLED(CONFIG_WAR_R10000_LLSC);
 }
 
 static int use_bbit_insns(void)
-- 
2.16.4

