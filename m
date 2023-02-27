Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E302A6A42B2
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 14:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjB0Nct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 08:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjB0Ncf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 08:32:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F23820D02
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 05:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677504702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V+6qFC7OXniFoFqHVWKESI1xjQfVcOUspp9yumvENXI=;
        b=ex46fXXrhKmDPYEWGcB+af8vCe1J2IzZwA/e2KmgnAYszjSYEeJRhD0SpcUuO1qPy3fF9X
        XAUmcoTTxXm+25+CGrHsNBZUTmHTyITfycVgVEzyB9To6mrfHrZuTHv/h//7qCbivgE7jW
        G/8xMJixjPXbKePOGt18zoDHMoIkxVA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-44LnH5nyMlWjIsrirzBjbw-1; Mon, 27 Feb 2023 08:31:41 -0500
X-MC-Unique: 44LnH5nyMlWjIsrirzBjbw-1
Received: by mail-wr1-f70.google.com with SMTP id g6-20020adfa486000000b002c55ef1ec94so839177wrb.0
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 05:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+6qFC7OXniFoFqHVWKESI1xjQfVcOUspp9yumvENXI=;
        b=XhmKaa7ioXxGT5LsKHzGDsHefDVD9NPa4e/eDQl4T/y3hsDB7KTAtgLp/ji+mqoUt+
         sjQk23PQyDvPsfpN8IgNA8m/6dbPhPHhuViEDiAeL4g8pg6gJVHt2RAjFt6/Xp3dM/WC
         b9f0PBZr6uJZsK+qOdSwrTIVdk0N+hs2r0LBLNjNzIjNrmCeVcNAV8DmqK/OHwnb5jjQ
         MRKQCPCMPsmZ1nsj0YGtSPo1+1AKBtLo5n89BiNWAX/O9xRKPJJ1aGR6XnkGEYpE8n6U
         cMHAGcLrbJGYjZO8vL+3lSDYxY/dzMIPw8HdUH8/JfkNfbWW4e/DK3puvhmI9ITNGy5x
         7uNw==
X-Gm-Message-State: AO0yUKX6oNKpFsSJIg945LM1n2mPAGjj1WY4Ub7bAfaWM0myKo0NTtGq
        dn+XaH9rpmifaDHoox0nir1//F2EI1RzU/LXuc0lpE4Ye+Cw3qd1QZjwjhxvaqeQzgnHfYSMwvA
        hKvhr1S9bT+gWstrREdWd8w==
X-Received: by 2002:a05:600c:3d9b:b0:3ea:f6c4:5f2a with SMTP id bi27-20020a05600c3d9b00b003eaf6c45f2amr11631369wmb.17.1677504699852;
        Mon, 27 Feb 2023 05:31:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9k8OE3X06H0t6ffblDghDw4p6MluetLQ2Nt3K/GymnPq5PiNVd71t1cUTwSWsd1hBXO2jKVw==
X-Received: by 2002:a05:600c:3d9b:b0:3ea:f6c4:5f2a with SMTP id bi27-20020a05600c3d9b00b003eaf6c45f2amr11631342wmb.17.1677504699482;
        Mon, 27 Feb 2023 05:31:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:1f00:7816:2307:5967:2228? (p200300cbc7031f007816230759672228.dip0.t-ipconnect.de. [2003:cb:c703:1f00:7816:2307:5967:2228])
        by smtp.gmail.com with ESMTPSA id m34-20020a05600c3b2200b003df5be8987esm14091432wms.20.2023.02.27.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 05:31:38 -0800 (PST)
Message-ID: <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
Date:   Mon, 27 Feb 2023 14:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
In-Reply-To: <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
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

On 26.02.23 21:13, Geert Uytterhoeven wrote:
> Hi David,

Hi Geert,

> 
> On Fri, Jan 13, 2023 at 6:16 PM David Hildenbrand <david@redhat.com> wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the type. Generic MM currently only uses 5 bits for the type
>> (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.
>>
>> The shift by 2 when converting between PTE and arch-specific swap entry
>> makes the swap PTE layout a little bit harder to decipher.
>>
>> While at it, drop the comment from paulus---copy-and-paste leftover
>> from powerpc where we actually have _PAGE_HASHPTE---and mask the type in
>> __swp_entry_to_pte() as well.
>>
>> Cc: Michal Simek <monstr@monstr.eu>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Thanks for your patch, which is now commit b5c88f21531c3457
> ("microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") in
> 

Right, it went upstream, so we can only fixup.

>>   arch/m68k/include/asm/mcf_pgtable.h   |  4 +--
> 
> What is this m68k change doing here?
> Sorry for not noticing this earlier.

Thanks for the late review, still valuable :)

That hunk should have gone into the previous patch, looks like I messed 
that up when reworking.

> 
> Furthermore, several things below look strange to me...
> 
>>   arch/microblaze/include/asm/pgtable.h | 45 +++++++++++++++++++++------
>>   2 files changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
>> index 3f8f4d0e66dd..e573d7b649f7 100644
>> --- a/arch/m68k/include/asm/mcf_pgtable.h
>> +++ b/arch/m68k/include/asm/mcf_pgtable.h
>> @@ -46,8 +46,8 @@
>>   #define _CACHEMASK040          (~0x060)
>>   #define _PAGE_GLOBAL040                0x400   /* 68040 global bit, used for kva descs */
>>
>> -/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
>> -#define _PAGE_SWP_EXCLUSIVE    0x080
>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>> +#define _PAGE_SWP_EXCLUSIVE    CF_PAGE_NOCACHE
> 
> CF_PAGE_NOCACHE is 0x80, so this is still bit 7, thus the new comment
> is wrong?

You're right, it's still bit 7 (and we use LSB-0 bit numbering in that 
file). I'll send a fixup.

> 
>>
>>   /*
>>    * Externally used page protection values.
>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
>> index 42f5988e998b..7e3de54bf426 100644
>> --- a/arch/microblaze/include/asm/pgtable.h
>> +++ b/arch/microblaze/include/asm/pgtable.h
>> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
>>    * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
>>    * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
>>    * zone.
>> - * - PRESENT *must* be in the bottom two bits because swap cache
>> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
>> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
>> - * is cleared in the TLB miss handler before the TLB entry is loaded.
>> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
>> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
>> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
>> + * before the TLB entry is loaded.
> 
> So the PowerPC 4xx comment is still here?

I only dropped the comment above __swp_type(). I guess you mean that we 
could also drop the "Because 4xx doesn't support SMP anyway, M is 
irrelevant so we borrow it for PAGE_PRESENT." sentence, correct? Not 
sure about the "Bit 30 is cleared in the TLB miss handler" comment, if 
that can similarly be dropped.

> 
>>    * - All other bits of the PTE are loaded into TLBLO without
>>    *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>>    * software PTE bits.  We actually use bits 21, 24, 25, and
>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>>   #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>>   #define _PMD_PRESENT   PAGE_MASK
>>
>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
> 
> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
> wrong?

In the example, I use MSB-0 bit numbering (which I determined to be 
correct in microblaze context eventually, but I got confused a couple a 
times because it's very inconsistent). That should be MSB-0 bit 24.

Thanks!

-- 
Thanks,

David / dhildenb

