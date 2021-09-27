Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632844196ED
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbhI0PBi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234873AbhI0PBf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 11:01:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B02C061575;
        Mon, 27 Sep 2021 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=rRPnSHMNjWr/LgNqeMuSZ9rCL+qcsMUYrqWdoofu0OY=; b=ifO5NW+CifpntK2cYBf+i7cBDX
        zA5+EQb1wUiRvbMcbBA/qY/11LqPIxKFzfg8ZVb+XsNuGmTy9xPBwRuw3d2EICaMGBgkbDX/qV7m0
        ltofl3Zqcnf5y405ieK7IBLGKu03691ia5vHcoh2DLKV3k0vwP5UA2ex8ZKSqy25RT3ZaWFtjPxNF
        dQ2I3FQk+vH3WGqSZhiMHt9d6UhR/iGdXuaYQ8bjAx1FozHGmP0hxmwkrJcl0IJFSJTHRCgeUL6ix
        lwpXn/BGHX5GeuyajxI4tNWxYtnWKRd7GWy9D4NPpguG63Rj7t9XvLW1vwxdJZjaj9dexVCqzh8Cs
        Y9WiF4aA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mUs5B-009qzS-Cj; Mon, 27 Sep 2021 14:58:30 +0000
Date:   Mon, 27 Sep 2021 15:58:17 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mmap: Define index macros for protection_map[]
Message-ID: <YVHcCZXmQ1yjINaf@infradead.org>
References: <1632712920-8171-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632712920-8171-1-git-send-email-anshuman.khandual@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 27, 2021 at 08:52:00AM +0530, Anshuman Khandual wrote:
> protection_map[] maps the lower four bits from vm_flags into platform page
> protection mask. Default initialization (and possible re-initialization in
> the platform) does not make it clear that these indices are just derived
> from various vm_flags protections (VM_SHARED, VM_READ, VM_WRITE, VM_EXEC).
> This defines macros for protection_map[] indices which concatenate various
> vm_flag attributes, making it clear and explicit.

I dont think this is all that helpful.  The main issue here is that
protection_map is a pointless obsfucation ad should be replaced with a
simple switch statement provided by each architecture.  See the below
WIP which just works for x86 and without pagetable debugging for where I
think we should be going.

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index ab83c22d274e7..70d8ae60a416f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -74,8 +74,8 @@ config X86
 	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
-	select ARCH_HAS_FILTER_PGPROT
 	select ARCH_HAS_FORTIFY_SOURCE
+	select ARCH_HAS_GET_PAGE_PROT
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64 && STACK_VALIDATION
 	select ARCH_HAS_MEM_ENCRYPT
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 448cd01eb3ecb..a0cc70b056385 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -646,11 +646,6 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
 
 #define canon_pgprot(p) __pgprot(massage_pgprot(p))
 
-static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
-{
-	return canon_pgprot(prot);
-}
-
 static inline int is_new_memtype_allowed(u64 paddr, unsigned long size,
 					 enum page_cache_mode pcm,
 					 enum page_cache_mode new_pcm)
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 40497a9020c6e..1a9dd933088e6 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -228,25 +228,6 @@ enum page_cache_mode {
 
 #endif	/* __ASSEMBLY__ */
 
-/*         xwr */
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READONLY
-#define __P010	PAGE_COPY
-#define __P011	PAGE_COPY
-#define __P100	PAGE_READONLY_EXEC
-#define __P101	PAGE_READONLY_EXEC
-#define __P110	PAGE_COPY_EXEC
-#define __P111	PAGE_COPY_EXEC
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READONLY
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED
-#define __S100	PAGE_READONLY_EXEC
-#define __S101	PAGE_READONLY_EXEC
-#define __S110	PAGE_SHARED_EXEC
-#define __S111	PAGE_SHARED_EXEC
-
 /*
  * early identity mapping  pte attrib macros.
  */
diff --git a/arch/x86/include/uapi/asm/mman.h b/arch/x86/include/uapi/asm/mman.h
index d4a8d0424bfbf..775dbd3aff736 100644
--- a/arch/x86/include/uapi/asm/mman.h
+++ b/arch/x86/include/uapi/asm/mman.h
@@ -5,20 +5,6 @@
 #define MAP_32BIT	0x40		/* only give out 32bit addresses */
 
 #ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
-/*
- * Take the 4 protection key bits out of the vma->vm_flags
- * value and turn them in to the bits that we can put in
- * to a pte.
- *
- * Only override these if Protection Keys are available
- * (which is only on 64-bit).
- */
-#define arch_vm_get_page_prot(vm_flags)	__pgprot(	\
-		((vm_flags) & VM_PKEY_BIT0 ? _PAGE_PKEY_BIT0 : 0) |	\
-		((vm_flags) & VM_PKEY_BIT1 ? _PAGE_PKEY_BIT1 : 0) |	\
-		((vm_flags) & VM_PKEY_BIT2 ? _PAGE_PKEY_BIT2 : 0) |	\
-		((vm_flags) & VM_PKEY_BIT3 ? _PAGE_PKEY_BIT3 : 0))
-
 #define arch_calc_vm_prot_bits(prot, key) (		\
 		((key) & 0x1 ? VM_PKEY_BIT0 : 0) |      \
 		((key) & 0x2 ? VM_PKEY_BIT1 : 0) |      \
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 5864219221ca8..b44806c5b3de8 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -16,8 +16,10 @@ CFLAGS_REMOVE_mem_encrypt.o		= -pg
 CFLAGS_REMOVE_mem_encrypt_identity.o	= -pg
 endif
 
