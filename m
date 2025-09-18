Return-Path: <linux-mips+bounces-11517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36746B86806
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 20:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B47DB6249EC
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 18:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF648302174;
	Thu, 18 Sep 2025 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrF4UB5v"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD502D8DCF;
	Thu, 18 Sep 2025 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221167; cv=none; b=Ekd55Nx2kscjeqPN5MfJKErHtYu80lZKNDy6swjcEYQP/425dzbviOKLBPKw5A/hXYY6Dq+9ks9eOL3SkmfO1lwjGlvpnCfPRBHYjRy4Rs6/3aHndLkyzvW8Idfd7uRh3fP6DbhZj6T7ZiJK3m3cMdbzMxX6ucU7rgZ+A1s6lbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221167; c=relaxed/simple;
	bh=3bqXOAYctDiXe+OCMHlitClbfEhC7Di6QPs9FEZ1pPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leI/0ZsDmp513dEv4Ux8F4GOm83SqdxqodDTbHw5txl5zDSfZVZRcEi7HDbroKJibw20fz7BBnzDq/o8W7LJE4trZYPQjkIrPGWHWcNondxAGEKOnzwLnGuUFnq98jt/jRh4uU6o21cZo4TrLPESgHSiDeJ6R87zQ+W9zoiymHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrF4UB5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE03FC4CEE7;
	Thu, 18 Sep 2025 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221167;
	bh=3bqXOAYctDiXe+OCMHlitClbfEhC7Di6QPs9FEZ1pPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrF4UB5vNiS1ar6EQULnP2g8xHqnzBBCJmALQvRpfCCwMERikovmxa5qLdv90lwcz
	 ISbg/kGE2Tx15VZG2vdkPFE7TQRrtuhFvEA4HHp4uvvjl43WFlncTqgHCP9W8wX6U0
	 xkIrRlvfY93G0GJ6rLphYBdU4/P5Y3W5660GWNxfdMbw9xHyNKR5bspM/f6LGlmcb0
	 udD+iUQiHebDEBJeOzgdkD6z4qs8pqG/CD7tfwkbjzQ863aDbZfxl2ejEdBKmr2Eva
	 UOsKQLShS++Ltzx7J/LCHkdw5NkgqooNDn4P7ThMastTfrzbD5CblRWK/tnQFtzeWT
	 PGzH6N+KD8OlA==
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
Subject: [PATCH 9/9] dma-mapping: remove unused map_page callback
Date: Thu, 18 Sep 2025 21:45:09 +0300
Message-ID: <d55dbd258a5582aff0bc40771099cad594600469.1758219787.git.leon@kernel.org>
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

After conversion of arch code to use physical address mapping,
there are no users of .map_page() and .unmap_page() callbacks,
so let's remove them.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  7 -------
 kernel/dma/mapping.c        | 12 ------------
 kernel/dma/ops_helpers.c    |  8 +-------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a2ec1566aa270..e0a78991fa8a3 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -31,13 +31,6 @@ struct dma_map_ops {
 			void *cpu_addr, dma_addr_t dma_addr, size_t size,
 			unsigned long attrs);
 
-	dma_addr_t (*map_page)(struct device *dev, struct page *page,
-			unsigned long offset, size_t size,
-			enum dma_data_direction dir, unsigned long attrs);
-	void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-
 	dma_addr_t (*map_phys)(struct device *dev, phys_addr_t phys,
 			size_t size, enum dma_data_direction dir,
 			unsigned long attrs);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 32a85bfdf873a..37163eb49f9fa 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -171,16 +171,6 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (!is_mmio && ops->map_page) {
-		struct page *page = phys_to_page(phys);
-		size_t offset = offset_in_page(phys);
-
-		/*
-		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory.
-		 */
-		addr = ops->map_page(dev, page, offset, size, dir, attrs);
-	}
 
 	if (!is_mmio)
 		kmsan_handle_dma(phys, size, dir);
@@ -222,8 +212,6 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else
-		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);
 }
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 1eccbdbc99c1e..20caf9cabf699 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -76,11 +76,8 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	if (use_dma_iommu(dev))
 		*dma_handle = iommu_dma_map_phys(dev, phys, size, dir,
 						 DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->map_phys)
-		*dma_handle = ops->map_phys(dev, phys, size, dir,
-					    DMA_ATTR_SKIP_CPU_SYNC);
 	else
-		*dma_handle = ops->map_page(dev, page, 0, size, dir,
+		*dma_handle = ops->map_phys(dev, phys, size, dir,
 					    DMA_ATTR_SKIP_CPU_SYNC);
 	if (*dma_handle == DMA_MAPPING_ERROR) {
 		dma_free_contiguous(dev, page, size);
@@ -102,8 +99,5 @@ void dma_common_free_pages(struct device *dev, size_t size, struct page *page,
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, dma_handle, size, dir,
 				DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->unmap_page)
-		ops->unmap_page(dev, dma_handle, size, dir,
-				DMA_ATTR_SKIP_CPU_SYNC);
 	dma_free_contiguous(dev, page, size);
 }
-- 
2.51.0


