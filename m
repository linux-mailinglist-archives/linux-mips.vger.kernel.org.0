Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13F64AB49
	for <lists+linux-mips@lfdr.de>; Tue, 13 Dec 2022 00:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiLLXQW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 18:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbiLLXQT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 18:16:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB971B79C
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 15:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670886927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y59dQxuBZvH2dJ+QaunSC7VWD6qA2LCOofme/uP6yrs=;
        b=ZioINGBsgKxNN3WZGSVbv+aAgcIA1613E7kpLwvS5+woJyDdLZDHC+/3/6+s0zqeDRn4wO
        yAkdglL/uPssq8rAcb/2Pe2rLsJHEN1mN7SAXk9wTCNBGpYiX/f7Sh1nE7/fOWPcZUXupf
        v0Xz75tneWNrmA4WaMHQb3KSDjdHYI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-eeGWdjp4MCKh4fNGBm2H_Q-1; Mon, 12 Dec 2022 18:15:25 -0500
X-MC-Unique: eeGWdjp4MCKh4fNGBm2H_Q-1
Received: by mail-wr1-f70.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso2566999wra.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 15:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y59dQxuBZvH2dJ+QaunSC7VWD6qA2LCOofme/uP6yrs=;
        b=b2nSfF7nlJuhpQ09eQ8ldTPAIoRM9Cu3p+SdesA810npCPKkESTrg9wue+dGt62Xds
         NlDE/dMCmBnOlxi97sIzqsSatsxlvVehhqRGw2vAzZb+K/veNb/zEVWE+w4K5ejJOqK3
         nDtYqgI/Zqe0oL5BN3FwyRbq6zONXD7iR0cfBHfzI4OZN6hCJ4wj/Jcac8spFcOaSBCH
         gj5eUnuIGZI4cpFuTneNAjq4sSUsnX9Kjff+Cy41Y4hJm9yUoKKRT4Vak1aYxaS+6aTt
         Fz+ez2nYApWaLTkXjKeXi5iHKkSLSBHH1Duq5/37EJQ3W9vWuwIGd3KG1XC9CdTrjoby
         O4KA==
X-Gm-Message-State: ANoB5pkKi6jkThadlzkTgDs3S2OTdG2Xy4RAO2A4pJZl74slz2ydR3fm
        8hUDsTKdfhhlbTYyE3x9xWk7q35tIdZ+2dCEPJpracZbXqjnyOcefCS71/gWT5djLhFEumvqHIK
        SwPtMH1ZZ7fGFzWaO8S/W2g==
X-Received: by 2002:a05:600c:4f05:b0:3cf:674a:aefe with SMTP id l5-20020a05600c4f0500b003cf674aaefemr14677225wmq.22.1670886924320;
        Mon, 12 Dec 2022 15:15:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf69Du0IJa2CIROeqUOCPZXYcdHcFYucdO6uTVaYAPa30ljZoIeQ8u4jZT85a4ufCPYPRVLQBg==
X-Received: by 2002:a05:600c:4f05:b0:3cf:674a:aefe with SMTP id l5-20020a05600c4f0500b003cf674aaefemr14677202wmq.22.1670886924043;
        Mon, 12 Dec 2022 15:15:24 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id a12-20020a05600c348c00b003d070e45574sm10730652wmq.11.2022.12.12.15.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 15:15:23 -0800 (PST)
Message-ID: <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
Date:   Tue, 13 Dec 2022 00:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 04/37] KVM: x86/mmu: Invert sp->tdp_mmu_page to
 sp->shadow_mmu_page
Content-Language: en-US
To:     David Matlack <dmatlack@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-5-dmatlack@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208193857.4090582-5-dmatlack@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/8/22 20:38, David Matlack wrote:
> Invert the meaning of sp->tdp_mmu_page and rename it accordingly. This
> allows the TDP MMU code to not care about this field, which will be used
> in a subsequent commit to move the TDP MMU to common code.
> 
> No functional change intended.

Let's use a bit of the role instead.

Paolo

> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c          | 1 +
>   arch/x86/kvm/mmu/mmu_internal.h | 2 +-
>   arch/x86/kvm/mmu/tdp_mmu.c      | 3 ---
>   arch/x86/kvm/mmu/tdp_mmu.h      | 5 ++++-
>   4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 355548603960..f7668a32721d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2180,6 +2180,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
>   
>   	sp->gfn = gfn;
>   	sp->role = role;
> +	sp->shadow_mmu_page = true;
>   	hlist_add_head(&sp->hash_link, sp_list);
>   	if (sp_has_gptes(sp))
>   		account_shadowed(kvm, sp);
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index e32379c5b1ad..c1a379fba24d 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -52,7 +52,7 @@ struct kvm_mmu_page {
>   	struct list_head link;
>   	struct hlist_node hash_link;
>   
> -	bool tdp_mmu_page;
> +	bool shadow_mmu_page;
>   	bool unsync;
>   	u8 mmu_valid_gen;
>   
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 7ccac1aa8df6..fc0b87ceb1ea 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -133,8 +133,6 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
>   	if (!refcount_dec_and_test(&root->tdp_mmu_root_count))
>   		return;
>   
> -	WARN_ON(!is_tdp_mmu_page(root));
> -
>   	/*
>   	 * The root now has refcount=0.  It is valid, but readers already
>   	 * cannot acquire a reference to it because kvm_tdp_mmu_get_root()
> @@ -279,7 +277,6 @@ static void tdp_mmu_init_sp(struct kvm_mmu_page *sp, tdp_ptep_t sptep,
>   	sp->role = role;
>   	sp->gfn = gfn;
>   	sp->ptep = sptep;
> -	sp->tdp_mmu_page = true;
>   
>   	trace_kvm_mmu_get_page(sp, true);
>   }
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
> index 0a63b1afabd3..18d3719f14ea 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.h
> +++ b/arch/x86/kvm/mmu/tdp_mmu.h
> @@ -71,7 +71,10 @@ u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
>   					u64 *spte);
>   
>   #ifdef CONFIG_X86_64
> -static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return sp->tdp_mmu_page; }
> +static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
> +{
> +	return !sp->shadow_mmu_page;
> +}
>   #else
>   static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
>   #endif

