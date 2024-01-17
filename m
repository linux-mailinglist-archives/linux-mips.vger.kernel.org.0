Return-Path: <linux-mips+bounces-947-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E725A82FF3E
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jan 2024 04:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B82F1C23B5E
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jan 2024 03:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0526928F0;
	Wed, 17 Jan 2024 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BD7Wwthn"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49910F5
	for <linux-mips@vger.kernel.org>; Wed, 17 Jan 2024 03:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705461452; cv=none; b=ZrzkIlsThzRepCRlAyKmN6I32FaeYOmhDasscSrOhrCrQJ2sPCMtfFo55zUjdxbEiOJ0cs5XKfHp3KCSzL7W9gjzuQXibYm1JlUeRsYd6Twe+5UrCd0Oh+fSfEK9ytFIj3+xFYGLSosUa5Si/nGzNeZWvAfxpUivUJSJz58jtyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705461452; c=relaxed/simple;
	bh=6FrV76jorRWk8aXFPVIUHIji96RsK5ufdh6OIzZ0qqE=;
	h=Message-ID:DKIM-Signature:Date:MIME-Version:Subject:
	 Content-Language:To:Cc:References:X-Report-Abuse:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Migadu-Flow; b=W40sXUR+osJzdT+nhaXwQctWjh+ABy5BvjqDiXVnvvaNe1fJct2QvnCYyvIHUKp9++6jtEojxAqKpSDaCGjtZpavgEHbiqHY9G53uoeyg1hMxfRG1kNwqJeKiolYS7OS0XOceOHb2rrHtHjAMZrBLo8EqHcx5YcOgxGkCapZorQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BD7Wwthn; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <234ddaeb-5988-858d-6ba1-0fef90fb7a87@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705461447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSC908aiFP9G9pfXZ6v8h/smDGh99yJWYPnGkGsZUbM=;
	b=BD7WwthnxzeJ3LrTLqB9B0zYUZSWiYUzNYXW8d+KQ5RM+87cTCqdCGye32yPu6YAx48O4P
	SkztbWYZdaBh8JqcST9ndNHIQjTDKcuwbSPQP6RjU+B/FQIGzNMgH4kmmp6z7b/3yl2JP2
	hyo4OXFnaVOs1Dg2BKlgYJ5eOmbQHE4=
Date: Wed, 17 Jan 2024 11:17:18 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: memblock_reserve for unadded region (was: [PATCH] MIPS:
 loongson64: fix boot failure)
Content-Language: en-US
To: Huang Pei <huangpei@loongson.cn>
Cc: Mike Rapoport <rppt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>,
 linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Li Xuefeng <lixuefeng@loongson.cn>, Yang Tiezhu <yangtiezhu@loongson.cn>,
 Gao Juxin <gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
References: <20231225093025.23215-1-huangpei@loongson.cn>
 <731134fd-4b3d-418c-84ee-80646bffcc01@flygoat.com>
 <ZaZAqMwuql9Y5Gra@kernel.org> <20240116122304.qwzy7san2vgspt2x@Board-3A3000>
 <3fc2f75e-d163-1ad1-009a-0e4538011885@linux.dev>
 <20240117030113.gs2fjs6vydthsc6l@Board-3A3000>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yajun Deng <yajun.deng@linux.dev>
