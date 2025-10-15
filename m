Return-Path: <linux-mips+bounces-11729-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E5BDDAC9
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 11:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CD1550398E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 09:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC93B31AF1F;
	Wed, 15 Oct 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig53rDzt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF531A81A;
	Wed, 15 Oct 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519613; cv=none; b=pzV0OIPkEo3rkGn577I5M3ITky73YagJd4er7OT2nTLqcCEm/nQdOsGKXR7WcBlZRWOcrTloFCCVi9JQfqhKp1GE2nOKEtol+9Vh2PidwadMCI1lK3i4UgaAKXT11Si9SPTm2kagtKXiVWrcIA6eeGSWY3QNTFxLKbOB30wEzLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519613; c=relaxed/simple;
	bh=20pkhPTluVu52SbPzmxmrTfHrn6yEtG7pWga+DsrWIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTR04GzRlVgOFZy5Dkh51SRiw1+43wBAN2XEHxfr6dCxSf3ri1qso233HtMORWudBekmiaSPwbAsWRJrXi9D9RmfIZSRhvWkec/yPTZZCEOxBpnWn/jgwc9oRuZ+5Rppbz2Lve2ZrMQ5FrPPPNIhlSNuDQ4Toa6/OauDzS/eWIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig53rDzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED5FC4CEF9;
	Wed, 15 Oct 2025 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519613;
	bh=20pkhPTluVu52SbPzmxmrTfHrn6yEtG7pWga+DsrWIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ig53rDzt8hiBzZZ+zdzkS7cx6K4XFlPakt74zliZ2VuFOxA/v+TKFBvFTWoou1sUN
	 q53E6CiOe35aym9Eqm8SnAer8W1OFJFVkHe3wWEFH4Ithjt31CpiK1AAPn+wYcvsWw
	 LMgdDn2fvxI1mJluK4lYZ292gEC9pr+xl8CZRpwwmz64D7xTeEPTRhwbKU6VeCcRVk
	 LtLSCMxyCZQlEPmtLI/pgkfz+kbl+r9ceDLpdIznTuwex+mPkjdDZ9f8md8PKxM9C4
	 eroP4W9zJU2vT9cO8vlBtQn8KWZOrYYGD9/qePUDi07GGe7B84+AoJ0M7EyrOLjuu+
	 lNptFD7tgV7qw==
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
Subject: [PATCH v5 08/14] MIPS/jazzdma: Provide physical address directly
Date: Wed, 15 Oct 2025 12:12:54 +0300
Message-ID: <20251015-remove-map-page-v5-8-3bbfe3a25cdf@kernel.org>
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

MIPS jazz uses physical addresses for mapping pages, so convert
it to get them directly from DMA mapping routine.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/mips/jazz/jazzdma.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index c97b089b9902..eb9fb2f2a720 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -521,18 +521,24 @@ static void jazz_dma_free(struct device *dev, size_t size, void *vaddr,
 	__free_pages(virt_to_page(vaddr), get_order(size));
 }
 
-static dma_addr_t jazz_dma_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t jazz_dma_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	phys_addr_t phys = page_to_phys(page) + offset;
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		/*
+		 * This check is included because older versions of the code lacked
+		 * MMIO path support, and my ability to test this path is limited.
+		 * However, from a software technical standpoint, there is no restriction,
+		 * as the following code operates solely on physical addresses.
+		 */
+		return DMA_MAPPING_ERROR;
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		arch_sync_dma_for_device(phys, size, dir);
 	return vdma_alloc(phys, size);
 }
 
-static void jazz_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void jazz_dma_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
@@ -607,8 +613,8 @@ static void jazz_dma_sync_sg_for_cpu(struct device *dev,
 const struct dma_map_ops jazz_dma_ops = {
 	.alloc			= jazz_dma_alloc,
 	.free			= jazz_dma_free,
-	.map_page		= jazz_dma_map_page,
-	.unmap_page		= jazz_dma_unmap_page,
+	.map_phys		= jazz_dma_map_phys,
+	.unmap_phys		= jazz_dma_unmap_phys,
 	.map_sg			= jazz_dma_map_sg,
 	.unmap_sg		= jazz_dma_unmap_sg,
 	.sync_single_for_cpu	= jazz_dma_sync_single_for_cpu,

-- 
2.51.0


