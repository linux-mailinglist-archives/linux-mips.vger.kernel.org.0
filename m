Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369EC52029C
	for <lists+linux-mips@lfdr.de>; Mon,  9 May 2022 18:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239138AbiEIQlz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 May 2022 12:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239208AbiEIQkx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 May 2022 12:40:53 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB35E18B94C
        for <linux-mips@vger.kernel.org>; Mon,  9 May 2022 09:36:48 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o69so13624000pjo.3
        for <linux-mips@vger.kernel.org>; Mon, 09 May 2022 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vcWBrXUV0qsOw9lQLNi+OhiEHQuaLCtwTh7HA5F6tIs=;
        b=GQuDadAMhf8b7Fy/I8JaGOgRQOsWHOMhy0hcMvriphuVIDCLpL0PdaLuMbF3n56Nke
         dZiKU5Jef5j11YpXBiBq70I2jRtKHo1vmB1cAh8/4Ff8ldw79/NB/gHKnpjQvMceq5+H
         3qgkrnh9KKmaw7DH9R9uQgmGpUN1bWPoVqDKK8soMOBL/CE7D+C0wzwPs6cO+5D2o7i9
         BUxS3PijLvpY1XWcQQ5OOyPIkC+UrL32CQw4fU5VdLpUvBKmussISGRTBF6qAwdnpemg
         ji09qdkVslMmiKaiQZghkH/uEpByZli/lutMtfurjdn+YHWI2FuLLfHnwrACscaUBN8e
         ydmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vcWBrXUV0qsOw9lQLNi+OhiEHQuaLCtwTh7HA5F6tIs=;
        b=nKLdEmMN6EAS8pkyaYegOmIQaTPNAnf9YhUgpkvA6AdvKimg+l8bhHTMar3yOu6isL
         BBSybAZYQwP4ZCa7w6+HujLFSCbrZX3C/G9nDNXm+NJT1eVBazQCDDc+ecbtnwlyA0Op
         +WeoXPt9jMAGHNXnkKOe6HBdzCVLivvSQF8CYDL8jnrfzdoyoP/oIFqm5rCRCZZMg9eX
         SccfLT6jcpdZnNpvLPiT9QElNKa4HYCb1EaqJP4E2hTdQ8ApB62kD72q93QxKOcSA7Yh
         LqrZRJvEECTEo/2fK/mRo6qM6nMtTuXOaewk1sj5xH8ZQgDkMyjxa7vUKUvp6eDZ+lpA
         hQyQ==
X-Gm-Message-State: AOAM533fAHQg8ooAcLwBRUp+hcKtEyc5lPSCk9Umf/FFEZsxvmlbEZK4
        DcBVJOBvFWNp8bSMHWhLFdLUGA==
X-Google-Smtp-Source: ABdhPJwEmR4hWs02XZuuAcqgDnjovgeoKc9HZE29HI/cH7wXAaf0/EHn99rc8bnyOXL0A+d9B+qwog==
X-Received: by 2002:a17:902:9044:b0:15d:1c51:5bef with SMTP id w4-20020a170902904400b0015d1c515befmr16764065plz.170.1652114207747;
        Mon, 09 May 2022 09:36:47 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id x71-20020a63864a000000b003c15f7f2914sm8650496pgd.24.2022.05.09.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 09:36:47 -0700 (PDT)
Date:   Mon, 9 May 2022 16:36:43 +0000
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
Subject: Re: [PATCH v4 18/20] KVM: x86/mmu: Refactor drop_large_spte()
Message-ID: <YnlDG/aRMB7js2Lc@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-19-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422210546.458943-19-dmatlack@google.com>
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
> drop_large_spte() drops a large SPTE if it exists and then flushes TLBs.
> Its helper function, __drop_large_spte(), does the drop without the
> flush.
> 
> In preparation for eager page splitting, which will need to sometimes
> flush when dropping large SPTEs (and sometimes not), push the flushing
> logic down into __drop_large_spte() and add a bool parameter to control
> it.
> 
> No functional change intended.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 479c581e8a96..a5961c17eb36 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1183,28 +1183,29 @@ static void drop_spte(struct kvm *kvm, u64 *sptep)
>  		rmap_remove(kvm, sptep);
>  }
>  
> -
> -static bool __drop_large_spte(struct kvm *kvm, u64 *sptep)
> +static void __drop_large_spte(struct kvm *kvm, u64 *sptep, bool flush)
>  {
> -	if (is_large_pte(*sptep)) {
> -		WARN_ON(sptep_to_sp(sptep)->role.level == PG_LEVEL_4K);
> -		drop_spte(kvm, sptep);
> -		return true;
> -	}
> +	struct kvm_mmu_page *sp;
>  
> -	return false;
> -}
> +	if (!is_large_pte(*sptep))
> +		return;
>  
> -static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
> -{
> -	if (__drop_large_spte(vcpu->kvm, sptep)) {
> -		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
> +	sp = sptep_to_sp(sptep);
> +	WARN_ON(sp->role.level == PG_LEVEL_4K);
>  
> -		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
> +	drop_spte(kvm, sptep);
> +
> +	if (flush) {

Unnecessary curly braces.

> +		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
>  			KVM_PAGES_PER_HPAGE(sp->role.level));
>  	}
>  }
>  
> +static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
> +{
> +	return __drop_large_spte(vcpu->kvm, sptep, true);
> +}
> +
>  /*
>   * Write-protect on the specified @sptep, @pt_protect indicates whether
>   * spte write-protection is caused by protecting shadow page table.
> -- 
> 2.36.0.rc2.479.g8af0fa9b8e-goog
> 
