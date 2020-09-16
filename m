Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B54026CE55
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 00:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgIPWIB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 18:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgIPWH7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Sep 2020 18:07:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1D3C0698D0;
        Wed, 16 Sep 2020 14:59:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 5C3D229BBA2
Subject: Re: [PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Aslan Bakirov <aslan@fb.com>, Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>, Roman Gushchin <guro@fb.com>,
        Mike Rapoport <rppt@kernel.org>, kernelci-results@groups.io
References: <20200915205703.34572-1-mike.kravetz@oracle.com>
 <4b7b14c9eb6a42509f8324f7ed84b46f@hisilicon.com>
 <2bf99eee-29b1-4965-da7d-d4e341803440@oracle.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <70ad632d-88f3-db6d-3493-b09451150298@collabora.com>
Date:   Wed, 16 Sep 2020 22:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2bf99eee-29b1-4965-da7d-d4e341803440@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/09/2020 17:30, Mike Kravetz wrote:
> On 9/16/20 2:14 AM, Song Bao Hua (Barry Song) wrote:
>>>> -----Original Message-----
>>>> From: Mike Kravetz [mailto:mike.kravetz@oracle.com]
>>>> Sent: Wednesday, September 16, 2020 8:57 AM
>>>> To: linux-mm@kvack.org; linux-kernel@vger.kernel.org;
>>>> linux-arm-kernel@lists.infradead.org; linux-mips@vger.kernel.org
>>>> Cc: Roman Gushchin <guro@fb.com>; Song Bao Hua (Barry Song)
>>>> <song.bao.hua@hisilicon.com>; Mike Rapoport <rppt@kernel.org>; Joonsoo
>>>> Kim <js1304@gmail.com>; Rik van Riel <riel@surriel.com>; Aslan Bakirov
>>>> <aslan@fb.com>; Michal Hocko <mhocko@kernel.org>; Andrew Morton
>>>> <akpm@linux-foundation.org>; Mike Kravetz <mike.kravetz@oracle.com>
>>>> Subject: [PATCH] cma: make number of CMA areas dynamic, remove
>>>> CONFIG_CMA_AREAS
>>>>
>>>> The number of distinct CMA areas is limited by the constant
>>>> CONFIG_CMA_AREAS.  In most environments, this was set to a default
>>>> value of 7.  Not too long ago, support was added to allocate hugetlb
>>>> gigantic pages from CMA.  More recent changes to make
>>> dma_alloc_coherent
>>>> NUMA-aware on arm64 added more potential users of CMA areas.  Along
>>>> with the dma_alloc_coherent changes, the default value of CMA_AREAS
>>>> was bumped up to 19 if NUMA is enabled.
>>>>
>>>> It seems that the number of CMA users is likely to grow.  Instead of
>>>> using a static array for cma areas, use a simple linked list.  These
>>>> areas are used before normal memory allocators, so use the memblock
>>>> allocator.
>>>>
>>>> Acked-by: Roman Gushchin <guro@fb.com>
>>>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>>>> ---
>>>> rfc->v1
>>>>   - Made minor changes suggested by Song Bao Hua (Barry Song)
>>>>   - Removed check for late calls to cma_init_reserved_mem that was part
>>>>     of RFC.
>>>>   - Added ACK from Roman Gushchin
>>>>   - Still in need of arm testing
>>>
>>> Unfortunately, the test result on my arm64 board is negative, Linux can't boot
>>> after applying
>>> this patch.
>>>
>>> I guess we have to hold on this patch for a while till this is fixed. BTW, Mike, do
>>> you have
>>> a qemu-based arm64 numa system to debug? It is very easy to reproduce, we
>>> don't need to
>>> use hugetlb_cma and pernuma_cma. Just the default cma will make the boot
>>> hang.
>>
>> Hi Mike,
>> I spent some time on debugging the boot issue and sent a patch here:
>> https://lore.kernel.org/linux-mm/20200916085933.25220-1-song.bao.hua@hisilicon.com/
>> All details and knic oops can be found there.
>> pls feel free to merge my patch into your v2 if you want. And we probably need ack from
>> arm maintainers.
>>
>> Also,  +Will,
>>
>> Hi Will, the whole story is that Mike tried to remove the cma array with CONFIG_CMA_AREAS
>> and moved to use memblock_alloc() to allocate cma area, so that the number of cma areas
>> could be dynamic. It turns out it causes a kernel panic on arm64 during system boot as the
>> returned address from memblock_alloc is invalid before paging_init() is done on arm64.
>>
> 
> Thank you!
> 
> Based on your analysis, I am concerned that other architectures may also
> have issues.
> 
> Andrew,
> I suggest we remove this patch from your tree.  I will audit all architectures
> which enable CMA and look for similar issues there.  Will then merge Barry's
> patch into a V2 with any other arch specific changes.

FYI This was also bisected on kernelci.org[1] and it landed on
this commit: c999bd436fe9 ("mm/cma: make number of CMA areas
dynamic, remove CONFIG_CMA_AREAS").  Only arm and arm64 seem to
be affected, and not with all the builds:

  https://kernelci.org/test/job/next/branch/master/kernel/next-20200916/plan/baseline/

The list of failures above might help someone debug the issue
with a platform they have at hand.

Guillaume

[1] https://groups.io/g/kernelci-results-staging/message/2027
