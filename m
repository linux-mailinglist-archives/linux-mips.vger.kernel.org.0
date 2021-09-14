Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9D440B29A
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 17:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhINPL7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 11:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbhINPL6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 11:11:58 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33D9C061574;
        Tue, 14 Sep 2021 08:10:40 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l18so24517820lji.12;
        Tue, 14 Sep 2021 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+K8MjtcnJXfpNCRFyMCdqNnPKrcaeccqs3rzyDDn0vU=;
        b=IaMh1odM3L3VhmQ1m9aeZoRN0SQqI1qWvuDoZWK+kGl0yYbfmDEi7D0j2oLe14UX2F
         rpjUo3lsxP5Ys1zoUPhUxacNkXBGHhKp/VWLcn3VaR1IZbD/wkmOEHytFa0NiO1XV0aE
         O1GlE5Y2v46M+6SUc2NpFvRok3ihp3e/rfYBP921FLdN2x2npuwD6bPz9uzlrrgVeYu9
         m+iuYgMs/d2E2Nt8Vhc0NLSoGg6tG917T7wzGKqoVsqJs2NYLv7TzW6UM3OszHB4dLXY
         pfJbHa0qySjo55aBIDzrsH27D5ycEHqJnZOlX1euImWJ1nEKFy+itmgG9ixUnlRxJzzs
         +oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+K8MjtcnJXfpNCRFyMCdqNnPKrcaeccqs3rzyDDn0vU=;
        b=BFV0Y4ix7KxmCDmTld3AYB0WBweu1o50z8MQpRjUahhuLKIIBsVEVLv3PCJrUU75Nj
         VwFNjLehPOqmdEWznhHNEvKaaxYideIxsSEcLSe05TGyFu+LfC6E1mrDOVOyX2ZZbq0O
         7/rUVXest3+NSinfEw8axuvyW9uvT8qyIBLiv5YMdbq+dQB+rteL66+E+462Lh+jhWVy
         sxsFIgUW9kgYipCaNQDS5aseG2qyIZVQXuyGp873+dtbQcBcvSoVZ+JIHq+6X+ZEdXfq
         ymyJN1+7XrjGd2HqY2U0O9338zORiWHzy3hZdA1AprCvGDORsyiPiLjEd/OCUWJAV0Tp
         nx0g==
X-Gm-Message-State: AOAM531g2q/lZGJZ9hobK79Kkue5wMKLNTUXGY+vFbbWCdTTpa74FQK+
        cQ+Xh/KgCzgTmSJGA3c9YKQ=
X-Google-Smtp-Source: ABdhPJzf6vLVIOTdmCQu5RbgpN6oC/S/5GVuhLuSFjpLP9tVLZKCDmzH0tCMHS1catjmI7HUw5NlUA==
X-Received: by 2002:a05:651c:1410:: with SMTP id u16mr15749408lje.435.1631632239102;
        Tue, 14 Sep 2021 08:10:39 -0700 (PDT)
Received: from localhost ([178.151.124.169])
        by smtp.gmail.com with ESMTPSA id z13sm1380486ljo.37.2021.09.14.08.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 08:10:38 -0700 (PDT)
From:   Roman Skakun <rm.skakun@gmail.com>
X-Google-Original-From: Roman Skakun <Roman_Skakun@epam.com>
To:     xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc:     Roman Skakun <rm.skakun@gmail.com>,
        Andrii Anisov <andrii_anisov@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH] swiotlb: set IO TLB segment size via cmdline
Date:   Tue, 14 Sep 2021 18:10:11 +0300
Message-Id: <20210914151016.3174924-1-Roman_Skakun@epam.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Roman Skakun <roman_skakun@epam.com>

It is possible when default IO TLB size is not
enough to fit a long buffers as described here [1].

This patch makes a way to set this parameter
using cmdline instead of recompiling a kernel.

[1] https://www.xilinx.com/support/answers/72694.html

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +-
 arch/mips/cavium-octeon/dma-octeon.c          |  2 +-
 arch/powerpc/platforms/pseries/svm.c          |  2 +-
 drivers/xen/swiotlb-xen.c                     |  7 +--
 include/linux/swiotlb.h                       |  1 +
 kernel/dma/swiotlb.c                          | 51 ++++++++++++++-----
 6 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..f842a523a485 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5558,8 +5558,9 @@
 			it if 0 is given (See Documentation/admin-guide/cgroup-v1/memory.rst)
 
 	swiotlb=	[ARM,IA-64,PPC,MIPS,X86]
-			Format: { <int> | force | noforce }
-			<int> -- Number of I/O TLB slabs
+			Format: { <slabs> [,<io_tlb_segment_size>] [,force | noforce]​ }
+			<slabs> -- Number of I/O TLB slabs
+			<io_tlb_segment_size> -- Max IO TLB segment size
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
 			noforce -- Never use bounce buffers (for debugging)
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index df70308db0e6..446c73bc936e 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -237,7 +237,7 @@ void __init plat_swiotlb_setup(void)
 		swiotlbsize = 64 * (1<<20);
 #endif
 	swiotlb_nslabs = swiotlbsize >> IO_TLB_SHIFT;
