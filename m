Return-Path: <linux-mips+bounces-7279-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA4A03CF2
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2025 11:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B5283A2DAB
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2025 10:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8F91E573D;
	Tue,  7 Jan 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WZn1/CrF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697BE1DFE01
	for <linux-mips@vger.kernel.org>; Tue,  7 Jan 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247086; cv=none; b=Ei2bmzx3mf+Ri6KWazu6eX5xP/74fIkT2Gt5q2jZV6C3D+kh9Pa894A5YcIeWfkhInuhmNMVex9IWmdNPq1ObJhRHPZjBoyv7E9kgS5v83UzEI+TcRI3eAaqbpDLaXia1ojRyFbsnOmgDUyNsuYrR+WAuNcmq2BOpA1h0COxuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247086; c=relaxed/simple;
	bh=BoszZx+BqHikhY7SukX5wUGx8tROnX9EyvNqTYI4nrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyGuhC3FnwH0Bed/ESBN2nBZTrhEOmz2nyaM+1AMBcvUuuwbNz3Y4pYUSX/dOVcLiaoYCSzypEI9HUYTqd7262pWIolTzaoYOlmb8/Fzt1Or2yrX2uqjSkgEOqixr87Q7Fgh9D8y2Y0EX02pclMe4ZtL5i2J5vhZdgD/d+xmVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WZn1/CrF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so194316495ad.2
        for <linux-mips@vger.kernel.org>; Tue, 07 Jan 2025 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736247083; x=1736851883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=WZn1/CrFcDsdR6ptN+5qLnJoSZrqHtFKQKhfnSvvSJCBjuwx1YxrJc4Y0J/1IEVWkK
         1+7MvWDfKKtuUpWHPQBAgMr3BfMwXRarP8HH6Dq2T2mp770fMYLsGQc0abBZ9clw5hRh
         0lu/LHYAjBVUPAzkpgpeFxPdtUz/OJEWis5ENSAVVxifA+i+6zSvdjCIrPdGtA3icvnH
         plPnhly9icfJnwCYrLFdRzAZqysjisG3ulDyrCnSg88EhH58VmPUuViHvWSRVjDh+eOi
         wSEdU84uCK6TtPpVGW9dWc/FiMCKwQyh8NEjKCMjyzuCioLB0AM+R6jReKrt9jQuXNzy
         nUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247083; x=1736851883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=FyJpVR5aNp7pDamOln+aB5IW879IvBKrPlwc/RjF+515PM4IIvHDQYCvzYpz62roRE
         s+G0w7zXQ9Fy+Zt/fQFOWCEdlrlt00UmK+bVxLkorZvdFY9XIPItPpau5VH8NK2X9Q9r
         +oWUQL8nYSNGtXVCe88KjSDun42MUqAbh9m6xYzF5SFBDzfVHakIMt7+12gn1b8JYSqY
         eXyGeP5CElC1/dWIvISw4vzQ8MEHKny7m0/xOraj4JS/Snya6ViL9kUPVjlv4VlvQqjc
         zrwClat11viEeD9Dd9AFbDP8yrhp2SuoPkniOGKnTuwZycWbJNhaOfA2WTRNyRp8EQ5b
         Zy5A==
X-Forwarded-Encrypted: i=1; AJvYcCU6LESFTR211n7wrGzYzQ5uLtWLMZ4ZbCIibC1TafdpN4YYMhyTFTwOUnRW9xTLehkT9X8xXGAQEJ7K@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0CeXKNIWzd8jdWsP1y5OXq/gt/CG5mfkedX3syz+TFCjId+b
	9lt3AVmmFk204j1YVEPYJvN0GrWnlHBidemUHjWnjvPFw/mCQ/3tMFk2QBj+Wis=
X-Gm-Gg: ASbGncsxdUYUfSfxQ+yfU+gkm/kAgMRHcvkFgB1x0SBdziHfPPpTzMYKG3tmqPTgsmt
	BDw6IGNn+f2zKbVfYUNGneNDi+B4Ebj3jn38hE9WA+NtZYU4WMZpptwbPuE/GjnkbHnPfZ2Sl0g
	eR7DMKuiFxDxr0FGUmGMiY2eb2KiyVYp0wrVwGxG8Psu7GdKcV8Cu/PRdgZ+xQwHnPYo9Z7CG7J
	OquAxUG42OmNEDwIUlKk2vHaDy43NfamsQskkCHbMXcHd11tddfxtVlffFagTEy6lSJ8ZKkj5M9
	+axS
