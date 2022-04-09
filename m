Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C9C4FA0BD
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 02:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237195AbiDIAmN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Apr 2022 20:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbiDIAmG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Apr 2022 20:42:06 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3045C6F17
        for <linux-mips@vger.kernel.org>; Fri,  8 Apr 2022 17:40:00 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id z16so9841218pfh.3
        for <linux-mips@vger.kernel.org>; Fri, 08 Apr 2022 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VZz44nmQ769NskmU1+rSj1kgQ7eEgmL84RyrglKPKlU=;
        b=hDG6N87X2mOxxCOCXXKUWOcaI826FpS5EoPhQJZu2dORSprAcsRFAElLaAchgm9JOc
         6aWNWoTK0riqGAg5yhneIUYXDrCc+fGj3H7kK7mXEHIlpTFzEJW/uo/BmtZGNeswC4nd
         PbmESxnPTnEseYvaH22WEqAMzyjNqP7va9Cy/08YzQ+8Zp7oRhZV7H2uOAWtwOJwR64j
         C1XpU2RhBAmDNFKLPpLhftnPQdVrdTUUBk5NAt0Csjzufq0YZ246p/rCAHmwpT6hnZDF
         gCIIkrVBCCM0ekFXDZVmyYk5Ax0gSZAvTp7mqghQynS+ToMez9bXma7soou9cwqLW7g0
         3GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VZz44nmQ769NskmU1+rSj1kgQ7eEgmL84RyrglKPKlU=;
        b=OEeKl7lAxBT6qfBL5Ccr8Alh1HTTZjhr6bw9UTfnswPX2nT18y/u77itYfKIRtrhcq
         dFm1/YdXPpBf56j3dC7l2jvzDKl+EI4GffbSlpnIDpMM8fyuq/2HjFR57i12caZAURp8
         rfJAesKR1gY+p0BGrO3qq5pIRD+8IATmrAxaa0VCGyT5skCQDfS9b6JMUWqHaYQVNdLj
         alqiYu1nk3lUYEsCt4yet6x/lrRd5RJ+KshFasnTSUKydP1p/E/Ef5OGb5rgLoGbpkBx
         QwEs0LDesmD160LpwmrneRuTNntn+K3IoZR20FxYPoeRF+nvVS61N1YOTndTbEKA06JU
         30qQ==
X-Gm-Message-State: AOAM531kI0YDMD3Qq/av7BuO/C+ngc1+eALlN+mRH1zAvfma+UytEp/4
        SScG5p0BgP0JMcvdia1oKE7wEA==
X-Google-Smtp-Source: ABdhPJy9qpY4+K63QvK5VhUfvYFRHJk9uYqLUbpgv47CS1Vcvf2kVPQru+XKAuYVywEBn/XAV7z39w==
X-Received: by 2002:a63:5520:0:b0:399:8cd:5f62 with SMTP id j32-20020a635520000000b0039908cd5f62mr17547409pgb.12.1649464800133;
        Fri, 08 Apr 2022 17:40:00 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id m8-20020a056a00080800b004faa4e113bfsm28586836pfk.154.2022.04.08.17.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 17:39:59 -0700 (PDT)
Date:   Sat, 9 Apr 2022 00:39:55 +0000
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
Subject: Re: [PATCH v3 22/23] KVM: x86/mmu: Support Eager Page Splitting in
 the shadow MMU
Message-ID: <YlDV27ediz+rBuLd@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <20220401175554.1931568-23-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401175554.1931568-23-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 01, 2022, David Matlack wrote:
> Add support for Eager Page Splitting pages that are mapped by the shadow
> MMU. Walk through the rmap first splitting all 1GiB pages to 2MiB pages,
> and then splitting all 2MiB pages to 4KiB pages.
> 
> Splitting huge pages mapped by the shadow MMU requries dealing with some
> extra complexity beyond that of the TDP MMU:
> 
> (1) The shadow MMU has a limit on the number of shadow pages that are
>     allowed to be allocated. So, as a policy, Eager Page Splitting
>     refuses to split if there are KVM_MIN_FREE_MMU_PAGES or fewer
>     pages available.
> 
> (2) Huge pages may be mapped by indirect shadow pages which have the
>     possibility of being unsync. As a policy we opt not to split such
>     pages as their translation may no longer be valid.

This shouldn't be possible, shadow pages whose role is > 4k are always write-protected
and not allowed to become unsync.

> 
> (3) Splitting a huge page may end up re-using an existing lower level
>     shadow page tables. This is unlike the TDP MMU which always allocates
>     new shadow page tables when splitting.

...

> +static void kvm_mmu_split_huge_page(struct kvm *kvm,
> +				    const struct kvm_memory_slot *slot,
> +				    u64 *huge_sptep, struct kvm_mmu_page **spp)
> +
> +{
> +	struct kvm_mmu_memory_cache *cache = &kvm->arch.huge_page_split_desc_cache;
> +	u64 huge_spte = READ_ONCE(*huge_sptep);
> +	struct kvm_mmu_page *sp;
> +	bool flush = false;
> +	u64 *sptep, spte;
> +	gfn_t gfn;
> +	int index;
> +
> +	sp = kvm_mmu_get_sp_for_split(kvm, slot, huge_sptep, spp);
> +
> +	for (index = 0; index < PT64_ENT_PER_PAGE; index++) {
> +		sptep = &sp->spt[index];
> +		gfn = kvm_mmu_page_get_gfn(sp, index);
> +
> +		/*
> +		 * sp may have populated page table entries, e.g. if this huge
> +		 * page is aliased by multiple sptes with the same access
> +		 * permissions. We know the sptes will be mapping the same
> +		 * gfn-to-pfn translation since sp is direct. However, a given
> +		 * spte may point to an even lower level page table. We don't
> +		 * know if that lower level page table is completely filled in,
> +		 * i.e. we may be effectively unmapping a region of memory, so
> +		 * we must flush the TLB.

Random side topic, please avoid "we" and other pronouns in comments and changelogs,
it gets real easy to lose track of what a pronoun is referring to, especially in
changelogs where "we" might be KVM, might be the kernel, might be the team that's
using the patch, might be an author that's prone to illeism, etc...