In-Reply-To: <20240117030113.gs2fjs6vydthsc6l@Board-3A3000>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2024/1/17 11:01, Huang Pei wrote:
> On Wed, Jan 17, 2024 at 10:20:00AM +0800, Yajun Deng wrote:
>> On 2024/1/16 20:23, Huang Pei wrote:
>>> On Tue, Jan 16, 2024 at 10:39:04AM +0200, Mike Rapoport wrote:
>>>> On Mon, Jan 15, 2024 at 02:08:21PM +0000, Jiaxun Yang wrote:
>>>>> Hi mm folks,
>>>>>
>>>>> Just a quick question, what is the expected behavior of memblock_reserve
>>>>> a region that is not added to memblock with memblock_add?
>>>>>
>>>>> I'm unable to find any documentation about memblock_reserve in comments and
>>>>> boot-time-mm, but as per my understanding to the code, this should be a
>>>>> legit usage?
>>>> Yes, memblock allows reserving memory that was not added to memblock with
>>>> memblock_add().
>>> I think arch/platform specific code should fix this bug, like,
>>> --------------------------------------------------------------------------
>>> //for loongson64
>>> memblock_set_node(0, 1ULL << 44, &memblock.reserved, 0);
>>>
>>> --------------------------------------------------------------------------
>>>
>>> or maybe memblock provide something like memblock_reserve_node
>> Hi pei,
>>
>> Can you test the following patch to see if it fixes this bug?
>>
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 2c19f5515e36..97721d99fdce 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -708,6 +708,9 @@ static void __meminit init_reserved_page(unsigned long
>> pfn, int nid)
>>          pg_data_t *pgdat;
>>          int zid;
>>
>> +       if (unlikely(nid == NUMA_NO_NODE || nid >= MAX_NUMNODES))
>> +               nid = early_pfn_to_nid(pfn);
>> +
>>          if (early_page_initialised(pfn, nid))
>>                  return;
> I do not think this fix set the right nid, ONLY arch/platform know that
> nid
>
>   int __meminit early_pfn_to_nid(unsigned long pfn)
> {
> 	static DEFINE_SPINLOCK(early_pfn_lock);
> 	int nid;
>
> 	spin_lock(&early_pfn_lock);
> 	nid = __early_pfn_to_nid(pfn,
> 			&early_pfnnid_cache);
> 	if (nid < 0)
> 	//!!!first_online_node MAY NOT be the node the pfn belong to!!!
> 		nid = first_online_node;
>
> 	spin_unlock(&early_pfn_lock);
>
> 	return
> 		nid;
> }


Okay, I don't think this bug is caused by commit 61167ad5fecd ("mm: pass 
nid to reserve_bootmem_region()"),

because even if you revert this commit, it will still get nid by 
early_pfn_to_nid(). Did I get that right?

