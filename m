Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689FF1AC7E2
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 17:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438833AbgDPPAb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 11:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394876AbgDPPAY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 11:00:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6477FC061A0F;
        Thu, 16 Apr 2020 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Faditfx/FJbi4tKcW240iX0ey7G6EjY+VLjH16rVRCA=; b=JFl0zZWwSvM3g+lWExkdidXOqn
        DF5Vajh9bT/64ZrzbSg9+q8Tp1WxoeArprkoyWg8i6AaLujYY6cmb2xatC8YgIJX+AEgyh6oULWlN
        7c2wkQ9JJ5usw/+WZEhKopcclNDKuq4Y6g3VLuwCezCurduPwcZdVxBG5w+5q3oeqbK9GUMKrizgO
        dbZt35/GLOQ+dXPwS0vK2+M4A4d8fIxF/H0nuwZVczj6YjKnKDyfuwo2lrjfwMq/XvujU5nA1ANsM
        fT5u37ZGmV507XUmJhgfLSAD+dK62rVhASVwmdxeYj0nCoJI+kvkHhQJuRp4rwyteYqQgEt8hnzbS
        o2YI/TIA==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jP605-00029F-6L; Thu, 16 Apr 2020 15:00:21 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 3/7] MIPS: cleanup fixup_bigphys_addr handling
Date:   Thu, 16 Apr 2020 17:00:07 +0200
Message-Id: <20200416150011.820984-4-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416150011.820984-1-hch@lst.de>
References: <20200416150011.820984-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

fixup_bigphys_addr is only provided by the alchemy platform.  Remove
all the stubs, and ensure we only call it if it is actually implemented.

Also don't bother implementing io_remap_pfn_range if we don't have to,
and move the remaining implementation to alchemy platform code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig                            |  4 +++
 arch/mips/alchemy/common/setup.c             | 16 ++++++---
 arch/mips/include/asm/mach-au1x00/ioremap.h  | 38 --------------------
 arch/mips/include/asm/mach-bcm63xx/ioremap.h |  5 ---
 arch/mips/include/asm/mach-bmips/ioremap.h   |  5 ---
 arch/mips/include/asm/mach-generic/ioremap.h |  9 -----
 arch/mips/include/asm/mach-tx39xx/ioremap.h  |  9 -----
 arch/mips/include/asm/mach-tx49xx/ioremap.h  |  9 -----
 arch/mips/include/asm/pgtable.h              | 23 ++++++------
 arch/mips/pci/pci-alchemy.c                  |  2 +-
 10 files changed, 27 insertions(+), 93 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-au1x00/ioremap.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b3701a..a7b580d14345 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -92,6 +92,9 @@ config MIPS
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
 
+config MIPS_FIXUP_BIGPHYS_ADDR
+	bool
+
 menu "Machine selection"
 
 choice
@@ -157,6 +160,7 @@ config MIPS_ALCHEMY
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
 	select DMA_MAYBE_COHERENT	# Au1000,1500,1100 aren't, rest is
+	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_APM_EMULATION
diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index 7faaa6d593a7..a8cbc552bd64 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -72,9 +72,9 @@ void __init plat_mem_setup(void)
 	iomem_resource.end = IOMEM_RESOURCE_END;
 }
 
-#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_PCI)
+#ifdef CONFIG_MIPS_FIXUP_BIGPHYS_ADDR
 /* This routine should be valid for all Au1x based boards */
-phys_addr_t __fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
+phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
 {
 	unsigned long start = ALCHEMY_PCI_MEMWIN_START;
 	unsigned long end = ALCHEMY_PCI_MEMWIN_END;
@@ -90,5 +90,13 @@ phys_addr_t __fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
 	/* default nop */
 	return phys_addr;
 }
