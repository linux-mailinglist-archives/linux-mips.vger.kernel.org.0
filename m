Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E2454FA46
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jun 2022 17:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbiFQP2W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jun 2022 11:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381370AbiFQP2V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jun 2022 11:28:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F6C3585D
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 08:28:20 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d5so4146964plo.12
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9lnCWB9zsyKOczCBSceUjigaztv7AStK8BeDoARKMKM=;
        b=MRDsetQVY8MyaT0DSP6tz4YsogDP3sj0rr5b0qt8A1QJdSxqRb2FK2SCRN4Rv61+Xf
         uskMCdC3eAPe8Jxgq7H0ZOFru5CTDkW409Q1LHVbJCTaXzRXAGYKGhrYiVfIRJl1ZDdV
         LIWk1N1oBF6dDpzc/XNOmabSkUSj7Za5iwn8ezuXDyex9GiKIa3Y5J+JPuzFG0UAgVNV
         5KoEC5iY+aBJCAWXTTjVyrG3AY5I7cI8s2MhNOBu3VH1llzYd24SxPA1cXi3c6/zWkOJ
         18PuIj7gGXc1WYJ5hDHcxEV/8icIiaWpaFpD0nfNGnI9Fae7NamaLQf8acl4eJ/wls2K
         dMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9lnCWB9zsyKOczCBSceUjigaztv7AStK8BeDoARKMKM=;
        b=qXE4EL8eigKA3u+sBtmZboFsHMa1nTcY2uOtn8sfQbYmvCwjk4rmhGdDHhxIn/BgmF
         bzCryb1T09yRYJagp7FaAm26IDQdP7W+Mr2L4upUjAS/NSh5R0I3hjW8W9W0eqn3sRlZ
         M8gOIYkyV8iCymWWMdxJJoi8OL0Ta9+LcaKmqU1DdcqoSZBB38ZuYpMuhZyOpw7eyfTs
         qdZCZIhYA9h9Hzolq9FKfF4ZyQbtKUhLH3CpwIY4sOXH5Urnxaz2X0t1OT11SHrCTytO
         RRuW9tqNkAXLlbzE4KfpfJnroEKDxyiv4xxdThFVOlWeeL8T14HsdiUObzgiYN5GjogD
         NbmQ==
X-Gm-Message-State: AJIora/UFVHeAgDmMkc6EF3JZHis1ZO/YhQjWFvcLAH0Bacv4BVwYvUH
        f1QiEDayz2egp04/TBiji8yfWg==
X-Google-Smtp-Source: AGRyM1tIpViIJ0OwvugoNaYPS81DxsMmaeO15jp/Gqk615TT7T4/NIE2uXviTLDn9T52SnoA3upg+w==
X-Received: by 2002:a17:90b:1b48:b0:1e8:5885:f8b with SMTP id nv8-20020a17090b1b4800b001e858850f8bmr11152803pjb.122.1655479699649;
        Fri, 17 Jun 2022 08:28:19 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709029a4600b0015e8d4eb1d1sm3742777plv.27.2022.06.17.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 08:28:18 -0700 (PDT)
Date:   Fri, 17 Jun 2022 15:28:15 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v6 13/22] KVM: x86/mmu: Allow NULL @vcpu in
 kvm_mmu_find_shadow_page()
Message-ID: <YqydjxjnuaYTIYMt@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-14-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516232138.1783324-14-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 16, 2022, David Matlack wrote:
> Allow @vcpu to be NULL in kvm_mmu_find_shadow_page() (and its only
> caller __kvm_mmu_get_shadow_page()). @vcpu is only required to sync
> indirect shadow pages, so it's safe to pass in NULL when looking up
> direct shadow pages.
> 
> This will be used for doing eager page splitting, which allocates direct

"hugepage" again, because I need constant reminders :-)

> shadow pages from the context of a VM ioctl without access to a vCPU
> pointer.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

With nits addressed,

Reviewed-by: Sean Christopherson <seanjc@google.com>

>  arch/x86/kvm/mmu/mmu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 4fbc2da47428..acb54d6e0ea5 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1850,6 +1850,7 @@ static int kvm_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>  
>  	if (ret < 0)
>  		kvm_mmu_prepare_zap_page(vcpu->kvm, sp, invalid_list);
> +

Unrelated whitespace change leftover from the previous approach.

>  	return ret;
>  }
>  
> @@ -2001,6 +2002,7 @@ static void clear_sp_write_flooding_count(u64 *spte)
>  	__clear_sp_write_flooding_count(sptep_to_sp(spte));
>  }
>  
> +/* Note, @vcpu may be NULL if @role.direct is true. */
>  static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
>  						     struct kvm_vcpu *vcpu,
>  						     gfn_t gfn,
> @@ -2039,6 +2041,16 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
>  			goto out;
>  
>  		if (sp->unsync) {
> +			/*
> +			 * A vCPU pointer should always be provided when finding

s/should/must, and "be provided" in unnecessarily ambiguous, simply state that
"@vcpu must be non-NULL".  E.g. if a caller provides a pointer, but that pointer
happens to be NULL.

> +			 * indirect shadow pages, as that shadow page may
> +			 * already exist and need to be synced using the vCPU
> +			 * pointer. Direct shadow pages are never unsync and
> +			 * thus do not require a vCPU pointer.
> +			 */

"vCPU pointer" over and over is a bit versbose, and I prefer to refer to vCPUs/VMs
as objects themselves.  E.g. "XYZ requires a vCPU" versus "XYZ requires a vCPU
pointer" since it's not the pointer itself that's required, it's all the context
of the vCPU that is needed.

			/*
			 * @vcpu must be non-NULL when finding indirect shadow
			 * pages, as such pages may already exist and need to
			 * be synced, which requires a vCPU.  Direct pages are
			 * never unsync and thus do not require a vCPU.
			 */

> +			if (KVM_BUG_ON(!vcpu, kvm))
> +				break;
> +
>  			/*
>  			 * The page is good, but is stale.  kvm_sync_page does
>  			 * get the latest guest state, but (unlike mmu_unsync_children)
> @@ -2116,6 +2128,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
>  	return sp;
>  }
>  
> +/* Note, @vcpu may be NULL if @role.direct is true. */
>  static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
>  						      struct kvm_vcpu *vcpu,
>  						      struct shadow_page_caches *caches,
> -- 
> 2.36.0.550.gb090851708-goog
> 
