Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4F74E4935
	for <lists+linux-mips@lfdr.de>; Tue, 22 Mar 2022 23:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237956AbiCVWhe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Mar 2022 18:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbiCVWhe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Mar 2022 18:37:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C714025C73
        for <linux-mips@vger.kernel.org>; Tue, 22 Mar 2022 15:36:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b5so7318971ljf.13
        for <linux-mips@vger.kernel.org>; Tue, 22 Mar 2022 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xOVVu/q0Ku1P/VW4cpKoWIMKe104EsaHhNWgjj4aCF8=;
        b=Y7qK379YZwjwJ93fuYIEVEDITu46iSrJOQ0tZ8SSc7IVS8czHo+MH4DJ7Pt7CL2biv
         GMjsHvy2T2x2DnT7OfrTkJ/sO5zmepZkjcXthCPZ4S9i4u64E9R4NOXDMYXHd5xJdO3a
         ahkV/xEP+lQEfsObo1RcXS1j/+oHAk5Z5+t01bDijgjmBhtKAhib6SUKp/zQZxG4XLPd
         nY5kbhVDTSTIFbGGM7tOW78wkSioZ/5SiaF2e2vzZ4kyh8DaZB9XrnkFb9KxGdW4Irty
         2fzpNLrPi8SnEn0OVzetEpoHsp6JrPqr2b9SACCkU3eSFZUiaZxL/5o/v/qMLVYzTDiF
         adTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xOVVu/q0Ku1P/VW4cpKoWIMKe104EsaHhNWgjj4aCF8=;
        b=u8/m5z58rrkKUDMaBfMciOyEwd0Rfh2sv4YU/9VnrIV/aGdYFN3rRLZMo7X+F1GMik
         x20W/SCrxGhEhV/iyp3k7OYxjZ7hsfgBfx5BLdaUWbBmevKe+98I7ETFcbXC/qHF0o0o
         Nch31Y83q1VpMCGaOdwzwHTVhmxLsouUkaN1LBx44/ll4X433COOgtkRtknhVLR9XtzP
         zvhGuQQzD9KM52lg7/QiDQy7WZBOwW3EOHKPbLpKqqCrq5KGHz+f0EPQdSgHDs6UhAWc
         bCo1YvKFdshp3VTg9hjzot8+f+8eidTTcfwS6GrRinO/0ujj0d75k7fZ3aDbBNoH0Krf
         oSTQ==
X-Gm-Message-State: AOAM53224qSebeo4uZNlxxxDC5onf2tln+0DdBVf2t5cwzGNQQaP8MgX
        4A5ySsokSxYR0exWqYF/TruNAQL3btt1XEDlt5yiNw==
X-Google-Smtp-Source: ABdhPJwluBUdrQ3S0RKAvUXwpNmDB1zewZyw9nwYwRGoo/UMdP6fAUCPu5hPz027Wbt0/gETfLhJ81bzY9PXcrOyUew=
X-Received: by 2002:a2e:8255:0:b0:247:dff4:1f with SMTP id j21-20020a2e8255000000b00247dff4001fmr20990052ljh.16.1647988564022;
 Tue, 22 Mar 2022 15:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com> <20220311002528.2230172-12-dmatlack@google.com>
 <YjBqAL+bPmcQpTgM@xz-m1.local>
In-Reply-To: <YjBqAL+bPmcQpTgM@xz-m1.local>
From:   David Matlack <dmatlack@google.com>
Date:   Tue, 22 Mar 2022 15:35:37 -0700
Message-ID: <CALzav=ehyvZiM-JH6gcZo_yw9R-T5mR18UQF_GecM-qZCQs=Uw@mail.gmail.com>
Subject: Re: [PATCH v2 11/26] KVM: x86/mmu: Use common code to allocate
 kvm_mmu_page structs from vCPU caches
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

On Tue, Mar 15, 2022 at 3:27 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:13AM +0000, David Matlack wrote:
> >  static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
> >  {
> > -     struct kvm_mmu_page *sp;
> > -
> > -     sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> > -     sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> > -     set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
> > -
> > -     return sp;
> > +     return kvm_mmu_alloc_shadow_page(vcpu, true);
> >  }
>
> Similarly I had a feeling we could drop tdp_mmu_alloc_sp() too.. anyway:

Certainly, but I think it simplifies the TDP MMU code to keep it. It abstracts
away the implementation detail that a TDP MMU shadow page is allocated
the same way as a shadow MMU shadow page with direct=true.


>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>
