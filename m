Return-Path: <linux-mips+bounces-12988-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AG5METqcmnQrAAAu9opvQ
	(envelope-from <linux-mips+bounces-12988-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 04:25:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44E7009C
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 04:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7261A300E3B7
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 03:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914FE37F103;
	Fri, 23 Jan 2026 03:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eXPMNHh9"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D032AABB
	for <linux-mips@vger.kernel.org>; Fri, 23 Jan 2026 03:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769138548; cv=none; b=VrK3AUqN9kwz6cI+Q84M+pn1Poh65uMb1w/pSb9QExFmLlCxnhg84V8wbHAQwcIQSAWqeeYwGAgNmWSaMP6uKnMtU11Qs0ClRxRRbi7PfKTE6fvvOCuGST++lKlZgxyWDPKZxKqn8kIAJ2+XN7haeqX66SCScEtwoo3l/pYnSWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769138548; c=relaxed/simple;
	bh=2Zps9dtzhRYJ8wFG0/fas+U5uJPmFW1YcxCoA4RkDFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8AU3VK4nchjzD0s2m7piVdd/aUKzF6pL//Obh4RmpwN1MJ+GCVk8o1ExaVi2fQeQrwBBpzt+5rnJD2mNJxWdU+ZnNb5xxGucF3r/pfjfng8qET37HdjCEt7AKAE1gJG8uhpwk+B1nxy4VLGIMILVOs34JHPrLJwNlc5Cev7MNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eXPMNHh9; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <fd90c84b-9829-4699-b7df-c43020519ec9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769138529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpeJcCHVDm9aGgZT7fLJbUNNelWHXP+Bu4gd7TvaW7g=;
	b=eXPMNHh9ctUnhtpd2wXxPJprv0KOzhjIIb/JZN2sRw4sr1qJsj2GswbWUwjQC99xFlGN+J
	QxtDjJNo/hWzlNu69ifrt1uEPxLsnWQciI1TqcX0DRrEmtCLkDY/tqkEIuT8fAicEwvtwZ
	cI4zum4BNHwOopAuRPtAWL6yfr/S8g4=
Date: Fri, 23 Jan 2026 11:21:50 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
To: Wei Yang <richard.weiyang@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 ioworker0@gmail.com, linmag7@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
 <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
 <20260101020715.45wqnjgcklvjcth3@master>
 <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
 <20260122140034.ymigrfppzwvmcjkr@master>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260122140034.ymigrfppzwvmcjkr@master>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12988-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,infradead.org,arm.com,linux-foundation.org,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qi.zheng@linux.dev,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bytedance.com:email]
X-Rspamd-Queue-Id: 5C44E7009C
X-Rspamd-Action: no action



On 1/22/26 10:00 PM, Wei Yang wrote:
> On Mon, Jan 19, 2026 at 11:18:52AM +0100, David Hildenbrand (Red Hat) wrote:
>> On 1/1/26 03:07, Wei Yang wrote:
>>> On Wed, Dec 31, 2025 at 05:52:57PM +0800, Qi Zheng wrote:
>>>>
>>>>
>>>> On 12/31/25 5:42 PM, Wei Yang wrote:
>>>>> On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>>>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>>>
>>>>>> The PT_RECLAIM can work on all architectures that support
>>>>>> MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>>>>>> MMU_GATHER_RCU_TABLE_FREE.
>>>>>>
>>>>>> BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>>>>>> to turn it off.
>>>>>>
>>>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>>> ---
>>>>>> arch/x86/Kconfig | 1 -
>>>>>> mm/Kconfig       | 9 ++-------
>>>>>> 2 files changed, 2 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>>>>> index 80527299f859a..0d22da56a71b0 100644
>>>>>> --- a/arch/x86/Kconfig
>>>>>> +++ b/arch/x86/Kconfig
>>>>>> @@ -331,7 +331,6 @@ config X86
>>>>>> 	select FUNCTION_ALIGNMENT_4B
>>>>>> 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>>>>>> 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>>>>>> -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>>>>>> 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>>>>>> 	select SCHED_SMT			if SMP
>>>>>> 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>>>>>> diff --git a/mm/Kconfig b/mm/Kconfig
>>>>>> index bd0ea5454af82..fc00b429b7129 100644
>>>>>> --- a/mm/Kconfig
>>>>>> +++ b/mm/Kconfig
>>>>>> @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>>>>>> 	  The architecture has hardware support for userspace shadow call
>>>>>>              stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>>>>>>
>>>>>> -config ARCH_SUPPORTS_PT_RECLAIM
>>>>>> -	def_bool n
>>>>>> -
>>>>>> config PT_RECLAIM
>>>>>> -	bool "reclaim empty user page table pages"
>>>>>> -	default y
>>>>>> -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>>>>>> -	select MMU_GATHER_RCU_TABLE_FREE
>>>>>> +	def_bool y
>>>>>> +	depends on MMU_GATHER_RCU_TABLE_FREE
>>>>>> 	help
>>>>>> 	  Try to reclaim empty user page table pages in paths other than munmap
>>>>>> 	  and exit_mmap path.
>>>>>
>>>>> Hi, Qi
>>>>>
>>>>> I am new to PT_RECLAIM, when reading related code I got one question.
>>>>>
>>>>> Before this patch,  we could have this config combination:
>>>>>
>>>>>        CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
>>>>>
>>>>> This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
>>>>> is semi rcu version.
>>>>>
>>>>> I am curious could we use rcu version tlb_remove_table_one() for this case?
>>>>> Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
>>>>> there some limitation here?
>>>>
>>>> I think there's no problem. The rcu version can also ensure that the
>>>> fast GUP works well.
>>>>
>>>
>>> Thanks for your quick response :-)
>>>
>>> And Happy New Year
>>>
>>> So my little suggestion is move the definition of __tlb_remove_table_one()
>>> under CONFIG_MMU_GATHER_RCU_TABLE_FREE. Do you thinks this would be more
>>> clear?
>>
>>
>> Do you mean
>>
>> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
>> index 2faa23d7f8d42..6aeba4bae68d2 100644
>> --- a/mm/mmu_gather.c
>> +++ b/mm/mmu_gather.c
>> @@ -319,7 +319,7 @@ static inline void tlb_table_invalidate(struct mmu_gather
>> *tlb)
>>         }
>> }
>>
>> -#ifdef CONFIG_PT_RECLAIM
>> +#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>> static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
>> {
>>         struct ptdesc *ptdesc;
>>
>> ?
> 
> Sorry for the late reply.
> 
> Yes, and maybe we can move the definition to the
> #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE code block above, then to be next to
> tlb_remove_table_free().
> 
> So that we always have rcu version when CONFIG_MMU_GATHER_RCU_TABLE_FREE.

LGTM, could you help submit an official patch?

Thanks,
Qi

> 
>>
>> -- 
>> Cheers
>>
>> David
> 


