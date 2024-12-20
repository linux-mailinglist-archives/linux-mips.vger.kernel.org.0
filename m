Return-Path: <linux-mips+bounces-7113-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64839F9483
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2024 15:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778CE1891568
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2024 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9F4216E1F;
	Fri, 20 Dec 2024 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WpUi0YSd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF12165F9
	for <linux-mips@vger.kernel.org>; Fri, 20 Dec 2024 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705336; cv=none; b=ib2K+02PhhkZSQlUk+eWxNsMwx2P/uDQsDamIhK6NtaGDAVUGv2s69MWCcU7vvc1QVShDQmwBbUk33ztFc1E4a6uDfRgkgRYRxFl/DhfEsKSLt/V7VzrZzTP6kxRZOhTEyh/Uva6WhxuMkRkuKNS4QbEbZHpM4qvR3+HulM9YrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705336; c=relaxed/simple;
	bh=mal3yYV/2puIWYQMpkgozfsCLOtcbEomeCKa3z1Lb4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acC7pt/rWs7jgszcRlDEZ4X9/nkqWP2pD0nMvT6tOxOQ133sADrzKWIlTNC3LvtFJCtIdiFYoCsgJVkPv2ooBGZ704a6HuSBwJJi5LM3kkOBfkK+g16di5DVNJtGnGvXaZxg0ryE2UciVodgkx5/MMg36+WqNJJh/iI2gmkQrjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WpUi0YSd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216281bc30fso21659895ad.0
        for <linux-mips@vger.kernel.org>; Fri, 20 Dec 2024 06:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734705334; x=1735310134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZtvjese48KZzlytF02YIE1ieOtjMj+XC4JVW8Rkw1o=;
        b=WpUi0YSdSzwsedoFq1iaUFnMB1ZuB/fJnX1nhwb+WCgEZd4ahZWHtbpCLoc6mjeFss
         1PqUPopcSeiI8hLGOxgW+V/A3VUH6ba4tTixAO4ugjcXcjYL+K45ZXruc6lObMUkN6bY
         kVfj9y3z5ro0lQIIxHj3W2EENSaL7koOJMx4TRpWVrGvm7F20dLUMuyJTNoe7yrKGjvr
         +cFzDpa810ZozN3J0g6EXhIDowHhVLHwXfmH9nX+kNz1hnIjaXisldeIkRpVQclHtPUQ
         IAPh8QcwrW20GsAztG9Ajud2tCCI4WlH3ANIN+UKjDQRIvsINL6LSUb5Ge0SY615+g0K
         SUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705334; x=1735310134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZtvjese48KZzlytF02YIE1ieOtjMj+XC4JVW8Rkw1o=;
        b=D3XAPbfH6572HOYbzTbaLIRkWwQNDgw+JAkb7OtkiilO/kgTy9Tch7XXmmG3IDpWS3
         0OBIfruUYFGbqgiltwWCadyaGWs+QGZqosPv7/NNcmV/hhpyLkc8vkX/I5hqj2Tu7/8E
         GYvHrHRYjGITdFxRHESorEeSJrB4djoSCo1YI7NBLduA3VMz4VqAD4v2MYwRweflyW4v
         Ha+BPNPATqr8yJSttgOFj9diM/jbHkDxr7vPBbMQWLio45aP0kkAssKZI8KnqCRVvwKH
         AqlN9ynIqqi/mKaD7t022PylUQCp6FhG5q2hEGYlNUev9BX2BqZnrG15nKQAhWaP+bcd
         7NCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyy6imloAkIZ0x2k/C0YzUCaNE9JKa1lJXahdGvI78v2zIur2pXn0U/lcde+GxAqv1azxZ7SG09TQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxefMhobtiRmObFFZskPs/lv8KNPBRiDIsBKNmrqJKNWym9PPs5
	JtobUKbr7oEWrSlxDJvCprigKJ/u10xyVFl74qdyG4m1ekM7Cy7R1MtwdUO871I=
