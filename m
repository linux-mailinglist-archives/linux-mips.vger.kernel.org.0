Return-Path: <linux-mips+bounces-12983-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMgCCBMycmmadwAAu9opvQ
	(envelope-from <linux-mips+bounces-12983-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 15:20:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2467D62
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 15:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE324945D09
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 14:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78959318B9D;
	Thu, 22 Jan 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE3JzZyS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE3345CC6
	for <linux-mips@vger.kernel.org>; Thu, 22 Jan 2026 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090440; cv=none; b=ISDOOjjR5N7eRs95NIy1imUU54xQkV/yw3/yyeoQWtWE5V5Ur2XRzthIcbU5zcTJ+yTXzJ8bZb1Ja/FskeJfC9mWmF2+c0KHR8drtSXirEJXsQszgsXDN78NkSJgjnfa6dwcu0fqQZPnE41EFkUj1wt+bp5F9mbl1NOSlJZkkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090440; c=relaxed/simple;
	bh=AHSBEaRYfStLiqJd2Yrr0EQ+tzb5DiwinzVPHKX4hIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRccx2mpHHAr8bwESTaHYGMzHv1gDF2xYpHG13Ki4k0+e07iWD/Ukl81jPr5DmqOQ7lQTU4B32FKZjdg9ma9n73T/4vOzDu9X6P1pmK3vzXLdqoRVmbm7u7eHmgWaqNE1JaixLsEN5zhrY8Eii4SxEri42G0PwJKUUYjZ9X1n30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE3JzZyS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b88455e6663so104717166b.1
        for <linux-mips@vger.kernel.org>; Thu, 22 Jan 2026 06:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769090436; x=1769695236; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXXllTpn+4j3DQ+o0FpmjiZEdWUg34VA5GPm+3TDwac=;
        b=mE3JzZySbsZNFXrazHRmfkLgXK1G6CICo/45BaSEMmri8qoPvELmkqlJUJuLq8r/cR
         BZuBE98d600tezPM1Ev3Lv6/wgj1maHQPUX5UMH0X7Bb1TL3sUzOm4dc6Ly1PPaTjaqs
         hDxR1qZKtGXBH67ziEpREgFLFgUdSeobUOgLHgZlfBxr0178fS+J4nD8OTVboWYl3pQt
         VfUZvZP7nVL41fRWgaHUJ4aLvHkvxOcT8JiNj8YivRx/Teoe0yOHaPjpxbMoqspGXGs4
         vz+mawD5KrfuWoRGegQ0STZROYkcYTyB9Mb6z3UbWWha+b7zhPD0i037Q32eJSQYTC72
         KJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769090436; x=1769695236;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXXllTpn+4j3DQ+o0FpmjiZEdWUg34VA5GPm+3TDwac=;
        b=mXi7sOoNvx8EQl0cmVv4Wb/H1mNQbhMqZai63hM+msro2BFvWt3VH9ig6KUyJG1fLi
         0stJdi0G2C+qV3Jv/FCaFqjLYCtppZZ13yYY8cCCvcLv+/nDo97+q6UGGmueHD6M7TkU
         fae3X/EEvMdktgeJQzfn4Tz00ib92NESWBbCvUjS/iAMMftek/LBh1D9zxfk02edvKY+
         i+L3YM65dOOBOAu3qRrv2WEhL4UWJXT51tl6Gp3bvZeZ54MR+d1TNzXl0Yk9vhsQSorN
         Q7LgZbEWdz+VZK/dXsmSOXp3315/Izb4/0eQJEgyEWkIn/6FlT0ISIJO9RVQKdY+6rRY
         z8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW+T2fIGwETolFnxa3wsaRuxg3VIPeTJs/xOWh4ZddEqzXQ1CKPFBeRflI3nxEHZQTsQDcoWKsDjqpB@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuhcKmN/EHGbOf4wQPRafu9a848HjwHm+E3NZWFg7it/yjVX1
	5RnIZ678NPvImtyX2S2RHlQWs+31/J5B4mjX9KXs0uL4xK75/mnNfG6q
X-Gm-Gg: AZuq6aL+SIJKInk1Ttewb8jXKKjejL4RC0c46HMiXC3DMfCLhDO9wQO6Bpac8eA9l/P
	FKUaX8Ut5WSSHuSg2NqLOeiEn6NNNM8MHaZMTe83r6nAg9dLGiso1CB0ofyoKFQXmz4GATaAMYr
	IA1SNMchJu6oCOJW8u2YqWNwYgvkyn6eumNc1AwNF0xjux0+XpCvaRJGEAv5oY9OAvBVng++SfD
	2YuXdzWYB3ri21aqvTrThCgyZ359UnffSucuyhFZhvCcd9iUBW4RldGdkiw60Eikn5tQTF8jrRe
	BsR/1smM9tsaIFHzv5AsvsV3lTDjpZLacW5WxQaeg1jx6XPfJ+FvgYzsL2uAG6l3JNi9s3ix43l
	X8bH490xz0PlLh911OJiFJbXykEZDmGtlzqeCwsz55W+IYAREkiMNjpds2k0XxxS2OvDII2COLI
	DYQXcBCZeamg==
X-Received: by 2002:a17:907:84e:b0:b87:33f3:6042 with SMTP id a640c23a62f3a-b8792d3be6dmr1826205366b.9.1769090435585;
        Thu, 22 Jan 2026 06:00:35 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b884006d3bbsm68748466b.32.2026.01.22.06.00.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jan 2026 06:00:35 -0800 (PST)
Date: Thu, 22 Jan 2026 14:00:34 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, Qi Zheng <qi.zheng@linux.dev>,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
	ioworker0@gmail.com, linmag7@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20260122140034.ymigrfppzwvmcjkr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
 <20251231094243.zmjs7kgflm7q6k73@master>
 <a3a60bbb-70b7-49ed-abc6-937e6c13d681@linux.dev>
 <20260101020715.45wqnjgcklvjcth3@master>
 <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38fcbe5-8b4a-40bc-b8c8-1c49ccaa9964@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-12983-lists,linux-mips=lfdr.de];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	HAS_REPLYTO(0.00)[richard.weiyang@gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richardweiyang@gmail.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,kernel.org,infradead.org,arm.com,linux-foundation.org,vger.kernel.org,kvack.org,lists.linux.dev,lists.infradead.org,bytedance.com];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 47A2467D62
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 11:18:52AM +0100, David Hildenbrand (Red Hat) wrote:
>On 1/1/26 03:07, Wei Yang wrote:
>> On Wed, Dec 31, 2025 at 05:52:57PM +0800, Qi Zheng wrote:
>> > 
>> > 
>> > On 12/31/25 5:42 PM, Wei Yang wrote:
>> > > On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>> > > > From: Qi Zheng <zhengqi.arch@bytedance.com>
>> > > > 
>> > > > The PT_RECLAIM can work on all architectures that support
>> > > > MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>> > > > MMU_GATHER_RCU_TABLE_FREE.
>> > > > 
>> > > > BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>> > > > to turn it off.
>> > > > 
>> > > > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> > > > ---
>> > > > arch/x86/Kconfig | 1 -
>> > > > mm/Kconfig       | 9 ++-------
>> > > > 2 files changed, 2 insertions(+), 8 deletions(-)
>> > > > 
>> > > > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> > > > index 80527299f859a..0d22da56a71b0 100644
>> > > > --- a/arch/x86/Kconfig
>> > > > +++ b/arch/x86/Kconfig
>> > > > @@ -331,7 +331,6 @@ config X86
>> > > > 	select FUNCTION_ALIGNMENT_4B
>> > > > 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> > > > 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> > > > -	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
>> > > > 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
>> > > > 	select SCHED_SMT			if SMP
>> > > > 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>> > > > diff --git a/mm/Kconfig b/mm/Kconfig
>> > > > index bd0ea5454af82..fc00b429b7129 100644
>> > > > --- a/mm/Kconfig
>> > > > +++ b/mm/Kconfig
>> > > > @@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
>> > > > 	  The architecture has hardware support for userspace shadow call
>> > > >             stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>> > > > 
>> > > > -config ARCH_SUPPORTS_PT_RECLAIM
>> > > > -	def_bool n
>> > > > -
>> > > > config PT_RECLAIM
>> > > > -	bool "reclaim empty user page table pages"
>> > > > -	default y
>> > > > -	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>> > > > -	select MMU_GATHER_RCU_TABLE_FREE
>> > > > +	def_bool y
>> > > > +	depends on MMU_GATHER_RCU_TABLE_FREE
>> > > > 	help
>> > > > 	  Try to reclaim empty user page table pages in paths other than munmap
>> > > > 	  and exit_mmap path.
>> > > 
>> > > Hi, Qi
>> > > 
>> > > I am new to PT_RECLAIM, when reading related code I got one question.
>> > > 
>> > > Before this patch,  we could have this config combination:
>> > > 
>> > >       CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM
>> > > 
>> > > This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
>> > > is semi rcu version.
>> > > 
>> > > I am curious could we use rcu version tlb_remove_table_one() for this case?
>> > > Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
>> > > there some limitation here?
>> > 
>> > I think there's no problem. The rcu version can also ensure that the
>> > fast GUP works well.
>> > 
>> 
>> Thanks for your quick response :-)
>> 
>> And Happy New Year
>> 
>> So my little suggestion is move the definition of __tlb_remove_table_one()
>> under CONFIG_MMU_GATHER_RCU_TABLE_FREE. Do you thinks this would be more
>> clear?
>
>
>Do you mean
>
>diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
>index 2faa23d7f8d42..6aeba4bae68d2 100644
>--- a/mm/mmu_gather.c
>+++ b/mm/mmu_gather.c
>@@ -319,7 +319,7 @@ static inline void tlb_table_invalidate(struct mmu_gather
>*tlb)
>        }
> }
>
>-#ifdef CONFIG_PT_RECLAIM
>+#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
> static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
> {
>        struct ptdesc *ptdesc;
>
>?

Sorry for the late reply.

Yes, and maybe we can move the definition to the 
#ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE code block above, then to be next to
tlb_remove_table_free().

So that we always have rcu version when CONFIG_MMU_GATHER_RCU_TABLE_FREE.

>
>-- 
>Cheers
>
>David

-- 
Wei Yang
Help you, Help me

