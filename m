Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEC3747AAA
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jul 2023 02:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjGEARN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jul 2023 20:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjGEARJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Jul 2023 20:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA764E41
        for <linux-mips@vger.kernel.org>; Tue,  4 Jul 2023 17:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688516181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SkAZyyid+TuVBgM2gukzJung09m0x/Qh1dXoAlys9U8=;
        b=ecDhDLiYFLNeEWbVQHNmkbc28mJSInAfAGdWCvNFWwL8kNfEDVGLzYP/uhSi2N6Ydq3oiS
        /wwBeF3zBqKlmlZOCAL56tfjoXoadiNEig4rcUzJ9bvVFymZaSvOG3MJoBb53+icMgf6Q0
        8jOTgfx1gwqSWlpWBimuh8bBQbHgCzI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-1P4XyuSVP4ukA1wtncGsCQ-1; Tue, 04 Jul 2023 20:16:19 -0400
X-MC-Unique: 1P4XyuSVP4ukA1wtncGsCQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1b8ae44d93bso2473495ad.2
        for <linux-mips@vger.kernel.org>; Tue, 04 Jul 2023 17:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688516179; x=1691108179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkAZyyid+TuVBgM2gukzJung09m0x/Qh1dXoAlys9U8=;
        b=DXDUwAWHmiEti9NL24xsatlca6In2MOaafB7CR9YcA1c0eAaAkUEn1yC1msMHwL/Hf
         nz/+5sSCpbGICif7SQLVswMlr0QEirHfWNxEkMPnvRMMVDDdyAq59i0+eKRX4SVK54WL
         PviWjOj6mPd/FyWnEaNTXMg7pExpB1RSB9fkHXzgmZiPoMhBsxsgVjzCs8mqO5SKM0Vk
         1ZlTtfA0ekemPETc/FPfkOOa1oeqLDvuVjmTlRgFfaxYXQXS3+LWYcCUjxWfNoygN7Ge
         RWvibMjvUBZaW+Ha0o7GKZt0ZnPSwU5tC1kPkSPaqVafFE0DI4IEQLcMtN+olM7gQstj
         BqUQ==
X-Gm-Message-State: ABy/qLa/JdRx73mvTf1x4WGK8StdoDfQ/LH1hCbI7zc3ByOblCKGoVir
        oIc7HzGjnz70DsaYU/uao/zXYgsJzq6tsF+gInBU3+zdvBATfAOudZ2OGODfzFRs6ApG+QmIupS
        jz3lD4nkwaJCWjs8fFNH3qg==
X-Received: by 2002:a17:902:c246:b0:1b2:4df5:c00e with SMTP id 6-20020a170902c24600b001b24df5c00emr8586343plg.35.1688516178352;
        Tue, 04 Jul 2023 17:16:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxsbyRmK1tUjQahKVu906wMoMLPOgJpr3TZVMF26AFyBgnJ9Dxug0OgWJAOZMZgIu565qNEA==
X-Received: by 2002:a17:902:c246:b0:1b2:4df5:c00e with SMTP id 6-20020a170902c24600b001b24df5c00emr8586333plg.35.1688516178049;
        Tue, 04 Jul 2023 17:16:18 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e80f00b001b876d5b23esm7537227plg.144.2023.07.04.17.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:16:17 -0700 (PDT)
Message-ID: <ca6146e0-2f76-c72e-ce8a-11bf9bd3f353@redhat.com>
Date:   Wed, 5 Jul 2023 10:16:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 06/11] KVM: arm64: Implement
 __kvm_tlb_flush_vmid_range()
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
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-7-rananta@google.com>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-7-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> Define  __kvm_tlb_flush_vmid_range() (for VHE and nVHE)
> to flush a range of stage-2 page-tables using IPA in one go.
> If the system supports FEAT_TLBIRANGE, the following patches
> would conviniently replace global TLBI such as vmalls12e1is
         ^^^^^^^^^^^^
         conveniently
