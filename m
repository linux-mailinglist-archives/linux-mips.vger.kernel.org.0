Return-Path: <linux-mips+bounces-11511-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556DB8675E
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 20:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6ACBE4E3681
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 18:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1DF2D6E67;
	Thu, 18 Sep 2025 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmeOm+sq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A62D2397;
	Thu, 18 Sep 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221140; cv=none; b=Xwy0OGKDAQe+aFjAyYRRCDzrWGHafPhDeRtKAh29Yw2truAux9B0COumQDQjTHhHIcTQBszFJP66UyHUQ+msApX/SYo5F35zWXfalVeGouSsycs0XU4HrvpGiL10Dla3kjAcWJpdDIMjBfX/kd5El/2oMw/jdKQHCvfGgyo3cYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221140; c=relaxed/simple;
	bh=lYina26sWVeUcMXQiYVzGEsG3s2F3WRjYogRL1Hc1Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fu4cDBMw5Kk9y9vF4fOi32gF5cS6FjHAxR7Pnfveoe3xMvd0kBXmdRarpWtTAnNmSfrZP42H0Sj7TG88f9gVLqFGvK5omQbftA/8PRcsw1A8hl5+OrAmb9NKtK7MOSbT4ZAGrIeQM4VwYJN7tsHckIJvIj5tx0dSTolyQ8MKjqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmeOm+sq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3E1C4CEE7;
	Thu, 18 Sep 2025 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221139;
	bh=lYina26sWVeUcMXQiYVzGEsG3s2F3WRjYogRL1Hc1Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmeOm+sqpgOPQj79lggvc1K6wpDOki3X4yJuxCb2vpWB7Yrit2zqRh0RiDIvOfhbE
	 evc12i0uWXAtIGkWhu78jwz295HLWPOAaZO6IZ/cviymzjBAJS/z9YITfLbhvXtCFj
	 ky8D8HIF4+CT3b196kV7uzpo4mZHe5HQ3Dm4EG7bvT2H0SCDQYzaGQ0o23uNJgkbi+
	 6aZi+d9itiPvwVg22aSegOmezzgMa5H8zXDrUjIenHJYjuH2xplO3ZAhthDLRLlTV2
	 U0DeJS9SxdDkBapfGs1dH8YVifrYc3iq4bbDeAIVs7BBOR9OCRgcGcxYPk4A43PYIU
	 SJ9lnFSV8Evzw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/9] parisc: Convert DMA map_page to map_phys  interface
Date: Thu, 18 Sep 2025 21:45:03 +0300
Message-ID: <56c4c3b14f46c0a785f196315b673b0b1bcfb3b1.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Perform mechanical conversion from .map_page to .map_phys callback.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/parisc/ccio-dma.c  | 25 +++++++++++++------------
 drivers/parisc/sba_iommu.c | 23 ++++++++++++-----------
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index feef537257d05..d45f3634f8270 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -773,17 +773,18 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 
 
 static dma_addr_t
-ccio_map_page(struct device *dev, struct page *page, unsigned long offset,
-		size_t size, enum dma_data_direction direction,
-		unsigned long attrs)
+ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
+	      enum dma_data_direction direction, unsigned long attrs)
 {
-	return ccio_map_single(dev, page_address(page) + offset, size,
-			direction);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return ccio_map_single(dev, phys_to_virt(phys), size, direction);
 }
 
 
 /**
- * ccio_unmap_page - Unmap an address range from the IOMMU.
+ * ccio_unmap_phys - Unmap an address range from the IOMMU.
  * @dev: The PCI device.
  * @iova: The start address of the DMA region.
  * @size: The length of the DMA region.
@@ -791,7 +792,7 @@ ccio_map_page(struct device *dev, struct page *page, unsigned long offset,
  * @attrs: attributes
  */
 static void 
-ccio_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
+ccio_unmap_phys(struct device *dev, dma_addr_t iova, size_t size,
 		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
@@ -873,7 +874,7 @@ static void
 ccio_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
-	ccio_unmap_page(dev, dma_handle, size, 0, 0);
+	ccio_unmap_phys(dev, dma_handle, size, 0, 0);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 }
 
