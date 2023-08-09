Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69FA27751CF
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 06:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjHIELQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Aug 2023 00:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjHIELP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Aug 2023 00:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E69619AF
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 21:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691554228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tiZt5qkV373iiZscCJbcFROPFCou/fOb43yGS5e3+0c=;
        b=OkBpJ4hjb4XeaPhRFCc9NGg1ldWTUzHvjxvWCDdKLNaRinp2X73RgxzCBcGpAtUOl5HLh7
        cEsQDo9nZ271hbPwuSkPUgAqEHTVHgn5UjZepE4mTHaZcrYVG/jTINy9RKu8pI8Evb2j+v
        xQw+/fnr7bIOCatNhho+6EGg7/nMNvY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-usLcuqGNMuup8QzbfdAEAw-1; Wed, 09 Aug 2023 00:10:27 -0400
X-MC-Unique: usLcuqGNMuup8QzbfdAEAw-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-686baf1a407so467222b3a.1
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 21:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691554223; x=1692159023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tiZt5qkV373iiZscCJbcFROPFCou/fOb43yGS5e3+0c=;
        b=f7fl95vsc4+qcmxjfh5iqCh674HlZ7EVBD3FB1cmm27zGW2wQoJdozFV4rkW0HoaGa
         BBVWMhAVcaMDpGMiGbWXY+vaQ+iGv47HpF7zTUgxTpyi74eL6WgU8a16b9K9Zl70GxSZ
         1rF7bzKQkLVLPGehom2S14pjbrjyzJY97Xj/oQHsMvZLCncGUB9B8PAiDMeGRcppiyOe
         QvsfPl1FywXKRE4rQcpMax26fGvkIeMll1pYGG/SGvvwNDjNXVuFaSs4LVWS/y5Z6+Dd
         OsIKTrsNhV2pJbJdbNt5ifz709DFLPvu3hl9PQ2EWIiZQCS/eKMf2PTVdaduOaw/fF6A
         26pg==
X-Gm-Message-State: AOJu0YzzSAXjCVey78k1MF9ZqlNbw5/Qge0dzZoHbTNm1o2wRzanuNDr
        KsqiYEoYV+XjGLG4w25c7O96x4NQ75ZcLUJ7AQ6I4lvl64vDjbFxKQsjXhhggINbXjlKeUmTtcD
        mpXcGTnthAzWiNz1bpcMJ2Q==
X-Received: by 2002:a05:6a00:1487:b0:666:eaaf:a2af with SMTP id v7-20020a056a00148700b00666eaafa2afmr2263665pfu.14.1691554222956;
        Tue, 08 Aug 2023 21:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4mKNqTgX+EsfCEP/MYW99W9JIOB5kHuLZbEs18DPRnq1dfDRhMLd6YmPemv3TlybaLWWmcQ==
X-Received: by 2002:a05:6a00:1487:b0:666:eaaf:a2af with SMTP id v7-20020a056a00148700b00666eaafa2afmr2263648pfu.14.1691554222702;
        Tue, 08 Aug 2023 21:10:22 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id p26-20020a62ab1a000000b006871fdde2c7sm8840727pff.110.2023.08.08.21.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 21:10:22 -0700 (PDT)
Message-ID: <b91d1869-3a1d-d9eb-27b0-0aac94cca8e0@redhat.com>
Date:   Wed, 9 Aug 2023 14:10:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 03/14] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
Content-Language: en-US
To:     Raghavendra Rao Ananta <rananta@google.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        Fuad Tabba <tabba@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-4-rananta@google.com>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230808231330.3855936-4-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 8/9/23 09:13, Raghavendra Rao Ananta wrote:
> Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but that is a small cost in comparison to flushing remote TLBs.
> 
> In addition, instead of just incrementing remote_tlb_flush_requests
> stat, the generic interface would also increment the
> remote_tlb_flush stat.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 2 ++
>   arch/arm64/kvm/Kconfig            | 1 -
>   arch/arm64/kvm/mmu.c              | 6 +++---
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 8b6096753740c..20f2ba149c70c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1111,6 +1111,8 @@ int __init kvm_set_ipa_limit(void);
>   #define __KVM_HAVE_ARCH_VM_ALLOC
>   struct kvm *kvm_arch_alloc_vm(void);
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> +
>   static inline bool kvm_vm_is_protected(struct kvm *kvm)
>   {
>   	return false;
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index f531da6b362e9..6b730fcfee379 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -25,7 +25,6 @@ menuconfig KVM
>   	select MMU_NOTIFIER
>   	select PREEMPT_NOTIFIERS
>   	select HAVE_KVM_CPU_RELAX_INTERCEPT
> -	select HAVE_KVM_ARCH_TLB_FLUSH_ALL
>   	select KVM_MMIO
>   	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>   	select KVM_XFER_TO_GUEST_WORK
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6db9ef288ec38..0ac721fa27f18 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -161,15 +161,15 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>   }
>   
>   /**
> - * kvm_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> + * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>    * @kvm:	pointer to kvm structure.
>    *
>    * Interface to HYP function to flush all VM TLB entries
>    */
> -void kvm_flush_remote_tlbs(struct kvm *kvm)
> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
> -	++kvm->stat.generic.remote_tlb_flush_requests;
>   	kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> +	return 0;
>   }
>   
>   static bool kvm_is_device_pfn(unsigned long pfn)

