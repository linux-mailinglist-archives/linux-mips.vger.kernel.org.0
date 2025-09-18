Return-Path: <linux-mips+bounces-11509-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57571B8672B
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 20:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734B41C267DA
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 18:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168902D640D;
	Thu, 18 Sep 2025 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z28vS7zX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940F27B357;
	Thu, 18 Sep 2025 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221130; cv=none; b=rt2z92a7FR73gB9UCJmFdSmmKU710duc/Po5rhpDJf000f4bJ/uyNWVz4LiSf0myhO7AQ3mgIqZ7VIm3EAfVMFcbvD7GzmyVKmmaxwkebgSdfu0t8+zWhsde2+CYARniQszET78+ZcQTX7om2Ae0kjCgrj5trxt5YaWA9NvAfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221130; c=relaxed/simple;
	bh=u6NaIt2RygsBlCtYn4hZiQqQdifJG8iCHYQXwiLX65E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPsnxUwc9vl3m5vYay5W8a/2POm+r3LgogskIB18XakLi7/6O/ZLH1sSgOzEXZQ178CCKvGnCcv/fAp3DhZak01e8usR29X1+aznNDLKhF0nFC28nsGoeJNRDrBPvnp2cXxMCCU8sperSXXdgZ3uPgta4q8oJQe3aTRvO9UBj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z28vS7zX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340C7C4CEE7;
	Thu, 18 Sep 2025 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221129;
	bh=u6NaIt2RygsBlCtYn4hZiQqQdifJG8iCHYQXwiLX65E=;
	h=From:To:Cc:Subject:Date:From;
	b=Z28vS7zXihUdX9isz4tKX5bJfG+N6wgA49ZsUL9MzWkxVOZIaB9CEoaGCeOdF5Wlc
	 irtxfrEkcx12CNmXSpOaxnrWSE3uyQ9BLUGMgdMwz3ZkzTrB7vIU5S+RDvQ6dKM5ki
	 RxUJdVCwUhpNByj1sxF0SK4ASPa55TnwfCGcGHPBq14Ogh8/QuEEAY6ulYXQRiCrc/
	 gKhn/kbZmmAWPpdmUgqtKeJS0PBEgSw0hZoyR9kwDh1THqWJDw1i1JuxwJQDO1Fvaa
	 tjs8Xsk56/6qq7xSDRAZoHUF6JGB7I+NLrajHOGD2OUILv6g7xC1NJVMJM9wXp6cE/
	 8ldLVQITFO98w==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: [PATCH 0/9] Remove DMA .map_page and .unmap_page callbacks
Date: Thu, 18 Sep 2025 21:45:00 +0300
Message-ID: <cover.1758219786.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series continues following two series:
1. "dma-mapping: migrate to physical address-based API" 
https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com
2. "Preparation to .map_page and .unmap_page removal"
Preparation to .map_page and .unmap_page removal

In this series, the DMA .map_page/.unmap_page callbacks are converted to newly
introduced .map_phys/.unmap_phys interfaces. This conversion allows us to reduce
or eliminate (for certain ARCHs) use of struct pages in DMA path.

Thanks

Leon Romanovsky (9):
  alpha: Convert mapping routine to rely on physical address
  MIPS/jazzdma: Provide physical address directly
  parisc: Convert DMA map_page to map_phys interface
  powerpc: Convert to physical address DMA mapping
  sparc64: Use physical address DMA mapping
  x86: Use physical address for DMA mapping
  vdpa: Convert to physical address DMA mapping
  xen: swiotlb: Convert mapping routine to rely on physical address
  dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            | 47 ++++++++++--------------
 arch/mips/jazz/jazzdma.c                 | 20 ++++++----
 arch/powerpc/include/asm/iommu.h         |  8 ++--
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++------
 arch/powerpc/kernel/iommu.c              | 14 +++----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++-------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++-----
 arch/sparc/kernel/iommu.c                | 16 ++++----
 arch/sparc/kernel/pci_sun4v.c            | 16 ++++----
 arch/sparc/mm/io-unit.c                  | 13 +++----
 arch/sparc/mm/iommu.c                    | 46 ++++++++++++-----------
 arch/x86/kernel/amd_gart_64.c            | 19 +++++-----
 drivers/parisc/ccio-dma.c                | 25 +++++++------
 drivers/parisc/sba_iommu.c               | 23 ++++++------
 drivers/vdpa/vdpa_user/iova_domain.c     | 11 +++---
 drivers/vdpa/vdpa_user/iova_domain.h     |  8 ++--
 drivers/vdpa/vdpa_user/vduse_dev.c       | 18 +++++----
 drivers/xen/grant-dma-ops.c              | 20 ++++++----
 include/linux/dma-map-ops.h              |  7 ----
 kernel/dma/mapping.c                     | 12 ------
 kernel/dma/ops_helpers.c                 |  8 +---
 22 files changed, 208 insertions(+), 214 deletions(-)

-- 
2.51.0


