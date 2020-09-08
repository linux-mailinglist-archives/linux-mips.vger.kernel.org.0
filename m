Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C28A261A08
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 20:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731235AbgIHS3n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 14:29:43 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:38584 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgIHS3m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 14:29:42 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 088IOSNn069846;
        Tue, 8 Sep 2020 18:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ohq2ao/eaVnIH4UHr6dDfMQ4sB6oBXKsUC8ttv8M1Fc=;
 b=vicZtndQBnYa5kXKqC/l7R2Y8l1E6jOqxrXwDwytZ07G5SEUwOU8OmNcXs6vlktnxOBr
 uHdv/7VjMxCc/LDRyXua+Gv6LnlQOdUzJ1DeKlQ64E+jFi26B7WkOKJvh4jGWkldEDFA
 jqkxrmRreRUZ4cIoGC0B2fiZ5UGVoEj1McT+9GFy3lWLuDU2ObwhX9cGBfWG31Vh1yUd
 S508D2GtUfUZzavzMHx9n/UFnohPKFXbeNZ8euKUwtrXwsOo50jbeMUqyPJ67Cfmmm8s
 S2UJ06LPc0jyU6hx7OLXdEogVtQYz3Yl9Dzy93rG5qTw362KpOnrjFaJTFwzF6Xi3+0S FA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 33c2mkwava-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 08 Sep 2020 18:29:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 088IPQYD029944;
        Tue, 8 Sep 2020 18:29:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 33cmeravtn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Sep 2020 18:29:20 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 088ITHgh027728;
        Tue, 8 Sep 2020 18:29:17 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Sep 2020 11:29:17 -0700
Subject: Re: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Roman Gushchin <guro@fb.com>, Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200903030204.253433-1-mike.kravetz@oracle.com>
 <6b4f0324c6db41a7975267f2ec42e577@hisilicon.com>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <b2f18f10-5ccc-d3ea-c60b-5fd230a2b20a@oracle.com>
Date:   Tue, 8 Sep 2020 11:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6b4f0324c6db41a7975267f2ec42e577@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009080173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080173
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/3/20 6:58 PM, Song Bao Hua (Barry Song) wrote:
> 
>> -----Original Message-----
>> From: Mike Kravetz [mailto:mike.kravetz@oracle.com]
>> Sent: Thursday, September 3, 2020 3:02 PM
>> To: linux-mm@kvack.org; linux-kernel@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-mips@vger.kernel.org
>> Cc: Roman Gushchin <guro@fb.com>; Song Bao Hua (Barry Song)
>> <song.bao.hua@hisilicon.com>; Joonsoo Kim <js1304@gmail.com>; Rik van
>> Riel <riel@surriel.com>; Aslan Bakirov <aslan@fb.com>; Michal Hocko
>> <mhocko@kernel.org>; Andrew Morton <akpm@linux-foundation.org>; Mike
>> Kravetz <mike.kravetz@oracle.com>
>> Subject: [RFC PATCH] cma: make number of CMA areas dynamic, remove
>> CONFIG_CMA_AREAS
>>
>> The number of distinct CMA areas is limited by the constant
>> CONFIG_CMA_AREAS.  In most environments, this was set to a default
>> value of 7.  Not too long ago, support was added to allocate hugetlb
>> gigantic pages from CMA.  More recent changes to make dma_alloc_coherent
>> NUMA-aware on arm64 added more potential users of CMA areas.  Along
>> with the dma_alloc_coherent changes, the default value of CMA_AREAS
>> was bumped up to 19 if NUMA is enabled.
>>
>> It seems that the number of CMA users is likely to grow.  Instead of
>> using a static array for cma areas, use a simple linked list.  These
>> areas are used before normal memory allocators, so use the memblock
>> allocator.
> 
> Hello Mike, It seems it is a good idea. Thanks for addressing this.
> 
> I was focusing on per-numa cma feature in my patchset and I didn't take care of this
> while I thought we should do something for the number of cma areas.
> 

Thanks for taking a look.

One area where I could use some help is testing/verifying on arm.  See the
changes to arch/arm/mm/dma-mapping.c.  I have tested the generic changes on
my x86 platform, but do not have an arm platform for easy testing.

>>  void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long
>> size)
>>  {
>> -	dma_mmu_remap[dma_mmu_remap_num].base = base;
>> -	dma_mmu_remap[dma_mmu_remap_num].size = size;
>> -	dma_mmu_remap_num++;
>> +	struct dma_contig_early_reserve *d;
>> +
>> +	d = memblock_alloc(sizeof(struct dma_contig_early_reserve),
> 
> sizeof(*d)?

Yes.  thanks.

>> @@ -172,15 +173,14 @@ int __init cma_init_reserved_mem(phys_addr_t
>> base, phys_addr_t size,
>>  	struct cma *cma;
>>  	phys_addr_t alignment;
>>
>> -	/* Sanity checks */
>> -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
>> -		pr_err("Not enough slots for CMA reserved regions!\n");
>> -		return -ENOSPC;
>> -	}
>> +	/* Do not attempt allocations after memblock allocator is torn down */
>> +	if (slab_is_available())
>> +		return -EINVAL;
>>
>>  	if (!size || !memblock_is_region_reserved(base, size))
>>  		return -EINVAL;
>>
>> +
> 
> Is this empty line relevant?

No, added by mistake.

>> @@ -192,12 +192,17 @@ int __init cma_init_reserved_mem(phys_addr_t
>> base, phys_addr_t size,
>>  	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
>>  		return -EINVAL;
>>
>> +	cma = memblock_alloc(sizeof(struct cma), sizeof(long));
> 
> sizeof(*cma)?

Yes, thanks.

> It seems we are going to write cma-> count, order_per_bit, debugfs fields.
> To avoid false sharing of the cacheline of struct cma, it is better to align with
> SMP_CACHE_BYTES.
> 
> On the other hand, it seems we are unlikely to write the cma 

I thought about using SMP_CACHE_BYTES, but the structures are simply defined
as an array today.  This should not be any worse.  I do not believe access
to the structures is performance sensitive.

Thanks,
-- 
Mike Kravetz
