Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C544E48DD
	for <lists+linux-mips@lfdr.de>; Tue, 22 Mar 2022 23:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbiCVWHj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Mar 2022 18:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237385AbiCVWHj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Mar 2022 18:07:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7376004C
        for <linux-mips@vger.kernel.org>; Tue, 22 Mar 2022 15:06:07 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 17so25876318lji.1
        for <linux-mips@vger.kernel.org>; Tue, 22 Mar 2022 15:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDctWXCZdyM5GB7RYASY+je0HYc47y70gOwl8FZOZm4=;
        b=smB2FXdWY0kivKSxas6WhCBIsILQplewNHqP+jCt4AUSWLy/pM2Sqmxa9Vs2b0ddnb
         rysEStWa6DxMu8bCjQoFwFIonkuFBXpcUjSFGIv8ZeKAn7cNKdA3Qn3I3TQG6nhRmz2T
         NG6nR/8T1pwaXdKdWGeKeW6u71IaPmZKO5IUsHHdC1pZPr2GQHbD8YwfMU+8YcYnBoDU
         TcNIBUyP1NQYItJFFYI7W5O7hgFQJpfjqOXWE7e7T90a42b8Yvzfde7AeBvNfktwdgVr
         IVyxA3N7oEsLuXfO91CfQGWGZdyB/gLypP6qaFz3j3yN2qEyvXDRBsa/iwKjJzg6sxc5
         2BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDctWXCZdyM5GB7RYASY+je0HYc47y70gOwl8FZOZm4=;
        b=sJYP2M+/KdB7BSiwJqWU5MMLTKqQfaQ1tBP+gByIsoYsJBmA/g77fhAVhA77i58vQ9
         HfYefp+hWEQiRL29Oi3xaQrV9Sk4tBDNzcLWyz/jYsgB+0YiXPR0in/IErxx3AehQPqF
         7oPK90nGCUXC+tOvHWv5P4+bJP6uiVEFTwIuNRjc7OnCqDbiTuI2y1ItJd/YIZYueef6
         Bh6MQcZVI7YQ9RbpbUgHs7/pdfvwqlcqe4fj7r7mJmWJhRnXj5BL7htvbO/appMTQQ4u
         1eX6/3NB7eI2jF27im2PXuF4eiUXBEb6j8acgRQh5y7WXoq7i75bfWd4PZy7DB9hLAr4
         ePlw==
X-Gm-Message-State: AOAM5316QfePv4n4POBB0cazX/pDtMqRhigJmnfIaOyQsc88btuDKk5+
        yNMtdH7CZfNNsJZN7S/GSGjN4JTI1unELq9PnKbz0c1ZX00=
X-Google-Smtp-Source: ABdhPJynK/JJXFYQj2VAWjdUhNJu91ZGpwnFDHqBcP8k3VgI99deds+U0mT8GuZkBk87T+opYdYujghah01FAEA+v/g=
X-Received: by 2002:a2e:8255:0:b0:247:dff4:1f with SMTP id j21-20020a2e8255000000b00247dff4001fmr20905527ljh.16.1647986766015;
 Tue, 22 Mar 2022 15:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com> <20220311002528.2230172-7-dmatlack@google.com>
 <YjBWdv3nEk3Cz40m@xz-m1.local>
In-Reply-To: <YjBWdv3nEk3Cz40m@xz-m1.local>
From:   David Matlack <dmatlack@google.com>
Date:   Tue, 22 Mar 2022 15:05:39 -0700
Message-ID: <CALzav=dmfFNvitGvO-RCnxmqHpSiQN68JV6Q+UTem8Wfwma+wA@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] KVM: x86/mmu: Pass memslot to kvm_mmu_new_shadow_page()
To:     Peter Xu <peterx@redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>,
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

On Tue, Mar 15, 2022 at 2:04 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:08AM +0000, David Matlack wrote:
> > Passing the memslot to kvm_mmu_new_shadow_page() avoids the need for the
> > vCPU pointer when write-protecting indirect 4k shadow pages. This moves
> > us closer to being able to create new shadow pages during VM ioctls for
> > eager page splitting, where there is not vCPU pointer.
> >
> > This change does not negatively impact "Populate memory time" for ept=Y
> > or ept=N configurations since kvm_vcpu_gfn_to_memslot() caches the last
> > use slot. So even though we now look up the slot more often, it is a
> > very cheap check.
> >
> > Opportunistically move the code to write-protect GFNs shadowed by
> > PG_LEVEL_4K shadow pages into account_shadowed() to reduce indentation
> > and consolidate the code. This also eliminates a memslot lookup.
> >
> > No functional change intended.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index b6fb50e32291..519910938478 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -793,16 +793,14 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn)
> >       update_gfn_disallow_lpage_count(slot, gfn, -1);
> >  }
> >
> > -static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
> > +static void account_shadowed(struct kvm *kvm,
> > +                          struct kvm_memory_slot *slot,
> > +                          struct kvm_mmu_page *sp)
> >  {
> > -     struct kvm_memslots *slots;
> > -     struct kvm_memory_slot *slot;
> >       gfn_t gfn;
> >
> >       kvm->arch.indirect_shadow_pages++;
> >       gfn = sp->gfn;
> > -     slots = kvm_memslots_for_spte_role(kvm, sp->role);
> > -     slot = __gfn_to_memslot(slots, gfn);
> >
> >       /* the non-leaf shadow pages are keeping readonly. */
> >       if (sp->role.level > PG_LEVEL_4K)
> > @@ -810,6 +808,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
> >                                                   KVM_PAGE_TRACK_WRITE);
> >
> >       kvm_mmu_gfn_disallow_lpage(slot, gfn);
> > +
> > +     if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
> > +             kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
>
> It's not immediately obvious in this diff, but when looking at the code
> yeah it looks right to just drop the 4K check..

Yeah it's a bit subtle but (as you probably noticed) account_shadowed()
returns early if the level is above PG_LEVEL_4K.


>
> I also never understood why we only write-track the >1 levels but only
> wr-protect the last level.  It'll be great if there's quick answer from
> anyone.. even though it's probably unrelated to the patch.
>
> The change looks all correct:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> Thanks,
>
> --
> Peter Xu
>
