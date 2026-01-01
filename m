Return-Path: <linux-mips+bounces-12658-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE771CECC1A
	for <lists+linux-mips@lfdr.de>; Thu, 01 Jan 2026 03:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A6D30057FC
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jan 2026 02:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5333F2877ED;
	Thu,  1 Jan 2026 02:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1n495X4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF4D285050
	for <linux-mips@vger.kernel.org>; Thu,  1 Jan 2026 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767233240; cv=none; b=ZDPODhDjIaGWpintZ17NMfNb4c4sCIs+j25fc927BEgupXRKOkalC4OrTvNEu3nhCOM6ekO5rFVmKVEIlsmqwNlYtbZspk/zRlJcn6vLwbOxLgUJomsxpvsMD3daIzDtENr1gvnNooQ6QG+tb0d64X+5bIxMF/tH8+b+6FH4JDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767233240; c=relaxed/simple;
	bh=NSSdoE7G/g/QaVmDnjP9LfDazgPNO8PlY1pApWlnZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3krVVW2auEKWFCFM2/wzYrAt/NrMFnUosuPuVjphCyLRSSxy1sO9eOaEyO3H0e5bBvPSGsMyBotj17Br1A8vvCcH4D6OeavnY1NEdp8cZ6SCX5xQbtiXLJKHPktPKaURknyx6RfPKdxZHWQXh2GbbuQjWAlD/QTwup8kIJMiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1n495X4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so1423353866b.0
        for <linux-mips@vger.kernel.org>; Wed, 31 Dec 2025 18:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767233237; x=1767838037; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQBF0g7LGMkaWXJONFj1Zzubf3JQP1KLJgb8Ha1McV4=;
        b=i1n495X42Awi4n07MNXXkHhs/ZSWHAPyNb3ik83mMMvg7FjQvBFSC+rSMdi9Px3igo
         ad9Hs5X4ug0sLCxi1ZTfwxmPNhO57XzfFjK2XzYXLBqTwhkTlmvIgF5yW8GvjCkwQbbU
         NBN60YCrFfAHaoYx70H4Caie7FhFlYhTHrDGvZH51ECY9G5L9S84eZ1gsjPoIU5wrf/J
         w1PMy2Fa0iKzfmNLuS3AqPw8moPkPPNKnssHuxbv09FulbTckOiPt0xA063QLX+AwQek
         Yp1rTYvpi2E2k0qvHGE95AmwuJjpGUKSAN9TAAQAPA2l2LmiPgU1KiM9BmVeYPVefN+4
         4vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767233237; x=1767838037;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQBF0g7LGMkaWXJONFj1Zzubf3JQP1KLJgb8Ha1McV4=;
        b=Vt7+ywFKnPlDkWm3L3iwI6Yy2LeCVHe7meHACAlml68V2bS2bWmPmwpGQc7HEOePCp
         ofWrb7Aa7pprdzS4saH2phDU7SSJL4A33VO4N89WP3CZRzLTRKGmZdx2jydEo2AcKSN8
         sBGAEBYHeYSP/FHdhHzTJSMRYCLSTARE30G5Jio0fvGwRyd3CEezjzqxYKWv0mJeHLtS
         oqo95NucE1GMaFnTzqBJX0GE16Z7WsPK2OtJZwHts5+dHvS7T5vhVrZCUFZ0CvUTAJXr
         Diql5eUddnuQHXlQX55Ccq2+3xwtdLA13SRzyEa8ggtyiob6sEcIpVw+PHaZh96ocKL1
         PVrg==
X-Forwarded-Encrypted: i=1; AJvYcCVmujwZmMtFX+64Fb+j4x6hWiB9nVzAp/TkYb/aocm84sg0PowMvnjzjYYScya3SH+qcuWWqfkb5sKu@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJhWtTBYX6JRFV0aa5dg75MtOhZuhaMjne+mg0vq8zUkaPHt3
	RkMKMNgmPOeaXAfj4t3Jkc74VfaXOP8nWXFkAUbE3IsI5L24PHb5XgXI
