Return-Path: <linux-mips+bounces-2915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5EF8B3E38
	for <lists+linux-mips@lfdr.de>; Fri, 26 Apr 2024 19:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA8B1F25975
	for <lists+linux-mips@lfdr.de>; Fri, 26 Apr 2024 17:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F30B173344;
	Fri, 26 Apr 2024 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRatC0TY"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EE172BC3
	for <linux-mips@vger.kernel.org>; Fri, 26 Apr 2024 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714152520; cv=none; b=UqSzR4nFHUrf2Qu13Abi1/cim23369g0IFU3D5xzUPcCv5cdNZz+qxJSv1axWTyNmGk9MTXRa1tn5/mmJNCqWvIkSy/Pv2Rs0SEk041Cg4b2Ct+X0sRfaUAUiM3akVOlRRV/Y6Cdop4TZoIM1RULamQuXeo7Xkhz2wTYhob8fIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714152520; c=relaxed/simple;
	bh=lUQ9lWBLKeg3L0+VFu19yPJOKbBf4DRp2XdW9ZemSGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9vwi3xDN6f1j+NvP6kXHHy1JQ/g6UiBFa7jWp92rjk4ZNhU4g6dtNAn5kquSaVRTIsn/5S4E7Pxbg+omVJiV+R+ut5Z/IYhd57T0xivacMnJ77U7RPXFkMNhVO9091A5jCbzoGevHL+tBwplMiVzawLF88/bqJi4Eml8O0cvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRatC0TY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714152517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sF1k7r79nP6D0Cz0V006l7HqgddaXC4/DaqrC5xv5NE=;
	b=GRatC0TYbHKgGNtKEzZ25F8rQ+VPLlCRA2kfUHaLo2cneZ3Nk2BH5Uqz9VGMI7VfvG6S9G
	Z13P1n0tqE472jl6D/f72sv9nwSTTmm37dmlPLiyd10vPADLH8j013lTeHskdNxbYd+c01
	qOnd+eXjAxwCjsGgYKozvg9pLafiNAE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-wgCnFgvVMrm32nkXYpMXmg-1; Fri, 26 Apr 2024 13:28:34 -0400
X-MC-Unique: wgCnFgvVMrm32nkXYpMXmg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-41a074e2d69so10507875e9.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Apr 2024 10:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152514; x=1714757314;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sF1k7r79nP6D0Cz0V006l7HqgddaXC4/DaqrC5xv5NE=;
        b=NAajXygkgfogglmdkoLkMvFPj7US/50g22u0FLDlIxGI9HeEqqrhkYhs9Ra99TwNdJ
         qOZlTLAbIuHBDRddeiraAX4CjdrcUzTChqmuAEszMVoGiwx4sD76AiLsIdIp75KWBUlE
         NdRV8lb0MhcQbqXClK5zPFhTbDsYlfQZio0zfVzzTdCit16FEjmPZtbYcYeFTp6jbXEI
         0zTlcGVfsHHxRwMR/EFLvPKxrq4f2q8CadWX8Npr2mqgr9Sbsej6INYFlzK13XIKrrrA
         Eq9wrtkcwMFk4PUqZnLNPNBg5rKxM+PqWJV5W7Gwe1RPUXGn6lC89vUUkneHTBYtVYqu
         YlZg==
X-Forwarded-Encrypted: i=1; AJvYcCV9t2AJEHOZkYdhkkat8SlyQ/FVX425wRFotJUil9+O2WF8fJA9FAK8Q5kT+0bG6JYilyOl1f25Tji1ADwDUrotDm1WyHD62svH7Q==
X-Gm-Message-State: AOJu0YzUcYOt4e7oi+/TN8ajN7IzmAbiUjddABCsGObYEoPEp/nIMtPV
	LhkYtiqHp8J7wsBQz3EHvAKFgcZKEQ2eZ57ruWzsVf7DINoy52WnnlvWsG28wutTQ5pdyd9GnLW
	c4Ia182Ys0Y/OFtTd7Ut4plvfVzL32CNXJDw4A55nALoWDy/Fr+2miJ1Cd/I=
X-Received: by 2002:a05:600c:4fd2:b0:418:969b:cb46 with SMTP id o18-20020a05600c4fd200b00418969bcb46mr2080079wmq.28.1714152513711;
        Fri, 26 Apr 2024 10:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr4IlE/4F2UM1XSXE5SI2ZMlVXBg8Azkjc4erF1BNEBHpvYYzXnx8PODT9MvcqXOUbLgfoug==
