Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F267C1E22EB
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgEZN3y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 09:29:54 -0400
Received: from foss.arm.com ([217.140.110.172]:50770 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbgEZN3y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 09:29:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D8801FB;
        Tue, 26 May 2020 06:29:53 -0700 (PDT)
Received: from [10.57.2.168] (unknown [10.57.2.168])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B41BB3F6C4;
        Tue, 26 May 2020 06:29:51 -0700 (PDT)
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Lichao Liu <liulichao@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
References: <20200526111438.3788-1-liulichao@loongson.cn>
 <20200526193859.0adaea3b@halation.net.flygoat.com>
 <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
 <20200526130128.GA8487@alpha.franken.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1d594568-e457-533e-122a-c7e449c0f05d@arm.com>
Date:   Tue, 26 May 2020 14:29:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526130128.GA8487@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-05-26 14:01, Thomas Bogendoerfer wrote:
> On Tue, May 26, 2020 at 08:40:28PM +0800, Lichao Liu wrote:
>> Loongson-2EF need software maintain cache consistency, So when using
>> streaming DMA, software needs to maintain consistency.
>>
>> dma_map_single() is correct, but dma_unmap_single is wrong.
>>
>> The function call path:
>> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
>>   dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
>>   cpu_needs_post_dma_flush'
>>
>> In current version, 'cpu_needs_post_dma_flush' will return false
>> at Loongon-2EF platform, and dma_unmap_single will not invalidate cache,
>> driver may access wrong dma data.
> 
> why should it ? CPU must not touch data while it's mapped for DMA.
> 
>> I don't know what's the exact meaning of "fill random cachelines with
>> stale data at any time". I always think 'cpu_needs_post_dma_flush()'
>> means whether this platform needs software to maintain cache consistency.
> 
> this will only happen, if cpu speculates creates dirty cache lines
> by speculation as R10k type of CPUs do.

Will it? The usual pattern for this problem is that the CPU 
speculatively fills a (clean) cache line after a DMA_FROM_DEVICE 
operation has begun, but before the device has actually written to that 
part of the buffer. Thus a subsequent CPU read after the operation is 
complete can hit in the cache and return the previous data rather than 
the updated data that the device wrote. I don't know about MIPS 
specifically, but that can certainly happen on Arm.

>> I found this problem in 4.19.90 kernel's ethernet driver,
>> and this patch can fix this problem.
> 
> if CPU isn't affected by the R10k speculation problem, it sounds more
> like wrong usage of DMA api.

Sure, explicit accesses to the mapped buffer would be a software error, 
but if legitimate non-overlapping accesses to other data nearby can 
trigger the CPU to speculatively fetch lines from the DMA-mapped region, 
that's generally beyond software's control.

Robin.
