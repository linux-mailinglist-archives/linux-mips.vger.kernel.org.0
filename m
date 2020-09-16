Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDCF26CB02
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 22:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgIPUPk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 16:15:40 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42066 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbgIPRb3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Sep 2020 13:31:29 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GHSOsr182311;
        Wed, 16 Sep 2020 17:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=16MVLMxJEjiqUj2yCZKb2qIuPejsvOFsf6Uv7KdzcwM=;
 b=Oh9ULta134KSgFt7v49f3Efb9aRp74ymj1fBPooUp6AFLmpBTd+m+J/TBfkSo1fDtx4n
 T6LQ3nkEAv6RwDIbPCaOzPXpU40GPYu3yOuNANTUAoTNQX/6dbOBhDeO5A+6M2A/9d42
 L4Pw9XkYSPR949KVvzWMh8ch5Pl2+yg+U1fT9Wt7KK1iRHQOAWkzs6jDv5VNBXHU/+hf
 Xp7f4lItRqNsuzpkmJb15B3GMZjy1aXTTFVx6Xe4M5DXIKc8DhvazYV4U0YBnYvdcxTi
 USscGpZXe2UNDmiNYqMYGE0b4w7jvoPkrcYsOWHAvnaQLVit7kQLLNY+JgCR3o/NDbhe Sw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 33j91dp56h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Sep 2020 17:31:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GHTs5J134351;
        Wed, 16 Sep 2020 17:31:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 33hm337mvg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Sep 2020 17:31:04 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08GHV0OP017867;
        Wed, 16 Sep 2020 17:31:00 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 16 Sep 2020 17:31:00 +0000
Subject: Re: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Roman Gushchin <guro@fb.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200903030204.253433-1-mike.kravetz@oracle.com>
 <20200916043207.GA713@infradead.org>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <7e730a74-3a9d-a18c-3f6a-f7bb206298d5@oracle.com>
Date:   Wed, 16 Sep 2020 10:30:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916043207.GA713@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160122
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/15/20 9:32 PM, Christoph Hellwig wrote:
> On Wed, Sep 02, 2020 at 08:02:04PM -0700, Mike Kravetz wrote:
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -383,25 +383,34 @@ postcore_initcall(atomic_pool_init);
>>  struct dma_contig_early_reserve {
>>  	phys_addr_t base;
>>  	unsigned long size;
>> +	struct list_head areas;
>>  };
>>  
>> +static __initdata LIST_HEAD(dma_mmu_remap_areas);
>>  
>>  void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
>>  {
>> +	struct dma_contig_early_reserve *d;
>> +
>> +	d = memblock_alloc(sizeof(struct dma_contig_early_reserve),
>> +			sizeof(void *));
>> +	if (!d) {
>> +		pr_err("Unable to allocate dma_contig_early_reserve struct!\n");
>> +		return;
>> +	}
>> +
>> +	d->base = base;
>> +	d->size = size;
>> +	list_add_tail(&d->areas, &dma_mmu_remap_areas);
>>  }
> 
> I wonder if struct cma should grow a flags or type field, so that the
> arm code can simply use cma_for_each_area to iterate the CMA areas for
> the DMA fixup, and we can remove the extra list and the magic hook.

I will look into a way of doing that.

> 
>> +/* modify here */
>> +LIST_HEAD(cma_areas);
> 
> What does this comment mean?

Sorry, that might have been a note to myself that was accidentally left.

> 
>> +static unsigned int cma_area_count;
> 
> It seems this is only used to provide a default name for the CMA
> areas, but all areas actually provide a name, so I think we can drop
> the default naming and the cma_area_count variable entirely.
> 

Seems reasonable.
We can change behavior to require a name.

>>  	if (!size || !memblock_is_region_reserved(base, size))
>>  		return -EINVAL;
>>  
>> +
>>  	/* ensure minimal alignment required by mm core */
> 
> This adds a spurious empty line.

yes, my bad.

>>  static int __init cma_debugfs_init(void)
>>  {
>>  	struct dentry *cma_debugfs_root;
>> -	int i;
>> +	struct cma *c;
>>  
>>  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
>>  
>> -	for (i = 0; i < cma_area_count; i++)
>> -		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
>> +	list_for_each_entry(c, &cma_areas, areas)
>> +		cma_debugfs_add_one(c, cma_debugfs_root);
> 
> I think this should use cma_for_each_area, that way cma_areas can be
> keep static in cma.c.

Yes, will provide a cma_for_each_area routine.

-- 
Mike Kravetz
