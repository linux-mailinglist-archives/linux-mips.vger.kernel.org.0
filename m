Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E21526CF2E
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 00:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgIPW4S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 18:56:18 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:57422 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgIPW4Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Sep 2020 18:56:16 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GGOXv6051337;
        Wed, 16 Sep 2020 16:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YKdl8gzDEpK1YpA3WFQ+M1n3JfBUrOCHTQf+cD4wugA=;
 b=rlDLQX50qseJ8UBRo7iVkY7W7X1/qWAPNDxWEm74Ee7+sG8hfbEGCE/Tb2PDzPwPrHgz
 28VqUG3+zitRVNBuWdk200HkH6XoL+uomTkfSL2DvmrfVnK9+VLGOfgutpKDBm6lxEae
 JFU/O7i1nryMgvfcrbOTI/qJyjTJqPqS/VH6hmX26QvteLSlLrBQvR/iyHAyFnV+DXqE
 02g+tQMiSselV4fxXlIK0SVjHO6rbOjnef7KK34ll7wseI6cfWbQrI6PQLGlX06497CR
 FEFYgQ3gQXpEUY511dRH2s6jyShaR8Zd2tfvNAG0eCMOQ4DZKWl/7HeVjw5nRFNFEDsu 6A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 33j91dntjc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Sep 2020 16:30:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GGQ2E4007875;
        Wed, 16 Sep 2020 16:30:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 33khpkpsd5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Sep 2020 16:30:30 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08GGUPg7008158;
        Wed, 16 Sep 2020 16:30:25 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 16 Sep 2020 16:30:25 +0000
Subject: Re: [PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Roman Gushchin <guro@fb.com>, Mike Rapoport <rppt@kernel.org>,
        Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>
References: <20200915205703.34572-1-mike.kravetz@oracle.com>
 <4b7b14c9eb6a42509f8324f7ed84b46f@hisilicon.com>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <2bf99eee-29b1-4965-da7d-d4e341803440@oracle.com>
Date:   Wed, 16 Sep 2020 09:30:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4b7b14c9eb6a42509f8324f7ed84b46f@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160118
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/16/20 2:14 AM, Song Bao Hua (Barry Song) wrote:
>>> -----Original Message-----
>>> From: Mike Kravetz [mailto:mike.kravetz@oracle.com]
>>> Sent: Wednesday, September 16, 2020 8:57 AM
>>> To: linux-mm@kvack.org; linux-kernel@vger.kernel.org;
>>> linux-arm-kernel@lists.infradead.org; linux-mips@vger.kernel.org
>>> Cc: Roman Gushchin <guro@fb.com>; Song Bao Hua (Barry Song)
>>> <song.bao.hua@hisilicon.com>; Mike Rapoport <rppt@kernel.org>; Joonsoo
>>> Kim <js1304@gmail.com>; Rik van Riel <riel@surriel.com>; Aslan Bakirov
>>> <aslan@fb.com>; Michal Hocko <mhocko@kernel.org>; Andrew Morton
>>> <akpm@linux-foundation.org>; Mike Kravetz <mike.kravetz@oracle.com>
>>> Subject: [PATCH] cma: make number of CMA areas dynamic, remove
>>> CONFIG_CMA_AREAS
>>>
>>> The number of distinct CMA areas is limited by the constant
>>> CONFIG_CMA_AREAS.  In most environments, this was set to a default
>>> value of 7.  Not too long ago, support was added to allocate hugetlb
>>> gigantic pages from CMA.  More recent changes to make
>> dma_alloc_coherent
>>> NUMA-aware on arm64 added more potential users of CMA areas.  Along
>>> with the dma_alloc_coherent changes, the default value of CMA_AREAS
>>> was bumped up to 19 if NUMA is enabled.
>>>
>>> It seems that the number of CMA users is likely to grow.  Instead of
>>> using a static array for cma areas, use a simple linked list.  These
>>> areas are used before normal memory allocators, so use the memblock
>>> allocator.
>>>
>>> Acked-by: Roman Gushchin <guro@fb.com>
>>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>>> ---
>>> rfc->v1
>>>   - Made minor changes suggested by Song Bao Hua (Barry Song)
>>>   - Removed check for late calls to cma_init_reserved_mem that was part
>>>     of RFC.
>>>   - Added ACK from Roman Gushchin
>>>   - Still in need of arm testing
>>
>> Unfortunately, the test result on my arm64 board is negative, Linux can't boot
>> after applying
>> this patch.
>>
>> I guess we have to hold on this patch for a while till this is fixed. BTW, Mike, do
>> you have
>> a qemu-based arm64 numa system to debug? It is very easy to reproduce, we
>> don't need to
>> use hugetlb_cma and pernuma_cma. Just the default cma will make the boot
>> hang.
> 
> Hi Mike,
> I spent some time on debugging the boot issue and sent a patch here:
> https://lore.kernel.org/linux-mm/20200916085933.25220-1-song.bao.hua@hisilicon.com/
> All details and knic oops can be found there.
> pls feel free to merge my patch into your v2 if you want. And we probably need ack from
> arm maintainers.
> 
> Also,  +Will,
> 
> Hi Will, the whole story is that Mike tried to remove the cma array with CONFIG_CMA_AREAS
> and moved to use memblock_alloc() to allocate cma area, so that the number of cma areas
> could be dynamic. It turns out it causes a kernel panic on arm64 during system boot as the
> returned address from memblock_alloc is invalid before paging_init() is done on arm64.
> 

Thank you!

Based on your analysis, I am concerned that other architectures may also
have issues.

Andrew,
I suggest we remove this patch from your tree.  I will audit all architectures
which enable CMA and look for similar issues there.  Will then merge Barry's
patch into a V2 with any other arch specific changes.
-- 
Mike Kravetz
