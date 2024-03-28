Return-Path: <linux-mips+bounces-2111-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 766398738BC
	for <lists+linux-mips@lfdr.de>; Wed,  6 Mar 2024 15:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 043251F27B0F
	for <lists+linux-mips@lfdr.de>; Wed,  6 Mar 2024 14:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7362132C16;
	Wed,  6 Mar 2024 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhR8u+F9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D6132C0C;
	Wed,  6 Mar 2024 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709734536; cv=none; b=scMd4a4p0j/C7VnLearIynIDQmfauwuCZrvEdNCfhpEdhqsRFWed7uXY0PRU693WlV1cfDIllDHXR6QACCYObgA3KocB0szh1oBTkx7jD+swjsTlR1/xRmBVxqzb70aMW/sJpVDgatR59nNgc4Ib/Imq3I3b7n9vl4iHNkudOEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709734536; c=relaxed/simple;
	bh=5yRjHZPSiRMt+qPwFJbIcOxytchYG541o8XRiohSVwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XJNvGZef3brcDyiyZpS2nDVGOMVQyyulJcBYeUz6aNMnsvxOwBQFb/1VZYW1/8lxyo9PCUeZa17ovLROjjZyc2UeJc3E3NMVjYpzxEJXuSy8TL/abUW43M9clbBgQBqAu8HIG3sVEVo1vfwtmQQBWTKJlUZ6hhF+12CmTNfkPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhR8u+F9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21296C433A6;
	Wed,  6 Mar 2024 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709734536;
	bh=5yRjHZPSiRMt+qPwFJbIcOxytchYG541o8XRiohSVwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MhR8u+F9cPGt/cabDyues/0eLxDpgk2wbTU6NdJVh9X7OwuxEzjelzAX2szd+fMhR
	 yHFUtYXMJkOkDzfYJCQ3vdLjz+7hYYQG/eZx3x//isHDfKTnlVmKyorEJu3kRWy5yq
	 fUG6of4PVYZ+xyjNLfsXMgGi+QCTaGH1vhFVN/lBwINVBo3/XSZ5BjiUj8pTzl+cdX
	 ddH/srgMmOmOrP5mP9uGHOC6GZS0jwX+TphFQCZS7Oya2B+byhz5ZF01otV6//vlYd
	 P9o9+JTVswagqpms4Ju25iCWhXNoPP0JPa1uBfege6qjA6xqDQQMaluEC60sh0SnGN
	 fbxMMZCiB16aA==
From: Arnd Bergmann <arnd@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH v2 2/3] arch: simplify architecture specific page size configuration
Date: Wed,  6 Mar 2024 15:14:52 +0100
Message-Id: <20240306141453.3900574-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306141453.3900574-1-arnd@kernel.org>
References: <20240306141453.3900574-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

arc, arm64, parisc and powerpc all have their own Kconfig symbols
in place of the common CONFIG_PAGE_SIZE_4KB symbols. Change these
so the common symbols are the ones that are actually used, while
leaving the arhcitecture specific ones as the user visible
place for configuring it, to avoid breaking user configs.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu> (powerpc32)
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Helge Deller <deller@gmx.de> # parisc
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
No changes from v1

 arch/arc/Kconfig                  |  3 +++
 arch/arc/include/uapi/asm/page.h  |  6 ++----
 arch/arm64/Kconfig                | 29 +++++++++++++----------------
 arch/arm64/include/asm/page-def.h |  2 +-
 arch/parisc/Kconfig               |  3 +++
 arch/parisc/include/asm/page.h    | 10 +---------
 arch/powerpc/Kconfig              | 31 ++++++-------------------------
 arch/powerpc/include/asm/page.h   |  2 +-
 scripts/gdb/linux/constants.py.in |  2 +-
 scripts/gdb/linux/mm.py           |  2 +-
 10 files changed, 32 insertions(+), 58 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 1b0483c51cc1..4092bec198be 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -284,14 +284,17 @@ choice
 
 config ARC_PAGE_SIZE_8K
 	bool "8KB"
+	select HAVE_PAGE_SIZE_8KB
 	help
 	  Choose between 8k vs 16k
 
 config ARC_PAGE_SIZE_16K
+	select HAVE_PAGE_SIZE_16KB
 	bool "16KB"
 
 config ARC_PAGE_SIZE_4K
 	bool "4KB"
+	select HAVE_PAGE_SIZE_4KB
 	depends on ARC_MMU_V3 || ARC_MMU_V4
 
 endchoice
diff --git a/arch/arc/include/uapi/asm/page.h b/arch/arc/include/uapi/asm/page.h
index 2a4ad619abfb..7fd9e741b527 100644
--- a/arch/arc/include/uapi/asm/page.h
+++ b/arch/arc/include/uapi/asm/page.h
@@ -13,10 +13,8 @@
 #include <linux/const.h>
 
 /* PAGE_SHIFT determines the page size */
