Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F0134F765
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 05:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbhCaDXB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 23:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233538AbhCaDWi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 23:22:38 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DB2C061574;
        Tue, 30 Mar 2021 20:22:38 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id l1so7193178plg.12;
        Tue, 30 Mar 2021 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkm3P5RE80U8+woiHQI1EQe+BOt3uSMFxDJpxjcNUTA=;
        b=LXNSnC/zeHOFL0gy9CmsCFdS+u43TkrZ4i4izXbo61O8g5SRFuRnra4b2bj8XtQUVH
         +0AyeuA5crGcmObs0eKB/zthjlFy45Lk6973MSgNC3iYpjpvtyJ+SamGOWYt95arCx55
         INIvzt/vw4qRotFT+KpkkBEW8uDdqC3bQKeYz4UxOkd48W/lDTT5VUDejLY59WuYK9WI
         rDQlLQRhYQ6LH15STDTtn2/WqaDD53Dvp/xkl69yqgLDJ/z94uiZ0CyQGz2FHO4lOf3K
         n3N99VGhpN82+8rayMhp640uRNUUlw8b3+ntvv4ix79GRLDryG+ifKy/I3ORkOJkH6+k
         zrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkm3P5RE80U8+woiHQI1EQe+BOt3uSMFxDJpxjcNUTA=;
        b=V+kn3BDKChCeUcYsa84OGKdw86uDAqSsNq+omDM1mDBhcY/jlSk2iBVBXNVqJLqkhI
         dv3iXpa8fJKg3KouKqJbijl73vAVjJRKD69C/RRZfWG4TgcnymkPAbOqozbVSC35NCIX
         fiktE7wXKWsxNooyWzulxHe4G/ng5wjALTzXWy2VF6m5rkJ7mDS5lmo65DKf63z3l2fI
         Cgh96vlWT0pP4hmg2FZAR6aY5TaEqlbXgLh8fWrvUwYQiXM3Gaii4AQL4INfP5SZn6c6
         LGiBakQVbPsGhgjIvaLTXV42Y2E7oLjU2aJJ6rYkJGQacqWcmxvz9KmHkOhUTDWwpvOh
         bkdA==
X-Gm-Message-State: AOAM530ylqOgg5vMaSzNSIE5KMVWQVr4Zz9lsOVdZJ/8WYNwbSpEZ9AO
        /Nol3xEimBOg06Ykuj6J75Q4nRvH1ZI=
X-Google-Smtp-Source: ABdhPJzR37hbTkvRe9594EWtvrv9MYDoJ2XWwdls3VL9cdeDjWnDwuoQCc+Yka2SpxqdHWSn0AQygQ==
X-Received: by 2002:a17:902:e752:b029:e6:822c:355c with SMTP id p18-20020a170902e752b02900e6822c355cmr1296179plf.69.1617160957232;
        Tue, 30 Mar 2021 20:22:37 -0700 (PDT)
Received: from localhost.localdomain (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id a13sm562053pgm.43.2021.03.30.20.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 20:22:36 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Huacai Chen <chenhuacai@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Kees Cook <keescook@chromium.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Michel Lespinasse <walken@google.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] MIPS: Add support for CONFIG_DEBUG_VIRTUAL
Date:   Tue, 30 Mar 2021 20:22:07 -0700
Message-Id: <20210331032228.21251-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide hooks to intercept bad usages of virt_to_phys() and
__pa_symbol() throughout the kernel. To make this possible, we need to
rename the current implement of virt_to_phys() into
__virt_to_phys_nodebug() and wrap it around depending on
CONFIG_DEBUG_VIRTUAL.

A similar thing is needed for __pa_symbol() which is now aliased to
__phys_addr_symbol() whose implementation is either the direct return of
RELOC_HIDE or goes through the debug version.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v4:

- properly address sparse warning in arch/mips/kernel/vdso.c and
  eliminate it entirely

Changes in v3:

- added missing SDPX license tag in physaddr.c

Changes in v2:
- fixed sparse warning in arch/mips/kernel/vdso.c

 arch/mips/Kconfig            |  1 +
 arch/mips/include/asm/io.h   | 14 ++++++++-
 arch/mips/include/asm/page.h |  9 +++++-
 arch/mips/kernel/vdso.c      |  5 ++--
 arch/mips/mm/Makefile        |  2 ++
 arch/mips/mm/physaddr.c      | 56 ++++++++++++++++++++++++++++++++++++
 6 files changed, 83 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/mm/physaddr.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..0904d6351808 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -4,6 +4,7 @@ config MIPS
 	default y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
+	select ARCH_HAS_DEBUG_VIRTUAL if !64BIT
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 78537aa23500..2c138450ad3b 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -100,11 +100,23 @@ static inline void set_io_port_base(unsigned long base)
  *     almost all conceivable cases a device driver should not be using
  *     this function
  */