X-Received: by 2002:a05:600c:4fd2:b0:418:969b:cb46 with SMTP id o18-20020a05600c4fd200b00418969bcb46mr2080052wmq.28.1714152513165;
        Fri, 26 Apr 2024 10:28:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6100:20f2:6848:5b74:ca82? (p200300cbc726610020f268485b74ca82.dip0.t-ipconnect.de. [2003:cb:c726:6100:20f2:6848:5b74:ca82])
        by smtp.gmail.com with ESMTPSA id cm14-20020a5d5f4e000000b0034c3885df9asm3080559wrb.76.2024.04.26.10.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 10:28:32 -0700 (PDT)
Message-ID: <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
Date: Fri, 26 Apr 2024 19:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com> <Ziuv2jLY1wgBITiP@x1n>
 <ZivScN8-Uoi9eye8@x1n>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZivScN8-Uoi9eye8@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.04.24 18:12, Peter Xu wrote:
> On Fri, Apr 26, 2024 at 09:44:58AM -0400, Peter Xu wrote:
>> On Fri, Apr 26, 2024 at 09:17:47AM +0200, David Hildenbrand wrote:
>>> On 02.04.24 14:55, David Hildenbrand wrote:
>>>> Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
>>>> all relevant internal functions to start with "gup_fast", to make it
>>>> clearer that this is not ordinary GUP. The current mixture of
>>>> "lockless", "gup" and "gup_fast" is confusing.
>>>>
>>>> Further, avoid the term "huge" when talking about a "leaf" -- for
>>>> example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
>>>> "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
>>>> stays.
>>>>
>>>> What remains is the "external" interface:
>>>> * get_user_pages_fast_only()
>>>> * get_user_pages_fast()
>>>> * pin_user_pages_fast()
>>>>
>>>> The high-level internal functions for GUP-fast (+slow fallback) are now:
>>>> * internal_get_user_pages_fast() -> gup_fast_fallback()
>>>> * lockless_pages_from_mm() -> gup_fast()
>>>>
>>>> The basic GUP-fast walker functions:
>>>> * gup_pgd_range() -> gup_fast_pgd_range()
>>>> * gup_p4d_range() -> gup_fast_p4d_range()
>>>> * gup_pud_range() -> gup_fast_pud_range()
>>>> * gup_pmd_range() -> gup_fast_pmd_range()
>>>> * gup_pte_range() -> gup_fast_pte_range()
>>>> * gup_huge_pgd()  -> gup_fast_pgd_leaf()
>>>> * gup_huge_pud()  -> gup_fast_pud_leaf()
>>>> * gup_huge_pmd()  -> gup_fast_pmd_leaf()
>>>>
>>>> The weird hugepd stuff:
>>>> * gup_huge_pd() -> gup_fast_hugepd()
>>>> * gup_hugepte() -> gup_fast_hugepte()
>>>
>>> I just realized that we end up calling these from follow_hugepd() as well.
>>> And something seems to be off, because gup_fast_hugepd() won't have the VMA
>>> even in the slow-GUP case to pass it to gup_must_unshare().
>>>
>>> So these are GUP-fast functions and the terminology seem correct. But the
>>> usage from follow_hugepd() is questionable,
>>>
>>> commit a12083d721d703f985f4403d6b333cc449f838f6
>>> Author: Peter Xu <peterx@redhat.com>
>>> Date:   Wed Mar 27 11:23:31 2024 -0400
>>>
>>>      mm/gup: handle hugepd for follow_page()
>>>
>>>
>>> states "With previous refactors on fast-gup gup_huge_pd(), most of the code
>>> can be leveraged", which doesn't look quite true just staring the the
>>> gup_must_unshare() call where we don't pass the VMA. Also,
>>> "unlikely(pte_val(pte) != pte_val(ptep_get(ptep)" doesn't make any sense for
>>> slow GUP ...
>>
>> Yes it's not needed, just doesn't look worthwhile to put another helper on
>> top just for this.  I mentioned this in the commit message here:
>>
>>    There's something not needed for follow page, for example, gup_hugepte()
>>    tries to detect pgtable entry change which will never happen with slow
>>    gup (which has the pgtable lock held), but that's not a problem to check.
>>
>>>
>>> @Peter, any insights?
>>
>> However I think we should pass vma in for sure, I guess I overlooked that,
>> and it didn't expose in my tests too as I probably missed ./cow.
>>
>> I'll prepare a separate patch on top of this series and the gup-fast rename
>> patches (I saw this one just reached mm-stable), and I'll see whether I can
>> test it too if I can find a Power system fast enough.  I'll probably drop
>> the "fast" in the hugepd function names too.
> 

