Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F77346CAA
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 23:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhCWWYG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 18:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbhCWWVg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 18:21:36 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A736C0613DB;
        Tue, 23 Mar 2021 15:21:34 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id i22so1640134pgl.4;
        Tue, 23 Mar 2021 15:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJqSTLOSJZiiTZiNKUsL2KlFgCZZceQr/nQknnwb9MA=;
        b=Y1HlnqyZNrvf5DJ5x+wynjpw0aiTDVsei0SSQvp1xsZ3NikqMb9Dm6wd85G7GccL4U
         1tc02MSvz2P9638LbnlZ9fFWOUgZaAFCCwd2zJNmICiOnEhbOyqD8Ci1Gcll74q7iW+9
         9BAfXkwLOEUM5Xi00GV2a0HPo+x8hpDe1BSvyP0ckJQaz6KilWRtMHFCzC8/qphapN3R
         oUG5QW2+5xwxRdVDsct8J+UR6qfPJauvF++Qy8Twhg96ouJe9q9H5OlGlTAHY+3jd4rg
         VyvTUlsJTTG1PXCZkYuw9YZWFVl37SRUjAVbb364dox9ZYsYO2oMqRgCMi24OXL3YeCH
         nHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJqSTLOSJZiiTZiNKUsL2KlFgCZZceQr/nQknnwb9MA=;
        b=fsMBFrVj6G2BStpEld+VgvuqExOd2aZKZT6tZ/3IK7POi4mTz2nxEroCdn2d4mzOA4
         wFWEZCH5+IxVhXz2RNqRUj2oCTFdreziCwc78FW9DshhjnB3zh1br8pw5lV/qn5KQcLl
         eSgxNNIjCMzI3fKOpxIDzuqgGDTniCWZT8tSqWM926UISIe8g1Azvb8B97OMVYrF7aXj
         FJdW4fjiTvpV6jTQbcHhWrWJqHEg6M87x18DaYaZY5aQ5pGh6qeFHx5DaGoFn6TLX68t
         CVppwnnFbtGfjL9NHHL2Cs4yc1kM/X3A2RO8pJwjXGPwTt5u19dRN72KZCHMX1/baerx
         Dpkg==
X-Gm-Message-State: AOAM530h0nh9Yvl2u0VIkO/wXnMIcatxvVTznyMS/8gSWKlbvJ3kwv/l
        /wF2vDGnoO+XHHArlpcDNcGHps2PXpU=
X-Google-Smtp-Source: ABdhPJyJJ1UXh+9HrsWV9QFqwvdCJUZ9zTK+PHHv9mN5rw/boKEgRx9QjhDq2tUuZIuGhfYMiWWAmw==
X-Received: by 2002:a17:902:e545:b029:e6:6499:cd19 with SMTP id n5-20020a170902e545b02900e66499cd19mr521394plf.53.1616538093277;
        Tue, 23 Mar 2021 15:21:33 -0700 (PDT)
Received: from localhost.localdomain (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id f21sm200168pfe.6.2021.03.23.15.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:21:32 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Vlastimil Babka <vbabka@suse.cz>,
        Yousong Zhou <yszhou4tech@gmail.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: Add support for CONFIG_DEBUG_VIRTUAL
Date:   Tue, 23 Mar 2021 15:20:43 -0700
Message-Id: <20210323222103.34225-1-f.fainelli@gmail.com>
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
Changes in v2:
- fixed sparse warning in arch/mips/kernel/vdso.c

 arch/mips/Kconfig            |  1 +
 arch/mips/include/asm/io.h   | 14 ++++++++-
 arch/mips/include/asm/page.h |  9 +++++-
 arch/mips/kernel/vdso.c      |  2 +-
 arch/mips/mm/Makefile        |  2 ++
 arch/mips/mm/physaddr.c      | 55 ++++++++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+), 3 deletions(-)
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
index 7d0b91ad2581..e3fd93ca480a 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -158,7 +158,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	/* Map GIC user page. */
 	if (gic_size) {
-		gic_pfn = virt_to_phys(mips_gic_base + MIPS_GIC_USER_OFS) >> PAGE_SHIFT;
+		gic_pfn = virt_to_phys((void *)mips_gic_base + MIPS_GIC_USER_OFS) >> PAGE_SHIFT;
 
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
index 000000000000..008b524a96b2
--- /dev/null
+++ b/arch/mips/mm/physaddr.c
@@ -0,0 +1,55 @@
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