-#if defined(CONFIG_ARC_PAGE_SIZE_16K)
-#define PAGE_SHIFT 14
-#elif defined(CONFIG_ARC_PAGE_SIZE_4K)
-#define PAGE_SHIFT 12
+#ifdef __KERNEL__
+#define PAGE_SHIFT CONFIG_PAGE_SHIFT
 #else
 /*
  * Default 8k
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index aa7c1d435139..29290b8cb36d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -277,27 +277,21 @@ config 64BIT
 config MMU
 	def_bool y
 
-config ARM64_PAGE_SHIFT
-	int
-	default 16 if ARM64_64K_PAGES
-	default 14 if ARM64_16K_PAGES
-	default 12
-
 config ARM64_CONT_PTE_SHIFT
 	int
-	default 5 if ARM64_64K_PAGES
-	default 7 if ARM64_16K_PAGES
+	default 5 if PAGE_SIZE_64KB
+	default 7 if PAGE_SIZE_16KB
 	default 4
 
 config ARM64_CONT_PMD_SHIFT
 	int
-	default 5 if ARM64_64K_PAGES
-	default 5 if ARM64_16K_PAGES
+	default 5 if PAGE_SIZE_64KB
+	default 5 if PAGE_SIZE_16KB
 	default 4
 
 config ARCH_MMAP_RND_BITS_MIN
-	default 14 if ARM64_64K_PAGES
-	default 16 if ARM64_16K_PAGES
+	default 14 if PAGE_SIZE_64KB
+	default 16 if PAGE_SIZE_16KB
 	default 18
 
 # max bits determined by the following formula:
@@ -1259,11 +1253,13 @@ choice
 
 config ARM64_4K_PAGES
 	bool "4KB"
+	select HAVE_PAGE_SIZE_4KB
 	help
 	  This feature enables 4KB pages support.
 
 config ARM64_16K_PAGES
 	bool "16KB"
+	select HAVE_PAGE_SIZE_16KB
 	help
 	  The system will use 16KB pages support. AArch32 emulation
 	  requires applications compiled with 16K (or a multiple of 16K)
@@ -1271,6 +1267,7 @@ config ARM64_16K_PAGES
 
 config ARM64_64K_PAGES
 	bool "64KB"
+	select HAVE_PAGE_SIZE_64KB
 	help
 	  This feature enables 64KB pages support (4KB by default)
 	  allowing only two levels of page tables and faster TLB
@@ -1291,19 +1288,19 @@ choice
 
 config ARM64_VA_BITS_36
 	bool "36-bit" if EXPERT
-	depends on ARM64_16K_PAGES
+	depends on PAGE_SIZE_16KB
 
 config ARM64_VA_BITS_39
 	bool "39-bit"
-	depends on ARM64_4K_PAGES
+	depends on PAGE_SIZE_4KB
 
 config ARM64_VA_BITS_42
 	bool "42-bit"
-	depends on ARM64_64K_PAGES
+	depends on PAGE_SIZE_64KB
 
 config ARM64_VA_BITS_47
 	bool "47-bit"
-	depends on ARM64_16K_PAGES
+	depends on PAGE_SIZE_16KB
 
 config ARM64_VA_BITS_48
 	bool "48-bit"
diff --git a/arch/arm64/include/asm/page-def.h b/arch/arm64/include/asm/page-def.h
index 2403f7b4cdbf..792e9fe881dc 100644
--- a/arch/arm64/include/asm/page-def.h
+++ b/arch/arm64/include/asm/page-def.h
@@ -11,7 +11,7 @@
 #include <linux/const.h>
 
 /* PAGE_SHIFT determines the page size */
-#define PAGE_SHIFT		CONFIG_ARM64_PAGE_SHIFT
+#define PAGE_SHIFT		CONFIG_PAGE_SHIFT
 #define PAGE_SIZE		(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK		(~(PAGE_SIZE-1))
 
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 5c845e8d59d9..b180e684fa0d 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -273,6 +273,7 @@ choice
 
 config PARISC_PAGE_SIZE_4KB
 	bool "4KB"
+	select HAVE_PAGE_SIZE_4KB
 	help
 	  This lets you select the page size of the kernel.  For best
 	  performance, a page size of 16KB is recommended.  For best
@@ -288,10 +289,12 @@ config PARISC_PAGE_SIZE_4KB
 
 config PARISC_PAGE_SIZE_16KB
 	bool "16KB"
+	select HAVE_PAGE_SIZE_16KB
 	depends on PA8X00 && BROKEN && !KFENCE
 
 config PARISC_PAGE_SIZE_64KB
 	bool "64KB"
+	select HAVE_PAGE_SIZE_64KB
 	depends on PA8X00 && BROKEN && !KFENCE
 
 endchoice
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 667e703c0e8f..ad4e15d12ed1 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -4,15 +4,7 @@
 
 #include <linux/const.h>
 