@@ -1004,7 +1005,7 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 #ifdef CCIO_COLLECT_STATS
 		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
 #endif
-		ccio_unmap_page(dev, sg_dma_address(sglist),
+		ccio_unmap_phys(dev, sg_dma_address(sglist),
 				  sg_dma_len(sglist), direction, 0);
 		++sglist;
 		nents--;
@@ -1017,8 +1018,8 @@ static const struct dma_map_ops ccio_ops = {
 	.dma_supported =	ccio_dma_supported,
 	.alloc =		ccio_alloc,
 	.free =			ccio_free,
-	.map_page =		ccio_map_page,
-	.unmap_page =		ccio_unmap_page,
+	.map_phys =		ccio_map_phys,
+	.unmap_phys =		ccio_unmap_phys,
 	.map_sg =		ccio_map_sg,
 	.unmap_sg =		ccio_unmap_sg,
 	.get_sgtable =		dma_common_get_sgtable,
@@ -1072,7 +1073,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 			   ioc->msingle_calls, ioc->msingle_pages,
 			   (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
 
-		/* KLUGE - unmap_sg calls unmap_page for each mapped page */
+		/* KLUGE - unmap_sg calls unmap_phys for each mapped page */
 		min = ioc->usingle_calls - ioc->usg_calls;
 		max = ioc->usingle_pages - ioc->usg_pages;
 		seq_printf(m, "pci_unmap_single: %8ld calls  %8ld pages (avg %d/1000)\n",
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index fc3863c09f83d..8040aa4e6ff42 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -778,17 +778,18 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 
 
 static dma_addr_t
-sba_map_page(struct device *dev, struct page *page, unsigned long offset,
-		size_t size, enum dma_data_direction direction,
-		unsigned long attrs)
+sba_map_phys(struct device *dev, phys_addr_t phys, size_t size,
+		enum dma_data_direction direction, unsigned long attrs)
 {
-	return sba_map_single(dev, page_address(page) + offset, size,
-			direction);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return sba_map_single(dev, phys_to_virt(phys), size, direction);
 }
 
 
 /**
- * sba_unmap_page - unmap one IOVA and free resources
+ * sba_unmap_phys - unmap one IOVA and free resources
  * @dev: instance of PCI owned by the driver that's asking.
  * @iova:  IOVA of driver buffer previously mapped.
  * @size:  number of bytes mapped in driver buffer.
@@ -798,7 +799,7 @@ sba_map_page(struct device *dev, struct page *page, unsigned long offset,
  * See Documentation/core-api/dma-api-howto.rst
  */
 static void
-sba_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
+sba_unmap_phys(struct device *dev, dma_addr_t iova, size_t size,
 		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
@@ -914,7 +915,7 @@ static void
 sba_free(struct device *hwdev, size_t size, void *vaddr,
 		    dma_addr_t dma_handle, unsigned long attrs)
 {
-	sba_unmap_page(hwdev, dma_handle, size, 0, 0);
+	sba_unmap_phys(hwdev, dma_handle, size, 0, 0);
 	free_pages((unsigned long) vaddr, get_order(size));
 }
 
@@ -1061,7 +1062,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	while (nents && sg_dma_len(sglist)) {
 
-		sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
+		sba_unmap_phys(dev, sg_dma_address(sglist), sg_dma_len(sglist),
 				direction, 0);
 #ifdef SBA_COLLECT_STATS
 		ioc->usg_pages += ((sg_dma_address(sglist) & ~IOVP_MASK) + sg_dma_len(sglist) + IOVP_SIZE - 1) >> PAGE_SHIFT;
@@ -1085,8 +1086,8 @@ static const struct dma_map_ops sba_ops = {
 	.dma_supported =	sba_dma_supported,
 	.alloc =		sba_alloc,
 	.free =			sba_free,
-	.map_page =		sba_map_page,
-	.unmap_page =		sba_unmap_page,
+	.map_phys =		sba_map_phys,
+	.unmap_phys =		sba_unmap_phys,
 	.map_sg =		sba_map_sg,
 	.unmap_sg =		sba_unmap_sg,
 	.get_sgtable =		dma_common_get_sgtable,
-- 
2.51.0


