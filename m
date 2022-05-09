Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60BD52065D
	for <lists+linux-mips@lfdr.de>; Mon,  9 May 2022 23:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiEIVIl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 May 2022 17:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiEIVIg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 May 2022 17:08:36 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9600C2685D0
        for <linux-mips@vger.kernel.org>; Mon,  9 May 2022 14:04:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id t25so18550255ljd.6
        for <linux-mips@vger.kernel.org>; Mon, 09 May 2022 14:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c5LtGywQnrOXKM23KEYCQ2YGVv1HopC1il4VU9eUgxE=;
        b=sV2YUesPkqRi/0p/HKaHURPtcySE3DJDHUAAMBQSxIzugMHDsHPkIq11Za+WFAu9bG
         UFNluQRx+kZVfU1Vtrib+AkxMsIkIny3t4PMACdMOyXRiuQ3BV7xjp4iiFZLffs6uqze
         Buf1chdttyPGbxT1R1vPzc8JbwWHscDRqxY6beEcpNXYfRjzEDZQgwrYjE1nWuW4kT3S
         r7UDQP39oaM8dHixquIHqqJHb12gzWedDgD4NEt0oYk/gusriZ1/hMFoSsXvXhS3LLrE
         I++TRCKQ2rchxMyGjDtWbFmQK9zTpViB+qmuOZzTe79sfGNcC5vqhazohhKu7W6GIYxU
         eiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5LtGywQnrOXKM23KEYCQ2YGVv1HopC1il4VU9eUgxE=;
        b=gt+mNNrV0aUx0H9Kql+6XqRqQ+XqQvLu0xbEqHm7rQpiaXQYMGV71NOlGizLyWL/Oa
         9SNlMCg4ciFCw6+qbSpLvNxAqHCBUwiPcyCCKtb00bAKUVs/PKqS2Fm9ijVzRo4q6MTE
         3cEkQ2EYuE8BXGLI/GiepJjdm4Y+rbB8WIDRHljUFasGw2VW6wSxeyHYiH5mlnzcQ3zW
         cZHbERXW74XwL4IHcDk8w5YWBjouqNNMqPi30ku+HU5xCC07DQivZBZGHiknK74iQTC0
         ezCEkKlOo4R1xJajsC3PeD1BLYDmy93OOss0n/AnRm1CMzznaI+8pSLsy4hg9xMEgC8E
         Kwtg==
X-Gm-Message-State: AOAM5301Ao/mmEdbipLeomz2l7PBnb0EQB8a3EStRuvpu2ZL//gWMjGu
        REu4hA/IxMWWAhzeA8cTzNTFFhAeULt0WzsQswoh4w==
X-Google-Smtp-Source: ABdhPJxAE3oSM612W5GV7m6rV0MnBAiT424gFGbU3VxZpyNw2tWnKhf1N6nGVWDl2btu9ErypG2EOm1F3IUMYGBbQWk=
X-Received: by 2002:a2e:9e54:0:b0:250:d6c8:c2a6 with SMTP id
 g20-20020a2e9e54000000b00250d6c8c2a6mr765147ljk.16.1652130273338; Mon, 09 May
 2022 14:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220422210546.458943-1-dmatlack@google.com> <20220422210546.458943-4-dmatlack@google.com>
 <75fbbcb6-d9bb-3d30-0bf4-fbf925517d09@gmail.com>
