Return-Path: <linux-mips+bounces-11575-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC54BA7385
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBFC17A28FE
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B00323D7E5;
	Sun, 28 Sep 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLl/BjLp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311AD23183F;
	Sun, 28 Sep 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759071787; cv=none; b=c83JWQ0QD+KdGp2A7swiK8vAgBwGGYXEm0jeqAmsh7VoF9zzFmpth1MSUF2wYlJqBvmAB8YFmbNkNVf40AqC/4xRB6wkC2BN4RatilcsJcxCUJKp6qgb/S0RIVTExMVcrN3w51NrnJGBRMR66AVqX90hIHg7Ol+aw4kEhIV4Ue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759071787; c=relaxed/simple;
	bh=4MEtXfdS28rAh2K80VhDxfAqakr0Nc2oB0/xCEv8vjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVUO0mtZlT0KI2kF0lju/eeTPQ6yjElh9vmOw6PhqJTFOpAGRj3JJkabTxnxUeX+OmoBJWlIV+1rnywoT84KeKTh6ExBWkU6G/CkeAnxn6QDPw7orGGr6LXc063qS1EX4iNH7tWqulFo4w2NMh1aBiEtB11HVoEThcKVGaabrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLl/BjLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E28C4CEF0;
	Sun, 28 Sep 2025 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071786;
	bh=4MEtXfdS28rAh2K80VhDxfAqakr0Nc2oB0/xCEv8vjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLl/BjLpSDt9SBh2norJcU2F46F/r6g6h87RuQBYkoAGcZPnCd215FCQzpvgxERCA
	 JoAcWDlpaaGMBeilORD02wS46EGf5rRgJdiyxnTdl/dSUOOThvXNKsn2RYd2BOpQtn
	 z6ab9Oz6SBGmGCyKrwpxkOF/E4FINpdFsv5bLV9vRy30LirIChJsKF36dmPdg/bAIF
	 IwPNo8c23EdJkconmObCTIOoESZ2J20hDLi0fpZt7g0Y3Geyi0wHUvkyVUleo7ZhH3
	 UGMgKulTpskho2dGEbm7PUSwJmGYxd5S4PBVSl8pNrZ4ST3LrqqCETAWzyt5QLfi+Q
	 4J6w++XMD0tWg==
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
Subject: [PATCH v1 8/9] xen: swiotlb: Convert mapping routine to rely on physical address
Date: Sun, 28 Sep 2025 18:02:28 +0300
Message-ID: <573fbadd743851838a91a8dbc84b4506cea2192c.1759071169.git.leon@kernel.org>
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

Switch to .map_phys callback instead of .map_page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/grant-dma-ops.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 29257d2639db..7f76e516fe24 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -163,18 +163,22 @@ static void xen_grant_dma_free_pages(struct device *dev, size_t size,
 	xen_grant_dma_free(dev, size, page_to_virt(vaddr), dma_handle, 0);
 }
 
-static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
-					 unsigned long offset, size_t size,
+static dma_addr_t xen_grant_dma_map_phys(struct device *dev, phys_addr_t phys,
+					 size_t size,
 					 enum dma_data_direction dir,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
+	unsigned long offset = offset_in_page(phys);
 	unsigned long dma_offset = xen_offset_in_page(offset),
 			pfn_offset = XEN_PFN_DOWN(offset);
 	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
 	if (WARN_ON(dir == DMA_NONE))
 		return DMA_MAPPING_ERROR;
 
@@ -190,7 +194,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 
 	for (i = 0; i < n_pages; i++) {
 		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
-				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
+				pfn_to_gfn(page_to_xen_pfn(phys_to_page(phys)) + i + pfn_offset),
 				dir == DMA_TO_DEVICE);
 	}
 
@@ -199,7 +203,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 	return dma_handle;
 }
 
-static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void xen_grant_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
@@ -242,7 +246,7 @@ static void xen_grant_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		xen_grant_dma_unmap_page(dev, s->dma_address, sg_dma_len(s), dir,
+		xen_grant_dma_unmap_phys(dev, s->dma_address, sg_dma_len(s), dir,
 				attrs);
 }
 
@@ -257,7 +261,7 @@ static int xen_grant_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		return -EINVAL;
 
 	for_each_sg(sg, s, nents, i) {
-		s->dma_address = xen_grant_dma_map_page(dev, sg_page(s), s->offset,
+		s->dma_address = xen_grant_dma_map_phys(dev, sg_phys(s),
 				s->length, dir, attrs);
 		if (s->dma_address == DMA_MAPPING_ERROR)
 			goto out;
@@ -286,8 +290,8 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.free_pages = xen_grant_dma_free_pages,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
-	.map_page = xen_grant_dma_map_page,
-	.unmap_page = xen_grant_dma_unmap_page,
+	.map_phys = xen_grant_dma_map_phys,
+	.unmap_phys = xen_grant_dma_unmap_phys,
 	.map_sg = xen_grant_dma_map_sg,
 	.unmap_sg = xen_grant_dma_unmap_sg,
 	.dma_supported = xen_grant_dma_supported,
-- 
2.51.0


