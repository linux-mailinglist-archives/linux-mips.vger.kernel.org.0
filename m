Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E28B4EE22D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Mar 2022 21:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241109AbiCaT7j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Mar 2022 15:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbiCaT7i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Mar 2022 15:59:38 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B88216FB1
        for <linux-mips@vger.kernel.org>; Thu, 31 Mar 2022 12:57:51 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v12so1213945ljd.3
        for <linux-mips@vger.kernel.org>; Thu, 31 Mar 2022 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTe27Qc9aU9mrh9Xska5d8/rYGqxPk37jFPTpeO0UrM=;
        b=cM+XYBWkQOvd6IpcK95d5PqkmE8Zj/rsE4HM7KyzFR+6DlwGlrOGTFvjtZpdC9Aguj
         ESLCoJHA6QKBbqz7zUq2+E4v6HH/ZVXTMUYngj6O/43jTiLxBhJi3bfgeUXDEUrKXO08
         jlLXoMJrlDu0ntHa4lYeB+e2z1Fh9359EEd57bYrB062nhgLtDMXJSITG9Z6Kf3Ed3Fi
         mthSWhv5B5HSBNA0vYd6c5UqJ/fLBKbFciLMVvj0n4okgDzj36jXxbYKZr9X1J8Auxr+
         KBfDAEbrqLEltDXdCTGVk7I9BVY+6Ofz+qmkKRTQ2zs3SMS+MOlVbg/b0NYQ27XQppJ0
         WsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTe27Qc9aU9mrh9Xska5d8/rYGqxPk37jFPTpeO0UrM=;
        b=UmpGVzNE771vfN7+JvTBKp5RlO2x5DbREoe1EYnULWFB6SBGi9d4wzmrMYUDNpYH6n
         dVPNStvCIG2Fgigv1GYKBvj3YMVuyrMmSf2npArtkvwT0pvtrWtzUlZcsCf7bhNBC08X
         6YoO1o3YHENBUQ1LPtQYElTuWOID74VhHiUsJaY3q7kcXzDM3b/K74k1U87THjSaPDwC
         sC9SgxFMcBX1fk473B3a/bez4xWp4bklduSyHg9UMDR4+WAGuoKU85ztXCvrI91WMhj8
         VVXL2CeZjO1XJ/HBU2EYm69lgMilHTtURx9lLp3AzMbkraNKScv4gezNqw4e9jGNiTgw
         U1Mw==
X-Gm-Message-State: AOAM532DBB+CU/4jzNPM7aZI5GaM5/hRoLL1xTY+XobDQcaznOWaHLw+
        rO8wz2aqcv6AWwWGMKxcQmAd7xmJKhhxvlExiFSHaQ==
X-Google-Smtp-Source: ABdhPJw9+gcr6sgJpKfiIcWS6ZH8RxhxtcabitgSKfJZiaZHQP81kNDhjMCQEcxa3zOxAKVi/mFm6Pv92XT19v/VvHs=
X-Received: by 2002:a2e:390c:0:b0:248:1b88:d6c4 with SMTP id
 g12-20020a2e390c000000b002481b88d6c4mr11250384lja.49.1648756669056; Thu, 31
 Mar 2022 12:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com> <20220311002528.2230172-21-dmatlack@google.com>
 <YjG7Zh4zwTDsO3L1@xz-m1.local> <CALzav=fRFzbGEVhdMSwhX1Gs1++DGW6MOWvKzeQ-RTtLsus=SQ@mail.gmail.com>
 <YkSirYT6s8YtUr4w@xz-m1.local>
In-Reply-To: <YkSirYT6s8YtUr4w@xz-m1.local>
From:   David Matlack <dmatlack@google.com>
Date:   Thu, 31 Mar 2022 12:57:22 -0700
Message-ID: <CALzav=ceTVGviFzCP0BfUP74DmkBkBnRo5wczGq+2j05MdetMw@mail.gmail.com>
Subject: Re: [PATCH v2 20/26] KVM: x86/mmu: Extend Eager Page Splitting to the
 shadow MMU
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

On Wed, Mar 30, 2022 at 11:34 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Mar 22, 2022 at 04:58:08PM -0700, David Matlack wrote:
> > > > +static int prepare_to_split_huge_page(struct kvm *kvm,
> > > > +                                   const struct kvm_memory_slot *slot,
> > > > +                                   u64 *huge_sptep,
> > > > +                                   struct kvm_mmu_page **spp,
> > > > +                                   bool *flush,
> > > > +                                   bool *dropped_lock)
> > > > +{
> > > > +     int r = 0;
> > > > +
> > > > +     *dropped_lock = false;
> > > > +
> > > > +     if (kvm_mmu_available_pages(kvm) <= KVM_MIN_FREE_MMU_PAGES)
> > > > +             return -ENOSPC;
> > > > +
> > > > +     if (need_resched() || rwlock_needbreak(&kvm->mmu_lock))
> > > > +             goto drop_lock;
> > > > +
> > >
> > > Not immediately clear on whether there'll be case that *spp is set within
> > > the current function.  Some sanity check might be nice?
> >
> > Sorry I'm not sure what you mean here. What kind of sanity check did
> > you have in mind?
>
> Something like "WARN_ON_ONCE(*spp);"?

Ah I see. I was confused because the previous version of this code
checked if *spp is already set and, if so, skipped the allocation. But
I accidentally introduced a memory leak here when I implemented Ben'
suggestion to defer alloc_memory_for_split() to a subsequent commit.
I'll fix this in v3.

>
> >
> > >
> > > > +     *spp = kvm_mmu_alloc_direct_sp_for_split(true);
> > > > +     if (r)
> > > > +             goto drop_lock;
> > > > +
> > > > +     return 0;
>
> Thanks,
>
> --
> Peter Xu
>