> in the map, unmap, and dirty-logging paths with ripas2e1is
> instead.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/include/asm/kvm_asm.h   |  3 +++
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>   arch/arm64/kvm/hyp/nvhe/tlb.c      | 30 ++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hyp/vhe/tlb.c       | 28 ++++++++++++++++++++++++++++
>   4 files changed, 72 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 43c3bc0f9544d..60ed0880cc9d6 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
>   	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>   	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>   	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v3_read_vmcr,
> @@ -225,6 +226,8 @@ extern void __kvm_flush_vm_context(void);
>   extern void __kvm_flush_cpu_context(struct kvm_s2_mmu *mmu);
>   extern void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu, phys_addr_t ipa,
>   				     int level);
> +extern void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +					phys_addr_t start, unsigned long pages);
>   extern void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu);
>   
>   extern void __kvm_timer_set_cntvoff(u64 cntvoff);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 728e01d4536b0..a19a9299c8362 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -125,6 +125,16 @@ static void handle___kvm_tlb_flush_vmid_ipa(struct kvm_cpu_context *host_ctxt)
>   	__kvm_tlb_flush_vmid_ipa(kern_hyp_va(mmu), ipa, level);
>   }
>   
> +static void
> +handle___kvm_tlb_flush_vmid_range(struct kvm_cpu_context *host_ctxt)
> +{
> +	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> +	DECLARE_REG(phys_addr_t, start, host_ctxt, 2);
> +	DECLARE_REG(unsigned long, pages, host_ctxt, 3);
> +
> +	__kvm_tlb_flush_vmid_range(kern_hyp_va(mmu), start, pages);
> +}
> +
>   static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>   {
>   	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> @@ -316,6 +326,7 @@ static const hcall_t host_hcall[] = {
>   	HANDLE_FUNC(__kvm_flush_vm_context),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid),
> +	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
>   	HANDLE_FUNC(__kvm_flush_cpu_context),
>   	HANDLE_FUNC(__kvm_timer_set_cntvoff),
>   	HANDLE_FUNC(__vgic_v3_read_vmcr),
> diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
> index 978179133f4b9..213b11952f641 100644
> --- a/arch/arm64/kvm/hyp/nvhe/tlb.c
> +++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
> @@ -130,6 +130,36 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
>   	__tlb_switch_to_host(&cxt);
>   }
>   
> +void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t start, unsigned long pages)
> +{
> +	struct tlb_inv_context cxt;
> +	unsigned long stride;
> +
> +	/*
> +	 * Since the range of addresses may not be mapped at
> +	 * the same level, assume the worst case as PAGE_SIZE
> +	 */
> +	stride = PAGE_SIZE;
> +	start = round_down(start, stride);
> +
> +	/* Switch to requested VMID */
> +	__tlb_switch_to_guest(mmu, &cxt, false);
> +
> +	__flush_tlb_range_op(ipas2e1is, start, pages, stride, 0, 0, false);
> +
> +	dsb(ish);
> +	__tlbi(vmalle1is);
> +	dsb(ish);
> +	isb();
> +
> +	/* See the comment below in __kvm_tlb_flush_vmid_ipa() */
> +	if (icache_is_vpipt())
> +		icache_inval_all_pou();
> +
> +	__tlb_switch_to_host(&cxt);
> +}
> +
>   void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
>   {
>   	struct tlb_inv_context cxt;
> diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
> index 24cef9b87f9e9..3ca3d38b7eb23 100644
> --- a/arch/arm64/kvm/hyp/vhe/tlb.c
> +++ b/arch/arm64/kvm/hyp/vhe/tlb.c
> @@ -111,6 +111,34 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
>   	__tlb_switch_to_host(&cxt);
>   }
>   
> +void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t start, unsigned long pages)
> +{
> +	struct tlb_inv_context cxt;
> +	unsigned long stride;
> +
> +	/*
> +	 * Since the range of addresses may not be mapped at
> +	 * the same level, assume the worst case as PAGE_SIZE
> +	 */
> +	stride = PAGE_SIZE;
> +	start = round_down(start, stride);
> +
> +	dsb(ishst);
> +
> +	/* Switch to requested VMID */
> +	__tlb_switch_to_guest(mmu, &cxt);
> +
> +	__flush_tlb_range_op(ipas2e1is, start, pages, stride, 0, 0, false);
> +
> +	dsb(ish);
> +	__tlbi(vmalle1is);
> +	dsb(ish);
> +	isb();
> +
> +	__tlb_switch_to_host(&cxt);
> +}
> +
>   void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
>   {
>   	struct tlb_inv_context cxt;

