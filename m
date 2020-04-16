Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5215E1AC7ED
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438050AbgDPPBD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 11:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2403889AbgDPPA2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 11:00:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C4CC061A0C;
        Thu, 16 Apr 2020 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=S0lIA/D9gWt+6MqKJrlRkinxSTiEVCtRIMKBgvJLedI=; b=Si6uZPZUbDHGlBY5mkbWjCVGBd
        jglpePYA50qRA1C1wIQF7wBC6rfGW9kABZExjbw05bHrjG8E2uBa7NDTkNvN2h1Vm4KbVYIMBHc7X
        cRED0+2gKFimxeLSvZdsZke6bECcTrw9DyFTn3SjbGX4QSmzDpPy1wv8EpwFoZYEuz3NC1K/qUdyG
        7R69JT0XFJ3VHvkLvnAT0RB41/r9CX18b6SoQHxNug6rZQGp45Ng37dT4Qes3BD0AcfdG+54Bhyfk
        3ZOBpunhAmTl7q9t31HGl3s6R+rf5ZfAi49sGr9/g9qSanaAto8j4JGMP4v8FOystoeEd/oJbpu+s
        i5eQ1zGg==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jP60A-0002Nn-Bc; Thu, 16 Apr 2020 15:00:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 5/7] MIPS: split out the 64-bit ioremap implementation
Date:   Thu, 16 Apr 2020 17:00:09 +0200
Message-Id: <20200416150011.820984-6-hch@lst.de>
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

