Return-Path: <linux-mips+bounces-11574-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE2BA736D
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C37DA175363
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BE923C8C7;
	Sun, 28 Sep 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fY7jKenQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65923C506;
	Sun, 28 Sep 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759071783; cv=none; b=p+p7wJfJqswBYn1UmkSxSGkwdbT1Y28L8vrkir5JyumHrIa6Flk2r1qrwR6bMvyre0SzGmQC/8gZEdCXa5CaK2RknfaWIs8BPmbha5rGpVCFxU24r9BthbyvB8EaM/lX4/CUKU9NJNGls7/gcMLUZZkstGHl32Bvm5qQ6eTk9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759071783; c=relaxed/simple;
	bh=Ij0uTy1OlJGAg7lnkUtDmxO01shTBaaj+uIPzSERgrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLDelzh44WUy76Mx/I7cFpskSEvvStfffHRWYHKw7frzqEcF1iJZYB+Iwl1IavLra7JdmAEJoSSM0ZPU47BrX4iBnZEseL5abXGLmsAd0FYdLv3jp4BpJKZJJ8OlX9EUlF/UCRkuQWKX5pG/1s6OpZddDehjm0KeyeGusjJVRc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fY7jKenQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A390C4CEF0;
	Sun, 28 Sep 2025 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071783;
	bh=Ij0uTy1OlJGAg7lnkUtDmxO01shTBaaj+uIPzSERgrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fY7jKenQggaIx2jtjZuB6uQLISTNufTm8rMgGJzO07IYL8vO6GWLJYx3TECVsXMXN
	 wBFOb8xnO78E31d0k727L1YDuVOkZOwLaN14A38UC4OIl5z6NwYopVhauUQgN4uYjd
	 Z1j0Hzf/aow0u91fDEfE2ibxWJkzECaGulmiSQijgWdmZvmBETmsJsFYG01wE9kV2V
	 gMBiAQh0oxrYUoXayv5CaRb11u4XY/2FzJUdgEhJ9m38AxCZiSOdfCYSFId/skTbqm
	 odl03w8FwLQt7lISHmEvTFzKcnJaFoaDlCKkL8sjMV3FOlwH3nlebDL4QRSHUhfx6m
	 R/MlI/Ps05Isg==
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
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 7/9] vdpa: Convert to physical address DMA mapping
Date: Sun, 28 Sep 2025 18:02:27 +0300
Message-ID: <fafaec3eb3830aa726b86ac7b145763c8be25a8a.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
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
index 58116f89d8da..c0ecf01003cd 100644
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
index 7f3f0928ec78..7c4546fd856a 100644
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
index 04620bb77203..75aa3c9f83fb 100644
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


