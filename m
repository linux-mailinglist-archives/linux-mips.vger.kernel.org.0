Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF1D265A39
	for <lists+linux-mips@lfdr.de>; Fri, 11 Sep 2020 09:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgIKHPX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 03:15:23 -0400
Received: from verein.lst.de ([213.95.11.211]:35813 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgIKHPW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 03:15:22 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 263C168BFE; Fri, 11 Sep 2020 09:15:20 +0200 (CEST)
Date:   Fri, 11 Sep 2020 09:15:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org, Tomasz Figa <tfiga@chromium.org>,
        Joerg Roedel <joro@8bytes.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 11/12] dma-mapping: move dma_common_{mmap,get_sgtable}
 out of mapping.c
Message-ID: <20200911071519.GF22394@lst.de>
References: <20200908164758.3177341-1-hch@lst.de> <20200908164758.3177341-12-hch@lst.de> <88bae26e-d5f4-7a00-a88a-b69194d519a4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bae26e-d5f4-7a00-a88a-b69194d519a4@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 10, 2020 at 02:34:18PM +0100, Robin Murphy wrote:
> On 2020-09-08 17:47, Christoph Hellwig wrote:
>> Add a new file that contains helpera for misc DMA ops, which is only
>
> The Latin plural of the singular "helperum", I guess? :P

I've switched it to helpers, that might be easier to understand :)
