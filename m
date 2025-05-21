Return-Path: <linux-mips+bounces-9061-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE4ABFC72
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 19:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095BB3B2612
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 17:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C20F289E0B;
	Wed, 21 May 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtwhFJZm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBB1A23AA;
	Wed, 21 May 2025 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747849327; cv=none; b=sUuzNTxsFShqcMS5vW4fNSM9iVlivu8exZ6Dd0dkWSzPGFM0t6dW17rjBgEFbpNyp3tECwZdEKIT5yjc9c26kYXBEy16fIz+skNCmq84CX+12Av1RK0vhxcU5WIP5Teb9Hg1KmJ6lfCnP7OdwL9ep0ZvsVIvJIZrTX8XdMhN1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747849327; c=relaxed/simple;
	bh=zILedU8aIBwOZV+2G1TrvBXeLPQ8UB3Yl8VhAYL566s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCMoGJCgt1wld+DGwiTbyAF6seF5fC9yldc3VlsZiM9UkrDUvmgVMHhYSvRB8AmhkfzzMGDTgkv1fifZ88TK4atSWa3Pc9QiLpBtXKC+eJhK/UE0Hb+LeZ8R1jMPJ848vOIyicAeJ1lZUWQR4yB2IW9w2Uj2TOmS/9D43aTk4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtwhFJZm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747849326; x=1779385326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zILedU8aIBwOZV+2G1TrvBXeLPQ8UB3Yl8VhAYL566s=;
  b=FtwhFJZmizfkTYmx5ga1Gax636pY2hH2eQf2yOQa3b7e8XcOGY5TXc0w
   x1bVb/lO0k8NZQkG/MBBPHWE5c9ACJiMSkBwYNAEfWXzEZEnKoFOI+0xu
   +7lLEAIZlyQLRbWTnz0BsYGW+FqpfxGF5F37en1L6wyJPTbmxXHz4Pq/2
   j5mkz2HfpjQ7XRbCg/CmrUvmWqRPieDv3TXu+oVbJg+UUPmJt9mNJ55CS
   UH0N/U5pbgfoyVrqyxNEjVGz9Mhqk7Ipk3dPm9kFFMhxcrC8RIwAihS4E
   bCDAOTZWm/6TtLWVlD+EGLrEzIoyif2i9/ITZKMUP7Oiz1J7tB4U/5t2q
   Q==;
X-CSE-ConnectionGUID: 6VN/NANlS8OYM833FP+csA==
X-CSE-MsgGUID: 79ZYpvL+Syy8i8fyd/ZSog==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61252110"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="61252110"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 10:42:04 -0700
X-CSE-ConnectionGUID: qNbmyK/7TbGW6UT8eUGwcg==
X-CSE-MsgGUID: ECERoRRvSN6yuz91U4AnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="171042032"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2025 10:41:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DC1DA368; Wed, 21 May 2025 20:41:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>
Subject: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/ code
Date: Wed, 21 May 2025 20:41:52 +0300
Message-ID: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the commit 3d86739c6343 ("floppy: always use the track buffer")
the CROSS_64K() is not used by the driver, remove the leftovers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/alpha/include/asm/floppy.h    | 19 -------------------
 arch/arm/include/asm/floppy.h      |  2 --
 arch/m68k/include/asm/floppy.h     |  4 ----
 arch/mips/include/asm/floppy.h     | 15 ---------------
 arch/parisc/include/asm/floppy.h   |  6 +-----
 arch/powerpc/include/asm/floppy.h  |  5 -----
 arch/sparc/include/asm/floppy_32.h |  3 ---
 arch/sparc/include/asm/floppy_64.h |  3 ---
 arch/x86/include/asm/floppy.h      |  5 +----
 9 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/arch/alpha/include/asm/floppy.h b/arch/alpha/include/asm/floppy.h
index 64b42d9591fc..5a6239e65097 100644
--- a/arch/alpha/include/asm/floppy.h
+++ b/arch/alpha/include/asm/floppy.h
@@ -90,25 +90,6 @@ static int FDC2 = -1;
 #define N_FDC 2
 #define N_DRIVE 8
 
-/*
- * Most Alphas have no problems with floppy DMA crossing 64k borders,
- * except for certain ones, like XL and RUFFIAN.
- *
- * However, the test is simple and fast, and this *is* floppy, after all,
- * so we do it for all platforms, just to make sure.
- *
- * This is advantageous in other circumstances as well, as in moving
- * about the PCI DMA windows and forcing the floppy to start doing
- * scatter-gather when it never had before, and there *is* a problem
- * on that platform... ;-}
- */
-
-static inline unsigned long CROSS_64KB(void *a, unsigned long s)
-{
-	unsigned long p = (unsigned long)a;
-	return ((p + s - 1) ^ p) & ~0xffffUL;
-}
-
 #define EXTRA_FLOPPY_PARAMS
 
 #endif /* __ASM_ALPHA_FLOPPY_H */
diff --git a/arch/arm/include/asm/floppy.h b/arch/arm/include/asm/floppy.h
index e1cb04ed5008..e579f77162e9 100644
--- a/arch/arm/include/asm/floppy.h
+++ b/arch/arm/include/asm/floppy.h
@@ -65,8 +65,6 @@ static unsigned char floppy_selects[4] = { 0x10, 0x21, 0x23, 0x33 };
 #define N_FDC 1
 #define N_DRIVE 4
 
-#define CROSS_64KB(a,s) (0)
-
 /*
  * This allows people to reverse the order of
  * fd0 and fd1, in case their hardware is
diff --git a/arch/m68k/include/asm/floppy.h b/arch/m68k/include/asm/floppy.h
index a4d0fea47c6b..dea98bbc0932 100644
--- a/arch/m68k/include/asm/floppy.h
+++ b/arch/m68k/include/asm/floppy.h
@@ -107,13 +107,9 @@ static void fd_free_irq(void)
 
 #define fd_free_dma()             /* nothing */
 
