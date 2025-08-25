Return-Path: <linux-mips+bounces-10585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A0BB3479A
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 18:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56417486576
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 16:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8AC3019C3;
	Mon, 25 Aug 2025 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2kev6gA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0146301461;
	Mon, 25 Aug 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139761; cv=none; b=BqHL0Uf7ALCm0k8JViYfzHRaIsdnKAKuKODYeHtMkNgWiMrPrkvkXbLHdhQ2YXs87IQM0U9q5YNhYM3udIfib5b1D3Tv/l5ZjG0x+/FfmCNjVtlkLsxHFD2AA0WBUfbs9lTRSfWZPegy0aeY9PjuDqTLiNnIoXgPQH/s17iFgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139761; c=relaxed/simple;
	bh=PS/OiIArs4RSteWG5A2HsYSRM0QB2lTSwsrYC9cKG4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTOzDyAgpOFshMygZmxL+4z04w0HGyLmxxyM8QwXsI+9FhdfgkDW6VqB8YQgL68WOJDEtPc6Or8D97IxG5kEg65CFb+oJXtS7TRw3h1+k8+8QKgTYUiEBehkPFodExxLmYIJr27GBfhzq408WiZvHL44sgdO0RD9ez2ePcJBbU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2kev6gA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139760; x=1787675760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PS/OiIArs4RSteWG5A2HsYSRM0QB2lTSwsrYC9cKG4M=;
  b=g2kev6gAEHNbQoJTdQTGMm+6bSwpxoVIO2E+SGIgKtXK0sdM25zSfmWh
   KmxM7nrOMRiWgFNgEqb2HXxmWYUswvLnIyWrr5HQ+WI/hVYof1OXUMiqM
   px28Gba/EWaVxSMnGI67DulqmQEvcmL8WWPQw79nsduU0Sx42ufu7Httn
   53yqEwiahCqkhfroHIynSBCYNALU9wgdM5tv9UHAuW6yUDSDoV3rvN9Gh
   S9TdapikX++9vIdBBcFP6To6LMTSUiaJx2azvVrwp6UHxkfUUaNI1Kv+3
   ca5ZTgYUg5rQsVxDJtWp6CyAovdN95TyEpW4iAWb3ptt6cCFKl8J4ApFW
   Q==;
X-CSE-ConnectionGUID: izZtqX+kToa9y+cqaaxSdw==
X-CSE-MsgGUID: UHkXIsxlQXO2E6GblNAaag==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58288851"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="58288851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:56 -0700
X-CSE-ConnectionGUID: nO/0WE7KShWApODQpA5OPg==
X-CSE-MsgGUID: LHnzXcOgSQiFreIo9l4a7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="168588222"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D944395; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
Date: Mon, 25 Aug 2025 18:32:55 +0200
Message-ID: <20250825163545.39303-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the commit 3d86739c6343 ("floppy: always use the track buffer")
the CROSS_64KB() is not used by the driver, remove the leftovers.

Acked-by: Helge Deller <deller@gmx.de> #parisc
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
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
index 34abf8bea2cc..f4dc657638b3 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -206,11 +206,6 @@ static int FDC2 = -1;
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
2.50.1