-static inline unsigned long virt_to_phys(volatile const void *address)
+static inline unsigned long __virt_to_phys_nodebug(volatile const void *address)
 {
 	return __pa(address);
 }
 
+#ifdef CONFIG_DEBUG_VIRTUAL
+extern phys_addr_t __virt_to_phys(volatile const void *x);
+#else
+#define __virt_to_phys(x)	__virt_to_phys_nodebug(x)
+#endif
+
+#define virt_to_phys virt_to_phys
+static inline phys_addr_t virt_to_phys(const volatile void *x)
+{
+	return __virt_to_phys(x);
+}
+
 /*
  *     phys_to_virt    -       map physical address to virtual
  *     @address: address to remap
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 65acab9c41f9..195ff4e9771f 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -210,9 +210,16 @@ static inline unsigned long ___pa(unsigned long x)
  * also affect MIPS so we keep this one until GCC 3.x has been retired
  * before we can apply https://patchwork.linux-mips.org/patch/1541/
  */
+#define __pa_symbol_nodebug(x)	__pa(RELOC_HIDE((unsigned long)(x), 0))
+
+#ifdef CONFIG_DEBUG_VIRTUAL
+extern phys_addr_t __phys_addr_symbol(unsigned long x);
+#else
+#define __phys_addr_symbol(x)	__pa_symbol_nodebug(x)
+#endif
 
 #ifndef __pa_symbol
-#define __pa_symbol(x)	__pa(RELOC_HIDE((unsigned long)(x), 0))
+#define __pa_symbol(x)		__phys_addr_symbol((unsigned long)(x))
 #endif
 
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 7d0b91ad2581..3d0cf471f2fe 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -90,7 +90,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mips_vdso_image *image = current->thread.abi->vdso;
 	struct mm_struct *mm = current->mm;
-	unsigned long gic_size, vvar_size, size, base, data_addr, vdso_addr, gic_pfn;
+	unsigned long gic_size, vvar_size, size, base, data_addr, vdso_addr, gic_pfn, gic_base;
 	struct vm_area_struct *vma;
 	int ret;
 
@@ -158,7 +158,8 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	/* Map GIC user page. */
 	if (gic_size) {
-		gic_pfn = virt_to_phys(mips_gic_base + MIPS_GIC_USER_OFS) >> PAGE_SHIFT;
+		gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
+		gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
 
 		ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
 					 pgprot_noncached(vma->vm_page_prot));
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 865926a37775..fa1f729e0700 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -40,3 +40,5 @@ obj-$(CONFIG_R5000_CPU_SCACHE)	+= sc-r5k.o
 obj-$(CONFIG_RM7000_CPU_SCACHE) += sc-rm7k.o
 obj-$(CONFIG_MIPS_CPU_SCACHE)	+= sc-mips.o
 obj-$(CONFIG_SCACHE_DEBUGFS)	+= sc-debugfs.o
+
+obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
diff --git a/arch/mips/mm/physaddr.c b/arch/mips/mm/physaddr.c
new file mode 100644
index 000000000000..a1ced5e44951
--- /dev/null
+++ b/arch/mips/mm/physaddr.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bug.h>
+#include <linux/export.h>
+#include <linux/types.h>
+#include <linux/mmdebug.h>
+#include <linux/mm.h>
+
+#include <asm/sections.h>
+#include <asm/io.h>
+#include <asm/page.h>
+#include <asm/dma.h>
+
+static inline bool __debug_virt_addr_valid(unsigned long x)
+{
+	/* high_memory does not get immediately defined, and there
+	 * are early callers of __pa() against PAGE_OFFSET
+	 */
+	if (!high_memory && x >= PAGE_OFFSET)
+		return true;
+
+	if (high_memory && x >= PAGE_OFFSET && x < (unsigned long)high_memory)
+		return true;
+
+	/*
+	 * MAX_DMA_ADDRESS is a virtual address that may not correspond to an
+	 * actual physical address. Enough code relies on
+	 * virt_to_phys(MAX_DMA_ADDRESS) that we just need to work around it
+	 * and always return true.
+	 */
+	if (x == MAX_DMA_ADDRESS)
+		return true;
+
+	return false;
+}
+
+phys_addr_t __virt_to_phys(volatile const void *x)
+{
+	WARN(!__debug_virt_addr_valid((unsigned long)x),
+	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
+	     x, x);
+
+	return __virt_to_phys_nodebug(x);
+}
+EXPORT_SYMBOL(__virt_to_phys);
+
+phys_addr_t __phys_addr_symbol(unsigned long x)
+{
+	/* This is bounds checking against the kernel image only.
+	 * __pa_symbol should only be used on kernel symbol addresses.
+	 */
+	VIRTUAL_BUG_ON(x < (unsigned long)_text ||
+		       x > (unsigned long)_end);
+
+	return __pa_symbol_nodebug(x);
+}
+EXPORT_SYMBOL(__phys_addr_symbol);
-- 
2.25.1

