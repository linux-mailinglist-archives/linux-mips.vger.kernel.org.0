Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8640314534C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 12:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAVLAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 06:00:07 -0500
Received: from fd.dlink.ru ([178.170.168.18]:55326 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgAVLAH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 06:00:07 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id D0FBF1B2180E; Wed, 22 Jan 2020 14:00:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru D0FBF1B2180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579690804; bh=uJavxx7yzMFtmmLm7i7FM8ZrD22U48lItBGZE7Kw13M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GRyS6YBRcl9cVBK2yebVTtkcYlHqv8ZZdr14/CdvocjqcitHrDsAQXjxnsW0/MptD
         RUMCiI51w7arKnPMNDZ1fYKN9nr4lwqo/+XVflsdI3Q6O3fidZ3Vjp9CkHk2O1NPaS
         gPpvxsjLuEwXuC/XuK0ZM+eg3lZiA8EinlWfBen4=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,URIBL_BLOCKED,
        USER_IN_WHITELIST autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id A3ED01B2176F;
        Wed, 22 Jan 2020 13:59:23 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru A3ED01B2176F
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id 5D2671B217F1;
        Wed, 22 Jan 2020 13:59:22 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 13:59:22 +0300 (MSK)
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mips-next 3/5] MIPS: make CPU_HAS_LOAD_STORE_LR opt-out
Date:   Wed, 22 Jan 2020 13:58:50 +0300
Message-Id: <20200122105852.8788-4-alobakin@dlink.ru>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122105852.8788-1-alobakin@dlink.ru>
References: <20200122105852.8788-1-alobakin@dlink.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPU_HAS_LOAD_STORE_LR was introduced in 932afdeec18b ("MIPS: Add Kconfig
variable for CPUs with unaligned load/store instructions") to make code
in kernel/unaligned.c and lib/mem{cpy,set}.S more intuitive and give a
possibility to easily add new CPUs without these instruction sets in
future.

Hovewer, this variant is not optimal for mainly two reasons:
* For now, we have 20+ CPUs with such instructions and only two (MIPS R6)
  without. It will obviously be more effective and straightforward to
  have an option for these two rather than for the rest.
* You can easily miss the fact that you need to select this option when
  adding a new CPU, while all processors lacking these sets are
  well-known, so the probability of missing something is way much lower.

We can address both points by turning CPU_HAS_LOAD_STORE_LR into opt-out
CPU_NO_LOAD_STORE_LR. This also makes MIPS root Kconfig more clear and
understandable.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 arch/mips/Kconfig            | 34 +++++++---------------------------
 arch/mips/kernel/unaligned.c | 36 ++++++++++++++++++------------------
 arch/mips/lib/memcpy.S       | 14 +++++++-------
 arch/mips/lib/memset.S       | 16 ++++++++--------
 4 files changed, 40 insertions(+), 60 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c5498146bd3b..8ff846ef2345 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1218,8 +1218,7 @@ config NO_IOPORT_MAP
 	def_bool n
 
 config GENERIC_CSUM
-	bool
-	default y if !CPU_HAS_LOAD_STORE_LR
+	def_bool CPU_NO_LOAD_STORE_LR
 
 config GENERIC_ISA_DMA
 	bool
@@ -1441,7 +1440,6 @@ config CPU_LOONGSON64
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 	select CPU_SUPPORTS_MSA
-	select CPU_HAS_LOAD_STORE_LR
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
 	select MIPS_ASID_BITS_VARIABLE
@@ -1537,7 +1535,6 @@ config CPU_MIPS32_R1
 	bool "MIPS32 Release 1"
 	depends on SYS_HAS_CPU_MIPS32_R1
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	help
@@ -1555,7 +1552,6 @@ config CPU_MIPS32_R2
 	bool "MIPS32 Release 2"
 	depends on SYS_HAS_CPU_MIPS32_R2
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
@@ -1571,6 +1567,7 @@ config CPU_MIPS32_R6
 	bool "MIPS32 Release 6"
 	depends on SYS_HAS_CPU_MIPS32_R6
 	select CPU_HAS_PREFETCH
+	select CPU_NO_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
@@ -1586,7 +1583,6 @@ config CPU_MIPS64_R1
 	bool "MIPS64 Release 1"
 	depends on SYS_HAS_CPU_MIPS64_R1
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1606,7 +1602,6 @@ config CPU_MIPS64_R2
 	bool "MIPS64 Release 2"
 	depends on SYS_HAS_CPU_MIPS64_R2
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1624,6 +1619,7 @@ config CPU_MIPS64_R6
 	bool "MIPS64 Release 6"
 	depends on SYS_HAS_CPU_MIPS64_R6
 	select CPU_HAS_PREFETCH
+	select CPU_NO_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1641,7 +1637,6 @@ config CPU_R3000
 	bool "R3000"
 	depends on SYS_HAS_CPU_R3000
 	select CPU_HAS_WB
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_R3K_TLB
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1657,7 +1652,6 @@ config CPU_TX39XX
 	bool "R39XX"
 	depends on SYS_HAS_CPU_TX39XX
 	select CPU_SUPPORTS_32BIT_KERNEL
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_R3K_TLB
 
 config CPU_VR41XX
@@ -1665,7 +1659,6 @@ config CPU_VR41XX
 	depends on SYS_HAS_CPU_VR41XX
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
-	select CPU_HAS_LOAD_STORE_LR
 	help
 	  The options selects support for the NEC VR4100 series of processors.
 	  Only choose this option if you have one of these processors as a
@@ -1678,7 +1671,6 @@ config CPU_R4X00
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
-	select CPU_HAS_LOAD_STORE_LR
 	help
 	  MIPS Technologies R4000-series processors other than 4300, including
 	  the R4000, R4400, R4600, and 4700.
@@ -1687,7 +1679,6 @@ config CPU_TX49XX
 	bool "R49XX"
 	depends on SYS_HAS_CPU_TX49XX
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
@@ -1698,7 +1689,6 @@ config CPU_R5000
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
-	select CPU_HAS_LOAD_STORE_LR
 	help
 	  MIPS Technologies R5000-series processors other than the Nevada.
 
@@ -1708,7 +1698,6 @@ config CPU_R5500
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
-	select CPU_HAS_LOAD_STORE_LR
 	help
 	  NEC VR5500 and VR5500A series processors implement 64-bit MIPS IV
 	  instruction set.
@@ -1719,7 +1708,6 @@ config CPU_NEVADA
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HUGEPAGES
-	select CPU_HAS_LOAD_STORE_LR
 	help
 	  QED / PMC-Sierra RM52xx-series ("Nevada") processors.
 
@@ -1727,7 +1715,6 @@ config CPU_R10000
 	bool "R10000"
 	depends on SYS_HAS_CPU_R10000
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1739,7 +1726,6 @@ config CPU_RM7000
 	bool "RM7000"
 	depends on SYS_HAS_CPU_RM7000
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1748,7 +1734,6 @@ config CPU_RM7000
 config CPU_SB1
 	bool "SB1"
 	depends on SYS_HAS_CPU_SB1
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1759,7 +1744,6 @@ config CPU_CAVIUM_OCTEON
 	bool "Cavium Octeon processor"
 	depends on SYS_HAS_CPU_CAVIUM_OCTEON
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select WEAK_ORDERING
 	select CPU_SUPPORTS_HIGHMEM
@@ -1789,7 +1773,6 @@ config CPU_BMIPS
 	select WEAK_ORDERING
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
 	help
@@ -1798,7 +1781,6 @@ config CPU_BMIPS
 config CPU_XLR
 	bool "Netlogic XLR SoC"
 	depends on SYS_HAS_CPU_XLR
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
@@ -1817,7 +1799,6 @@ config CPU_XLP
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_MIPSR2
 	select CPU_SUPPORTS_HUGEPAGES
 	select MIPS_ASID_BITS_VARIABLE
@@ -1923,14 +1904,12 @@ config CPU_LOONGSON2EF
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 	select ARCH_HAS_PHYS_TO_DMA
-	select CPU_HAS_LOAD_STORE_LR
 
 config CPU_LOONGSON32
 	bool
 	select CPU_MIPS32
 	select CPU_MIPSR2
 	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_CPUFREQ
@@ -2573,12 +2552,13 @@ config XKS01
 config CPU_HAS_RIXI
 	bool
 
-config CPU_HAS_LOAD_STORE_LR
+config CPU_NO_LOAD_STORE_LR
 	bool
 	help
-	  CPU has support for unaligned load and store instructions:
+	  CPU lacks support for unaligned load and store instructions:
 	  LWL, LWR, SWL, SWR (Load/store word left/right).
-	  LDL, LDR, SDL, SDR (Load/store doubleword left/right, for 64bit systems).
+	  LDL, LDR, SDL, SDR (Load/store doubleword left/right, for 64bit
+	  systems).
 
 #
 # Vectored interrupt mode is an R2 feature
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 92bd2b0f0548..ca6fc4762d97 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -131,7 +131,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 #define     _LoadW(addr, value, res, type)   \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -152,7 +152,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#else /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 /* For CPUs without lwl instruction */
 #define     _LoadW(addr, value, res, type) \
 do {                                                        \
@@ -187,7 +187,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 
 #define     _LoadHWU(addr, value, res, type) \
 do {                                                        \
@@ -213,7 +213,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 #define     _LoadWU(addr, value, res, type)  \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -256,7 +256,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#else /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 /* For CPUs without lwl and ldl instructions */
 #define	    _LoadWU(addr, value, res, type) \
 do {                                                        \
@@ -340,7 +340,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 
 
 #define     _StoreHW(addr, value, res, type) \
@@ -366,7 +366,7 @@ do {                                                        \
 			: "r" (value), "r" (addr), "i" (-EFAULT));\
 } while(0)
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 #define     _StoreW(addr, value, res, type)  \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -407,7 +407,7 @@ do {                                                        \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
 } while(0)
 
-#else /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 #define     _StoreW(addr, value, res, type)  \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -483,7 +483,7 @@ do {                                                        \
 		: "memory");                                \
 } while(0)
 
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 
 #else /* __BIG_ENDIAN */
 