X-Gm-Gg: AY/fxX6brNVUgzgqUhCGjoBd58yBulT4Ytu5BKzcsDnscOEBJjkH+gXjJScEtfnEFAP
	3nTDyP1UBK+1dMR/WvjgQsGQPITvazA9PhwYVVxB/5xqVoiJef+cOAT2qkYqvHzfuia2xK7xF1c
	GurE4tHfKIuToWBali958YVQGS3xKIMU6D5GJ6KVuUddv2qJM9hDbVRs3/iy2JreRxb/fklkDc2
	02KHhTHWXqDBoJlQmhSz8k5O+tSPZexXCwzgzIEjqnTe0m//RMvxhjLWF4K0mU5hqrUN7lhyB6g
	hqxk09RzH4e8NOIXh9uqfOTJ8x0xV1naJhCxRqV3WLMo5GlzL8NcGGVdXgFK0s1vFdcNJatXmMB
	dF4HLStzkdZr3wnsYdpeqwP1Oq9Tq5e2et62eSxMkaDkfKBpFl4u2FfGc78CL0r0JgZ7Yrv0/cE
	uLTNEWIrwSRg==
X-Google-Smtp-Source: AGHT+IGkCnh9dqfLUptvpy4PZGXmScqGnHYP3DGjjwJuJ8br2u0RfwesNHaEMQG1tTnLLwW9sFl6GQ==
X-Received: by 2002:a17:907:7f05:b0:b72:9961:dc04 with SMTP id a640c23a62f3a-b8036f86950mr4237184166b.28.1767233236739;
        Wed, 31 Dec 2025 18:07:16 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b910601c7sm39251595a12.14.2025.12.31.18.07.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Dec 2025 18:07:16 -0800 (PST)
Date: Thu, 1 Jan 2026 02:07:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: Wei Yang <richard.weiyang@gmail.com>, will@kernel.org,
	aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
	dev.jain@arm.com, akpm@linux-foundation.org, david@kernel.org,
	ioworker0@gmail.com, linmag7@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20260101020715.45wqnjgcklvjcth3@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
 <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Dec 31, 2025 at 05:52:57PM +0800, Qi Zheng wrote:
>
>
>On 12/31/25 5:42 PM, Wei Yang wrote:
>> On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>> > From: Qi Zheng <zhengqi.arch@bytedance.com>
>> > 
>> > The PT_RECLAIM can work on all architectures that support
>> > MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> > MMU_GATHER_RCU_TABLE_FREE.
>> > 
>> > BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> > to turn it off.
>> > 
>> > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> > ---
>> > arch/x86/Kconfig | 1 -
>> > mm/Kconfig       | 9 ++-------
>> > 2 files changed, 2 insertions(+), 8 deletions(-)
>> > 
>> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> > index 80527299f859a..0d22da56a71b0 100644
>> > --- a/arch/x86/Kconfig
>> > +++ b/arch/x86/Kconfig
>> > @@ -331,7 +331,6 @@ config X86
>> > 	select FUNCTION_ALIGNMENT_4B
>> > 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> > 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> > -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>> > 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>> > 	select SCHED_SMT			if SMP
>> > 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> > diff --git a/mm/Kconfig b/mm/Kconfig
>> > index bd0ea5454af82..fc00b429b7129 100644
>> > --- a/mm/Kconfig
>> > +++ b/mm/Kconfig
>> > @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>> > 	  The architecture has hardware support for userspace shadow call
>> >            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>> > 
>> > -config ARCH_SUPPORTS_PT_RECLAIM
>> > -	def_bool n
>> > -
>> > config PT_RECLAIM
>> > -	bool "reclaim empty user page table pages"
>> > -	default y
>> > -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> > -	select MMU_GATHER_RCU_TABLE_FREE
>> > +	def_bool y
>> > +	depends on MMU_GATHER_RCU_TABLE_FREE
>> > 	help
>> > 	  Try to reclaim empty user page table pages in paths other than munmap
>> > 	  and exit_mmap path.
>> 
>> Hi, Qi
>> 
>> I am new to PT_RECLAIM, when reading related code I got one question.
>> 
>> Before this patch,  we could have this config combination:
>> 
>>      CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
>> 
>> This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
>> is semi rcu version.
>> 
>> I am curious could we use rcu version tlb_remove_table_one() for this case?
>> Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
>> there some limitation here?
>
>I think there's no problem. The rcu version can also ensure that the
>fast GUP works well.
>

Thanks for your quick response :-)

And Happy New Year

So my little suggestion is move the definition of __tlb_remove_table_one()
under CONFIG_MMU_GATHER_RCU_TABLE_FREE. Do you thinks this would be more
clear?

>> 
>> Thanks in advance for your explanation.
>> 
>> 

-- 
Wei Yang
Help you, Help me

