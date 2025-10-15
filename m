Return-Path: <linux-mips+bounces-11727-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0CBDDAB7
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 11:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95CBE580641
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 09:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1766631A804;
	Wed, 15 Oct 2025 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiSeBjBU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E530BBAB;
	Wed, 15 Oct 2025 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519606; cv=none; b=gj3SqWW1r+g9W8l0EDhADlRhuyK0ku2h5+ED044Z4NMaGTFEuKmoMH49cFMxxnPdWTXbIS5OIfwYTUb+r55rTZ9Z3ax3eaVN+MVdr3z1lTFIjXEX0zBWLIuk3LTj5K6xfX+5KxbjwEdAw76iKmxc0GUCl6izTv+4Q6wjPhB3PJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519606; c=relaxed/simple;
	bh=8N5ZxsYLVcDZve6x5HHk+A1JboM5EKxL5gdSKO7Ns2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=maR3Y82Nzuf7n2nJMGp2zXEyX51u2jX8klrsRcM442BFyPIjMSgdMN20+xSrxy7VGL6GGoNW0jK4arlTihHzfYfI4dODu1hWt1dgGof2DksAEKgdv1Sj4OO+72A68Cn0L7LcNu8dTVZVY9i2X/tcx7vXm8tMijGhpgE4pR9lFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiSeBjBU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6168C4CEF8;
	Wed, 15 Oct 2025 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519606;
	bh=8N5ZxsYLVcDZve6x5HHk+A1JboM5EKxL5gdSKO7Ns2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiSeBjBUKhVwymer3tPYHzwIFC7GJm10nXZ/10XtCNi51kg88RJS1w18W4pvJ7NeM
	 3OwVmb0T1vu2KwfDWjx1io+HgFyPxO0MgtEwlMotfiJ179Y1QgqMPkRKjDJqt5Ao/+
	 VjZfp9uISkci3ImI/5C8oEZdlj4Z+oNMqJTyULPa769DD302IN/VxJv7rJehAO4LNe
	 KeIuGfTQFzyYPb83xzSoo0Sz6I9iQ3Uy0TnyhPQrAye6SrySQGjy96frRmnA4dlk+5
	 xWdb7xuNoLeNJ5dtzrtaGqkyWLhMMmZy2qZFkbs1eHx+/CfxBpfdsutxVsk+ta+jCH
	 50a30dGZYCtdA==
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
Subject: [PATCH v5 06/14] dma-mapping: remove unused mapping resource callbacks
Date: Wed, 15 Oct 2025 12:12:52 +0300
Message-ID: <20251015-remove-map-page-v5-6-3bbfe3a25cdf@kernel.org>
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

After ARM and XEN conversions to use physical addresses for the mapping,
there are no in-kernel users for map_resource/unmap_resource callbacks,
so remove them.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  6 ------
 kernel/dma/mapping.c        | 16 ++++------------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 79d2a74d4b49..2e98ecc313a3 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -53,12 +53,6 @@ struct dma_map_ops {
 			enum dma_data_direction dir, unsigned long attrs);
 	void (*unmap_sg)(struct device *dev, struct scatterlist *sg, int nents,
 			enum dma_data_direction dir, unsigned long attrs);
-	dma_addr_t (*map_resource)(struct device *dev, phys_addr_t phys_addr,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-	void (*unmap_resource)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
 	void (*sync_single_for_cpu)(struct device *dev, dma_addr_t dma_handle,
 			size_t size, enum dma_data_direction dir);
 	void (*sync_single_for_device)(struct device *dev,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 4080aebe5deb..32a85bfdf873 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -157,7 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
-	dma_addr_t addr;
+	dma_addr_t addr = DMA_MAPPING_ERROR;
 
 	BUG_ON(!valid_dma_direction(dir));
 
@@ -171,18 +171,13 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (is_mmio) {
-		if (!ops->map_resource)
-			return DMA_MAPPING_ERROR;
-
-		addr = ops->map_resource(dev, phys, size, dir, attrs);
-	} else {
+	else if (!is_mmio && ops->map_page) {
 		struct page *page = phys_to_page(phys);
 		size_t offset = offset_in_page(phys);
 
 		/*
 		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory, while ops->map_resource() does not.
+		 * kmappable memory.
 		 */
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
 	}
@@ -227,10 +222,7 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else if (is_mmio) {
-		if (ops->unmap_resource)
-			ops->unmap_resource(dev, addr, size, dir, attrs);
-	} else
+	else
 		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);

-- 
2.51.0


