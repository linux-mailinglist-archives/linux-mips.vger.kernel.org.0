Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EA23E4872
	for <lists+linux-mips@lfdr.de>; Mon,  9 Aug 2021 17:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbhHIPQs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Aug 2021 11:16:48 -0400
Received: from verein.lst.de ([213.95.11.211]:60961 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233058AbhHIPQr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 9 Aug 2021 11:16:47 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6D60467357; Mon,  9 Aug 2021 17:16:22 +0200 (CEST)
Date:   Mon, 9 Aug 2021 17:16:22 +0200
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
Subject: Re: [PATCH v3 00/21] .map_sg() error cleanup
Message-ID: <20210809151622.GB22445@lst.de>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks,

I've applied this to the dma-mapping tree with a few minor cosmetic
tweaks.
