Return-Path: <linux-mips+bounces-11569-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC7CBA72D4
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3EB3BB306
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4780229B36;
	Sun, 28 Sep 2025 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSOYpsgi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917234BA59;
	Sun, 28 Sep 2025 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759071763; cv=none; b=Yg4N5gtEgAC/VnTAvbeRvrMXy/dHIInrAwMEPFUg/xh5QpN/011o4ks0SWXDlS8HM2DN7n7gE8ggvv0e+gZkkDOuF87DS60p3+vH/zGSuYMPcOQThBtvSt9bEJjXcYI/1zTbzOd99FC8VUU3Skvothas4uMijPAgF7EKIpBu4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759071763; c=relaxed/simple;
	bh=joV1RJXfMRWLzhpnIVMn+yDni/E+0b2XTKZNLoQGaO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDJWZOA9w0ww3RphZWlgSNUPaiIvaK0PwXoHv7mL2G382GOR8KurQ9vVUxkXcx13RLuq1WQcGtUbHR1vRTrskXcuEzeJScYaKpfv9n2xRS0LlfqR9Xu6o6cjDkXo5g7lN2iCqMevaq976J8fbpTgxGjZrhstNpwMo3OSs5+oMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSOYpsgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81470C116B1;
	Sun, 28 Sep 2025 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071763;
	bh=joV1RJXfMRWLzhpnIVMn+yDni/E+0b2XTKZNLoQGaO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DSOYpsgikSOy8MZ87jPu/KYUDc+l4cdaniO8RKKeI+Ogx+vIbjw3PFXybhxCGiVkL
	 Svbf9LCD/OLSu1+BhYWYUN2NsbU1qvbAJmkVnyM+ehBPWXa1P8Dfsr10VqVfh+CJ3/
	 fK0PydC9i55IUTpcrx/WEa8jZeqt059f7qwZBuoA4bLcGPLmEQkD0cguNeebMBEFKT
	 3RrvQyQn8dehTNH48u0yl6WLA+Tz2ziEbgsKR0IERUfTbFnsVdNo8hdbmtk8QqvVxt
	 7HSong2gEFWSxqgarqeXxYxR/Gye8uoIqVAF8qNmGQXTAkUC6S5UaNNMSjuWnuDC7u
	 prcP+vXzgDPsQ==
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
Subject: [PATCH v1 2/9] MIPS/jazzdma: Provide physical address directly
Date: Sun, 28 Sep 2025 18:02:22 +0300
Message-ID: <f64ece5bdf9dc4c7e9407a5089be68a8c5c011a5.1759071169.git.leon@kernel.org>
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

MIPS jazz uses physical addresses for mapping pages, so convert
it to get them directly from DMA mapping routine.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/mips/jazz/jazzdma.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index c97b089b9902..45fe71aa454b 100644
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
+	if (attrs & DMA_ATTR_MMIO)
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