For the missing VMA parameter, the cow.c test might not trigger it. We never need the VMA to make
a pinning decision for anonymous memory. We'll trigger an unsharing fault, get an exclusive anonymous page
and can continue.

We need the VMA in gup_must_unshare(), when long-term pinning a file hugetlb page. I *think*
the gup_longterm.c selftest should trigger that, especially:

# [RUN] R/O longterm GUP-fast pin in MAP_SHARED file mapping ... with memfd hugetlb (2048 kB)
...
# [RUN] R/O longterm GUP-fast pin in MAP_SHARED file mapping ... with memfd hugetlb (1048576 kB)


We need a MAP_SHARED page where the PTE is R/O that we want to long-term pin R/O.
I don't remember from the top of my head if the test here might have a R/W-mapped
folio. If so, we could extend it to cover that.

> Hmm, so when I enable 2M hugetlb I found ./cow is even failing on x86.
> 
>    # ./cow  | grep -B1 "not ok"
>    # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
>    not ok 161 No leak from parent into child
>    --
>    # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with hugetlb (2048 kB)
>    not ok 215 No leak from parent into child
>    --
>    # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
>    not ok 269 No leak from child into parent
>    --
>    # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
>    not ok 323 No leak from child into parent
> 
> And it looks like it was always failing.. perhaps since the start?  We

Yes!

commit 7dad331be7816103eba8c12caeb88fbd3599c0b9
Author: David Hildenbrand <david@redhat.com>
Date:   Tue Sep 27 13:01:17 2022 +0200

     selftests/vm: anon_cow: hugetlb tests
     
     Let's run all existing test cases with all hugetlb sizes we're able to
     detect.
     
     Note that some tests cases still fail. This will, for example, be fixed
     once vmsplice properly uses FOLL_PIN instead of FOLL_GET for pinning.
     With 2 MiB and 1 GiB hugetlb on x86_64, the expected failures are:
     
      # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
      not ok 23 No leak from parent into child
      # [RUN] vmsplice() + unmap in child ... with hugetlb (1048576 kB)
      not ok 24 No leak from parent into child
      # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
      not ok 35 No leak from child into parent
      # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (1048576 kB)
      not ok 36 No leak from child into parent
      # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
      not ok 47 No leak from child into parent
      # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (1048576 kB)
      not ok 48 No leak from child into parent
     

As it keeps confusing people (until somebody cares enough to fix vmsplice), I already
thought about just disabling the test and adding a comment why it happens and
why nobody cares.

> didn't do the same on hugetlb v.s. normal anon from that regard on the
> vmsplice() fix.
> 
> I drafted a patch to allow refcount>1 detection as the same, then all tests
> pass for me, as below.
> 
> David, I'd like to double check with you before I post anything: is that
> your intention to do so when working on the R/O pinning or not?

Here certainly the "if it's easy it would already have done" principle applies. :)

The issue is the following: hugetlb pages are scarce resources that cannot usually
be overcommitted. For ordinary memory, we don't care if we COW in some corner case
because there is an unexpected reference. You temporarily consume an additional page
that gets freed as soon as the unexpected reference is dropped.

For hugetlb, it is problematic. Assume you have reserved a single 1 GiB hugetlb page
and your process uses that in a MAP_PRIVATE mapping. Then it calls fork() and the
child quits immediately.

If you decide to COW, you would need a second hugetlb page, which we don't have, so
you have to crash the program.

And in hugetlb it's extremely easy to not get folio_ref_count() == 1:

hugetlb_fault() will do a folio_get(folio) before calling hugetlb_wp()!

... so you essentially always copy.


At that point I walked away from that, letting vmsplice() be fixed at some point. Dave
Howells was close at some point IIRC ...

I had some ideas about retrying until the other reference is gone (which cannot be a
longterm GUP pin), but as vmsplice essentially does without FOLL_PIN|FOLL_LONGTERM,
it's quit hopeless to resolve that as long as vmsplice holds longterm references the wrong
way.

---

One could argue that fork() with hugetlb and MAP_PRIVATE is stupid and fragile: assume
your child MM is torn down deferred, and will unmap the hugetlb page deferred. Or assume
you access the page concurrently with fork(). You'd have to COW and crash the program.
BUT, there is a horribly ugly hack in hugetlb COW code where you *steal* the page form
the child program and crash your child. I'm not making that up, it's horrible.

-- 
Cheers,

David / dhildenb


