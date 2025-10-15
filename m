Return-Path: <linux-mips+bounces-11722-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFFBDDA09
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 11:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B7464E9475
	for <lists+linux-mips@lfdr.de>; Wed, 15 Oct 2025 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7611930B528;
	Wed, 15 Oct 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/fn/Q7E"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6B298991;
	Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519589; cv=none; b=HanzYuve6EgCSNIsvyhGO3QT2csxkcB5xNYy9bGwQGElpHlR+MjWjxalrne5SLbWsmi5EJ0nccBiibG9P4B8+La3Z6F+t+j2WW1J11XhFISTMxGxvzx8q17jd2AiF0cuR0/gT793vkn9BnuArsOAf1lHZ4omIA63k4WVezeFVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519589; c=relaxed/simple;
	bh=ywR7wdHo9iJDPAMnOLxx2KSfcpdMYgaVYoeQgeEMVE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZHyCeU7uvFcnjiWkFUPfmd2Chjd5/pSDqcrgc0b8qlE5fwCUb367tTeM3CfTc780AfX7ruNQXkiMLkJhxJ/KpTRLE1HLOoJUTGT5wiaeKuyIscXcFkLzqlTHARHrIQVFw71tR1meoRWn9iTP+/S99Eo92qJDLNLZzO28EAUVDKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/fn/Q7E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5DDC4CEF8;
	Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519588;
	bh=ywR7wdHo9iJDPAMnOLxx2KSfcpdMYgaVYoeQgeEMVE0=;
	h=From:To:Cc:Subject:Date:From;
	b=T/fn/Q7Et3W/XoUP2+BW/BncjyLdn9Q59dx4I+uKrVGVx83N3CoqpvJHFxWuqRsC+
	 XdbXTMel6OirvBhxiFjPLifrL1qZ1WA1GV0CfnbnyJ0gLcqjgJlrUBUk085bytleC1
	 Ps1/U8qadzNDPEXTFtbAw3rfhPCKp+JJvyNHVNWiVzxBuTqLX4e1h0uwpfnG6FXSGu
	 ahv0t+DTPlJs6QFO33ojzLxd9DpyMUAoYg7u/ZEvqC360GdrnKWc4kvzqrKjjOzNyu
	 sfpnfCdbcfzoWkUMqnORIpnF4VZ9xrYID8Bc3PCTstBRCa5sVe3z7x9f1ejmwsSTxY
	 9ePteT4berpfg==
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
	Magnus Lindholm <linmag7@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v5 00/14] Remove DMA map_page/map_resource and their unmap callbacks
Date: Wed, 15 Oct 2025 12:12:46 +0300
Message-ID: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251015-remove-map-page-a28302e6cc7d
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit

This series is a combination of previous two steps [1, 2] to reduce
number of accesses to struct page in the code "below" DMA layer.

In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

Thanks

[1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
[2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

---
Leon Romanovsky (14):
      dma-mapping: prepare dma_map_ops to conversion to physical address
      dma-mapping: convert dummy ops to physical address mapping
      ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
      ARM: dma-mapping: Switch to physical address mapping callbacks
      xen: swiotlb: Switch to physical address mapping callbacks
      dma-mapping: remove unused mapping resource callbacks
      alpha: Convert mapping routine to rely on physical address
      MIPS/jazzdma: Provide physical address directly
      parisc: Convert DMA map_page to map_phys interface
      powerpc: Convert to physical address DMA mapping
      sparc: Use physical address DMA mapping
      x86: Use physical address for DMA mapping
      xen: swiotlb: Convert mapping routine to rely on physical address
      dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            |  48 ++++-----
 arch/arm/mm/dma-mapping.c                | 180 +++++++++----------------------
 arch/mips/jazz/jazzdma.c                 |  20 ++--
 arch/powerpc/include/asm/iommu.h         |   8 +-
 arch/powerpc/kernel/dma-iommu.c          |  22 ++--
 arch/powerpc/kernel/iommu.c              |  14 +--
 arch/powerpc/platforms/ps3/system-bus.c  |  33 +++---
 arch/powerpc/platforms/pseries/ibmebus.c |  15 +--
 arch/powerpc/platforms/pseries/vio.c     |  21 ++--
 arch/sparc/kernel/iommu.c                |  30 ++++--
 arch/sparc/kernel/pci_sun4v.c            |  31 +++---
 arch/sparc/mm/io-unit.c                  |  38 +++----
 arch/sparc/mm/iommu.c                    |  46 ++++----
 arch/x86/kernel/amd_gart_64.c            |  19 ++--
 drivers/parisc/ccio-dma.c                |  54 +++++-----
 drivers/parisc/iommu-helpers.h           |  10 +-
 drivers/parisc/sba_iommu.c               |  54 +++++-----
 drivers/xen/grant-dma-ops.c              |  20 ++--
 drivers/xen/swiotlb-xen.c                |  63 +++++------
 include/linux/dma-map-ops.h              |  14 +--
 kernel/dma/dummy.c                       |  13 ++-
 kernel/dma/mapping.c                     |  26 +----
 kernel/dma/ops_helpers.c                 |  12 ++-
 23 files changed, 361 insertions(+), 430 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251015-remove-map-page-a28302e6cc7d

Best regards,
--  
Leon Romanovsky <leon@kernel.org>