-obj-y				:=  init.o init_$(BITS).o fault.o ioremap.o extable.o mmap.o \
-				    pgtable.o physaddr.o setup_nx.o tlb.o cpu_entry_area.o maccess.o
+obj-y				:=  init.o init_$(BITS).o fault.o ioremap.o \
+				    extable.o mmap.o pgtable.o physaddr.o \
+				    setup_nx.o tlb.o cpu_entry_area.o \
+				    maccess.o pgprot.o
 
 obj-y				+= pat/
 
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index ff08dc4636347..e1d1168ed25e8 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -189,10 +189,6 @@ void __init sme_early_init(void)
 
 	__supported_pte_mask = __sme_set(__supported_pte_mask);
 
-	/* Update the protection map with memory encryption mask */
-	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
-		protection_map[i] = pgprot_encrypted(protection_map[i]);
-
 	if (sev_active())
 		swiotlb_force = SWIOTLB_FORCE;
 }
diff --git a/arch/x86/mm/pgprot.c b/arch/x86/mm/pgprot.c
new file mode 100644
index 0000000000000..4d8e9dbcce993
--- /dev/null
+++ b/arch/x86/mm/pgprot.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/export.h>
+#include <linux/mm.h>
+#include <asm/pgtable.h>
+
+static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case 0:
+		return PAGE_NONE;
+	case VM_READ:
+		return PAGE_READONLY;
+	case VM_WRITE:
+		return PAGE_COPY;
+	case VM_READ | VM_WRITE:
+		return PAGE_COPY;
+	case VM_EXEC:
+	case VM_EXEC | VM_READ:
+		return PAGE_READONLY_EXEC;
+	case VM_EXEC | VM_WRITE:
+	case VM_EXEC | VM_READ | VM_WRITE:
+		return PAGE_COPY_EXEC;
+	case VM_SHARED:
+		return PAGE_NONE;
+	case VM_SHARED | VM_READ:
+		return PAGE_READONLY;
+	case VM_SHARED | VM_WRITE:
+	case VM_SHARED | VM_READ | VM_WRITE:
+		return PAGE_SHARED;
+	case VM_SHARED | VM_EXEC:
+	case VM_SHARED | VM_READ | VM_EXEC:
+		return PAGE_READONLY_EXEC;
+	case VM_SHARED | VM_WRITE | VM_EXEC:
+	case VM_SHARED | VM_READ | VM_WRITE | VM_EXEC:
+		return PAGE_SHARED_EXEC;
+	default:
+		BUILD_BUG();
+		return PAGE_NONE;
+	}
+}
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	unsigned long val = pgprot_val(__vm_get_page_prot(vm_flags));
+
+#ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
+	/*
+	 * Take the 4 protection key bits out of the vma->vm_flags value and
+	 * turn them in to the bits that we can put in to a pte.
+	 *
+	 * Only override these if Protection Keys are available (which is only
+	 * on 64-bit).
+	 */
+	if (vm_flags & VM_PKEY_BIT0)
+		val |= _PAGE_PKEY_BIT0;
+	if (vm_flags & VM_PKEY_BIT1)
+		val |= _PAGE_PKEY_BIT1;
+	if (vm_flags & VM_PKEY_BIT2)
+		val |= _PAGE_PKEY_BIT2;
+	if (vm_flags & VM_PKEY_BIT3)
+		val |= _PAGE_PKEY_BIT3;
+#endif
+
+	val = __sme_set(val);
+	if (val & _PAGE_PRESENT)
+		val &= __supported_pte_mask;
+	return __pgprot(val);
+}
+EXPORT_SYMBOL(vm_get_page_prot);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 73a52aba448f9..def17c5fb6afc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -428,12 +428,6 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #define VM_FLAGS_CLEAR	(ARCH_VM_PKEY_FLAGS | VM_ARCH_CLEAR)
 
