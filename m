Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49666646B1A
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 09:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiLHIyu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 03:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiLHIyt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 03:54:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9542F53ED8
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 00:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670489582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WtVANh0eBS7cuUnAJkHyLAHfwCxkRrG12+slAtG+/Kc=;
        b=OLICTvYRAWvZClShRUAIwD9mWbKVNaKMOB8J9S+fnVKvTFPyAa8mca61v0jvrn2pNrgplw
        esCvIowYvc4M7IljieXbhfyoYPG0fxXHUWHmOSSvNGmbG8YL1adq+9tzuEJbcudSURHbnV
        lVWjNrKKcKHlaIIMUGRrq/NaSERw2FE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-j7De1lxnNhqlUihgPF0PYg-1; Thu, 08 Dec 2022 03:53:01 -0500
X-MC-Unique: j7De1lxnNhqlUihgPF0PYg-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso506159wmb.4
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 00:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtVANh0eBS7cuUnAJkHyLAHfwCxkRrG12+slAtG+/Kc=;
        b=pLVWYwDvfNFiKoib3GwQaDTZwL1H0nrHoxwvEJhzYAl08It3df6wa2bJq8oIiS3oSv
         5PAvGZR03M4nRsxuSHbety78CcKmcN/9ZvQcpxBbVtR6S7AWclDcJVfPB1gSY1daf/Ei
         7Lz8ijSHvfyvUC20rXxoRZUsTQkBHxo+Sx3PeIcqJpivmxOl+EqeT9+T8CdJE0RO6Ux0
         LtgmkcS/M8VkRaRNpQr/rh2HMdwLLVFgqH3ApSn+P7G26NDygwcg42xAMz6W6u8ShX2v
         L+fD3izsS5J0CZ3VRdSr59uETfaVR07anjQvFRTsgsGSONRxkJxYdcZ3nTaLy4G5YC53
         mt+A==
X-Gm-Message-State: ANoB5pnnmatlqzG+ursEDJoQaDkDXr4LQdV1BofW95Vs+WdW2dkt0T7Q
        xrNy8TBwsc4eeK7yD2uD4B7oZpbM2qMifkxfgwwhi9CWpFc7ZLxMkMmC4AJdpb5M6MzaiUjqn4p
        SMGhmK+JmpRSIRPurH/b0+A==
X-Received: by 2002:a7b:c3d3:0:b0:3d1:cec6:75a8 with SMTP id t19-20020a7bc3d3000000b003d1cec675a8mr10610863wmj.206.1670489580101;
        Thu, 08 Dec 2022 00:53:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43lyCBCnse73L4nmQgwKX2lVPb0zDtRkTV00eD7UM2rHA9mTsLvJ7fK1IaCMRkleIpPTdzzg==
X-Received: by 2002:a7b:c3d3:0:b0:3d1:cec6:75a8 with SMTP id t19-20020a7bc3d3000000b003d1cec675a8mr10610851wmj.206.1670489579743;
        Thu, 08 Dec 2022 00:52:59 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c350100b003a2f2bb72d5sm5810986wmq.45.2022.12.08.00.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 00:52:59 -0800 (PST)
Message-ID: <0b5b1303-8bcb-c19d-5f63-0e4a3517fea5@redhat.com>
Date:   Thu, 8 Dec 2022 09:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20221206144730.163732-1-david@redhat.com>
 <20221206144730.163732-18-david@redhat.com>
 <8be167b6-3836-25c3-9f69-b8b3916ee5b4@csgroup.eu>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable RFC 17/26] powerpc/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
In-Reply-To: <8be167b6-3836-25c3-9f69-b8b3916ee5b4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07.12.22 14:55, Christophe Leroy wrote:
> 
> 
> Le 06/12/2022 à 15:47, David Hildenbrand a écrit :
>> We already implemented support for 64bit book3s in commit bff9beaa2e80
>> ("powerpc/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE for book3s")
>>
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also in 32bit by reusing yet
>> unused LSB 2 / MSB 29. There seems to be no real reason why that bit cannot
>> be used, and reusing it avoids having to steal one bit from the swap
>> offset.
>>
>> While at it, mask the type in __swp_entry().
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    arch/powerpc/include/asm/book3s/32/pgtable.h | 38 +++++++++++++++++---
>>    1 file changed, 33 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
>> index 75823f39e042..8107835b38c1 100644
>> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
>> @@ -42,6 +42,9 @@
>>    #define _PMD_PRESENT_MASK (PAGE_MASK)
>>    #define _PMD_BAD	(~PAGE_MASK)
>>    
>> +/* We borrow the _PAGE_USER bit to store the exclusive marker in swap PTEs. */
>> +#define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
>> +
>>    /* And here we include common definitions */
>>    
>>    #define _PAGE_KERNEL_RO		0
>> @@ -363,17 +366,42 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
>>    #define pmd_page(pmd)		pfn_to_page(pmd_pfn(pmd))
>>    
>>    /*
>> - * Encode and decode a swap entry.
>> - * Note that the bits we use in a PTE for representing a swap entry
>> - * must not include the _PAGE_PRESENT bit or the _PAGE_HASHPTE bit (if used).
>> - *   -- paulus
>> + * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
>> + * are !pte_none() && !pte_present().
>> + *
>> + * Format of swap PTEs (32bit PTEs):
>> + *
>> + *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
>> + *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
>> + *   E H P <- type --> <----------------- offset ------------------>
> 
> That's in reversed order. _PAGE_HASHPTE is bit 30 and should be on the
> right hand side. Etc ...

Ugh, messed it up while converting back and forth between LSB 0 and MSB 0.

/*
  * Format of swap PTEs (32bit PTEs):
  *
  *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
  *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
  *   <----------------- offset ------------------> <- type --> E H P


Now the patch description ("unused LSB 2 / MSB 29") makes sense.

Thanks!

Any feedback if the bit could be problematic?

-- 
Thanks,

David / dhildenb