In-Reply-To: <75fbbcb6-d9bb-3d30-0bf4-fbf925517d09@gmail.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 9 May 2022 14:04:06 -0700
Message-ID: <CALzav=dmseUw6khErkiSV7T5K88QvaRvWvBpvrb6VNOQTE3bQQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/20] KVM: x86/mmu: Derive shadow MMU page role from parent
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, May 7, 2022 at 1:28 AM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
>
>
>
> On 2022/4/23 05:05, David Matlack wrote:
> > Instead of computing the shadow page role from scratch for every new
> > page, derive most of the information from the parent shadow page.  This
> > avoids redundant calculations and reduces the number of parameters to
> > kvm_mmu_get_page().
> >
> > Preemptively split out the role calculation to a separate function for
> > use in a following commit.
> >
> > No functional change intended.
> >
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c         | 96 +++++++++++++++++++++++-----------
> >   arch/x86/kvm/mmu/paging_tmpl.h |  9 ++--
> >   2 files changed, 71 insertions(+), 34 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index dc20eccd6a77..4249a771818b 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -2021,31 +2021,15 @@ static void clear_sp_write_flooding_count(u64 *spte)
> >       __clear_sp_write_flooding_count(sptep_to_sp(spte));
> >   }
> >
> > -static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> > -                                          gfn_t gfn,
> > -                                          gva_t gaddr,
> > -                                          unsigned level,
> > -                                          bool direct,
> > -                                          unsigned int access)
> > +static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
> > +                                          union kvm_mmu_page_role role)
> >   {
> > -     union kvm_mmu_page_role role;
> >       struct hlist_head *sp_list;
> > -     unsigned quadrant;
> >       struct kvm_mmu_page *sp;
> >       int ret;
> >       int collisions = 0;
> >       LIST_HEAD(invalid_list);
> >
> > -     role = vcpu->arch.mmu->root_role;
> > -     role.level = level;
> > -     role.direct = direct;
> > -     role.access = access;
> > -     if (role.has_4_byte_gpte) {
> > -             quadrant = gaddr >> (PAGE_SHIFT + (PT64_PT_BITS * level));
> > -             quadrant &= (1 << ((PT32_PT_BITS - PT64_PT_BITS) * level)) - 1;
> > -             role.quadrant = quadrant;
> > -     }
>
>
> I don't think replacing it with kvm_mmu_child_role() can reduce any calculations.
>
> role.level, role.direct, role.access and role.quadrant still need to be
> calculated.  And the old code is still in mmu_alloc_root().

You are correct. Instead of saying "less calculations" I should have
said "eliminates the dependency on vcpu->arch.mmu->root_role".

>
> I think kvm_mmu_get_shadow_page() can keep the those parameters and
> kvm_mmu_child_role() is only introduced for nested_mmu_get_sp_for_split().
>
> Both kvm_mmu_get_shadow_page() and nested_mmu_get_sp_for_split() call
> __kvm_mmu_get_shadow_page() which uses role as a parameter.

I agree this would work, but I think the end result would be more
difficult to read.

The way I've implemented it there are two ways the SP roles are calculated:

1. For root SPs: Derive the role from vCPU root_role and caller-provided inputs.
2. For child SPs: Derive the role from parent SP and caller-provided inputs.

Your proposal would still have two ways to calculate the SP role, but
split along a different dimension:

1. For vCPUs creating SPs: Derive the role from vCPU root_role and
caller-provided inputs.
2. For Eager Page Splitting creating SPs: Derive the role from parent
SP and caller-provided inputs.

With your proposal, it is less obvious that eager page splitting is
going to end up with the correct role. Whereas if we use the same
calculation for all child SPs, it is immediately obvious.

>
>
>
> > -
> >       sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
> >       for_each_valid_sp(vcpu->kvm, sp, sp_list) {
> >               if (sp->gfn != gfn) {
> > @@ -2063,7 +2047,7 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> >                        * Unsync pages must not be left as is, because the new
> >                        * upper-level page will be write-protected.
> >                        */
> > -                     if (level > PG_LEVEL_4K && sp->unsync)
> > +                     if (role.level > PG_LEVEL_4K && sp->unsync)
> >                               kvm_mmu_prepare_zap_page(vcpu->kvm, sp,
> >                                                        &invalid_list);
> >                       continue;
> > @@ -2104,14 +2088,14 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> >
> >       ++vcpu->kvm->stat.mmu_cache_miss;
> >
> > -     sp = kvm_mmu_alloc_page(vcpu, direct);
> > +     sp = kvm_mmu_alloc_page(vcpu, role.direct);
> >
> >       sp->gfn = gfn;
> >       sp->role = role;
> >       hlist_add_head(&sp->hash_link, sp_list);
> > -     if (!direct) {
> > +     if (!role.direct) {
> >               account_shadowed(vcpu->kvm, sp);
> > -             if (level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
> > +             if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
> >                       kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
> >       }
> >       trace_kvm_mmu_get_page(sp, true);
> > @@ -2123,6 +2107,51 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> >       return sp;
> >   }
> >
> > +static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
> > +{
> > +     struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
> > +     union kvm_mmu_page_role role;
> > +
> > +     role = parent_sp->role;
> > +     role.level--;
> > +     role.access = access;
> > +     role.direct = direct;
> > +
> > +     /*
> > +      * If the guest has 4-byte PTEs then that means it's using 32-bit,
> > +      * 2-level, non-PAE paging. KVM shadows such guests using 4 PAE page
> > +      * directories, each mapping 1/4 of the guest's linear address space
> > +      * (1GiB). The shadow pages for those 4 page directories are
> > +      * pre-allocated and assigned a separate quadrant in their role.
>
>
> It is not going to be true in patchset:
> [PATCH V2 0/7] KVM: X86/MMU: Use one-off special shadow page for special roots
>
> https://lore.kernel.org/lkml/20220503150735.32723-1-jiangshanlai@gmail.com/
>
> The shadow pages for those 4 page directories are also allocated on demand.

Ack. I can even just drop this sentence in v5, it's just background information.
