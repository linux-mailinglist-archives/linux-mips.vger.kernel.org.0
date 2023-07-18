Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C1C757200
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jul 2023 04:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjGRCu2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jul 2023 22:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjGRCu0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jul 2023 22:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348DE10C8
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 19:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689648580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H+45ZyWb2HqRyHH2F0pUkKRaEVhoBXUcXoMtMWwioBo=;
        b=cPnLEiEzrqkluvY0xYCH8m1vk80xKCyKDh0GKV4zkXNlNR4/5on9UlJPRFSchnHuBjDYmG
        njTOlLZskHUTl8oQNjLjVinxcSuMlxxNg3aHLB44QFAhXrW8UAAWdC3Rk01QcfrLqDnias
        /zbWCNS39C7o3ojFHQr7sPP+/yg51eo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-jkvaz9SBPHS3X0Z2TD9vNA-1; Mon, 17 Jul 2023 22:49:38 -0400
X-MC-Unique: jkvaz9SBPHS3X0Z2TD9vNA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-262d2cae3efso573570a91.1
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 19:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689648577; x=1690253377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+45ZyWb2HqRyHH2F0pUkKRaEVhoBXUcXoMtMWwioBo=;
        b=kgRtDltFC3dU9anYcaqVQ0vJlbJTNH/3Qg+rUIVv0gylSanlstdeF4n8K5ESs2Lkh9
         FNCDKgms5Z7uriDxqMaFtPlBXtUDmj90+XGYMQ8/xxuWbMO2bDEbQSS1e2cuWN8HM4yt
         nIbpwqmdAuH//CF1aeuSMS5/+xQj+C3rQhRu5UCJWow/Zxp5C46ipXUzK/7YmcpWCE4y
         OGSvTjGoR9bS0kUyHjDl8pupd+aN/taFUOdzpAedvU/2tlzkpB0LDS9zI8I3QwSobdUZ
         A/5vY3JqOTaucC5gheN8GzY9OH1GAvxlb8hTS6tFMTXxkRn3ZJlKlTr7D4Hs4GTQvSIy
         UowA==
X-Gm-Message-State: ABy/qLaUk8B1YWcRhce0Asceta/rmPzha6l1kE0gv2HY0KizAXOhyzBC
        zQ6jLU63Ur5c5rm2wkJPfP/VY/rMlfj6w76fJinWwq9oKgtY/GUxC6qaen9u0lIhdcrm73IqT42
        wcc86lkhCLDlVriAUS+0DDQ==
X-Received: by 2002:a17:90b:4f85:b0:264:942:ad27 with SMTP id qe5-20020a17090b4f8500b002640942ad27mr8520260pjb.4.1689648577415;
        Mon, 17 Jul 2023 19:49:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmr1Z6fxgwh3ey9UYla3ldbhFZ9vRtd8xFl4FGgQch6ukr6hDJ/c8wi7DljinMiAbNuTzhgA==
X-Received: by 2002:a17:90b:4f85:b0:264:942:ad27 with SMTP id qe5-20020a17090b4f8500b002640942ad27mr8520243pjb.4.1689648577079;
        Mon, 17 Jul 2023 19:49:37 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id cm10-20020a17090afa0a00b0025dc5749b4csm5693845pjb.21.2023.07.17.19.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 19:49:36 -0700 (PDT)
Message-ID: <fb52139b-5854-6370-7de3-bd87b31e3148@redhat.com>
Date:   Tue, 18 Jul 2023 10:49:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 03/11] KVM: Allow range-based TLB invalidation from
 common code
Content-Language: en-US
To:     Raghavendra Rao Ananta <rananta@google.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-4-rananta@google.com>
 <199d18de-1214-7683-b87a-03cc7e49719a@redhat.com>
 <CAJHc60zhVco3uTq97vDHMk8cgg1psPtwHT6MN1eKP1Yr18d9cw@mail.gmail.com>
