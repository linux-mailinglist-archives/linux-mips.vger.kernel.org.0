Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F055E342623
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 20:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCSTZG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 15:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhCSTYt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Mar 2021 15:24:49 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48CFC06174A;
        Fri, 19 Mar 2021 12:24:48 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id r17-20020a4acb110000b02901b657f28cdcso2576700ooq.6;
        Fri, 19 Mar 2021 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VtqKfaKI7pYqkaeqQDhNDK8olraDe+3mAirbVP7Z38A=;
        b=N8KcP2PYzwXGWXQWtkF2RgdnS5uW6sFdSg2dpxoIbMNmfavfQwzK87+WGME3ONysAo
         qdfky6aDrqThAWKXFasO0tyuE6EGgR9ZrE7f/Yu40mVtGRm+58Qj4IuQmZ7tASqeccxe
         JNsZEvqu3KBrtxk7eooL919DzuepvJi4+yvueToBu7jdUv53fXmwq2bZ02TDDYzKThoY
         P61Hk/wL/aofnk9UBRgSV3rk8bSlP6b71/Dep9Kurv3nEYtklk98UNXJak1eIeZps8ZL
         n7pb2do3u9n651yBYbR/TR4AEeGVJpyZ2/6xtAGZ/9ua7q7MT+g1fDA+UH+AYgAU0JaI
         BXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VtqKfaKI7pYqkaeqQDhNDK8olraDe+3mAirbVP7Z38A=;
        b=ciqpT4md90VDyfKXcgh+RshD0bcV5zQZmhwcPO1hbB0xKgY4YvzdJ5qllg24xL0ffX
         8G4xFGckw9kqBiL+n6Xdz66kTSvXatwY6FH3R0mpkxd51bShSmTrhjwab794esf3t0Rd
         1/3KvjnsJepaOgIE8WFqbfcgnorb8YGtR29EQJ2V4AQF6Ui6fxeu3QBf61gIwx2uMu/F
         WVS4xZRNT+MpX0Ch5jhchdgjSjtbdWVUlCJTOzM4bCAbCpsu5cP6tOQXGfxfBMtu0DG2
         tm8sJFpAZNpXke5U/tgVi4Y4svFYPLUCiLlH6fpCMtGNsOBdrpDk5BJH1t+1AGFr+1Xt
         3Srg==
X-Gm-Message-State: AOAM5338B0jiUrY2cT+UDjC+jColV/OXoG3wCKOLR9oAiSljRqB+ObVx
        YZeTi23PWuPDLqQVrolOYaaoEgO7sdA=
X-Google-Smtp-Source: ABdhPJwKs3a9aeAF7gr4whzR8jhMee8tGkXmpxBjRkjNxt5jv2Rp7SY9ENJ9oswA6XQ1/3gXWB2YzA==
X-Received: by 2002:a4a:ea11:: with SMTP id x17mr2568631ood.81.1616181887725;
        Fri, 19 Mar 2021 12:24:47 -0700 (PDT)
Received: from localhost.localdomain (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id u194sm1412697oia.27.2021.03.19.12.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 12:24:47 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Jinyang He <hejinyang@loongson.cn>,
        Kees Cook <keescook@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Add support for CONFIG_DEBUG_VIRTUAL
Date:   Fri, 19 Mar 2021 12:24:32 -0700
Message-Id: <20210319192440.2019371-1-f.fainelli@gmail.com>
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
 arch/mips/Kconfig            |  1 +
 arch/mips/include/asm/io.h   | 14 ++++++++-
 arch/mips/include/asm/page.h |  9 +++++-
 arch/mips/mm/Makefile        |  2 ++
 arch/mips/mm/physaddr.c      | 55 ++++++++++++++++++++++++++++++++++++
 5 files changed, 79 insertions(+), 2 deletions(-)
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

