Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B807317A03F
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 07:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgCEGuw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 01:50:52 -0500
Received: from foss.arm.com ([217.140.110.172]:43824 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgCEGuw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Mar 2020 01:50:52 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F9941FB;
        Wed,  4 Mar 2020 22:50:51 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.88])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5EE33F534;
        Wed,  4 Mar 2020 22:54:31 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     hughd@google.com, vbabka@suse.cz,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Salter <msalter@redhat.com>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Brian Cain <bcain@codeaurora.org>,
        Tony Luck <tony.luck@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Jonas Bonn <jonas@southpole.se>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jeff Dike <jdike@addtoit.com>, Chris Zankel <chris@zankel.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: [PATCH 1/2] mm/vma: Define a default value for VM_DATA_DEFAULT_FLAGS
Date:   Thu,  5 Mar 2020 12:20:13 +0530
Message-Id: <1583391014-8170-2-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583391014-8170-1-git-send-email-anshuman.khandual@arm.com>
References: <1583391014-8170-1-git-send-email-anshuman.khandual@arm.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are many platforms with exact same value for VM_DATA_DEFAULT_FLAGS
This creates a default value for VM_DATA_DEFAULT_FLAGS in line with the
existing VM_STACK_DEFAULT_FLAGS. While here, also define some more macros
with standard VMA access flag combinations that are used frequently across
many platforms. Apart from simplification, this reduces code duplication
as well.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Salter <msalter@redhat.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Nick Hu <nickhu@andestech.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Rich Felker <dalias@libc.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-c6x-dev@linux-c6x.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: nios2-dev@lists.rocketboards.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 arch/alpha/include/asm/page.h      |  3 ---
 arch/arc/include/asm/page.h        |  2 +-
 arch/arm/include/asm/page.h        |  4 +---
 arch/arm64/include/asm/page.h      |  4 +---
 arch/c6x/include/asm/page.h        |  5 +----
 arch/csky/include/asm/page.h       |  3 ---
 arch/h8300/include/asm/page.h      |  2 --
 arch/hexagon/include/asm/page.h    |  3 +--
 arch/ia64/include/asm/page.h       |  5 +----
 arch/m68k/include/asm/page.h       |  3 ---
 arch/microblaze/include/asm/page.h |  2 --
 arch/mips/include/asm/page.h       |  5 +----
 arch/nds32/include/asm/page.h      |  3 ---
 arch/nios2/include/asm/page.h      |  3 +--
 arch/openrisc/include/asm/page.h   |  5 -----
 arch/parisc/include/asm/page.h     |  3 ---
 arch/powerpc/include/asm/page.h    |  9 ++-------
 arch/powerpc/include/asm/page_64.h |  7 ++-----
 arch/riscv/include/asm/page.h      |  3 +--
 arch/s390/include/asm/page.h       |  3 +--
 arch/sh/include/asm/page.h         |  3 ---
 arch/sparc/include/asm/page_32.h   |  3 ---
 arch/sparc/include/asm/page_64.h   |  3 ---
 arch/unicore32/include/asm/page.h  |  3 ---
 arch/x86/include/asm/page_types.h  |  4 +---
 arch/x86/um/asm/vm-flags.h         | 10 ++--------
 arch/xtensa/include/asm/page.h     |  3 ---
 include/linux/mm.h                 | 14 ++++++++++++++
 28 files changed, 31 insertions(+), 89 deletions(-)

diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index f3fb2848470a..e241bd88880f 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -90,9 +90,6 @@ typedef struct page *pgtable_t;
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 #endif /* CONFIG_DISCONTIGMEM */
 
-#define VM_DATA_DEFAULT_FLAGS		(VM_READ | VM_WRITE | VM_EXEC | \
-					 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 0a32e8cfd074..b0dfed0f12be 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -102,7 +102,7 @@ typedef pte_t * pgtable_t;
 #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
 
 /* Default Permissions for stack/heaps pages (Non Executable) */
-#define VM_DATA_DEFAULT_FLAGS   (VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
 
 #define WANT_PAGE_VIRTUAL   1
 
diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
index c2b75cba26df..11b058a72a5b 100644
--- a/arch/arm/include/asm/page.h
+++ b/arch/arm/include/asm/page.h
@@ -161,9 +161,7 @@ extern int pfn_valid(unsigned long);
 
 #endif /* !__ASSEMBLY__ */
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
-	 VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #include <asm-generic/getorder.h>
 
diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index d39ddb258a04..cb4e1e6ca385 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -32,9 +32,7 @@ extern int pfn_valid(unsigned long);
 
 #endif /* !__ASSEMBLY__ */
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
-	 VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #include <asm-generic/getorder.h>
 
diff --git a/arch/c6x/include/asm/page.h b/arch/c6x/include/asm/page.h
index 70db1e7632bc..40079899084d 100644
--- a/arch/c6x/include/asm/page.h
+++ b/arch/c6x/include/asm/page.h
@@ -2,10 +2,7 @@
 #ifndef _ASM_C6X_PAGE_H
 #define _ASM_C6X_PAGE_H
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(VM_READ | VM_WRITE | \
-	((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
-		 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #include <asm-generic/page.h>
 
diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
index 9738eacefdc7..9b98bf31d57c 100644
--- a/arch/csky/include/asm/page.h
+++ b/arch/csky/include/asm/page.h
@@ -85,9 +85,6 @@ extern unsigned long va_pa_offset;
 				 PHYS_OFFSET_OFFSET)
 #define virt_to_page(x)	(mem_map + MAP_NR(x))
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #define pfn_to_kaddr(x)	__va(PFN_PHYS(x))
 
 #include <asm-generic/memory_model.h>
diff --git a/arch/h8300/include/asm/page.h b/arch/h8300/include/asm/page.h
index 8da5124ad344..53e037544239 100644
--- a/arch/h8300/include/asm/page.h
+++ b/arch/h8300/include/asm/page.h
@@ -6,8 +6,6 @@
 #include <linux/types.h>
 
 #define MAP_NR(addr) (((uintptr_t)(addr)-PAGE_OFFSET) >> PAGE_SHIFT)
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
 #ifndef __ASSEMBLY__
 extern unsigned long rom_length;
diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
index ee31f36f48f3..7cbf719c578e 100644
--- a/arch/hexagon/include/asm/page.h
+++ b/arch/hexagon/include/asm/page.h
@@ -93,8 +93,7 @@ struct page;
 #define virt_to_page(kaddr) pfn_to_page(PFN_DOWN(__pa(kaddr)))
 
 /* Default vm area behavior is non-executable.  */
-#define VM_DATA_DEFAULT_FLAGS (VM_READ | VM_WRITE | \
-				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
 
 #define pfn_valid(pfn) ((pfn) < max_mapnr)
 #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
diff --git a/arch/ia64/include/asm/page.h b/arch/ia64/include/asm/page.h
index 5798bd2b462c..b69a5499d75b 100644
--- a/arch/ia64/include/asm/page.h
+++ b/arch/ia64/include/asm/page.h
@@ -218,10 +218,7 @@ get_order (unsigned long size)
 
 #define PAGE_OFFSET			RGN_BASE(RGN_KERNEL)
 
-#define VM_DATA_DEFAULT_FLAGS		(VM_READ | VM_WRITE |					\
-					 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |		\
-					 (((current->personality & READ_IMPLIES_EXEC) != 0)	\
-					  ? VM_EXEC : 0))
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #define GATE_ADDR		RGN_BASE(RGN_GATE)
 
diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index 05e1e1e77a9a..9d2ef0a51720 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -55,9 +55,6 @@ extern unsigned long _ramend;
 #define __phys_to_pfn(paddr)	((unsigned long)((paddr) >> PAGE_SHIFT))
 #define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/getorder.h>
 
 #endif /* _M68K_PAGE_H */
diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
index f4b44b24b02e..43bd560b7b67 100644
--- a/arch/microblaze/include/asm/page.h
+++ b/arch/microblaze/include/asm/page.h
@@ -197,8 +197,6 @@ extern int page_is_ram(unsigned long pfn);
 
 #ifdef CONFIG_MMU
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 #endif /* CONFIG_MMU */
 
 #endif /* __KERNEL__ */
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 0ba4ce6e2bf3..e2f503fc7a84 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -253,10 +253,7 @@ extern bool __virt_addr_valid(const volatile void *kaddr);
 #define virt_addr_valid(kaddr)						\
 	__virt_addr_valid((const volatile void *) (kaddr))
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(VM_READ | VM_WRITE | \
-	 ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
-	 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/nds32/include/asm/page.h b/arch/nds32/include/asm/page.h
index 86b32014c5f9..add33a7f02c8 100644
--- a/arch/nds32/include/asm/page.h
+++ b/arch/nds32/include/asm/page.h
@@ -59,9 +59,6 @@ typedef struct page *pgtable_t;
 
 #endif /* !__ASSEMBLY__ */
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #endif /* __KERNEL__ */
 
 #endif
diff --git a/arch/nios2/include/asm/page.h b/arch/nios2/include/asm/page.h
index 79fcac61f6ef..6a989819a7c1 100644
--- a/arch/nios2/include/asm/page.h
+++ b/arch/nios2/include/asm/page.h
@@ -98,8 +98,7 @@ static inline bool pfn_valid(unsigned long pfn)
 # define virt_to_page(vaddr)	pfn_to_page(PFN_DOWN(virt_to_phys(vaddr)))
 # define virt_addr_valid(vaddr)	pfn_valid(PFN_DOWN(virt_to_phys(vaddr)))
 
-# define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+# define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
 
 #include <asm-generic/memory_model.h>
 
diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
index 01069db59454..aab6e64d6db4 100644
--- a/arch/openrisc/include/asm/page.h
+++ b/arch/openrisc/include/asm/page.h
@@ -86,11 +86,6 @@ typedef struct page *pgtable_t;
 
 #endif /* __ASSEMBLY__ */
 
-
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 796ae29e9b9a..6b3f6740a6a6 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -180,9 +180,6 @@ extern int npmem_ranges;
 #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
 #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 #include <asm/pdc.h>
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 080a0bf8e54b..3ee8df0f66e0 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -240,13 +240,8 @@ static inline bool pfn_valid(unsigned long pfn)
  * and needs to be executable.  This means the whole heap ends
  * up being executable.
  */
-#define VM_DATA_DEFAULT_FLAGS32 \
-	(((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0) | \
-				 VM_READ | VM_WRITE | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
-#define VM_DATA_DEFAULT_FLAGS64	(VM_READ | VM_WRITE | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS32	VM_DATA_FLAGS_TSK_EXEC
+#define VM_DATA_DEFAULT_FLAGS64	VM_DATA_FLAGS_NON_EXEC
 
 #ifdef __powerpc64__
 #include <asm/page_64.h>
diff --git a/arch/powerpc/include/asm/page_64.h b/arch/powerpc/include/asm/page_64.h
index 5962797f784a..79a9b7c6a132 100644
--- a/arch/powerpc/include/asm/page_64.h
+++ b/arch/powerpc/include/asm/page_64.h
@@ -94,11 +94,8 @@ extern u64 ppc64_pft_size;
  * stack by default, so in the absence of a PT_GNU_STACK program header
  * we turn execute permission off.
  */
-#define VM_STACK_DEFAULT_FLAGS32	(VM_READ | VM_WRITE | VM_EXEC | \
-					 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
-#define VM_STACK_DEFAULT_FLAGS64	(VM_READ | VM_WRITE | \
-					 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_STACK_DEFAULT_FLAGS32	VM_DATA_FLAGS_EXEC
+#define VM_STACK_DEFAULT_FLAGS64	VM_DATA_FLAGS_NON_EXEC
 
 #define VM_STACK_DEFAULT_FLAGS \
 	(is_32bit_task() ? \
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 8ca1930caa44..2d50f76efe48 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -137,8 +137,7 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 
 #define virt_addr_valid(vaddr)	(pfn_valid(virt_to_pfn(vaddr)))
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
index 1019efd85b9d..089f49230966 100644
--- a/arch/s390/include/asm/page.h
+++ b/arch/s390/include/asm/page.h
@@ -176,8 +176,7 @@ static inline int devmem_is_allowed(unsigned long pfn)
 
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
 
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
diff --git a/arch/sh/include/asm/page.h b/arch/sh/include/asm/page.h
index 5eef8be3e59f..ea8d68f58e39 100644
--- a/arch/sh/include/asm/page.h
+++ b/arch/sh/include/asm/page.h
@@ -182,9 +182,6 @@ typedef struct page *pgtable_t;
 #endif
 #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page_32.h
index b76d59edec8c..478260002836 100644
--- a/arch/sparc/include/asm/page_32.h
+++ b/arch/sparc/include/asm/page_32.h
@@ -133,9 +133,6 @@ extern unsigned long pfn_base;
 #define pfn_valid(pfn)		(((pfn) >= (pfn_base)) && (((pfn)-(pfn_base)) < max_mapnr))
 #define virt_addr_valid(kaddr)	((((unsigned long)(kaddr)-PAGE_OFFSET)>>PAGE_SHIFT) < max_mapnr)
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/sparc/include/asm/page_64.h b/arch/sparc/include/asm/page_64.h
index e80f2d5bf62f..254dffd85fb1 100644
--- a/arch/sparc/include/asm/page_64.h
+++ b/arch/sparc/include/asm/page_64.h
@@ -158,9 +158,6 @@ extern unsigned long PAGE_OFFSET;
 
 #endif /* !(__ASSEMBLY__) */
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/getorder.h>
 
 #endif /* _SPARC64_PAGE_H */
diff --git a/arch/unicore32/include/asm/page.h b/arch/unicore32/include/asm/page.h
index 8a89335673f9..96d6bdf180bd 100644
--- a/arch/unicore32/include/asm/page.h
+++ b/arch/unicore32/include/asm/page.h
@@ -69,9 +69,6 @@ extern int pfn_valid(unsigned long);
 
 #endif /* !__ASSEMBLY__ */
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(VM_READ | VM_WRITE | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/getorder.h>
 
 #endif
diff --git a/arch/x86/include/asm/page_types.h b/arch/x86/include/asm/page_types.h
index c85e15010f48..e27aa6be6320 100644
--- a/arch/x86/include/asm/page_types.h
+++ b/arch/x86/include/asm/page_types.h
@@ -35,9 +35,7 @@
 
 #define PAGE_OFFSET		((unsigned long)__PAGE_OFFSET)
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0 ) | \
-	 VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #define __PHYSICAL_START	ALIGN(CONFIG_PHYSICAL_START, \
 				      CONFIG_PHYSICAL_ALIGN)
diff --git a/arch/x86/um/asm/vm-flags.h b/arch/x86/um/asm/vm-flags.h
index 7c297e9e2413..df7a3896f5dd 100644
--- a/arch/x86/um/asm/vm-flags.h
+++ b/arch/x86/um/asm/vm-flags.h
@@ -9,17 +9,11 @@
 
 #ifdef CONFIG_X86_32
 
-#define VM_DATA_DEFAULT_FLAGS \
-	(VM_READ | VM_WRITE | \
-	((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0 ) | \
-		 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #else
 
-#define VM_DATA_DEFAULT_FLAGS (VM_READ | VM_WRITE | VM_EXEC | \
-	VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-#define VM_STACK_DEFAULT_FLAGS (VM_GROWSDOWN | VM_READ | VM_WRITE | \
-	VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_STACK_DEFAULT_FLAGS (VM_GROWSDOWN | VM_DATA_FLAGS_EXEC)
 
 #endif
 #endif
diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
index f4771c29c7e9..37ce25ef92d6 100644
--- a/arch/xtensa/include/asm/page.h
+++ b/arch/xtensa/include/asm/page.h
@@ -203,8 +203,5 @@ static inline unsigned long ___pa(unsigned long va)
 
 #endif /* __ASSEMBLY__ */
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
-				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-
 #include <asm-generic/memory_model.h>
 #endif /* _XTENSA_PAGE_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b0e53ef13ff1..3861524368a4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -342,6 +342,20 @@ extern unsigned int kobjsize(const void *objp);
 /* Bits set in the VMA until the stack is in its final location */
 #define VM_STACK_INCOMPLETE_SETUP	(VM_RAND_READ | VM_SEQ_READ)
 
+#define TASK_EXEC ((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0)
+
+/* Common data flag combinations */
+#define VM_DATA_FLAGS_TSK_EXEC	(VM_READ | VM_WRITE | TASK_EXEC | \
+				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_FLAGS_NON_EXEC	(VM_READ | VM_WRITE | VM_MAYREAD | \
+				 VM_MAYWRITE | VM_MAYEXEC)
+#define VM_DATA_FLAGS_EXEC	(VM_READ | VM_WRITE | VM_EXEC | \
+				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
+
+#ifndef VM_DATA_DEFAULT_FLAGS		/* arch can override this */
+#define VM_DATA_DEFAULT_FLAGS  VM_DATA_FLAGS_EXEC
+#endif
+
 #ifndef VM_STACK_DEFAULT_FLAGS		/* arch can override this */
 #define VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
 #endif
-- 
2.20.1