From:   Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <CAJHc60zhVco3uTq97vDHMk8cgg1psPtwHT6MN1eKP1Yr18d9cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 7/18/23 00:37, Raghavendra Rao Ananta wrote:
> On Mon, Jul 17, 2023 at 4:40 AM Shaoqin Huang <shahuang@redhat.com> wrote:
>>
>>
>>
>> On 7/15/23 08:53, Raghavendra Rao Ananta wrote:
>>> From: David Matlack <dmatlack@google.com>
>>>
>>> Make kvm_flush_remote_tlbs_range() visible in common code and create a
>>> default implementation that just invalidates the whole TLB.
>>>
>>> This paves the way for several future features/cleanups:
>>>
>>>    - Introduction of range-based TLBI on ARM.
>>>    - Eliminating kvm_arch_flush_remote_tlbs_memslot()
>>>    - Moving the KVM/x86 TDP MMU to common code.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: David Matlack <dmatlack@google.com>
>>> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>    arch/x86/include/asm/kvm_host.h |  3 +++
>>>    arch/x86/kvm/mmu/mmu.c          |  9 ++++-----
>>>    arch/x86/kvm/mmu/mmu_internal.h |  3 ---
>>>    include/linux/kvm_host.h        |  9 +++++++++
>>>    virt/kvm/kvm_main.c             | 13 +++++++++++++
>>>    5 files changed, 29 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>>> index a2d3cfc2eb75..08900afbf2ad 100644
>>> --- a/arch/x86/include/asm/kvm_host.h
>>> +++ b/arch/x86/include/asm/kvm_host.h
>>> @@ -1804,6 +1804,9 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>>>                return -ENOTSUPP;
>>>    }
>>>
>>> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>>> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
>>> +
>>>    #define kvm_arch_pmi_in_guest(vcpu) \
>>>        ((vcpu) && (vcpu)->arch.handling_intr_from_guest)
>>>
>>> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
>>> index ec169f5c7dce..aaa5e336703a 100644
>>> --- a/arch/x86/kvm/mmu/mmu.c
>>> +++ b/arch/x86/kvm/mmu/mmu.c
>>> @@ -278,16 +278,15 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
>>>        return kvm_x86_ops.flush_remote_tlbs_range;
>>>    }
>>>
>>> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
>>> -                              gfn_t nr_pages)
>>> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
>>>    {
>>>        int ret = -EOPNOTSUPP;
>>>
>>>        if (kvm_x86_ops.flush_remote_tlbs_range)
>>>                ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
>>> -                                                                nr_pages);
>>> -     if (ret)
>>> -             kvm_flush_remote_tlbs(kvm);
>>> +                                                                     pages);
>> This will be good if parameter pages aligned with parameter kvm.
>>
> Agreed, but pulling 'pages' above brings the char count to 83. If
> that's acceptable, I'm happy to do it in v7.
> Hi Raghavendra,

no need to pulling 'pages' above, just delete one tab, and add some 
space before the pages, just like the original `nr_pages` position.

Thanks,
Shaoqin
> Thank you.
> Raghavendra
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>>> +
>>> +     return ret;
>>>    }
>>>
>>>    static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
>>> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
>>> index d39af5639ce9..86cb83bb3480 100644
>>> --- a/arch/x86/kvm/mmu/mmu_internal.h
>>> +++ b/arch/x86/kvm/mmu/mmu_internal.h
>>> @@ -170,9 +170,6 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
>>>                                    struct kvm_memory_slot *slot, u64 gfn,
>>>                                    int min_level);
>>>
>>> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
>>> -                              gfn_t nr_pages);
>>> -
>>>    /* Flush the given page (huge or not) of guest memory. */
>>>    static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
>>>    {
>>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>>> index e3f968b38ae9..a731967b24ff 100644
>>> --- a/include/linux/kvm_host.h
>>> +++ b/include/linux/kvm_host.h
>>> @@ -1359,6 +1359,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
>>>    void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
>>>
>>>    void kvm_flush_remote_tlbs(struct kvm *kvm);
>>> +void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages);
>>>
>>>    #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
>>>    int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
>>> @@ -1486,6 +1487,14 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>>>    }
>>>    #endif
>>>
>>> +#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>>> +static inline int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
>>> +                                                gfn_t gfn, u64 pages)
>>> +{
>>> +     return -EOPNOTSUPP;
>>> +}
>>> +#endif
>>> +
>>>    #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
>>>    void kvm_arch_register_noncoherent_dma(struct kvm *kvm);
>>>    void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm);
>>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>>> index d6b050786155..804470fccac7 100644
>>> --- a/virt/kvm/kvm_main.c
>>> +++ b/virt/kvm/kvm_main.c
>>> @@ -366,6 +366,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
>>>    }
>>>    EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
>>>
>>> +void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages)
>>> +{
>>> +     if (!kvm_arch_flush_remote_tlbs_range(kvm, gfn, pages))
>>> +             return;
>>> +
>>> +     /*
>>> +      * Fall back to a flushing entire TLBs if the architecture range-based
>>> +      * TLB invalidation is unsupported or can't be performed for whatever
>>> +      * reason.
>>> +      */
>>> +     kvm_flush_remote_tlbs(kvm);
>>> +}
>>> +
>>>    static void kvm_flush_shadow_all(struct kvm *kvm)
>>>    {
>>>        kvm_arch_flush_shadow_all(kvm);
>>
>> --
>> Shaoqin
>>
> 

-- 
Shaoqin

