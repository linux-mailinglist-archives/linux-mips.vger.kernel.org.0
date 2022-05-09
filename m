Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139D5520206
	for <lists+linux-mips@lfdr.de>; Mon,  9 May 2022 18:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbiEIQOM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 May 2022 12:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238893AbiEIQOL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 May 2022 12:14:11 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C9A2BFBE9
        for <linux-mips@vger.kernel.org>; Mon,  9 May 2022 09:10:15 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id i17so14289481pla.10
        for <linux-mips@vger.kernel.org>; Mon, 09 May 2022 09:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cu/jiZxH6OGpEZOL+PQieADiAgi9jfOz/B++XfNJktg=;
        b=mhnslXdEZD4iLSuPRVVDxjSn6+FvXzI4Bcai5sRw8fKKc3MLOz0UYsczXlk1PHsKbC
         THfEA22X/nb+xS6QBIvswdYFZeqHqn+dEjYGdEmxr7d4It/gdFXtvmWw8IZatYmd9ueh
         XnrwFPDDqz0UzPc8YVMEq1gDwmmx9mQyJC4o6U45EhhxSrPodB/cz0hPWmwd4Ltd+Zma
         9hkQZ+42gt2tPedeVqnrBRXKhHSDcGbPfs4XEdFvlZsKUhBKr6Dqb1dOGMlryalSjaQA
         +PJmeJyD7rJpRm6so4lClPmND19dMoeaqEnPBys3Jd2/NsX29i9JNwJPQiF4BGOsu8Tq
         3JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cu/jiZxH6OGpEZOL+PQieADiAgi9jfOz/B++XfNJktg=;
        b=3fu34gthGhb+WnRevQehPlqUogRVLrV8YXk+9oW6+aSs8GC60N6ijzz9Frtabaokyb
         nHKIMOhpnBYnj2nHODBCoT29IYt+62/Y3GqhzCLcdjUMDZysyE5dv+F20t0i25RbL5Yw
         3441HHrsOYYvIhN0mrV+YqZ7a2GlHvdraP5uHckqU6MSPuKruNFhlLPVBl0QKdiehztd
         9F+WmJdxe1wUbuKVWNOXG4/zmIA9dTpgJ2KMfB6ZyxZeJD192mfHU5YPPtCyoXLD7XiH
         Sq02nnbNotWqk6M1ttU8ACc0vyjvNsFfTCWxIm0ezBozkaGrs7IC0v4rW4uLTyEXwI3z
         wl+w==
X-Gm-Message-State: AOAM530uqacANbV7g2jZLfd6184vlJAByonshr5SBXLc0hhMrSZFm8hs
        IuuDqpu+a25sCLFKMDQBZ1IqJQ==
X-Google-Smtp-Source: ABdhPJw25Pjuh0E3wte+D0++UVsLqfNoyFyxpKkkTJFLfZkGy695uMwCI3FkNxQhcC97eHo59R4/Og==
X-Received: by 2002:a17:90b:4c88:b0:1dc:60c2:25b2 with SMTP id my8-20020a17090b4c8800b001dc60c225b2mr27045719pjb.133.1652112615226;
        Mon, 09 May 2022 09:10:15 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id b29-20020aa7951d000000b0050dc762819asm8852722pfp.116.2022.05.09.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 09:10:14 -0700 (PDT)
Date:   Mon, 9 May 2022 16:10:11 +0000
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v4 15/20] KVM: x86/mmu: Cache the access bits of shadowed
 translations
Message-ID: <Ynk84xydEn4/3xkT@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-16-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422210546.458943-16-dmatlack@google.com>
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

On Fri, Apr 22, 2022, David Matlack wrote:
> @@ -2820,7 +2861,10 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
>  
>  	if (!was_rmapped) {
>  		WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
> -		rmap_add(vcpu, slot, sptep, gfn);
> +		rmap_add(vcpu, slot, sptep, gfn, pte_access);
> +	} else {
> +		/* Already rmapped but the pte_access bits may have changed. */
> +		kvm_mmu_page_set_access(sp, sptep - sp->spt, pte_access);
>  	}
>  
>  	return ret;

...

> diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> index a8a755e1561d..97bf53b29b88 100644
> --- a/arch/x86/kvm/mmu/paging_tmpl.h
> +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> @@ -978,7 +978,8 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
>  }
>  
>  /*
> - * Using the cached information from sp->gfns is safe because:
> + * Using the information in sp->shadowed_translation (kvm_mmu_page_get_gfn()
> + * and kvm_mmu_page_get_access()) is safe because:
>   * - The spte has a reference to the struct page, so the pfn for a given gfn
>   *   can't change unless all sptes pointing to it are nuked first.
>   *
> @@ -1052,12 +1053,15 @@ static int FNAME(sync_page)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
>  		if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
>  			continue;
>  
> -		if (gfn != sp->gfns[i]) {
> +		if (gfn != kvm_mmu_page_get_gfn(sp, i)) {
>  			drop_spte(vcpu->kvm, &sp->spt[i]);
>  			flush = true;
>  			continue;
>  		}
>  
> +		if (pte_access != kvm_mmu_page_get_access(sp, i))

I think it makes sense to do this unconditionally, same as mmu_set_spte().  Or
make the mmu_set_spte() case conditional.  I don't have a strong preference either
way, but the two callers should be consistent with each other.

> +			kvm_mmu_page_set_access(sp, i, pte_access);
> +
>  		sptep = &sp->spt[i];
>  		spte = *sptep;
>  		host_writable = spte & shadow_host_writable_mask;
> -- 
> 2.36.0.rc2.479.g8af0fa9b8e-goog
> 
