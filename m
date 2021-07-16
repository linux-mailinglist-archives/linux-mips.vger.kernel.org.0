Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9523CB2B9
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jul 2021 08:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbhGPGg3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jul 2021 02:36:29 -0400
Received: from verein.lst.de ([213.95.11.211]:41976 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234896AbhGPGg3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Jul 2021 02:36:29 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C874467373; Fri, 16 Jul 2021 08:33:32 +0200 (CEST)
Date:   Fri, 16 Jul 2021 08:33:32 +0200
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
        Martin Oliveira <martin.oliveira@eideticom.com>
Subject: Re: [PATCH v1 16/16] dma-mapping: Disallow .map_sg operations from
 returning zero on error
Message-ID: <20210716063332.GD13345@lst.de>
References: <20210715164544.6827-1-logang@deltatee.com> <20210715164544.6827-17-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-17-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 15, 2021 at 10:45:44AM -0600, Logan Gunthorpe wrote:
> @@ -194,6 +194,8 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
>  	else
>  		ents = ops->map_sg(dev, sg, nents, dir, attrs);
>  
> +	WARN_ON_ONCE(ents == 0);

Turns this into a negative error code while we're at it, just to keep
the callers sane?