-EXPORT_SYMBOL(__fixup_bigphys_addr);
-#endif
+
+int io_remap_pfn_range(struct vm_area_struct *vma, unsigned long vaddr,
+		unsigned long pfn, unsigned long size, pgprot_t prot)
+{
+	phys_addr_t phys_addr = fixup_bigphys_addr(pfn << PAGE_SHIFT, size);
+
+	return remap_pfn_range(vma, vaddr, phys_addr >> PAGE_SHIFT, size, prot);
+}
+EXPORT_SYMBOL(io_remap_pfn_range);
+#endif /* CONFIG_MIPS_FIXUP_BIGPHYS_ADDR */
diff --git a/arch/mips/include/asm/mach-au1x00/ioremap.h b/arch/mips/include/asm/mach-au1x00/ioremap.h
deleted file mode 100644
index f6877ed8b8d0..000000000000
--- a/arch/mips/include/asm/mach-au1x00/ioremap.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *	include/asm-mips/mach-au1x00/ioremap.h
- */
-#ifndef __ASM_MACH_AU1X00_IOREMAP_H
-#define __ASM_MACH_AU1X00_IOREMAP_H
-
-#include <linux/types.h>
-
-#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_PCI)
-extern phys_addr_t __fixup_bigphys_addr(phys_addr_t, phys_addr_t);
-#else
-static inline phys_addr_t __fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-#endif
-
-/*
- * Allow physical addresses to be fixed up to help 36-bit peripherals.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return __fixup_bigphys_addr(phys_addr, size);
-}
-
-static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
-	unsigned long flags)
-{
-	return NULL;
-}
-
-static inline int plat_iounmap(const volatile void __iomem *addr)
-{
-	return 0;
-}
-
-#endif /* __ASM_MACH_AU1X00_IOREMAP_H */
diff --git a/arch/mips/include/asm/mach-bcm63xx/ioremap.h b/arch/mips/include/asm/mach-bcm63xx/ioremap.h
index 8cd261ec0a75..73f31825bbf3 100644
--- a/arch/mips/include/asm/mach-bcm63xx/ioremap.h
+++ b/arch/mips/include/asm/mach-bcm63xx/ioremap.h
@@ -4,11 +4,6 @@
 
 #include <bcm63xx_cpu.h>
 
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline int is_bcm63xx_internal_registers(phys_addr_t offset)
 {
 	switch (bcm63xx_get_cpu_id()) {
diff --git a/arch/mips/include/asm/mach-bmips/ioremap.h b/arch/mips/include/asm/mach-bmips/ioremap.h
index 52632ebc705f..63b4af9916b6 100644
--- a/arch/mips/include/asm/mach-bmips/ioremap.h
+++ b/arch/mips/include/asm/mach-bmips/ioremap.h
@@ -4,11 +4,6 @@
 
 #include <linux/types.h>
 
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline int is_bmips_internal_registers(phys_addr_t offset)
 {
 	if (offset >= 0xfff80000)
diff --git a/arch/mips/include/asm/mach-generic/ioremap.h b/arch/mips/include/asm/mach-generic/ioremap.h
index 4e36ea25ed33..f2442b84545c 100644
--- a/arch/mips/include/asm/mach-generic/ioremap.h
+++ b/arch/mips/include/asm/mach-generic/ioremap.h
@@ -7,15 +7,6 @@
 
 #include <linux/types.h>
 
-/*
- * Allow physical addresses to be fixed up to help peripherals located
- * outside the low 32-bit range -- generic pass-through version.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
 	unsigned long flags)
 {
diff --git a/arch/mips/include/asm/mach-tx39xx/ioremap.h b/arch/mips/include/asm/mach-tx39xx/ioremap.h
index 077b3c9971f7..157a7292397e 100644
--- a/arch/mips/include/asm/mach-tx39xx/ioremap.h
+++ b/arch/mips/include/asm/mach-tx39xx/ioremap.h
@@ -7,15 +7,6 @@
 
 #include <linux/types.h>
 
-/*
- * Allow physical addresses to be fixed up to help peripherals located
- * outside the low 32-bit range -- generic pass-through version.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
 	unsigned long flags)
 {
diff --git a/arch/mips/include/asm/mach-tx49xx/ioremap.h b/arch/mips/include/asm/mach-tx49xx/ioremap.h
index c6b9e05f44c4..b1f3710acf8e 100644
--- a/arch/mips/include/asm/mach-tx49xx/ioremap.h
+++ b/arch/mips/include/asm/mach-tx49xx/ioremap.h
@@ -7,15 +7,6 @@
 
 #include <linux/types.h>
 
-/*
- * Allow physical addresses to be fixed up to help peripherals located
- * outside the low 32-bit range -- generic pass-through version.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
 	unsigned long flags)
 {
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index f1801e7a4b15..aab0ec174f68 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -507,20 +507,17 @@ static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 
 #define kern_addr_valid(addr)	(1)
 
-#ifdef CONFIG_PHYS_ADDR_T_64BIT
-extern int remap_pfn_range(struct vm_area_struct *vma, unsigned long from, unsigned long pfn, unsigned long size, pgprot_t prot);
-
-static inline int io_remap_pfn_range(struct vm_area_struct *vma,
-		unsigned long vaddr,
-		unsigned long pfn,
-		unsigned long size,
-		pgprot_t prot)
-{
-	phys_addr_t phys_addr_high = fixup_bigphys_addr(pfn << PAGE_SHIFT, size);
-	return remap_pfn_range(vma, vaddr, phys_addr_high >> PAGE_SHIFT, size, prot);
-}
+/*
+ * Allow physical addresses to be fixed up to help 36-bit peripherals.
+ */
+#ifdef CONFIG_MIPS_FIXUP_BIGPHYS_ADDR
+phys_addr_t fixup_bigphys_addr(phys_addr_t addr, phys_addr_t size);
+int io_remap_pfn_range(struct vm_area_struct *vma, unsigned long vaddr,
+		unsigned long pfn, unsigned long size, pgprot_t prot);
 #define io_remap_pfn_range io_remap_pfn_range
-#endif
+#else
+#define fixup_bigphys_addr(addr, size)	(addr)
+#endif /* CONFIG_MIPS_FIXUP_BIGPHYS_ADDR */
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 01a2af8215c8..7285b5667568 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -52,7 +52,7 @@ struct alchemy_pci_context {
 static struct alchemy_pci_context *__alchemy_pci_ctx;
 
 
-/* IO/MEM resources for PCI. Keep the memres in sync with __fixup_bigphys_addr
+/* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
 static struct resource alchemy_pci_def_memres = {
-- 
2.25.1