>>
>>>>> In practical we run into uninitialized nid of reserved block problem, should
>>>>> we fix it
>>>>> in our usage, or on memblock side?
>>>> Apparently it's a bug in memblock :(
>>>>
>>>> If you revert 61167ad5fecd ("mm: pass nid to reserve_bootmem_region()")
>>>> does the issue disappear?
>>> Yes, I git bisect this commit.
>>>
>>> But I don't think it is a bug in memblock. IMO, memblock_reserve under
>>> NUMA set nid of reserved region to MAX_NUMNODES, which is the point
>>> that cause the "memblock_get_region_node from memmap_init_reserved_pages "
>>> passing a invalid node id(aka MAX_NUMNODES) to "reserver_bootmem_region
>>> -> init_reserved_page -> early_pfn_to_nid". If arch-specific code DOES NOT
>>> initialize the nid of reserved region(only it know that), or the reserved
>>> region NOT within a memblock added by memblock_add, memblock can not
>>> give a valid node id to the reserved region. Commit 61167ad5fecd ("mm: pass nid to
>>> reserve_bootmem_region()") just reveals the embarrassment case by an
>>> out of bound memory access.
>>>
>>>>> Thanks
>>>>>
>>>>> 在 2023/12/25 09:30, Huang Pei 写道:
>>>>>> Since commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()),
>>>>>> loongson64 booting failed with CONFIG_DEFERRED_STRUCT_PAGE_INIT like
>>>>>> this:
>>>>>> ----------------------------------------------------------------------
>>>>>>     Call Trace:
>>>>>>     [<ffffffff8235d088>] reserve_bootmem_region+0xa8/0x184
>>>>>>     [<ffffffff82333940>] memblock_free_all+0x104/0x2a8
>>>>>>     [<ffffffff8231d8e4>] mem_init+0x84/0x94
>>>>>>     [<ffffffff82330958>] mm_core_init+0xf8/0x308
>>>>>>     [<ffffffff82318c38>] start_kernel+0x43c/0x86c
>>>>>>
>>>>>>     Code: 10400028  2402fff0  de420000 <dc432880> 0203182b 14600022
>>>>>>     64420070  00003025  24040003
>>>>>>
>>>>>>     ---[ end trace 0000000000000000 ]---
>>>>>>     Kernel panic - not syncing: Attempted to kill the idle task!
>>>>>>     ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
>>>>>> ----------------------------------------------------------------------
>>>>>>
>>>>>> The root cause is no memory region "0x0-0x1fffff" paired with
>>>>>> memory-reserved region "0x0-0x1fffff" and "0x0-0xfff", with "memblock
>>>>>> =debug":
>>>>>>
>>>>>> ----------------------------------------------------------------------
>>>>>>      memory[0x0]     [0x0000000000200000-0x000000000effffff],
>>>>>>      0x000000000ee00000 bytes on node 0 flags: 0x0 !!!!here
>>>>>>      memory[0x1]     [0x0000000090000000-0x00000000fdffffff],
>>>>>>      0x000000006e000000 bytes on node 0 flags: 0x0
>>>>>>      memory[0x2]     [0x0000000100000000-0x000000027fffffff],
>>>>>>      0x0000000180000000 bytes on node 0 flags: 0x0
>>>>>>      memory[0x3]     [0x0000100000000000-0x000010000fffffff],
>>>>>>      0x0000000010000000 bytes on node 1 flags: 0x0
>>>>>>      memory[0x4]     [0x0000100090000000-0x000010027fffffff],
>>>>>>      0x00000001f0000000 bytes on node 1 flags: 0x0
>>>>>>      reserved.cnt  = 0x1f
>>>>>>      reserved[0x0]   [0x0000000000000000-0x000000000190c80a],
>>>>>>      0x000000000190c80b bytes flags: 0x0 !!!!oops 0x0-0x1fffff not in memory[0]
>>>>>>      reserved[0x1]   [0x000000000190c810-0x000000000190eea3],
>>>>>>      0x0000000000002694 bytes flags: 0x0
>>>>>> ----------------------------------------------------------------------
>>>>>>
>>>>>> It caused memory-reserved region "0x0-0x1fffff" without valid node id
>>>>>> in "memblock_get_region_node" from "memmap_init_reserved_pages", lead to
>>>>>> "reserve_bootmem_region-> init_reserved_page -> early_pfn_to_nid()"
>>>>>> accessing "node_data" out of bound.
>>>>>>
>>>>>> To fix this bug, we should remove unnecessary memory block reservation.
>>>>>>
>>>>>> +. no need to reserve 0x0-0x1fffff below kernel loading address, since
>>>>>> it is not registered by "memblock_add_node"
>>>>>>
>>>>>> +. no need to reserve 0x0-0xfff for exception handling if it is not
>>>>>> registered by "memblock_add" either.
>>>>>>
>>>>>> Fixes: commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region())
>>>>>> Signed-off-by: Huang Pei <huangpei@loongson.cn>
>>>>>> ---
>>>>>>     arch/mips/kernel/traps.c    | 3 ++-
>>>>>>     arch/mips/loongson64/numa.c | 2 --
>>>>>>     2 files changed, 2 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
>>>>>> index 246c6a6b0261..9b632b4c10c3 100644
>>>>>> --- a/arch/mips/kernel/traps.c
>>>>>> +++ b/arch/mips/kernel/traps.c
>>>>>> @@ -2007,7 +2007,8 @@ unsigned long vi_handlers[64];
>>>>>>     void reserve_exception_space(phys_addr_t addr, unsigned long size)
>>>>>>     {
>>>>>> -	memblock_reserve(addr, size);
>>>>>> +	if(memblock_is_region_memory(addr, size))
>>>>>> +		memblock_reserve(addr, size);
>>>>>>     }
>>>>>>     void __init *set_except_vector(int n, void *addr)
>>>>>> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
>>>>>> index 8f61e93c0c5b..0f516dde81da 100644
>>>>>> --- a/arch/mips/loongson64/numa.c
>>>>>> +++ b/arch/mips/loongson64/numa.c
>>>>>> @@ -130,8 +130,6 @@ static void __init node_mem_init(unsigned int node)
>>>>>>     			memblock_reserve((node_addrspace_offset | 0xfe000000),
>>>>>>     					 32 << 20);
>>>>>> -		/* Reserve pfn range 0~node[0]->node_start_pfn */
>>>>>> -		memblock_reserve(0, PAGE_SIZE * start_pfn);
>>>>>>     	}
>>>>>>     }
>>>>> -- 
>>>>> ---
>>>>> Jiaxun Yang
>>>>>
>>>> -- 
>>>> Sincerely yours,
>>>> Mike.