-	swiotlb_nslabs = ALIGN(swiotlb_nslabs, IO_TLB_SEGSIZE);
+	swiotlb_nslabs = ALIGN(swiotlb_nslabs, swiotlb_io_seg_size());
 	swiotlbsize = swiotlb_nslabs << IO_TLB_SHIFT;
 
 	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 87f001b4c4e4..2a1f09c722ac 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -47,7 +47,7 @@ void __init svm_swiotlb_init(void)
 	unsigned long bytes, io_tlb_nslabs;
 
 	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	io_tlb_nslabs = ALIGN(io_tlb_nslabs, swiotlb_io_seg_size());
 
 	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 643fe440c46e..0fc9c6cb6815 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -110,12 +110,13 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	int dma_bits;
 	dma_addr_t dma_handle;
 	phys_addr_t p = virt_to_phys(buf);
+	unsigned long tlb_segment_size = swiotlb_io_seg_size();
 
-	dma_bits = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT) + PAGE_SHIFT;
+	dma_bits = get_order(tlb_segment_size << IO_TLB_SHIFT) + PAGE_SHIFT;
 
 	i = 0;
 	do {
-		int slabs = min(nslabs - i, (unsigned long)IO_TLB_SEGSIZE);
+		int slabs = min(nslabs - i, (unsigned long)tlb_segment_size);
 
 		do {
 			rc = xen_create_contiguous_region(
@@ -153,7 +154,7 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 	return "";
 }
 
-#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
+#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, swiotlb_io_seg_size())
 
 int __ref xen_swiotlb_init(void)
 {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b0cb2a9973f4..35c3ffeda9fa 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -59,6 +59,7 @@ void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_addr,
 		size_t size, enum dma_data_direction dir);
 dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
+unsigned long swiotlb_io_seg_size(void);
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87c40517e822..6b505206fc13 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -72,6 +72,11 @@ enum swiotlb_force swiotlb_force;
 
 struct io_tlb_mem io_tlb_default_mem;
 
+/*
+ * Maximum IO TLB segment size.
+ */
+static unsigned long io_tlb_seg_size = IO_TLB_SEGSIZE;
+
 /*
  * Max segment that we can provide which (if pages are contingous) will
  * not be bounced (unless SWIOTLB_FORCE is set).
@@ -81,15 +86,30 @@ static unsigned int max_segment;
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 
 static int __init
-setup_io_tlb_npages(char *str)
+setup_io_tlb_params(char *str)
 {
+	unsigned long tmp;
+
 	if (isdigit(*str)) {
-		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		default_nslabs =
-			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+		default_nslabs = simple_strtoul(str, &str, 0);
 	}
 	if (*str == ',')
 		++str;
+
+	/* get max IO TLB segment size */
+	if (isdigit(*str)) {
+		tmp = simple_strtoul(str, &str, 0);
+		if (tmp)
+			io_tlb_seg_size = ALIGN(tmp, IO_TLB_SEGSIZE);
+	}
+	if (*str == ',')
+		++str;
+
+	/* update io_tlb_nslabs after applying a new segment size and
+	 * avoid tail segment of size < IO TLB segment size
+	 */
+	default_nslabs = ALIGN(default_nslabs, io_tlb_seg_size);
+
 	if (!strcmp(str, "force"))
 		swiotlb_force = SWIOTLB_FORCE;
 	else if (!strcmp(str, "noforce"))
@@ -97,7 +117,7 @@ setup_io_tlb_npages(char *str)
 
 	return 0;
 }
-early_param("swiotlb", setup_io_tlb_npages);
+early_param("swiotlb", setup_io_tlb_params);
 
 unsigned int swiotlb_max_segment(void)
 {
@@ -118,6 +138,11 @@ unsigned long swiotlb_size_or_default(void)
 	return default_nslabs << IO_TLB_SHIFT;
 }
 
+unsigned long swiotlb_io_seg_size(void)
+{
+	return io_tlb_seg_size;
+}
+
 void __init swiotlb_adjust_size(unsigned long size)
 {
 	/*
@@ -128,7 +153,7 @@ void __init swiotlb_adjust_size(unsigned long size)
 	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
 		return;
 	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, io_tlb_seg_size);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }
 
@@ -147,7 +172,7 @@ void swiotlb_print_info(void)
 
 static inline unsigned long io_tlb_offset(unsigned long val)
 {
-	return val & (IO_TLB_SEGSIZE - 1);
+	return val & (io_tlb_seg_size - 1);
 }
 
 static inline unsigned long nr_slots(u64 val)
@@ -192,7 +217,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
-		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->slots[i].list = io_tlb_seg_size - io_tlb_offset(i);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
 	}
@@ -261,7 +286,7 @@ int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
 	unsigned long nslabs =
-		ALIGN(default_size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+		ALIGN(default_size >> IO_TLB_SHIFT, io_tlb_seg_size);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
 	unsigned int order;
@@ -522,7 +547,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
 	}
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
+	     io_tlb_offset(i) != io_tlb_seg_size - 1 &&
 	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
 
@@ -600,7 +625,7 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * with slots below and above the pool being returned.
 	 */
 	spin_lock_irqsave(&mem->lock, flags);
-	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
+	if (index + nslots < ALIGN(index + 1, io_tlb_seg_size))
 		count = mem->slots[index + nslots].list;
 	else
 		count = 0;
@@ -620,7 +645,7 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * available (non zero)
 	 */
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
+	     io_tlb_offset(i) != io_tlb_seg_size - 1 && mem->slots[i].list;
 	     i--)
 		mem->slots[i].list = ++count;
 	mem->used -= nslots;
@@ -698,7 +723,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 
 size_t swiotlb_max_mapping_size(struct device *dev)
 {
-	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
+	return ((size_t)IO_TLB_SIZE) * io_tlb_seg_size;
 }
 
 bool is_swiotlb_active(struct device *dev)
-- 
2.27.0

