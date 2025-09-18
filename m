Return-Path: <linux-mips+bounces-11515-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91173B86800
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 20:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37B5F6274B6
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 18:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012642FDC59;
	Thu, 18 Sep 2025 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJjcqkji"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5C2D6E4E;
	Thu, 18 Sep 2025 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221157; cv=none; b=XuOClYioD6m6mepIptDJOcZyPAsU/tLD3q5vSdbJRWoNLoixOhfuiI+jpnQekfXL/2EdyErJfsz0t0qXuZUAK//pRz724NQAGtt1tU+yFhb5QM96fBnok9yNKTzMY7NJRu33DW10Iukdt3RcWU+cZGES3azs6h5fjsyJN9m78gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221157; c=relaxed/simple;
	bh=1mDXfVNbsYLo4a+duzDpY85ZUnJWos79Vyrao8w+xkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5qJjcg8coYAJH7x2wDOI2GfVznXabH9S6BUf0ERrrE2PcT/JnAmeY+u1Ipn5MtN4HExAPs73FycFYo1y/jNAe381EweoWANzQsRyKw7edZgdeItd5EPjidi8lUNOFN7EskZIC91Ibjkjk5QPetgu9lcUpmuFiGt2y22pC68KUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJjcqkji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B01C4CEE7;
	Thu, 18 Sep 2025 18:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221157;
	bh=1mDXfVNbsYLo4a+duzDpY85ZUnJWos79Vyrao8w+xkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJjcqkjioeaPHR3oTtovXk7XnK/pd4Dpvt6tqBF2mLVNs5Q4naZBBRjxEELRfi2+Y
	 D4kIQlN6hJhac0eiwI3sASKq7B/5bGRMKu7BFRE0t7mA5u6NXWj4T2DNxp00i+Dz8P
	 CDKvCCa9nHcj0qbtseSusPltdxhIdxKZ4Yl5D4KaZQNkpzvLKwIkvugBIZkuUi+n41
	 sRDjxFx3/OcIdrXVx9M+pcPfgc0XKte5yCfdgAtR79e5ju1JRnVXErNA0tRs33R8Nz
	 1UIUOZkvr968XteLjAHpFkZyPWqxmq1DajIw+0WZAlLFornxw8ZulfpFSWmmyNnZ69
	 l7OvidjZ6KebQ==
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
Subject: [PATCH 7/9] vdpa: Convert to physical address DMA mapping
Date: Thu, 18 Sep 2025 21:45:07 +0300
Message-ID: <517785de56c12927a782b6bc51cc84e06493958d.1758219787.git.leon@kernel.org>
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

Use physical address directly in DMA mapping flow.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vdpa/vdpa_user/iova_domain.c | 11 +++++------
 drivers/vdpa/vdpa_user/iova_domain.h |  8 ++++----
 drivers/vdpa/vdpa_user/vduse_dev.c   | 18 ++++++++++--------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
index 58116f89d8dae..c0ecf01003cd3 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.c
+++ b/drivers/vdpa/vdpa_user/iova_domain.c
@@ -396,17 +396,16 @@ void vduse_domain_sync_single_for_cpu(struct vduse_iova_domain *domain,
 	read_unlock(&domain->bounce_lock);
 }
 
-dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
-				 struct page *page, unsigned long offset,
-				 size_t size, enum dma_data_direction dir,
+dma_addr_t vduse_domain_map_phys(struct vduse_iova_domain *domain,
+				 phys_addr_t pa, size_t size,
+				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
 	struct iova_domain *iovad = &domain->stream_iovad;
 	unsigned long limit = domain->bounce_size - 1;
-	phys_addr_t pa = page_to_phys(page) + offset;
 	dma_addr_t iova = vduse_domain_alloc_iova(iovad, size, limit);
 
-	if (!iova)
+	if (!iova || (attrs & DMA_ATTR_MMIO))
 		return DMA_MAPPING_ERROR;
 
 	if (vduse_domain_init_bounce_map(domain))
@@ -430,7 +429,7 @@ dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
 	return DMA_MAPPING_ERROR;
 }
 
-void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+void vduse_domain_unmap_phys(struct vduse_iova_domain *domain,
 			     dma_addr_t dma_addr, size_t size,
 			     enum dma_data_direction dir, unsigned long attrs)
 {
diff --git a/drivers/vdpa/vdpa_user/iova_domain.h b/drivers/vdpa/vdpa_user/iova_domain.h
index 7f3f0928ec781..7c4546fd856ab 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.h
+++ b/drivers/vdpa/vdpa_user/iova_domain.h
@@ -53,12 +53,12 @@ void vduse_domain_sync_single_for_cpu(struct vduse_iova_domain *domain,
 				      dma_addr_t dma_addr, size_t size,
 				      enum dma_data_direction dir);
 
-dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
-				 struct page *page, unsigned long offset,
-				 size_t size, enum dma_data_direction dir,
+dma_addr_t vduse_domain_map_phys(struct vduse_iova_domain *domain,
+				 phys_addr_t phys, size_t size,
+				 enum dma_data_direction dir,
 				 unsigned long attrs);
 
-void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+void vduse_domain_unmap_phys(struct vduse_iova_domain *domain,
 			     dma_addr_t dma_addr, size_t size,
 			     enum dma_data_direction dir, unsigned long attrs);
 
diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 04620bb77203d..75aa3c9f83fb5 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -834,25 +834,27 @@ static void vduse_dev_sync_single_for_cpu(struct device *dev,
 	vduse_domain_sync_single_for_cpu(domain, dma_addr, size, dir);
 }
 
-static dma_addr_t vduse_dev_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
-				     enum dma_data_direction dir,
+static dma_addr_t vduse_dev_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
 	struct vduse_dev *vdev = dev_to_vduse(dev);
 	struct vduse_iova_domain *domain = vdev->domain;
 
-	return vduse_domain_map_page(domain, page, offset, size, dir, attrs);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return vduse_domain_map_phys(domain, phys, size, dir, attrs);
 }
 
-static void vduse_dev_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void vduse_dev_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
 	struct vduse_dev *vdev = dev_to_vduse(dev);
 	struct vduse_iova_domain *domain = vdev->domain;
 
-	return vduse_domain_unmap_page(domain, dma_addr, size, dir, attrs);
+	return vduse_domain_unmap_phys(domain, dma_addr, size, dir, attrs);
 }
 
 static void *vduse_dev_alloc_coherent(struct device *dev, size_t size,
@@ -896,8 +898,8 @@ static size_t vduse_dev_max_mapping_size(struct device *dev)
 static const struct dma_map_ops vduse_dev_dma_ops = {
 	.sync_single_for_device = vduse_dev_sync_single_for_device,
 	.sync_single_for_cpu = vduse_dev_sync_single_for_cpu,
-	.map_page = vduse_dev_map_page,
-	.unmap_page = vduse_dev_unmap_page,
+	.map_phys = vduse_dev_map_phys,
+	.unmap_phys = vduse_dev_unmap_phys,
 	.alloc = vduse_dev_alloc_coherent,
 	.free = vduse_dev_free_coherent,
 	.max_mapping_size = vduse_dev_max_mapping_size,
-- 
2.51.0


