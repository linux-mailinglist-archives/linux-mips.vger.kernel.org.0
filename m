Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8A23B2C3D
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 12:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhFXKT5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 06:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45524 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232145AbhFXKT4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Jun 2021 06:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624529857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4frsi0H+HBjHeCdKISuXJMG773wuFNrwEMxUF4xqOQU=;
        b=H1QmQf0HjgfEEO/YXFb07R4kp428RjM92oYJv9BIIfU1pd6duojaDyI7drSXXC1f8H2Ywn
        AvXBDSZI/lrCj8j/ASh1qhpRLH3p3oHWD1DEynMOa3UyttSPWHJ+KipgM4k9oOjf43gYiE
        MaEh2Ii3o4SFW6mTXKeDD9DV8UVUfwc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-eySJLsepPzuvn4CTuMbYEA-1; Thu, 24 Jun 2021 06:17:35 -0400
X-MC-Unique: eySJLsepPzuvn4CTuMbYEA-1
Received: by mail-ej1-f72.google.com with SMTP id jw19-20020a17090776b3b0290481592f1fc4so1836121ejc.2
        for <linux-mips@vger.kernel.org>; Thu, 24 Jun 2021 03:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4frsi0H+HBjHeCdKISuXJMG773wuFNrwEMxUF4xqOQU=;
        b=anBSEBR8JbSUnZChpU17PRQX63KA2mBSuei1SxnpIxDKdA7IG/2iWGt+ZdpkJMBOQs
         amX7WSxZlb9DQZMiPaCrwhsTlB6DuwfURBzY21P1AGYlfQzRUyniLk2CYFAI14XOWeqK
         yofuvKYfbq6KoSPwjch9/QbBdBxl/sA8vc49Av0J2XgoSEk2Z1ze0eholFN3o6sb4U4y
         ZQrw+Mfm7PcRHFTT/zFXUO6q75qSFQ+AwdNTfwdvb90IlAwuTQOt3seVP0pUr4TDL7dV
         u/TVXA/dt6HOgvlPbIEEFJd+P4hDvDOaUvBpsj7zvc7XQhsi22HMffXOHZiqxdzEZ8Af
         BHpQ==
X-Gm-Message-State: AOAM5326y3965/glRVxME+us8LMf79bHzlOqOp4VEyX0Sn0D7aCHOVHw
        m21uSpg1Je3fxsTTEbXCD8m1LLw0aVRCiVGgLQdw9ZGf5FePDov/MFC/JPOn0sv2sgzdY4ek0lw
        nxK9BjGB0Q0M/MEVso7pzcQ==
X-Received: by 2002:a17:906:b254:: with SMTP id ce20mr4621419ejb.480.1624529854691;
        Thu, 24 Jun 2021 03:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxC6TqcAfZORfwKXJXCm8bql8vynsp6j3JYon1fQgnkpoL4xlG5zu/uVtJRITtzGjbxU3KFw==
X-Received: by 2002:a17:906:b254:: with SMTP id ce20mr4621398ejb.480.1624529854552;
        Thu, 24 Jun 2021 03:17:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id x21sm1600772edv.97.2021.06.24.03.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 03:17:33 -0700 (PDT)
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To:     Marc Zyngier <maz@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Cc:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        David Stevens <stevensd@chromium.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
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
 <20210624035749.4054934-4-stevensd@google.com>
 <1624524744.2sr7o7ix86.astroid@bobo.none> <87mtrfinks.wl-maz@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b7f9c30-eb12-35c5-191f-0e8e469e1b88@redhat.com>
Date:   Thu, 24 Jun 2021 12:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87mtrfinks.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/06/21 12:06, Marc Zyngier wrote:
> On Thu, 24 Jun 2021 09:58:00 +0100,
> Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>>> From: David Stevens <stevensd@chromium.org>
>>>   out_unlock:
>>>   	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
>>>   		read_unlock(&vcpu->kvm->mmu_lock);
>>>   	else
>>>   		write_unlock(&vcpu->kvm->mmu_lock);
>>> -	kvm_release_pfn_clean(pfn);
>>> +	if (pfnpg.page)
>>> +		put_page(pfnpg.page);
>>>   	return r;
>>>   }
>>
>> How about
>>
>>    kvm_release_pfn_page_clean(pfnpg);
> 
> I'm not sure. I always found kvm_release_pfn_clean() ugly, because it
> doesn't mark the page 'clean'. I find put_page() more correct.
> 
> Something like 'kvm_put_pfn_page()' would make more sense, but I'm so
> bad at naming things that I could just as well call it 'bob()'.

The best way to go would be to get rid of kvm_release_pfn_clean() and 
always go through a pfn_page.  Then we could or could not introduce 
wrappers kvm_put_pfn_page{,_dirty}.

I think for now it's best to limit the churn since these patches will go 
in the stable releases too, and clean up the resulting API once we have 
a clear idea of how all architectures are using kvm_pfn_page.

Paolo

