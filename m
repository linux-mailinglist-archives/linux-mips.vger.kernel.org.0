Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2F13B2BB1
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhFXJp5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 05:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25407 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231966AbhFXJp4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Jun 2021 05:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624527817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qkxHw284a/HcUQKczqJcr3hZxs0a/eNZzaMIqcieCR4=;
        b=N2dmpoXd8h1tJ/1jVQ8EadWoXvdJ00hsKd76ingRURI7ArP7YM3OVAqgd5iCcGtLbxK3C7
        J0rwSiQGm1W62yubsHJcsSZWAiwG+R6YTX3bMtLXDw+7oAc+B11Z/3FqYtBXdPD45Pcc9x
        UB6haCnVbw5AnTQduuhTYeNyrGJRGKk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-881iQMLiNVCq_zgY0IjSEQ-1; Thu, 24 Jun 2021 05:43:36 -0400
X-MC-Unique: 881iQMLiNVCq_zgY0IjSEQ-1
Received: by mail-ed1-f72.google.com with SMTP id v8-20020a0564023488b0290393873961f6so3032646edc.17
        for <linux-mips@vger.kernel.org>; Thu, 24 Jun 2021 02:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qkxHw284a/HcUQKczqJcr3hZxs0a/eNZzaMIqcieCR4=;
        b=OywsnWtyno7hgmjxOcCQ/Itzx3W93Q3X812F36oybpkBYQNeJDhKmsnf95fOnRFQ28
         poFhEMF5vin5ZNzkv7X6iELEuEm0UouhjdvrYkItvwv9IzD4DljFpT4E/xF06SoWHGWI
         Ddm3yEx5vwxW8YJoJcu1heXqL8y6xob4RMKSGj0QCMSoWFDm6cQz+ACJ5Xyfe3pe3S6s
         4yIKGUaEj+mAXQdsaHDtGf1Y0heT4JgR+5lu/SVyHJO4gSpfflUFMryHjvAka1hjOGVd
         dJv1Z7wwSjMQRc6zZUu0kpn0Qjp4U1X9PlTnAV0beI+lHV9ANJ4LZHS8xNVTjrFJJCVs
         k3+g==
X-Gm-Message-State: AOAM532fgd0e2BfD6y47Vjkcw7OTO+75DAconIoCqBlLPaCsEVS2loGR
        bgiEtDYUlMiopLhv+7SQKtY38uTzudiwgYbsEYLu2YxhAddwWAGyUakCogwy7MGN47BcGqmJJwh
        oI87RIvEN/gBu0WONIFvYfw==
X-Received: by 2002:a05:6402:944:: with SMTP id h4mr5798140edz.76.1624527815208;
        Thu, 24 Jun 2021 02:43:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD6cFFU4Uspcy5dTYBfn7A0VR+4loxnlaoo/QjHY9IN1nmjQ4mSQ+4egclMkG5+RC1oGdqOg==
X-Received: by 2002:a05:6402:944:: with SMTP id h4mr5798117edz.76.1624527814999;
        Thu, 24 Jun 2021 02:43:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id t17sm1544705edv.75.2021.06.24.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 02:43:34 -0700 (PDT)
Subject: Re: [PATCH 1/6] KVM: x86/mmu: release audited pfns
To:     Nicholas Piggin <npiggin@gmail.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        David Stevens <stevensd@chromium.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>
Cc:     Alexandru Elisei <alexandru.elisei@arm.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        James Morse <james.morse@arm.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvmarm@lists.cs.columbia.edu,
        kvm-ppc@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Will Deacon <will@kernel.org>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-2-stevensd@google.com>
 <1624524156.04etgk7zmz.astroid@bobo.none>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4816287a-b9a9-d3f4-f844-06922d696e06@redhat.com>
Date:   Thu, 24 Jun 2021 11:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624524156.04etgk7zmz.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/06/21 10:43, Nicholas Piggin wrote:
> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>> From: David Stevens <stevensd@chromium.org>
> 
> Changelog? This looks like a bug, should it have a Fixes: tag?

Probably has been there forever... The best way to fix the bug would be 
to nuke mmu_audit.c, which I've threatened to do many times but never 
followed up on.

Paolo

> Thanks,
> Nick
> 
>>
>> Signed-off-by: David Stevens <stevensd@chromium.org>
>> ---
>>   arch/x86/kvm/mmu/mmu_audit.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
>> index cedc17b2f60e..97ff184084b4 100644
>> --- a/arch/x86/kvm/mmu/mmu_audit.c
>> +++ b/arch/x86/kvm/mmu/mmu_audit.c
>> @@ -121,6 +121,8 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64 *sptep, int level)
>>   		audit_printk(vcpu->kvm, "levels %d pfn %llx hpa %llx "
>>   			     "ent %llxn", vcpu->arch.mmu->root_level, pfn,
>>   			     hpa, *sptep);
>> +
>> +	kvm_release_pfn_clean(pfn);
>>   }
>>   
>>   static void inspect_spte_has_rmap(struct kvm *kvm, u64 *sptep)
>> -- 
>> 2.32.0.93.g670b81a890-goog
>>
>>
> 

