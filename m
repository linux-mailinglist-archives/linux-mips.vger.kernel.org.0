Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D830D26468B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 15:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgIJNGX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 09:06:23 -0400
Received: from foss.arm.com ([217.140.110.172]:35522 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730637AbgIJNFF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 09:05:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AA5113D5;
        Thu, 10 Sep 2020 06:03:20 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C6D53F66E;
        Thu, 10 Sep 2020 06:03:17 -0700 (PDT)
Subject: Re: [PATCH 08/12] dma-direct: use phys_to_dma_direct in
 dma_direct_alloc
To:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-9-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <84dfb537-c028-e6d1-88d3-b3d48fc7df3a@arm.com>
Date:   Thu, 10 Sep 2020 14:03:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-9-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Replace the currently open code copy.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 12e9f5f75dfe4b..57a6e7d7cf8f16 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -240,10 +240,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   			goto out_encrypt_pages;
>   	}
>   done:
> -	if (force_dma_unencrypted(dev))
> -		*dma_handle = __phys_to_dma(dev, page_to_phys(page));
> -	else
> -		*dma_handle = phys_to_dma(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
>   	return ret;
>   
>   out_encrypt_pages:
> 
