Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55476A5C90
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 16:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjB1P5r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 10:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjB1P50 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 10:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D9231E28
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677599747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xBghEncF8boHA8ERPg4saQyYB+zKBnxfff7p7OTCduA=;
        b=Bzq8IokY3k/GJpwh78aJ9A+e5MzynQFp4XCe+4dEyBin9vQKFT0M4qmBIUR1Zwtst/Bla5
        JJVEVwrcthE9UZlNxVDfBF4mliVjP4NGv4b56Ym26IUInhmSwsWCxS5cfQDhyDmljjgcS9
        /a693KGZrhH9xUGfLSEjzndinCSQPBU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-DW19HEN2MnynV4OEBwWV3g-1; Tue, 28 Feb 2023 10:55:45 -0500
X-MC-Unique: DW19HEN2MnynV4OEBwWV3g-1
Received: by mail-wm1-f71.google.com with SMTP id z6-20020a7bc7c6000000b003e0107732f4so3777050wmk.1
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 07:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBghEncF8boHA8ERPg4saQyYB+zKBnxfff7p7OTCduA=;
        b=xhYKBaZdkC5uqf61gBg2BP5Z3UF8oH1Nm+xIwAm4N4mUr2m/IshAw49K8FrXoPTHwH
         j0igDIoVVn3Ko3TwNxIq0lSVGNXFZ9EwYhUbexSKJgLMa43sXn+sC448VVlRbj4mb0TA
         63o0Dlb46vVyaa1zvL9+bj2xgugkoP1xNAxyvmYs2+xA5rfWpimNZLJdSD/KQzoinLfz
         MwcMkkrgdVHVp/2MsFEG7v5a3cLtVA/jnaqFg5XZPisEgOF4By2XZ5ZoVSCgsnlX6tRu
         6vUDRooLdQJe1neHg9EEaYBfZrZ9xIikEGyKGuQw1AVrmNsD3WvVtJM+nThV7jDm4ygT
         8gjg==
X-Gm-Message-State: AO0yUKVSR6b2JJHKvJILAA9X2ISVEdJh9/nHKlskqwock2ykxZWHf6g7
        moeJ/iv/EcgnyX5fESE4xzUSImXTUacUlP1G2aWm57sPmDAXDjWmlSLrS883lgILM8dlTtoQjAr
        1ptiV65+YJe8XpHom1rMLLw==
X-Received: by 2002:a05:600c:350f:b0:3eb:3945:d400 with SMTP id h15-20020a05600c350f00b003eb3945d400mr2593167wmq.6.1677599743553;
        Tue, 28 Feb 2023 07:55:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+wnf2WDMcprxngEfzcv3vYTz2vjDLBbvltb+8+t+ERFjJxQhjmdzxRvt+YBcvxcSrV4CC0jA==
X-Received: by 2002:a05:600c:350f:b0:3eb:3945:d400 with SMTP id h15-20020a05600c350f00b003eb3945d400mr2593150wmq.6.1677599743200;
        Tue, 28 Feb 2023 07:55:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id o25-20020a05600c511900b003dfe549da4fsm18407191wms.18.2023.02.28.07.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:55:42 -0800 (PST)
Message-ID: <5d99c731-c47a-c525-76e5-4578d9dfc9ee@redhat.com>
Date:   Tue, 28 Feb 2023 16:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Michal Simek <monstr@monstr.eu>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
 <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
 <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
 <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
 <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27.02.23 20:46, Geert Uytterhoeven wrote:
> Hi David,
> 
> On Mon, Feb 27, 2023 at 6:01 PM David Hildenbrand <david@redhat.com> wrote:
>>>>>>     /*
>>>>>>      * Externally used page protection values.
>>>>>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
>>>>>> index 42f5988e998b..7e3de54bf426 100644
>>>>>> --- a/arch/microblaze/include/asm/pgtable.h
>>>>>> +++ b/arch/microblaze/include/asm/pgtable.h
> 
>>>>>>      * - All other bits of the PTE are loaded into TLBLO without
>>>>>>      *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>>>>>>      * software PTE bits.  We actually use bits 21, 24, 25, and
>>>>>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>>>>>>     #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>>>>>>     #define _PMD_PRESENT   PAGE_MASK
>>>>>>
>>>>>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>>>>>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
>>>>>
>>>>> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
>>>>> wrong?
>>>>
>>>> In the example, I use MSB-0 bit numbering (which I determined to be
>>>> correct in microblaze context eventually, but I got confused a couple a
>>>> times because it's very inconsistent). That should be MSB-0 bit 24.
>>>
>>> Thanks, TIL microblaze uses IBM bit numbering...
>>
>> I assume IBM bit numbering corresponds to MSB-0 bit numbering, correct?
> 
> Correct, as seen in s370 and PowerPC manuals...

Good, I have some solid s390x background, but thinking about the term 
"IBM PC" made me double-check that we're talking about the same thing ;)

> 
>> I recall that I used the comment above "/* Definitions for MicroBlaze.
>> */" as an orientation.
>>
>> 0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
>> RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G
> 
> Indeed, that's where I noticed the "unconventional" numbering...
> 
>> So ... either we adjust both or we leave it as is. (again, depends on
>> what the right thing to to is -- which I don't know :) )
> 
> It depends whether you want to match the hardware documentation,
> or the Linux BIT() macro and friends...

The hardware documentation, so we should be good.

Thanks!

-- 
Thanks,

David / dhildenb