-#if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
-# define PAGE_SHIFT	12
-#elif defined(CONFIG_PARISC_PAGE_SIZE_16KB)
-# define PAGE_SHIFT	14
-#elif defined(CONFIG_PARISC_PAGE_SIZE_64KB)
-# define PAGE_SHIFT	16
-#else
-# error "unknown default kernel page size"
-#endif
+#define PAGE_SHIFT	CONFIG_PAGE_SHIFT
 #define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE-1))
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b9fc064d38d2..8fad4e5d7ad5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -212,7 +212,7 @@ config PPC
 	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
-	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
+	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
 	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
@@ -809,19 +809,23 @@ choice
 config PPC_4K_PAGES
 	bool "4k page size"
 	select HAVE_ARCH_SOFT_DIRTY if PPC_BOOK3S_64
+	select HAVE_PAGE_SIZE_4KB
 
 config PPC_16K_PAGES
 	bool "16k page size"
 	depends on 44x || PPC_8xx
+	select HAVE_PAGE_SIZE_16KB
 
 config PPC_64K_PAGES
 	bool "64k page size"
 	depends on 44x || PPC_BOOK3S_64
 	select HAVE_ARCH_SOFT_DIRTY if PPC_BOOK3S_64
+	select HAVE_PAGE_SIZE_64KB
 
 config PPC_256K_PAGES
 	bool "256k page size (Requires non-standard binutils settings)"
 	depends on 44x && !PPC_47x
+	select HAVE_PAGE_SIZE_256KB
 	help
 	  Make the page size 256k.
 
@@ -832,29 +836,6 @@ config PPC_256K_PAGES
 
 endchoice
 
-config PAGE_SIZE_4KB
-	def_bool y
-	depends on PPC_4K_PAGES
-
-config PAGE_SIZE_16KB
-	def_bool y
-	depends on PPC_16K_PAGES
-
-config PAGE_SIZE_64KB
-	def_bool y
-	depends on PPC_64K_PAGES
-
-config PAGE_SIZE_256KB
-	def_bool y
-	depends on PPC_256K_PAGES
-
-config PPC_PAGE_SHIFT
-	int
-	default 18 if PPC_256K_PAGES
-	default 16 if PPC_64K_PAGES
-	default 14 if PPC_16K_PAGES
-	default 12
-
 config THREAD_SHIFT
 	int "Thread shift" if EXPERT
 	range 13 15
@@ -891,7 +872,7 @@ config DATA_SHIFT
 	default 23 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx && PIN_TLB_DATA
 	default 19 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
 	default 24 if STRICT_KERNEL_RWX && PPC_85xx
-	default PPC_PAGE_SHIFT
+	default PAGE_SHIFT
 	help
 	  On Book3S 32 (603+), DBATs are used to map kernel text and rodata RO.
 	  Smaller is the alignment, greater is the number of necessary DBATs.
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e5fcc79b5bfb..e411e5a70ea3 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -21,7 +21,7 @@
  * page size. When using 64K pages however, whether we are really supporting
  * 64K pages in HW or not is irrelevant to those definitions.
  */
-#define PAGE_SHIFT		CONFIG_PPC_PAGE_SHIFT
+#define PAGE_SHIFT		CONFIG_PAGE_SHIFT
 #define PAGE_SIZE		(ASM_CONST(1) << PAGE_SHIFT)
 
 #ifndef __ASSEMBLY__
diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index e810e0c27ff1..10fadc238719 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -139,7 +139,7 @@ LX_CONFIG(CONFIG_ARM64_64K_PAGES)
 if IS_BUILTIN(CONFIG_ARM64):
     LX_VALUE(CONFIG_ARM64_PA_BITS)
     LX_VALUE(CONFIG_ARM64_VA_BITS)
-    LX_VALUE(CONFIG_ARM64_PAGE_SHIFT)
+    LX_VALUE(CONFIG_PAGE_SHIFT)
     LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
 LX_CONFIG(CONFIG_SPARSEMEM)
 LX_CONFIG(CONFIG_SPARSEMEM_EXTREME)
diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
index ad5641dcb068..515730fd4c9d 100644
--- a/scripts/gdb/linux/mm.py
+++ b/scripts/gdb/linux/mm.py
@@ -41,7 +41,7 @@ class aarch64_page_ops():
             self.SECTION_SIZE_BITS = 27
         self.MAX_PHYSMEM_BITS = constants.LX_CONFIG_ARM64_VA_BITS
 
-        self.PAGE_SHIFT = constants.LX_CONFIG_ARM64_PAGE_SHIFT
+        self.PAGE_SHIFT = constants.LX_CONFIG_PAGE_SHIFT
         self.PAGE_SIZE = 1 << self.PAGE_SHIFT
         self.PAGE_MASK = (~(self.PAGE_SIZE - 1)) & ((1 << 64) - 1)
 
-- 
2.39.2