-/* No 64k boundary crossing problems on Q40 - no DMA at all */
-#define CROSS_64KB(a,s) (0)
-
 #define DMA_MODE_READ  0x44    /* i386 look-alike */
 #define DMA_MODE_WRITE 0x48
 
-
 static int m68k_floppy_init(void)
 {
   use_virtual_dma =1;
diff --git a/arch/mips/include/asm/floppy.h b/arch/mips/include/asm/floppy.h
index 021d09ae5670..44da2ff91f65 100644
--- a/arch/mips/include/asm/floppy.h
+++ b/arch/mips/include/asm/floppy.h
@@ -34,21 +34,6 @@ static inline void fd_cacheflush(char * addr, long size)
 #define N_FDC 1			/* do you *really* want a second controller? */
 #define N_DRIVE 8
 
-/*
- * The DMA channel used by the floppy controller cannot access data at
- * addresses >= 16MB
- *
- * Went back to the 1MB limit, as some people had problems with the floppy
- * driver otherwise. It doesn't matter much for performance anyway, as most
- * floppy accesses go through the track buffer.
- *
- * On MIPSes using vdma, this actually means that *all* transfers go thru
- * the * track buffer since 0x1000000 is always smaller than KSEG0/1.
- * Actually this needs to be a bit more complicated since the so much different
- * hardware available with MIPS CPUs ...
- */
-#define CROSS_64KB(a, s) ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64)
-
 #define EXTRA_FLOPPY_PARAMS
 
 #include <floppy.h>
diff --git a/arch/parisc/include/asm/floppy.h b/arch/parisc/include/asm/floppy.h
index b318a7df52f6..df20dbef3ada 100644
--- a/arch/parisc/include/asm/floppy.h
+++ b/arch/parisc/include/asm/floppy.h
@@ -22,13 +22,9 @@
 #define _CROSS_64KB(a,s,vdma) \
 (!(vdma) && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
 
-#define CROSS_64KB(a,s) _CROSS_64KB(a,s,use_virtual_dma & 1)
-
-
 #define SW fd_routine[use_virtual_dma&1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
 
-
 #define fd_inb(base, reg)		readb((base) + (reg))
 #define fd_outb(value, base, reg)	writeb(value, (base) + (reg))
 
@@ -206,7 +202,7 @@ static int vdma_dma_setup(char *addr, unsigned long size, int mode, int io)
 static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 {
 #ifdef FLOPPY_SANITY_CHECK
-	if (CROSS_64KB(addr, size)) {
+	if (_CROSS_64KB(addr, size, use_virtual_dma & 1)) {
 		printk("DMA crossing 64-K boundary %p-%p\n", addr, addr+size);
 		return -1;
 	}
diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..048c0c5cdf30 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -203,11 +203,6 @@ static int FDC2 = -1;
 #define N_FDC 2			/* Don't change this! */
 #define N_DRIVE 8
 
-/*
- * The PowerPC has no problems with floppy DMA crossing 64k borders.
- */
-#define CROSS_64KB(a,s)	(0)
-
 #define EXTRA_FLOPPY_PARAMS
 
 #endif /* __KERNEL__ */
diff --git a/arch/sparc/include/asm/floppy_32.h b/arch/sparc/include/asm/floppy_32.h
index 836f6575aa1d..7251d1fed7a4 100644
--- a/arch/sparc/include/asm/floppy_32.h
+++ b/arch/sparc/include/asm/floppy_32.h
@@ -96,9 +96,6 @@ static struct sun_floppy_ops sun_fdops;
 #define N_FDC    1
 #define N_DRIVE  8
 
-/* No 64k boundary crossing problems on the Sparc. */
-#define CROSS_64KB(a,s) (0)
-
 /* Routines unique to each controller type on a Sun. */
 static void sun_set_dor(unsigned char value, int fdc_82077)
 {
diff --git a/arch/sparc/include/asm/floppy_64.h b/arch/sparc/include/asm/floppy_64.h
index b0f633ce3518..135f9a49b6ba 100644
--- a/arch/sparc/include/asm/floppy_64.h
+++ b/arch/sparc/include/asm/floppy_64.h
@@ -95,9 +95,6 @@ static int sun_floppy_types[2] = { 0, 0 };
 #define N_FDC    1
 #define N_DRIVE  8
 
-/* No 64k boundary crossing problems on the Sparc. */
-#define CROSS_64KB(a,s) (0)
-
 static unsigned char sun_82077_fd_inb(unsigned long base, unsigned int reg)
 {
 	udelay(5);
diff --git a/arch/x86/include/asm/floppy.h b/arch/x86/include/asm/floppy.h
index 6ec3fc969ad5..e76cb74bbed2 100644
--- a/arch/x86/include/asm/floppy.h
+++ b/arch/x86/include/asm/floppy.h
@@ -24,9 +24,6 @@
 	(!(vdma) &&							\
 	 ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
 
-#define CROSS_64KB(a, s) _CROSS_64KB(a, s, use_virtual_dma & 1)
-
-
 #define SW fd_routine[use_virtual_dma & 1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
 
@@ -206,7 +203,7 @@ static int vdma_dma_setup(char *addr, unsigned long size, int mode, int io)
 static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 {
 #ifdef FLOPPY_SANITY_CHECK
-	if (CROSS_64KB(addr, size)) {
+	if (_CROSS_64KB(addr, size, use_virtual_dma & 1)) {
 		printk("DMA crossing 64-K boundary %p-%p\n", addr, addr+size);
 		return -1;
 	}
-- 
2.47.2