X-Gm-Gg: ASbGnct2fOnc8lnRkR5OkNrCreoTI2sW/HqIX/SzwDm13jQYBMrbXjLQPWXvLi8O0GG
	MBs3UkKOc4CDMwAI3eldZLeYY4J5v8AsjR1LSvQKJ61KgZ9hQgJShixATHvnxdt5nOqo0QqnX4s
	gGg18Mlwc1RcURN2i9GoTZZij3ozy0BCHjAYkYaBHncRhRZoLanrKAD0V339PWf9GqMk7J3qKxR
	rKzW94vaem7j2h8/fO0oaaPpKwpAatkPy3DcnuuN5iEdN0IGngvH2Ix2HNIw3bMZ3FEfv0okYXn
	nJxJ1r6d2cQuofe5IbQ+UrLc49+6u++SRqGbUyDSIxgQ3I4lKGlyC0Y=
X-Google-Smtp-Source: AGHT+IEB+BvsoefjQ7Vgsp4o6cvW8xDLBZZay+9fVCOXIUsW3GchN/svfJCRC88uzsyXVDtiu7XXHA==
X-Received: by 2002:a17:902:d485:b0:215:b5d6:5fa8 with SMTP id d9443c01a7336-219e6ea8948mr44866765ad.22.1734705333728;
        Fri, 20 Dec 2024 06:35:33 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:dc48:fb1b:dd06:cba7? ([2409:8a28:f44:3764:dc48:fb1b:dd06:cba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9704dbsm29773545ad.98.2024.12.20.06.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:35:32 -0800 (PST)
Message-ID: <0725252d-1339-4841-bc1d-6cf9e82b2170@bytedance.com>
Date: Fri, 20 Dec 2024 22:35:23 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
 <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
 <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
 <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
 <7f5e6ac7-01ef-46c8-bc85-7f8399dadb19@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <7f5e6ac7-01ef-46c8-bc85-7f8399dadb19@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/12/20 22:28, Kevin Brodsky wrote:
> On 20/12/2024 15:16, Qi Zheng wrote:
>>>>
>>>> Did I miss something?
>>>>
>>>> My patch series is not only for cleanup, but also for fixes of
>>>> UAF issue [1], so is it possible to rebase your patch series onto
>>>> mine? I can post v3 ASAP.
>>>
>>> I see, yours should be merged first then. The issue is that yours would
>>> depend on some of the patches in mine, not the other way round.
>>>
>>> My suggestion would then be for you to take patch 5, 6 and 7 from my
>>> series, as they match Alexander's suggestions (and patch 5 is I think a
>>> useful simplification), and replace patch 2 in your series with those. I
>>> would then rebase my series on top and adapt it accordingly. Does that
>>> sound reasonable?
>>
>> Sounds good. But maybe just patch 5 and 6. Because I actually did
>> the work of your patch 7 in my patch 2 and 4.
> 
> Yes that's fair! You'd have to do adapt my patch 7 to make it fit in
> your series so I agree it makes more sense this way.

Thanks!

> 
>>
>> So, is it okay to do something like the following?
>>
>> 1. I separate the ctor()/dtor() part from my patch 2, and then replace
>>     the rest with your patch 6.
>> 2. take your patch 5 form your series
> 
> Sounds good to me!
> 
> IIUC Dave Hansen gave his Acked-by for the x86 part of patch 6 [1],
> would make sense to add it when you post your v3.

OK, will add it!

> 
>>
>> If it's ok, I will post the v3 next Monday. ;)
> 
> Perfect. I'm going offline tonight, when I come back in the new year
> I'll review your v3 series and post a new version of this one.

Thank you very much! And Happy New Year!

> 
> Cheers,
> - Kevin
> 
> [1]
> https://lore.kernel.org/linux-mm/a7398426-56d1-40b4-a1c9-40ae8c8a4b4b@intel.com/