-/*
- * mapping from the currently active vm_flags protection bits (the
- * low four bits) to a page protection mask..
- */
-extern pgprot_t protection_map[16];
-
 /**
  * enum fault_flag - Fault flag definitions.
  * @FAULT_FLAG_WRITE: Fault was a write fault.
diff --git a/mm/Kconfig b/mm/Kconfig
index d16ba9249bc53..d9fa0bac189b4 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -894,6 +894,9 @@ config IO_MAPPING
 config SECRETMEM
 	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
 
+config ARCH_HAS_GET_PAGE_PROT
+	bool
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/mmap.c b/mm/mmap.c
index 88dcc5c252255..c6031dfcedd18 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -80,6 +80,7 @@ static void unmap_region(struct mm_struct *mm,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
 		unsigned long start, unsigned long end);
 
+#ifndef CONFIG_ARCH_HAS_GET_PAGE_PROT
 /* description of effects of mapping type and prot in current implementation.
  * this is due to the limited x86 page protection hardware.  The expected
  * behavior is in parens:
@@ -100,11 +101,6 @@ static void unmap_region(struct mm_struct *mm,
  *								w: (no) no
  *								x: (yes) yes
  */
-pgprot_t protection_map[16] __ro_after_init = {
-	__P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
-	__S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
-};
-
 #ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
 static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
 {
@@ -112,15 +108,57 @@ static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
 }
 #endif
 
+static pgprot_t __vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case 0:
+		return __P000;
+	case VM_READ:
+		return __P001;
+	case VM_WRITE:
+		return __P010;
+	case VM_READ | VM_WRITE:
+		return __P011;
+	case VM_EXEC:
+		return __P100;
+	case VM_EXEC | VM_READ:
+		return __P101;
+	case VM_EXEC | VM_WRITE:
+		return __P110;
+	case VM_EXEC | VM_READ | VM_WRITE:
+		return __P111;
+	case VM_SHARED:
+		return __S000;
+	case VM_SHARED | VM_READ:
+		return __S001;
+	case VM_SHARED | VM_WRITE:
+		return __S010;
+	case VM_SHARED | VM_READ | VM_WRITE:
+		return __S011;
+	case VM_SHARED | VM_EXEC:
+		return __S100;
+	case VM_SHARED | VM_READ | VM_EXEC:
+		return __S101;
+	case VM_SHARED | VM_WRITE | VM_EXEC:
+		return __S110;
+	case VM_SHARED | VM_READ | VM_WRITE | VM_EXEC:
+		return __S111;
+	default:
+		BUG();
+	}
+}
+
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
-				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
-			pgprot_val(arch_vm_get_page_prot(vm_flags)));
+	pgprot_t ret;
+
+	ret = __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
+		       pgprot_val(arch_vm_get_page_prot(vm_flags)));
 
 	return arch_filter_pgprot(ret);
 }
 EXPORT_SYMBOL(vm_get_page_prot);
+#endif /* CONFIG_ARCH_HAS_GET_PAGE_PROT */
 
 static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
 {
@@ -1660,10 +1698,9 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
 #endif /* __ARCH_WANT_SYS_OLD_MMAP */
 
 /*
- * Some shared mappings will want the pages marked read-only
- * to track write events. If so, we'll downgrade vm_page_prot
- * to the private version (using protection_map[] without the
- * VM_SHARED bit).
+ * Some shared mappings will want the pages marked read-only to track write
+ * events.  If so, we'll downgrade vm_page_prot to the private version without
+ * the VM_SHARED bit.
  */
 int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
 {
