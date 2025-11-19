Return-Path: <linux-mips+bounces-12289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E6C6E09D
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 11:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69F1E4E629E
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 10:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12FC347FFA;
	Wed, 19 Nov 2025 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WlmCPbWn"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFF6340A46
	for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548690; cv=none; b=shP/7GfsGuK3I6bahLEfIywBleDKJEgqBlZYdUmbJPGy6HniO3JbmXPT/NGqkR+MqZMVpt6kNkAyP9Red1YGOEqjo85myYBUj4bHu2JPQkHHBQctVlPSran05YbJA8MSyaD/dq6aijJQIjB/ndU47WMZjT8fd4iNZqwFaG1Mns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548690; c=relaxed/simple;
	bh=qsv2yYTKolrKy0b9rHk18vlAbL6i6ada3LOYA8zKeVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4ToauAnCDYkoz/73OX9/G5boged4dDnAzzgInfOwXtxoaj6fQg9bgEr0+szYuPb5taitVNpoe7mS+5/AQe24Z0FldB14St+PZMgjyRk4HpVOdFE8+22td9V3xp6VBfc2DrTPAu9tocKLJyKJ4cGeQolDzpScXE3q+CYBgI9c+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WlmCPbWn; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <9c884aeb-c1ec-4fe0-8495-639344633569@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763548677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2TBsWCikXGWQPUUHsPA7sycMNKDe7zouYf7GZ8q6JeI=;
	b=WlmCPbWnPdAaCcans4XB+sX3p9j7swCRg/bKjIgLcOdwHQGNX8Ly6s46NtS/bk1YRUX5nD
	P/USmoX3HrHHdMyNu4n5ttfSh4oinQ+knKhggVYN1S4ezwiWm1UMI+WsjcrjIT6sAYxVwY
	YCuykmmow7b6GErFp6rT+UF5iCgIJi0=
Date: Wed, 19 Nov 2025 18:37:47 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
 dev.jain@arm.com, akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
 <f7f0ca8d-bca2-4a3e-8c45-85cba1b0ff18@gmail.com>
 <afecde77-a4af-40f1-a905-9de8a1bdd783@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <afecde77-a4af-40f1-a905-9de8a1bdd783@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 11/19/25 6:13 PM, David Hildenbrand (Red Hat) wrote:
> On 18.11.25 12:53, Qi Zheng wrote:
>>
>>
>> On 11/18/25 12:53 AM, David Hildenbrand (Red Hat) wrote:
>>> On 14.11.25 12:11, Qi Zheng wrote:
>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>
>>>> Hi all,
>>>>
>>>> This series aims to enable PT_RECLAIM on all 64-bit architectures.
>>>>
>>>> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
>>>> empty PTE
>>>> page table pages (such as 100GB+). To resolve this problem, we need to
>>>> enable
>>>> PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.
>>>>
>>>
>>> Makes sense!
>>>
>>>> Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all
>>>> 64-bit
>>>> architectures, and finally makes PT_RECLAIM depend on
>>>> MMU_GATHER_RCU_TABLE_FREE
>>>> && 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
>>>> architectures.
>>>
>>> Could we then even go ahead and stop making PT_RECLAIM user-selectable?
>>
>> OK, will change to:
> 
> Was more of a question: is there any scenario where we ran so far into 
> issues with it?

No, I haven't received any reports of related issues, either within the
company or in the community.

> 


