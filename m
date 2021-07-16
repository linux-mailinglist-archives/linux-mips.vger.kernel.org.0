Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430D93CB72B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jul 2021 14:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhGPMOi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Jul 2021 08:14:38 -0400
Received: from foss.arm.com ([217.140.110.172]:38236 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhGPMOi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Jul 2021 08:14:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03A52D6E;
        Fri, 16 Jul 2021 05:11:43 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7A2A3F774;
        Fri, 16 Jul 2021 05:11:39 -0700 (PDT)
Subject: Re: [PATCH v1 14/16] x86/amd_gart: return error code from
 gart_map_sg()
To:     Christoph Hellwig <hch@lst.de>,
        Logan Gunthorpe <logang@deltatee.com>
Cc:     linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Bates <sbates@raithlin.com>,
        Martin Oliveira <martin.oliveira@eideticom.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-15-logang@deltatee.com> <20210716063241.GC13345@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <98c09e65-35d0-dde5-75fc-e3d99864d078@arm.com>
Date:   Fri, 16 Jul 2021 13:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716063241.GC13345@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-07-16 07:32, Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 10:45:42AM -0600, Logan Gunthorpe wrote:
>> @@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>>   	iommu_full(dev, pages << PAGE_SHIFT, dir);
>>   	for_each_sg(sg, s, nents, i)
>>   		s->dma_address = DMA_MAPPING_ERROR;
>> -	return 0;
>> +	return ret;
> 
> While we're at it - setting the ->dma_address to DMA_MAPPING_ERROR is
> not part of the ->map_sg calling convention.  Might be worth to fix
> up while we're at it.

Especially since it's not even zeroing dma_length, which at least is a 
documented indicator of validity (even if it's not strictly defined for 
failure cases either).

Robin.