@@ -509,7 +509,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 #define     _LoadW(addr, value, res, type)   \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -530,7 +530,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#else  /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 /* For CPUs without lwl instruction */
 #define     _LoadW(addr, value, res, type) \
 do {                                                        \
@@ -565,7 +565,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 
 
 #define     _LoadHWU(addr, value, res, type) \
@@ -592,7 +592,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 #define     _LoadWU(addr, value, res, type)  \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -635,7 +635,7 @@ do {                                                        \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
 
-#else /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 /* For CPUs without lwl and ldl instructions */
 #define	    _LoadWU(addr, value, res, type) \
 do {                                                        \
@@ -718,7 +718,7 @@ do {                                                        \
 			: "=&r" (value), "=r" (res)	    \
 			: "r" (addr), "i" (-EFAULT));       \
 } while(0)
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 
 #define     _StoreHW(addr, value, res, type) \
 do {                                                        \
@@ -743,7 +743,7 @@ do {                                                        \
 			: "r" (value), "r" (addr), "i" (-EFAULT));\
 } while(0)
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 #define     _StoreW(addr, value, res, type)  \
 do {                                                        \
 		__asm__ __volatile__ (                      \
@@ -784,7 +784,7 @@ do {                                                        \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
 } while(0)
 
-#else /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 /* For CPUs without swl and sdl instructions */
 #define     _StoreW(addr, value, res, type)  \
 do {                                                        \
@@ -861,7 +861,7 @@ do {                                                        \
 		: "memory");                                \
 } while(0)
 
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 #endif
 
 #define LoadHWU(addr, value, res)	_LoadHWU(addr, value, res, kernel)
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index cdd19d8561e8..f7994d936505 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -301,14 +301,14 @@
 	 and	t0, src, ADDRMASK
 	PREFS(	0, 2*32(src) )
 	PREFD(	1, 2*32(dst) )
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 	bnez	t1, .Ldst_unaligned\@
 	 nop
 	bnez	t0, .Lsrc_unaligned_dst_aligned\@
-#else
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 	or	t0, t0, t1
 	bnez	t0, .Lcopy_unaligned_bytes\@
-#endif
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 	/*
 	 * use delay slot for fall-through
 	 * src and dst are aligned; need to compute rem
@@ -389,7 +389,7 @@
 	bne	rem, len, 1b
 	.set	noreorder
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 	/*
 	 * src and dst are aligned, need to copy rem bytes (rem < NBYTES)
 	 * A loop would do only a byte at a time with possible branch
@@ -491,7 +491,7 @@
 	bne	len, rem, 1b
 	.set	noreorder
 
-#endif /* CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* !CONFIG_CPU_NO_LOAD_STORE_LR */
 .Lcopy_bytes_checklen\@:
 	beqz	len, .Ldone\@
 	 nop
@@ -520,7 +520,7 @@
 	jr	ra
 	 nop
 
-#ifndef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifdef CONFIG_CPU_NO_LOAD_STORE_LR
 .Lcopy_unaligned_bytes\@:
 1:
 	COPY_BYTE(0)
@@ -534,7 +534,7 @@
 	ADD	src, src, 8
 	b	1b
 	 ADD	dst, dst, 8
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 	.if __memcpy == 1
 	END(memcpy)
 	.set __memcpy, 0
diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index 418611ef13cf..d5449e8a3dfc 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -115,7 +115,7 @@
 #endif
 	.set		reorder
 
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 	R10KCBARRIER(0(ra))
 #ifdef __MIPSEB__
 	EX(LONG_S_L, a1, (a0), .Lfirst_fixup\@)	/* make word/dword aligned */
@@ -125,7 +125,7 @@
 	PTR_SUBU	a0, t0			/* long align ptr */
 	PTR_ADDU	a2, t0			/* correct size */
 
-#else /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 #define STORE_BYTE(N)				\
 	EX(sb, a1, N(a0), .Lbyte_fixup\@);	\
 	.set		noreorder;		\
@@ -150,7 +150,7 @@
 	ori		a0, STORMASK
 	xori		a0, STORMASK
 	PTR_ADDIU	a0, STORSIZE
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 1:	ori		t1, a2, 0x3f		/* # of full blocks */
 	xori		t1, 0x3f
 	andi		t0, a2, 0x40-STORSIZE
@@ -185,7 +185,7 @@
 
 	.set		noreorder
 	beqz		a2, 1f
-#ifdef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
 	 PTR_ADDU	a0, a2			/* What's left */
 	.set		reorder
 	R10KCBARRIER(0(ra))
@@ -194,7 +194,7 @@
 #else
 	EX(LONG_S_L, a1, -1(a0), .Llast_fixup\@)
 #endif
-#else
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
 	 PTR_SUBU	t0, $0, a2
 	.set		reorder
 	move		a2, zero		/* No remaining longs */
@@ -211,7 +211,7 @@
 	EX(sb, a1, 6(a0), .Lbyte_fixup\@)
 #endif
 0:
-#endif
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 1:	move		a2, zero
 	jr		ra
 
@@ -234,7 +234,7 @@
 	.hidden __memset
 	.endif
 
-#ifndef CONFIG_CPU_HAS_LOAD_STORE_LR
+#ifdef CONFIG_CPU_NO_LOAD_STORE_LR
 .Lbyte_fixup\@:
 	/*
 	 * unset_bytes = (#bytes - (#unaligned bytes)) - (-#unaligned bytes remaining + 1) + 1
@@ -243,7 +243,7 @@
 	PTR_SUBU	a2, t0
 	PTR_ADDIU	a2, 1
 	jr		ra
-#endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
 
 .Lfirst_fixup\@:
 	/* unset_bytes already in a2 */
-- 
2.25.0

