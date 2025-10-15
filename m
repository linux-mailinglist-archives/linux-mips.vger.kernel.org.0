Return-Path: <linux-mips+bounces-11733-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16419BDDB20
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 11:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA4EF5033F3
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 09:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A8631BC84;
	Wed, 15 Oct 2025 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9yhFgPg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF00C31B83A;
	Wed, 15 Oct 2025 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519627; cv=none; b=ka8crxqR+3IsQtPWfpp2B2yvezOsoCaxNmu9YPi5mbfGkfDG52ANBgy/F1xabZwAA53aYnfwWN3Y4BnpdEgWdHqdDZxx1JIeQRoIhJCBHUP2/aS4NUwF7xjktaSqa8qJWhmfNAfuvgmAQiX54mQshAxHgQNVz+V6kvKpWAwdJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519627; c=relaxed/simple;
	bh=zzQXTsnLOGdg76KODINeBFjFs4FSyl4KUo2bG+1GZ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3wtPFqA9+FOVrXRwyV/Y8m9NQa4+wIde8YipscNQr4n0uEhKrs2Z5IvnXTdjprBhAgEoEJv+QmOSVeKvHVR0xoIX0YqJBUCKV9TTsDHHaofMERqMCfJeUM3cGYH88ssGXmRGwHS867SM+XcEuaV0aY99XuPFjtdv1ZxOD+Ic5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9yhFgPg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25B0C4CEF8;
	Wed, 15 Oct 2025 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519627;
	bh=zzQXTsnLOGdg76KODINeBFjFs4FSyl4KUo2bG+1GZ8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9yhFgPgwpVs4tFWOcDRtxYhD6QBmPU5x7MeRpM5LRrV4SFruJeJ2VKVX1hlNzzev
	 RKyxdFpLxe4VxNNS1i19yVfZuvwnTr6N7nozN8QELaDHuFUcpL3uFe4KZ9kZ1Qo5T8
	 lVSnqYkJQXMvInE6HUFHqyIlw2YQz+CdLBulm6tyKPsu65Y3ehdRM9odQAFkbpL0un
	 x1cqSGLjI8L3B3I3mxWUVA6cdGriTZNj1DPjR0stP3cP9PiCRwc932+lC3wrCrzzgD
	 ghjh1wbCy4td07EhnhZgJCk7Oroyhryf2f0kU1EDufHOl+tbg2mWKnvNf9h0EXS+Ck
	 7KY0MmP16+Uvg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 12/14] x86: Use physical address for DMA mapping
Date: Wed, 15 Oct 2025 12:12:58 +0300
Message-ID: <20251015-remove-map-page-v5-12-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Perform mechanical conversion from DMA .map_page to .map_phys.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/x86/kernel/amd_gart_64.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5..93a06307d953 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -222,13 +222,14 @@ static dma_addr_t dma_map_area(struct device *dev, dma_addr_t phys_mem,
 }
 
 /* Map a single area into the IOMMU */
-static dma_addr_t gart_map_page(struct device *dev, struct page *page,
-				unsigned long offset, size_t size,
-				enum dma_data_direction dir,
+static dma_addr_t gart_map_phys(struct device *dev, phys_addr_t paddr,
+				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
 	unsigned long bus;
-	phys_addr_t paddr = page_to_phys(page) + offset;
+
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
 
 	if (!need_iommu(dev, paddr, size))
 		return paddr;
@@ -242,7 +243,7 @@ static dma_addr_t gart_map_page(struct device *dev, struct page *page,
 /*
  * Free a DMA mapping.
  */
-static void gart_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void gart_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 			    size_t size, enum dma_data_direction dir,
 			    unsigned long attrs)
 {
@@ -282,7 +283,7 @@ static void gart_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 	for_each_sg(sg, s, nents, i) {
 		if (!s->dma_length || !s->length)
 			break;
-		gart_unmap_page(dev, s->dma_address, s->dma_length, dir, 0);
+		gart_unmap_phys(dev, s->dma_address, s->dma_length, dir, 0);
 	}
 }
 
@@ -487,7 +488,7 @@ static void
 gart_free_coherent(struct device *dev, size_t size, void *vaddr,
 		   dma_addr_t dma_addr, unsigned long attrs)
 {
-	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
+	gart_unmap_phys(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
 	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
 }
 
@@ -668,8 +669,8 @@ static __init int init_amd_gatt(struct agp_kern_info *info)
 static const struct dma_map_ops gart_dma_ops = {
 	.map_sg				= gart_map_sg,
 	.unmap_sg			= gart_unmap_sg,
-	.map_page			= gart_map_page,
-	.unmap_page			= gart_unmap_page,
+	.map_phys			= gart_map_phys,
+	.unmap_phys			= gart_unmap_phys,
 	.alloc				= gart_alloc_coherent,
 	.free				= gart_free_coherent,
 	.mmap				= dma_common_mmap,

-- 
2.51.0


