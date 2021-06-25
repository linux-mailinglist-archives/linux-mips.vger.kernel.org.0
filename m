Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F363B3E34
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 10:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhFYIJs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 04:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38793 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229850AbhFYIJs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Jun 2021 04:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624608447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
        b=jK0/NpFVp4oMevRWYSWRsakDd42UE7hcTrOSylVlUYAqVgsIs2eTQFyCFvYaWOH9l1dgJX
        mI7hL8T9her949OZD1uxufDCANXBHrAxm9IEBE7IonhGDYPdzNzgM7FXtZFO9w0a6oyyFP
        5LtcrHhGQfQ6TBgTfUyWYAOPQ16cXJA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-QR88ITa7PWqb4Awo6doWOw-1; Fri, 25 Jun 2021 04:07:25 -0400
X-MC-Unique: QR88ITa7PWqb4Awo6doWOw-1
Received: by mail-ed1-f70.google.com with SMTP id y17-20020a0564023591b02903951740fab5so1379076edc.23
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 01:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
        b=hqisoJn1nBvto+ks3GHycuLots5w4cT93jKtdAyRuEPIM6xucGRpcS51zNh6pb0UiB
         rmpUZjy6NvAaTTUtrhj709VuEIhGsamy07ng65C+fnMD2c3gBCQyZsWXeI8DZpz+WSdr
         da6U9xHq17nliTvxnkC5UIvXFIKm+J85snCDg/6SK5gkuAd5JAkk13yomHxfUNL16Qn/
         GwSQ+vAo3ccI5vXW+bLxh21f1pT+/fqM0KiTzYnD7ZKvDrnKvFpYQhiM9JeatWe2Avd9
         yu7rbPKEIOTFWnAjiDPdfVNVJewRr8IpW9xwjyvPXJeMaH8r1PewymLr6025Tzh0y86G
         qjNA==
X-Gm-Message-State: AOAM531DQ7DElg8Yaqd+YXozD+/7OdXWTNhNL8Tlclv0y96Vcp3Oqx3K
        ay3dSnF3si0xb5A9SYeb0icq2QTSEAc+6ndfJSWhi66ZQMFDGn/Uuh4WZW1hpdOCHGJ2xncgrSx
        gyviuY5SLnoIXo8lJjc09pw==
X-Received: by 2002:a17:907:96a8:: with SMTP id hd40mr9411655ejc.546.1624608443912;
        Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVB3z+OXWUecb9ahGrJESZcqrbKx9pnQ6XoxJ6GZ25cMxxTZOEeAuP3MqM1WxvBDGMvZ/qcw==
X-Received: by 2002:a17:907:96a8:: with SMTP id hd40mr9411623ejc.546.1624608443667;
        Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id cf3sm1879380edb.39.2021.06.25.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] KVM: do not allow mapping valid but non-refcounted
 pages
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        David Stevens <stevensd@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Nick Piggin <npiggin@gmail.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210625073616.2184426-1-stevensd@google.com>
 <20210625073616.2184426-2-stevensd@google.com>
 <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e865b84-7b8f-bd2d-5e74-f46b257ad858@redhat.com>
Date:   Fri, 25 Jun 2021 10:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/06/21 09:58, Christian Borntraeger wrote:
> 
> 
> On 25.06.21 09:36, David Stevens wrote:
>> From: Nicholas Piggin <npiggin@gmail.com>
>>
>> It's possible to create a region which maps valid but non-refcounted
>> pages (e.g., tail pages of non-compound higher order allocations). These
>> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
>> of APIs, which take a reference to the page, which takes it from 0 to 1.
>> When the reference is dropped, this will free the page incorrectly.
>>
>> Fix this by only taking a reference on the page if it was non-zero,
>> which indicates it is participating in normal refcounting (and can be
>> released with put_page).
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> I guess this would be the small fix for stable? Do we want to add that cc?
> 
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

Yes, this one is going to Linus today.  The rest is for 5.15.

Paolo

>> ---
>>   virt/kvm/kvm_main.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 3dcc2abbfc60..f7445c3bcd90 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2175,6 +2175,13 @@ static bool vma_is_valid(struct vm_area_struct 
>> *vma, bool write_fault)
>>       return true;
>>   }
>>
>> +static int kvm_try_get_pfn(kvm_pfn_t pfn)
>> +{
>> +    if (kvm_is_reserved_pfn(pfn))
>> +        return 1;
>> +    return get_page_unless_zero(pfn_to_page(pfn));
>> +}
>> +
>>   static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>>                      unsigned long addr, bool *async,
>>                      bool write_fault, bool *writable,
>> @@ -2224,13 +2231,21 @@ static int hva_to_pfn_remapped(struct 
>> vm_area_struct *vma,
>>        * Whoever called remap_pfn_range is also going to call e.g.
>>        * unmap_mapping_range before the underlying pages are freed,
>>        * causing a call to our MMU notifier.
>> +     *
>> +     * Certain IO or PFNMAP mappings can be backed with valid
>> +     * struct pages, but be allocated without refcounting e.g.,
>> +     * tail pages of non-compound higher order allocations, which
>> +     * would then underflow the refcount when the caller does the
>> +     * required put_page. Don't allow those pages here.
>>        */
>> -    kvm_get_pfn(pfn);
>> +    if (!kvm_try_get_pfn(pfn))
>> +        r = -EFAULT;
>>
>>   out:
>>       pte_unmap_unlock(ptep, ptl);
>>       *p_pfn = pfn;
>> -    return 0;
>> +
>> +    return r;
>>   }
>>
>>   /*
>>
> 

