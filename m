Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C48BF2630
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 05:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfKGECD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 23:02:03 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:40826 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733102AbfKGECD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 23:02:03 -0500
Received: from mxback22j.mail.yandex.net (mxback22j.mail.yandex.net [IPv6:2a02:6b8:0:1619::222])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id 5B6CE6740311;
        Thu,  7 Nov 2019 07:01:59 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback22j.mail.yandex.net (mxback/Yandex) with ESMTP id 6q14ZrIh7r-1xiqC3J6;
        Thu, 07 Nov 2019 07:01:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573099319;
        bh=ckK5Hssu4zzQuaWruoW41xzbDqC+RA8d6/fynmhnZ0g=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=B04gO/YzjABordDf7hJ6Yp0SiPd0OBMYk5WZ97kqdJTbURNTczQdwcw3CeTc3LlzZ
         e4s1IKOSrnDJC11mzXd/E/p3ANW7iH/g3Nw8nn1JrcpWZ8ihY/8fL0TCaXCSS0gBGI
         yiuJBb7HqOFeYyT456ARcF461u3/7RZSSxThq5FQ=
Authentication-Results: mxback22j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id Z8DeRIVREY-1tVml3X0;
        Thu, 07 Nov 2019 07:01:57 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paulburton@kernel.org, chenhe@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/5] MIPS: Drop CPU_SUPPORTS_UNCACHED_ACCELERATED
Date:   Thu,  7 Nov 2019 12:01:16 +0800
Message-Id: <20191107040118.10685-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
References: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPU_SUPPORTS_UNCACHED_ACCELERATED was introduced when kernel can't handle
writecombine remap well. Nowadays drivers can try writecombine remap by
themselves so this function is nolonger needed.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                  |  3 --
 arch/mips/include/asm/pgtable.h    | 11 ------
 arch/mips/loongson2ef/common/mem.c | 58 ------------------------------
 3 files changed, 72 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7cb894776f44..3dd7540c82bb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1966,7 +1966,6 @@ config SYS_HAS_CPU_LOONGSON2F
 	bool
 	select CPU_SUPPORTS_CPUFREQ
 	select CPU_SUPPORTS_ADDRWINCFG if 64BIT
-	select CPU_SUPPORTS_UNCACHED_ACCELERATED
 
 config SYS_HAS_CPU_LOONGSON1B
 	bool
@@ -2143,8 +2142,6 @@ config CPU_SUPPORTS_ADDRWINCFG
 config CPU_SUPPORTS_HUGEPAGES
 	bool
 	depends on !(32BIT && (ARCH_PHYS_ADDR_T_64BIT || EVA))
-config CPU_SUPPORTS_UNCACHED_ACCELERATED
-	bool
 config MIPS_PGD_C0_CONTEXT
 	bool
 	default y if 64BIT && (CPU_MIPSR2 || CPU_MIPSR6) && !CPU_XLP
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index f85bd5b15f51..91b89aab1787 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -643,17 +643,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #include <asm-generic/pgtable.h>
 
-/*
- * uncached accelerated TLB map for video memory access
- */
-#ifdef CONFIG_CPU_SUPPORTS_UNCACHED_ACCELERATED
-#define __HAVE_PHYS_MEM_ACCESS_PROT
-
-struct file;
-pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-		unsigned long size, pgprot_t vma_prot);
-#endif
-
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
index 11bf6eefb82a..ae21f1c62baa 100644
--- a/arch/mips/loongson2ef/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -60,61 +60,3 @@ int __uncached_access(struct file *file, unsigned long addr)
 		((addr >= LOONGSON_MMIO_MEM_START) &&
 		 (addr < LOONGSON_MMIO_MEM_END));
 }
-
-#ifdef CONFIG_CPU_SUPPORTS_UNCACHED_ACCELERATED
-
-#include <linux/pci.h>
-#include <linux/sched.h>
-#include <asm/current.h>
-
-static unsigned long uca_start, uca_end;
-
-pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-			      unsigned long size, pgprot_t vma_prot)
-{
-	unsigned long offset = pfn << PAGE_SHIFT;
-	unsigned long end = offset + size;
-
-	if (__uncached_access(file, offset)) {
-		if (uca_start && (offset >= uca_start) &&
-		    (end <= uca_end))
-			return __pgprot((pgprot_val(vma_prot) &
-					 ~_CACHE_MASK) |
-					_CACHE_UNCACHED_ACCELERATED);
-		else
-			return pgprot_noncached(vma_prot);
-	}
-	return vma_prot;
-}
-
-static int __init find_vga_mem_init(void)
-{
-	struct pci_dev *dev = 0;
-	struct resource *r;
-	int idx;
-
-	if (uca_start)
-		return 0;
-
-	for_each_pci_dev(dev) {
-		if ((dev->class >> 16) == PCI_BASE_CLASS_DISPLAY) {
-			for (idx = 0; idx < PCI_NUM_RESOURCES; idx++) {
-				r = &dev->resource[idx];
-				if (!r->start && r->end)
-					continue;
-				if (r->flags & IORESOURCE_IO)
-					continue;
-				if (r->flags & IORESOURCE_MEM) {
-					uca_start = r->start;
-					uca_end = r->end;
-					return 0;
-				}
-			}
-		}
-	}
-
-	return 0;
-}
-
-late_initcall(find_vga_mem_init);
-#endif /* !CONFIG_CPU_SUPPORTS_UNCACHED_ACCELERATED */
-- 
2.20.1

