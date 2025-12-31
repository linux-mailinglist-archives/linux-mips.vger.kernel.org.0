Return-Path: <linux-mips+bounces-12653-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048FCEBB8E
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 10:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED8B300F8A9
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B661314D0D;
	Wed, 31 Dec 2025 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kA0qCy5s"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57931283C
	for <linux-mips@vger.kernel.org>; Wed, 31 Dec 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174801; cv=none; b=YLCGasa4HawIOoXYbHeY1lcldPfW2jbqC8xQz3st3qqQaYQl3/sNGTlvLyzFg26gLoV7pzvrSd61H6KeQeI9hWeq7Y2WyCMGWFURJY4WHuvmO2wfw1cVKaw37QaXHDLYYW8hm3z2/mWJ1FDQ4pObRqBkITQ7RpM0zbQeDGY9A9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174801; c=relaxed/simple;
	bh=bgKG/XkgrbCcQBOUfd1V/7rkB3OG4Wmzv5QaKooC00k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ka1Y7hyAMW1SymOwZufwUf2gJsR065tZ40KTEBNwUWQbDP4IvFQdDwMdjNj1v3sPBGGkc/0wXJISE+qrz5878T7yTFd1dKhO0L/5grPH0jZOTAyMkoVbPmJRpRTdFZYwZO/UpHCqytLYvcrnGgXXTZFxywRMpwQvvMAFS7zXLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kA0qCy5s; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767174787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wl7HEoZMUzGsbQepWMVSfO0JV4YjBapS0e5mq4W7b+4=;
	b=kA0qCy5swxT9/bUHnpErzkaTUIfgXxao85n1AotjzFLMJUomMkCAQjLXpZ4B+KRO9Tbq2L
	WU+1OAl5FxBAuCo1I3+CkOeCjPhLEPbag/rozOxh+CRn8kHOwBSKIYK4ige8l1o+gK7jtK
	Vz5BljGIGicYjbCKFeIBggxM5nn/wOQ=
Date: Wed, 31 Dec 2025 17:52:57 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
To: Wei Yang <richard.weiyang@gmail.com>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 david@kernel.org, ioworker0@gmail.com, linmag7@gmail.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20251231094243.zmjs7kgflm7q6k73@master>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 12/31/25 5:42 PM, Wei Yang wrote:
> On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> The PT_RECLAIM can work on all architectures that support
>> MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> MMU_GATHER_RCU_TABLE_FREE.
>>
>> BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> to turn it off.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> arch/x86/Kconfig | 1 -
>> mm/Kconfig       | 9 ++-------
>> 2 files changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 80527299f859a..0d22da56a71b0 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -331,7 +331,6 @@ config X86
>> 	select FUNCTION_ALIGNMENT_4B
>> 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>> 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>> 	select SCHED_SMT			if SMP
>> 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index bd0ea5454af82..fc00b429b7129 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>> 	  The architecture has hardware support for userspace shadow call
>>            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>>
>> -config ARCH_SUPPORTS_PT_RECLAIM
>> -	def_bool n
>> -
>> config PT_RECLAIM
>> -	bool "reclaim empty user page table pages"
>> -	default y
>> -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> -	select MMU_GATHER_RCU_TABLE_FREE
>> +	def_bool y
>> +	depends on MMU_GATHER_RCU_TABLE_FREE
>> 	help
>> 	  Try to reclaim empty user page table pages in paths other than munmap
>> 	  and exit_mmap path.
> 
> Hi, Qi
> 
> I am new to PT_RECLAIM, when reading related code I got one question.
> 
> Before this patch,  we could have this config combination:
> 
>      CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
> 
> This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
> is semi rcu version.
> 
> I am curious could we use rcu version tlb_remove_table_one() for this case?
> Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
> there some limitation here?

I think there's no problem. The rcu version can also ensure that the
fast GUP works well.

> 
> Thanks in advance for your explanation.
> 
> 


