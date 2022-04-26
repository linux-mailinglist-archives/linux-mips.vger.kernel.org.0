Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC6651025C
	for <lists+linux-mips@lfdr.de>; Tue, 26 Apr 2022 17:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352704AbiDZQBW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Apr 2022 12:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349967AbiDZQBV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Apr 2022 12:01:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A7015F5A3;
        Tue, 26 Apr 2022 08:58:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 342FDB820F8;
        Tue, 26 Apr 2022 15:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03B7C385AA;
        Tue, 26 Apr 2022 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650988691;
        bh=/YgFqANCotQOeAeteIFsD8Oyb0t5Q2qJXjm0YSnM1oE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=C8rU4yxsFwHXtg50MdNWAAfY3HdsJClOLHH04kNVLOseADXyo11uZ2ZkPeLisx7aE
         RiLnTlNDzJ2d2uc0oBClmx7FCGiPfa89y6esf4a+8d0R32BlSDo+rOjgZ7xTXa+6ht
         7AGnj3gBSrv7rLX12YG161HPU5WxuxjoKI3id0oWgsSNQ8iYH5KfzNmHKk4dIrdJzy
         Q+IVR+y5KMLKMc1rK2tPtex1+qJtrH35jXIdVH2IbMkkhW7F3UBEOOebS2Tc+A1gop
         7JHlYnnHZLXwU6qDA2dX7ypI6erMxOEMkKsRV/0opnw4cwTtQTPFw4je2m6Opl8nx3
         SpNZM3ec6Xp4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1njNZo-0077t3-BE; Tue, 26 Apr 2022 16:58:08 +0100
Date:   Tue, 26 Apr 2022 16:58:07 +0100
Message-ID: <874k2falbk.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Yosry Ahmed <yosryahmed@google.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        James Morse <james.morse@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu
Subject: Re: [PATCH v3 4/6] KVM: arm64/mmu: count KVM page table pages in pagetable stats
In-Reply-To: <20220426053904.3684293-5-yosryahmed@google.com>
References: <20220426053904.3684293-1-yosryahmed@google.com>
        <20220426053904.3684293-5-yosryahmed@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: yosryahmed@google.com, seanjc@google.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, anup@brainfault.org, atishp@atishpatra.org, pbonzini@redhat.com, vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, james.morse@arm.com, catalin.marinas@arm.com, shameerali.kolothum.thodi@huawei.com, alexandru.elisei@arm.com, suzuki.poulose@arm.com, linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 26 Apr 2022 06:39:02 +0100,
Yosry Ahmed <yosryahmed@google.com> wrote:
> 
> Count the pages used by KVM in arm64 for page tables in pagetable stats.
> 
> Account pages allocated for PTEs in pgtable init functions and
> kvm_set_table_pte().
> 
> Since most page table pages are freed using put_page(), add a helper
> function put_pte_page() that checks if this is the last ref for a pte
> page before putting it, and unaccounts stats accordingly.
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> ---
>  arch/arm64/kernel/image-vars.h |  3 ++
>  arch/arm64/kvm/hyp/pgtable.c   | 50 +++++++++++++++++++++-------------
>  2 files changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 241c86b67d01..25bf058714f6 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -143,6 +143,9 @@ KVM_NVHE_ALIAS(__hyp_rodata_end);
>  /* pKVM static key */
>  KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
>  
> +/* Called by kvm_account_pgtable_pages() to update pagetable stats */
> +KVM_NVHE_ALIAS(__mod_lruvec_page_state);

This cannot be right. It means that this function will be called
directly from the EL2 code when in protected mode, and will result in
extreme fireworks.  There is no way you can call core kernel stuff
like this from this context.

Please do not add random symbols to this list just for the sake of
being able to link the kernel.

> +
>  #endif /* CONFIG_KVM */
>  
>  #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 2cb3867eb7c2..53e13c3313e9 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -152,6 +152,7 @@ static void kvm_set_table_pte(kvm_pte_t *ptep, kvm_pte_t *childp,
>  
>  	WARN_ON(kvm_pte_valid(old));
>  	smp_store_release(ptep, pte);
> +	kvm_account_pgtable_pages((void *)childp, +1);

Why the + sign?

>  }
>  
>  static kvm_pte_t kvm_init_valid_leaf_pte(u64 pa, kvm_pte_t attr, u32 level)
> @@ -326,6 +327,14 @@ int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
>  	return ret;
>  }
>  
> +static void put_pte_page(kvm_pte_t *ptep, struct kvm_pgtable_mm_ops *mm_ops)
> +{
> +	/* If this is the last page ref, decrement pagetable stats first. */
> +	if (!mm_ops->page_count || mm_ops->page_count(ptep) == 1)
> +		kvm_account_pgtable_pages((void *)ptep, -1);
> +	mm_ops->put_page(ptep);
> +}
> +
>  struct hyp_map_data {
>  	u64				phys;
>  	kvm_pte_t			attr;
> @@ -488,10 +497,10 @@ static int hyp_unmap_walker(u64 addr, u64 end, u32 level, kvm_pte_t *ptep,
>  
>  	dsb(ish);
>  	isb();
> -	mm_ops->put_page(ptep);
> +	put_pte_page(ptep, mm_ops);
>  
>  	if (childp)
> -		mm_ops->put_page(childp);
> +		put_pte_page(childp, mm_ops);
>  
>  	return 0;
>  }
> @@ -522,6 +531,7 @@ int kvm_pgtable_hyp_init(struct kvm_pgtable *pgt, u32 va_bits,
>  	pgt->pgd = (kvm_pte_t *)mm_ops->zalloc_page(NULL);
>  	if (!pgt->pgd)
>  		return -ENOMEM;
> +	kvm_account_pgtable_pages((void *)pgt->pgd, +1);
>  
>  	pgt->ia_bits		= va_bits;
>  	pgt->start_level	= KVM_PGTABLE_MAX_LEVELS - levels;
> @@ -541,10 +551,10 @@ static int hyp_free_walker(u64 addr, u64 end, u32 level, kvm_pte_t *ptep,
>  	if (!kvm_pte_valid(pte))
>  		return 0;
>  
> -	mm_ops->put_page(ptep);
> +	put_pte_page(ptep, mm_ops);
>  
>  	if (kvm_pte_table(pte, level))
> -		mm_ops->put_page(kvm_pte_follow(pte, mm_ops));
> +		put_pte_page(kvm_pte_follow(pte, mm_ops), mm_ops);

OK, I see the pattern. I don't think this workable as such. I'd rather
the callbacks themselves (put_page, zalloc_page*) call into the
accounting code when it makes sense, rather than spreading the
complexity and having to special case the protected case.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
