Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24C7191617
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 17:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgCXQT5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 12:19:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55478 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCXQT5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 12:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=hWBzE7+Ma89SOv/SxY3UdWgMQO5IxVxE22FLaZEKh/I=; b=L33QL+FC6OUtXe/Qh46Prloa5b
        lLkZ6Ka3AxwHJu22+ZmBfRkwiKA6Cz8EJJzIvTqIQnwXHBHKb+J/gzj7DILgquMOgdhJuMbEu0UBh
        DzczfY2x82db+KHQ2P82uOBjljl1KlHb7hUi8U2lO12oH/GwWRZSpOleZzm8EpWFH4qe/6pSPzl6O
        0IyWoemmFV2lFqm9lS2IrNc1Bsqqr0mOtn3zBvM52/Xy4nC66wks2vGQzyQ5X6Vj000HzbYjtaDdi
        jd5YaXNSgE35IIRa6y4WL4c0QEwN1BZEtwWxv2LLxFufeIrAWLiepC4XPVRThZDq9lHZCxDsBYKco
        SuicTaWQ==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmHU-0003Ft-EK; Tue, 24 Mar 2020 16:19:56 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] MIPS: merge __ioremap_mode into ioremap_prot
Date:   Tue, 24 Mar 2020 17:15:22 +0100
Message-Id: <20200324161525.754181-4-hch@lst.de>
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

There is no reason to have two ioremap with flags interfaces.  Merge
the historic mips __ioremap_mode into ioremap_prot which is a generic
kernel interface.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/io.h | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 7be323ed2bfd..60513250f8f8 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -156,9 +156,17 @@ static inline void *isa_bus_to_virt(unsigned long address)
 extern void __iomem * __ioremap(phys_addr_t offset, phys_addr_t size, unsigned long flags);
 extern void __iounmap(const volatile void __iomem *addr);
 
-static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long size,
-	unsigned long flags)
+/*
+ * ioremap_prot     -   map bus memory into CPU space
+ * @offset:    bus address of the memory
+ * @size:      size of the resource to map
+
+ * ioremap_prot gives the caller control over cache coherency attributes (CCA)
+ */
+static inline void __iomem *ioremap_prot(phys_addr_t offset,
+		unsigned long size, unsigned long prot_val)
 {
+	unsigned long flags = prot_val & _CACHE_MASK;
 	void __iomem *addr = plat_ioremap(offset, size, flags);
 
 	if (addr)
@@ -202,18 +210,6 @@ static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long si
 #undef __IS_LOW512
 }
 
-/*
- * ioremap_prot     -   map bus memory into CPU space
- * @offset:    bus address of the memory
- * @size:      size of the resource to map
-
- * ioremap_prot gives the caller control over cache coherency attributes (CCA)
- */
-static inline void __iomem *ioremap_prot(phys_addr_t offset,
-		unsigned long size, unsigned long prot_val) {
-	return __ioremap_mode(offset, size, prot_val & _CACHE_MASK);
-}
-
 /*
  * ioremap     -   map bus memory into CPU space
  * @offset:    bus address of the memory
@@ -226,7 +222,7 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
  * address.
  */
 #define ioremap(offset, size)						\
-	__ioremap_mode((offset), (size), _CACHE_UNCACHED)
+	ioremap_prot((offset), (size), _CACHE_UNCACHED)
 #define ioremap_uc		ioremap
 
 /*
@@ -245,7 +241,7 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
  * memory-like regions on I/O busses.
  */
 #define ioremap_cache(offset, size)					\
-	__ioremap_mode((offset), (size), _page_cachable_default)
+	ioremap_prot((offset), (size), _page_cachable_default)
 
 /*
  * ioremap_wc     -   map bus memory into CPU space
@@ -266,7 +262,7 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
  * _CACHE_UNCACHED option (see cpu_probe() method).
  */
 #define ioremap_wc(offset, size)					\
-	__ioremap_mode((offset), (size), boot_cpu_data.writecombine)
+	ioremap_prot((offset), (size), boot_cpu_data.writecombine)
 
 static inline void iounmap(const volatile void __iomem *addr)
 {
-- 
2.25.1

