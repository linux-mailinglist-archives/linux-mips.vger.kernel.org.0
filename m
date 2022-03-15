Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37164D98E9
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 11:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239139AbiCOKjE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 06:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234839AbiCOKjE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 06:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7647D625F
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647340670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/KyXBi502NBWJY1eIzGz6vA6KexTdmJyjzypUpAHTNE=;
        b=AYiLbc4VoDFKUfLmUoGH3A0KVDa+0BrjTL9nrCubyQt6x+0w0nLtYFv/EDZhSeWQbu9HK3
        neuxei+yAuI7YaHSGy5W59XkxINXAau2lipiQ/cOsTO/EfLPSOKQyU7K9PUjjuvSl43S41
        cAu5uQcL1zO8MJoq2rSlMKfKwB1GvFk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-wa__eP4mNkmk_sa4W_Tqiw-1; Tue, 15 Mar 2022 06:37:49 -0400
X-MC-Unique: wa__eP4mNkmk_sa4W_Tqiw-1
Received: by mail-pl1-f199.google.com with SMTP id j1-20020a170903028100b0014b1f9e0068so8154960plr.8
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/KyXBi502NBWJY1eIzGz6vA6KexTdmJyjzypUpAHTNE=;
        b=CoKawqDFhbDX93FPl+EC3Beefwido8CXIY4rMhgrv0Lh/tkcQTb5V1Zc1PnU/Rst1s
         x8yrt9OLDBoHtHyNUJNREfJkyHbx4gLCBmpbXNpKwICeXjNlMhhV4iGem6k3BKlu7Sbg
         C9ELi3mPWyXRpZQBdeXiTaG2rdBhpEfrNMxI5Lg9O4CLRoxwKG+GRvUXLcw0Mp3sQ95P
         bFausrEJz6KWVJIqnWipHTXUj2/ZqspkaHQ+zbvrr/HIN3sTvDjp3dpcUsyuWECdBsLZ
         3lc2wRvLAH3s/LHPqziLGDMh8lgnbTCmv+kAuCa2tkfppi9pNfvyaeNb+bRy3aHyHb2g
         a1Ug==
X-Gm-Message-State: AOAM532eidXEeJnJ2VUqQiZpC0eR1pKn7z2qd7S3AJk/GC5PesSuwQVC
        U397yySz7fAP7g0TbNS4G7KwKsaCNacMRSLpeQ4j3TYTCFPTEqCpAbjIDr9aCHyFiWuC/EDl51v
        kEjOd8pYH+UPxsLNBaoj4nw==
X-Received: by 2002:a17:902:864b:b0:14c:d45e:a77b with SMTP id y11-20020a170902864b00b0014cd45ea77bmr27271941plt.143.1647340668141;
        Tue, 15 Mar 2022 03:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuwiZgnCw2OZfY3/17qI+R/Vwptjj6tRCpsQcLyxgK5e+0w7DucK4ECAsJZKeHLCwxh0Ejkg==
X-Received: by 2002:a17:902:864b:b0:14c:d45e:a77b with SMTP id y11-20020a170902864b00b0014cd45ea77bmr27271914plt.143.1647340667879;
        Tue, 15 Mar 2022 03:37:47 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43])
        by smtp.gmail.com with ESMTPSA id lp13-20020a17090b4a8d00b001c18b1114c8sm2789942pjb.10.2022.03.15.03.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 03:37:47 -0700 (PDT)
Date:   Tue, 15 Mar 2022 18:37:38 +0800
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
Subject: Re: [PATCH v2 14/26] KVM: x86/mmu: Decouple rmap_add() and
 link_shadow_page() from kvm_vcpu
Message-ID: <YjBsctBz5RAWUd8r@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-15-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-15-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:16AM +0000, David Matlack wrote:
> Allow adding new entries to the rmap and linking shadow pages without a
> struct kvm_vcpu pointer by moving the implementation of rmap_add() and
> link_shadow_page() into inner helper functions.
> 
> No functional change intended.
> 
> Reviewed-by: Ben Gardon <bgardon@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 43 +++++++++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index d7ad71be6c52..c57070ed157d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -725,9 +725,9 @@ static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
>  	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
>  }
>  
> -static struct pte_list_desc *mmu_alloc_pte_list_desc(struct kvm_vcpu *vcpu)
> +static struct pte_list_desc *mmu_alloc_pte_list_desc(struct kvm_mmu_memory_cache *cache)
>  {
> -	return kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_pte_list_desc_cache);
> +	return kvm_mmu_memory_cache_alloc(cache);
>  }

Nit: same here, IMHO we could drop mmu_alloc_pte_list_desc() already..

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