X-Google-Smtp-Source: AGHT+IFtbfiI9xlsmfuUVQ2Vnnc4auVp2ktX/5YZgw6vYG9rwgEZ2ifuqdpGqVP2TXFmBqefmQU79g==
X-Received: by 2002:a17:902:ea08:b0:216:7410:7e14 with SMTP id d9443c01a7336-219e6eb5c15mr809959765ad.34.1736247082763;
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca025d1sm307318475ad.254.2025.01.07.02.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Message-ID: <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
Date: Tue, 7 Jan 2025 18:51:07 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 peterz@infradead.org, akpm@linux-foundation.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
 <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
 <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/1/7 17:57, Kevin Brodsky wrote:
> On 06/01/2025 04:49, Qi Zheng wrote:
>> [...]
>>
>>> Once this is done, we should be able to replace all those confusing
>>> calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
>>> the explicit call to pagetable_dtor(). AIUI this is essentially what
>>> Peter suggested on v3 [2].
>>
>> Since this patch series is mainly for bug fix, I think that these things
>> can be done in separate patch series later.
> 
> Sure that's fair.
> 
>>
>>>
>>> [...]
>>>
>>>> Or can we just not let tlb_remove_table() fall back to
>>>> tlb_remove_page()? Like the following:
>>>>
>>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>>> index a59205863f431..354ffaa4bd120 100644
>>>> --- a/include/asm-generic/tlb.h
>>>> +++ b/include/asm-generic/tlb.h
>>>> @@ -195,8 +195,6 @@
>>>>     *  various ptep_get_and_clear() functions.
>>>>     */
>>>>
>>>> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
>>>> -
>>>>    struct mmu_table_batch {
>>>>    #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>>>           struct rcu_head         rcu;
>>>> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>>>>
>>>>    extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>>>
>>>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>>>> -
>>>> -/*
>>>> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>>>> page based
>>>> - * page directories and we can use the normal page batching to free
>>>> them.
>>>> - */
>>>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
>>>
>>> We still need a different implementation of tlb_remove_table() in this
>>> case. We could define it inline here:
>>>
>>> static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
>>> {
>>>       struct page *page = table;
>>>
>>>       pagetable_dtor(page_ptdesc(page));
>>>       tlb_remove_page(page);
>>> }
>>
>> Right. As I said above, will add this to the updated patch #8.
> 
> I think it would be preferable to make it a standalone patch, because
> this is a change to generic code that could in principle impact other
> arch's too.

Agree, I have done that:

```
Author: Qi Zheng <zhengqi.arch@bytedance.com>
Date:   Fri Dec 13 17:13:48 2024 +0800

     mm: pgtable: completely move pagetable_dtor() to generic 
tlb_remove_table()

     For the generic tlb_remove_table(), it is implemented in the 
following two
     forms:

     1) CONFIG_MMU_GATHER_TABLE_FREE is enabled

     tlb_remove_table
     --> generic __tlb_remove_table()

     2) CONFIG_MMU_GATHER_TABLE_FREE is disabled

     tlb_remove_table
     --> tlb_remove_page

     For case 1), the pagetable_dtor() has already been moved to generic
     __tlb_remove_table().

     For case 2), now only arm will call 
tlb_remove_table()/tlb_remove_ptdesc()
     when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move 
pagetable_dtor()
     completely to generic tlb_remove_table(), so that the architectures can
     follow more easily.

     Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8eebdb598631..ea4fbe7b17f6f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
unsigned long addr)
  {
         struct ptdesc *ptdesc = page_ptdesc(pte);

-#ifndef CONFIG_MMU_GATHER_TABLE_FREE
-       pagetable_dtor(ptdesc);
-#endif
-
  #ifndef CONFIG_ARM_LPAE
         /*
          * With the classic ARM MMU, a pte page has two corresponding pmd
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..53ae7748f555b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void *table)

  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);

-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
+#else /* !CONFIG_MMU_GATHER_TABLE_FREE */

+static inline void tlb_remove_page(struct mmu_gather *tlb, struct page 
*page);
  /*
   * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have 
page based
   * page directories and we can use the normal page batching to free them.
   */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
+static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
+{
+       struct page *page = (struct page *)table;

+       pagetable_dtor(page_ptdesc(page));
+       tlb_remove_page(tlb, page);
+}
  #endif /* CONFIG_MMU_GATHER_TABLE_FREE */

  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
```

and will send v5 later.

Thanks!

> 
> - Kevin

