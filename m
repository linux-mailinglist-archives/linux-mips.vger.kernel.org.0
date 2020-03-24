Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F97C191618
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 17:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgCXQT7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 12:19:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55510 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCXQT7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 12:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=S0lIA/D9gWt+6MqKJrlRkinxSTiEVCtRIMKBgvJLedI=; b=OciYbK/IlASgDILE7n0ioDsgqy
        7AGIivU04MyeYUvwoS471vq7KpdJ/tp76SH/613gs2qaShr8lUBu4Tz+CnwjdRkw/MsVC4HK2TPrJ
        USeIHucirJuZlYcZQxItpL/a/clLG9oa9cDcQDOAFWZ9DudAg2MfnA8iFF9fTaQC+Ano5cH20bVzk
        tqmN/v8KfA9uvCpy2tjrvlJse0u+GyiAWpOCc1qLbk9iCiQUQSZOE+seob0uyVMyh4hxUrmWObjsy
        dV+uvzZEH4MLiwkGraD3Ww9b3B3vgLFIkuqC8iLZyfjkdcWrtxRKMKxhO8auI3K+6BVTWuwbuGq5w
        xKuqGBWQ==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmHW-0003Gq-Rs; Tue, 24 Mar 2020 16:19:59 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] MIPS: split out the 64-bit ioremap implementation
Date:   Tue, 24 Mar 2020 17:15:23 +0100
Message-Id: <20200324161525.754181-5-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324161525.754181-1-hch@lst.de>
References: <20200324161525.754181-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Split out the mips64 ioremap implementation entirely, as it will never use
page table based remapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/io.h | 65 ++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 60513250f8f8..f007571e036d 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -153,6 +153,25 @@ static inline void *isa_bus_to_virt(unsigned long address)
  */
 #define page_to_phys(page)	((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
 
+#ifdef CONFIG_64BIT
+static inline void __iomem *ioremap_prot(phys_addr_t offset,
+		unsigned long size, unsigned long prot_val)
+{
+	unsigned long flags = prot_val & _CACHE_MASK;
+	u64 base = (flags == _CACHE_UNCACHED ? IO_BASE : UNCAC_BASE);
+	void __iomem *addr;
+
+	addr = plat_ioremap(offset, size, flags);
+	if (!addr)
+		addr = (void __iomem *)(unsigned long)(base + offset);
+	return addr;
+}
+
+static inline void iounmap(const volatile void __iomem *addr)
+{
+	plat_iounmap(addr);
+}
+#else /* CONFIG_64BIT */
 extern void __iomem * __ioremap(phys_addr_t offset, phys_addr_t size, unsigned long flags);
 extern void __iounmap(const volatile void __iomem *addr);
 
@@ -174,18 +193,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
 
 #define __IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
 
-	if (IS_ENABLED(CONFIG_64BIT)) {
-		u64 base = UNCAC_BASE;
-
-		/*
-		 * R10000 supports a 2 bit uncached attribute therefore
-		 * UNCAC_BASE may not equal IO_BASE.
-		 */
-		if (flags == _CACHE_UNCACHED)
-			base = (u64) IO_BASE;
-		return (void __iomem *) (unsigned long) (base + offset);
-	} else if (__builtin_constant_p(offset) &&
-		   __builtin_constant_p(size) && __builtin_constant_p(flags)) {
+	if (__builtin_constant_p(offset) &&
+	    __builtin_constant_p(size) && __builtin_constant_p(flags)) {
 		phys_addr_t phys_addr, last_addr;
 
 		phys_addr = fixup_bigphys_addr(offset, size);
@@ -210,6 +219,22 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
 #undef __IS_LOW512
 }
 
+static inline void iounmap(const volatile void __iomem *addr)
+{
+	if (plat_iounmap(addr))
+		return;
+
+#define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
+
+	if (__builtin_constant_p(addr) && __IS_KSEG1(addr))
+		return;
+
+	__iounmap(addr);
+
+#undef __IS_KSEG1
+}
+#endif /* !CONFIG_64BIT */
+
 /*
  * ioremap     -   map bus memory into CPU space
  * @offset:    bus address of the memory
@@ -264,22 +289,6 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
 #define ioremap_wc(offset, size)					\
 	ioremap_prot((offset), (size), boot_cpu_data.writecombine)
 
-static inline void iounmap(const volatile void __iomem *addr)
-{
-	if (plat_iounmap(addr))
-		return;
-
-#define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
-
-	if (IS_ENABLED(CONFIG_64BIT) ||
-	    (__builtin_constant_p(addr) && __IS_KSEG1(addr)))
-		return;
-
-	__iounmap(addr);
-
-#undef __IS_KSEG1
-}
-
 #if defined(CONFIG_CPU_CAVIUM_OCTEON) || defined(CONFIG_CPU_LOONGSON64)
 #define war_io_reorder_wmb()		wmb()
 #else
-- 
2.25.1

