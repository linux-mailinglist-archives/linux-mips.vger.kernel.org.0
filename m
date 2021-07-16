Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6C93CB296
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jul 2021 08:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhGPGe0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jul 2021 02:34:26 -0400
Received: from verein.lst.de ([213.95.11.211]:41942 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230011AbhGPGe0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Jul 2021 02:34:26 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3C31267373; Fri, 16 Jul 2021 08:31:28 +0200 (CEST)
Date:   Fri, 16 Jul 2021 08:31:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Stephen Bates <sbates@raithlin.com>,
        Martin Oliveira <martin.oliveira@eideticom.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 04/16] dma-iommu: Return error code from
 iommu_dma_map_sg()
Message-ID: <20210716063127.GB13345@lst.de>
References: <20210715164544.6827-1-logang@deltatee.com> <20210715164544.6827-5-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-5-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Careful here. What do all these errors from the low-level code mean
here?  I think we need to clearly standardize on what we actually
return from ->map_sg and possibly document what the callers expect and
can do, and enforce that only those error are reported.
