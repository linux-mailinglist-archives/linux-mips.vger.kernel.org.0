Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712D04D970D
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 10:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239046AbiCOJFP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 05:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346342AbiCOJFO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 05:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B677E13D02
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647335041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q7JlUJr4Lo/7VJy1NmLVlU58GKSRSwFR5b1pvsat2Gg=;
        b=V0r2prCvVV8K17URNZ2smRfXHQAHC8/bVQFdRRtDKcEbHeYp0+4ycloKPfJaWXB9TVG7dF
        kMMRc09wjyZ2Fke1o+X78nTaoBWbZq/HnzvyaBIVzCqCbdcOIgUTzeNjyqkK7cT2dwvSF/
        9j7fiywTj5Y2grDzHBY7Xdwfzkn1H4Q=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-qXGNbpeMMgmZVB-QddqzJw-1; Tue, 15 Mar 2022 05:04:00 -0400
X-MC-Unique: qXGNbpeMMgmZVB-QddqzJw-1
Received: by mail-pj1-f72.google.com with SMTP id mm2-20020a17090b358200b001bf529127dfso1552613pjb.6
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 02:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q7JlUJr4Lo/7VJy1NmLVlU58GKSRSwFR5b1pvsat2Gg=;
        b=IuTWc+RvCA0jGptm0QrckiwYXaiw9tVYAvHtS6udcAdKC6ZPcEwd54l0KXo2T8TYiO
         yhjqbFwxtIDP4zzZfprzTkGGBNznoYXK+GcdFK4HHlywx3jYPKVMthfC+uvjc7ui7QTX
         SKQtpUIgo/J0Ir7/v8/MIZ2qOZ1IYRG8BgzmCSRu9Sf2IqJ1QE/F6YV667h13Sl7lMwg
         s1ieQPRIpIKqkOrOVknwI23gbRrsHH0FJiWBHOo9UouTAY217SFAQtI7aYkBGmdVwmn1
         jh9v12tasUmbABRNbpwc+tp7G8nO6ohk6bfODpSPDRNhoZIHIRdTW8X8huJHCCklylWR
         88OQ==
X-Gm-Message-State: AOAM532PQwjqzy2SB1+SdVagPQ0d9XnacFYrI5bWbJlmuROah0IC6RkS
        JJ9Cpj3zgBZiyGasrK1htZtDBjRayuTXIT74MOB6ODSLUYNwktGuotWAkV1jG/8Ea44DfkLrAeP
        1h/W/ok1YqaV0cjLXjFA+ow==
X-Received: by 2002:a63:4543:0:b0:374:87b6:c9f5 with SMTP id u3-20020a634543000000b0037487b6c9f5mr23571601pgk.302.1647335039376;
        Tue, 15 Mar 2022 02:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhjGuq26G+fQETXurSMRI3XZcImwtJrOW3Uh4ZD3nZ5YW2XWuRRTs+2GtkbHoiDVdGeTEnRw==
X-Received: by 2002:a63:4543:0:b0:374:87b6:c9f5 with SMTP id u3-20020a634543000000b0037487b6c9f5mr23571566pgk.302.1647335039059;
        Tue, 15 Mar 2022 02:03:59 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm15441943pfv.15.2022.03.15.02.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 02:03:58 -0700 (PDT)
Date:   Tue, 15 Mar 2022 17:03:50 +0800
From:   Peter Xu <peterx@redhat.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v2 06/26] KVM: x86/mmu: Pass memslot to
 kvm_mmu_new_shadow_page()
Message-ID: <YjBWdv3nEk3Cz40m@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-7-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-7-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:08AM +0000, David Matlack wrote:
> Passing the memslot to kvm_mmu_new_shadow_page() avoids the need for the
> vCPU pointer when write-protecting indirect 4k shadow pages. This moves
> us closer to being able to create new shadow pages during VM ioctls for
> eager page splitting, where there is not vCPU pointer.
> 
> This change does not negatively impact "Populate memory time" for ept=Y
> or ept=N configurations since kvm_vcpu_gfn_to_memslot() caches the last
> use slot. So even though we now look up the slot more often, it is a
> very cheap check.
> 
> Opportunistically move the code to write-protect GFNs shadowed by
> PG_LEVEL_4K shadow pages into account_shadowed() to reduce indentation
> and consolidate the code. This also eliminates a memslot lookup.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index b6fb50e32291..519910938478 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -793,16 +793,14 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn)
>  	update_gfn_disallow_lpage_count(slot, gfn, -1);
>  }
>  
> -static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
> +static void account_shadowed(struct kvm *kvm,
> +			     struct kvm_memory_slot *slot,
> +			     struct kvm_mmu_page *sp)
>  {
> -	struct kvm_memslots *slots;
> -	struct kvm_memory_slot *slot;
>  	gfn_t gfn;
>  
>  	kvm->arch.indirect_shadow_pages++;
>  	gfn = sp->gfn;
> -	slots = kvm_memslots_for_spte_role(kvm, sp->role);
> -	slot = __gfn_to_memslot(slots, gfn);
>  
>  	/* the non-leaf shadow pages are keeping readonly. */
>  	if (sp->role.level > PG_LEVEL_4K)
> @@ -810,6 +808,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
>  						    KVM_PAGE_TRACK_WRITE);
>  
>  	kvm_mmu_gfn_disallow_lpage(slot, gfn);
> +
> +	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
> +		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);

It's not immediately obvious in this diff, but when looking at the code
yeah it looks right to just drop the 4K check..

I also never understood why we only write-track the >1 levels but only
wr-protect the last level.  It'll be great if there's quick answer from
anyone.. even though it's probably unrelated to the patch.

The change looks all correct:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

