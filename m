Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBED3CA2A2
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 18:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhGOQtD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 12:49:03 -0400
Received: from ale.deltatee.com ([204.191.154.188]:49892 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhGOQtD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 12:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
        :references:content-disposition:in-reply-to;
        bh=XXtkehQ2ONU8oCrAkxOjAUpUG3U+0n5Rbx+vQpsbqo0=; b=VsZ9pl6IcXQEaJc+OIOPSTH2s2
        ImpLpkZPiYqR2MqPe8J/TCGrfa8lTDqG4w41mP8plFxEbBU2ba8ajzYIU158IKdhsRSvxpR71yYdi
        lVVs77Hk2Pwh/yOG9jaNYPjpiBTmg03B32Cgaw3UpyR0EHixI4UWL/Pt0GPEJp5VOWqnyGa2Yz0/s
        3C1qrOy1FusMqR+BnvbDOrd/Ep7SkhCwGvaL1a1HrPR88k6xVDa+RE9U5jtSx6AVj/RxyiHhm3et7
        frKUyhYk2p67XlqGrIorntTlVANHFYgzmZDPkv3iqb7xQICE4bdtcuTXqP5XORIq/327zHaHt0vWM
        S5WTyqtw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Ur-0001yb-1a; Thu, 15 Jul 2021 10:46:01 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Un-0001n6-Ig; Thu, 15 Jul 2021 10:45:57 -0600
From:   Logan Gunthorpe <logang@deltatee.com>
To:     linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Stephen Bates <sbates@raithlin.com>,
        Martin Oliveira <martin.oliveira@eideticom.com>,
        Logan Gunthorpe <logang@deltatee.com>
Date:   Thu, 15 Jul 2021 10:45:28 -0600
Message-Id: <20210715164544.6827-1-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 00/16] .map_sg() error cleanup
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This series is spun out and expanded from my work to add P2PDMA support
to DMA map operations[1].

The P2PDMA work requires distinguishing different error conditions in
a map_sg operation. dma_map_sgtable() already allows for returning an
error code (where as dma_map_sg() is only allowed to return zero)
however, it currently only returns -EINVAL when a .map_sg() call returns
zero.

This series cleans up all .map_sg() implementations to return appropriate
error codes. After the cleanup, dma_map_sg() will still return zero,
however dma_map_sgtable() will pass the error code from the .map_sg()
call. Thanks go to Martn Oliveira for doing a lot of the cleanup of the
obscure implementations.

The patch set is based off of v5.14-rc1 and a git repo can be found
here:

  https://github.com/sbates130272/linux-p2pmem map_sg_err_cleanup_v1

Thanks,

Logan

[1] https://lore.kernel.org/linux-block/20210513223203.5542-1-logang@deltatee.com/

--

Logan Gunthorpe (5):
  dma-mapping: Allow map_sg() ops to return negative error codes
  dma-direct: Return appropriate error code from dma_direct_map_sg()
  iommu: Return full error code from iommu_map_sg[_atomic]()
  dma-iommu: Return error code from iommu_dma_map_sg()
  dma-mapping: Disallow .map_sg operations from returning zero on error

Martin Oliveira (11):
  alpha: return error code from alpha_pci_map_sg()
  ARM/dma-mapping: return error code from .map_sg() ops
  ia64/sba_iommu: return error code from sba_map_sg_attrs()
  MIPS/jazzdma: return error code from jazz_dma_map_sg()
  powerpc/iommu: return error code from .map_sg() ops
  s390/pci: return error code from s390_dma_map_sg()
  sparc/iommu: return error codes from .map_sg() ops
  parisc: return error code from .map_sg() ops
  xen: swiotlb: return error code from xen_swiotlb_map_sg()
  x86/amd_gart: return error code from gart_map_sg()
  dma-mapping: return error code from dma_dummy_map_sg()

 arch/alpha/kernel/pci_iommu.c           | 10 +++-
 arch/arm/mm/dma-mapping.c               | 22 +++++---
 arch/ia64/hp/common/sba_iommu.c         |  9 +--
 arch/mips/jazz/jazzdma.c                |  2 +-
 arch/powerpc/kernel/iommu.c             |  4 +-
 arch/powerpc/platforms/ps3/system-bus.c |  2 +-
 arch/powerpc/platforms/pseries/vio.c    |  5 +-
 arch/s390/pci/pci_dma.c                 | 12 ++--
 arch/sparc/kernel/iommu.c               |  4 +-
 arch/sparc/kernel/pci_sun4v.c           |  4 +-
 arch/sparc/mm/iommu.c                   |  2 +-
 arch/x86/kernel/amd_gart_64.c           | 16 +++---
 drivers/iommu/dma-iommu.c               | 20 ++++---
 drivers/iommu/iommu.c                   | 15 +++--
 drivers/parisc/ccio-dma.c               |  2 +-
 drivers/parisc/sba_iommu.c              |  2 +-
 drivers/xen/swiotlb-xen.c               |  2 +-
 include/linux/dma-map-ops.h             |  6 +-
 include/linux/dma-mapping.h             | 35 +++---------
 include/linux/iommu.h                   | 22 ++++----
 kernel/dma/direct.c                     |  2 +-
 kernel/dma/dummy.c                      |  2 +-
 kernel/dma/mapping.c                    | 73 ++++++++++++++++++++++---
 23 files changed, 165 insertions(+), 108 deletions(-)


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
--
2.20.1
