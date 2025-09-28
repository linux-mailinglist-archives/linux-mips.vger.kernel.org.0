Return-Path: <linux-mips+bounces-11568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08384BA72BC
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 17:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9923BA1CA
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 15:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04521E0DD8;
	Sun, 28 Sep 2025 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnkMQdRq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F034BA59;
	Sun, 28 Sep 2025 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759071759; cv=none; b=Q1oP2AbqcCrMz7lLpe40TX/lvgdVmowoz4yMaOajLJrVLlg2YE1ZR2ymSAPGUFGVa5DNikcWOhLLM41taBMROzWmTecLevH4EmJS0r/d8SaDJMh2oBv55CkulCDHt3VRUsAk0y42DBvO0Hv1joOUnV+32G2lsA0clrxqYgtCdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759071759; c=relaxed/simple;
	bh=Akj3CON6IBsq+OP9A9OkC5SszLfqcLnpZRG8DGaLpwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbXlgBfizckGS/Mk1P+nEVZPi2mbcE19gq0TJapSlZds4HJfHffKulf/cHyeeRFxGAMKG/egVIlCZVsKq7lLwY9XyWJsRCIbxxV7wUtWA+xTQj6dDxyq9/FY/M7xAi+TNWeNCmACp0Ydm3tDVQXsEoALl5y8pcCOJdx+jO3BWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnkMQdRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E12C4CEF0;
	Sun, 28 Sep 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071759;
	bh=Akj3CON6IBsq+OP9A9OkC5SszLfqcLnpZRG8DGaLpwM=;
	h=From:To:Cc:Subject:Date:From;
	b=TnkMQdRqI3QZ3YV/GCpp5pqPe146ZT+yd8f0yZi5dqhffQqkLDkFNg275CdcBt57r
	 P46/Q8MJggBoVrUATbN4yQz/1RNVzEr4qRwDBK1qefHMrZA7rRP2hz2qDSVWQ0iS7S
	 DGy5cZpbTLZ4famPhxfNn0tm+T9zHJU/CGhwJumTvkSrrah3nVMcJlpks0e7mhTc4w
	 j8HKF/6RRxHmpIgigj7NLyGRrG0vXEG8EvTBOOsy4JlJy5mBhEoqFp+dHa3/mFRG69
	 4FazbdhYoc7M4C8CocEkOrWVODSNfM2PMKHWaItVyJziGeyDxLU2xd+NY5jkkGqhpC
	 h/JiXqu+FTGaw==
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
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 0/9] Remove DMA .map_page and .unmap_page callbacks
Date: Sun, 28 Sep 2025 18:02:20 +0300
Message-ID: <cover.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
v1:
 * Fixed wrong offset in alpha conversion patch.
v0: https://lore.kernel.org/all/cover.1758219786.git.leon@kernel.org

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

 arch/alpha/kernel/pci_iommu.c            | 48 +++++++++++-------------
 arch/mips/jazz/jazzdma.c                 | 20 ++++++----
 arch/powerpc/include/asm/iommu.h         |  8 ++--
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++------
 arch/powerpc/kernel/iommu.c              | 14 +++----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 +++++++++-------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++-----
 arch/sparc/kernel/iommu.c                | 16 ++++----
 arch/sparc/kernel/pci_sun4v.c            | 16 ++++----
 arch/sparc/mm/io-unit.c                  | 13 +++----
 arch/sparc/mm/iommu.c                    | 46 ++++++++++++-----------
 arch/x86/kernel/amd_gart_64.c            | 19 +++++-----
 drivers/parisc/ccio-dma.c                | 25 ++++++------
 drivers/parisc/sba_iommu.c               | 23 ++++++------
 drivers/vdpa/vdpa_user/iova_domain.c     | 11 +++---
 drivers/vdpa/vdpa_user/iova_domain.h     |  8 ++--
 drivers/vdpa/vdpa_user/vduse_dev.c       | 18 +++++----
 drivers/xen/grant-dma-ops.c              | 20 ++++++----
 include/linux/dma-map-ops.h              |  7 ----
 kernel/dma/mapping.c                     | 12 ------
 kernel/dma/ops_helpers.c                 |  8 +---
 22 files changed, 209 insertions(+), 214 deletions(-)

-- 
2.51.0


