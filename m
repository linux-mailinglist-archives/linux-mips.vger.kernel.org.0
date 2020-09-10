Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5044265480
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 23:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgIJVm1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 17:42:27 -0400
Received: from foss.arm.com ([217.140.110.172]:35360 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730879AbgIJM40 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 08:56:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF2C01063;
        Thu, 10 Sep 2020 05:55:44 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 141203F66E;
        Thu, 10 Sep 2020 05:55:40 -0700 (PDT)
Subject: Re: [PATCH 04/12] dma-mapping: fix DMA_OPS dependencies
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-5-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1e3c7094-62da-6e8c-0a41-0bc63dd3db68@arm.com>
Date:   Thu, 10 Sep 2020 13:55:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-5-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Driver that select DMA_OPS need to depend on HAS_DMA support to
> work.  The vop driver was missing that dependency, so add it, and also
> add a nother depends in DMA_OPS itself.  That won't fix the issue due
> to how the Kconfig dependencies work, but at least produce a warning
> about unmet dependencies.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/misc/mic/Kconfig | 1 +
>   kernel/dma/Kconfig       | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
> index b9bb086785db48..8a7c2c5711d5f4 100644
> --- a/drivers/misc/mic/Kconfig
> +++ b/drivers/misc/mic/Kconfig
> @@ -35,6 +35,7 @@ config SCIF_BUS
>   
>   config VOP_BUS
>   	tristate "VOP Bus Driver"
> +	depends on HAS_DMA
>   	select DMA_OPS

AFAICS all three of these bus drivers are only proxying a struct 
dma_map_ops * pointer around, so if they used the set_dma_ops() helper 
they shouldn't even need these selects at all. Only INTEL_MIC_HOST 
appears to have a logical dependency on DMA_OPS for actual functionality.

However, I have a vague feeling you might not be fond of those dma_ops 
helpers, and I have no great objection to this one-liner as-is, so 
(modulo the couple of commit message typos),

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

(of course the hunk below is unquestionably OK)

Robin.

>   	help
>   	  This option is selected by any driver which registers a
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 0ddfb5510fe45f..e7b801649f6574 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -9,6 +9,7 @@ config HAS_DMA
>   	default y
>   
>   config DMA_OPS
> +	depends on HAS_DMA
>   	bool
>   
>   #
> 
