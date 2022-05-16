Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030335292FE
	for <lists+linux-mips@lfdr.de>; Mon, 16 May 2022 23:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349416AbiEPViv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 17:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349430AbiEPVij (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 17:38:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4AF419BE
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 14:38:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y32so28076816lfa.6
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGRQiwR6nMDWdELQLZomuoHgNcB74pq7BSHN33rcyck=;
        b=IsfR/Ba8Lmb+VJH2OG0mIgzWKLWgJSZ7G3RtQlM9ozVeYj+IjPRW4gphkF+ePx5pPK
         /ARCnfbfKxB+CrmtIHAtVCy/macGC66sVlMQi2bYubo+LAEtIO2ur2X295UsCC4eOE7v
         82TwvhmCNXtTf3reKHYT8k0OGZeIsyEqRaJx26mbJ9PuGA9weeVgy1owjHYkgctW2uN4
         J04QlA82V/guPrOqw6heaj2eGWVasuQemmz6eps1IOJRq+16ntEJ8ldA2QCPV0k9PUqe
         +2W1gTouJaPx1cvAB/rQVOnqnr4Q4qGiHJtgvdFD2hP4wp1H9uXHLOnm7lsfl8f+cuQj
         zHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGRQiwR6nMDWdELQLZomuoHgNcB74pq7BSHN33rcyck=;
        b=JRoi26I00B7U7NPPqmstvJ/gVieOxdaa6cf+wtbNufh4JqPHcvz2jD1p854gvj3ePe
         RyonafVgNilG1SDCfnqPgwL3aCZwMSR11b/dTKmQhi4DdJR16tvUiSsk7AD16Zr6QB4X
         vClrqXCX69tfxTxqiQvDQdriZm7w+jXKIZpI8mIRBWGpfdT9qwBzD3BKbvf7qD3E1bFh
         4LNsQxydGiAAwBdXs1HNigP4uaE7Ov/k09yB/kUmMD0w5N9Svf9gbkdaxptnhGVV3JTj
         09pU+43ZWyk+UCIRDDBowW3kJ+UfKDAQE4ewBKp4XKtjo/rGcyNs/7eaXgJ0c/tpXujI
         P7qA==
X-Gm-Message-State: AOAM533owTwcMZj9c4NzDKkmujVr52GVkDvaS9kt1SBwRlTlOIXWhfWs
        vV15j+PpGOq/dHMRHbUoAsL7I7VzZlvR5HJn4j0Lfg==
X-Google-Smtp-Source: ABdhPJzhERAS9lHQHB6Dz/Db29pEQFX1daKzVrhh48FjaZbwCqNewI9tJhfWv44RYQoQCBR3iXMGVI6TmcXJ2YsQ79g=
X-Received: by 2002:ac2:5399:0:b0:472:1f95:85df with SMTP id
 g25-20020ac25399000000b004721f9585dfmr14058450lfh.102.1652737115690; Mon, 16
 May 2022 14:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220513202819.829591-1-dmatlack@google.com> <20220513202819.829591-4-dmatlack@google.com>
 <CAJhGHyAU_5Esn6i-eeBNKOh4XenOc9_1aiF8N0+CeMF5yyhxew@mail.gmail.com>
In-Reply-To: <CAJhGHyAU_5Esn6i-eeBNKOh4XenOc9_1aiF8N0+CeMF5yyhxew@mail.gmail.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 16 May 2022 14:38:09 -0700
Message-ID: <CALzav=cOS580FMr3zoDT+efYaBDSPSq+m84a1jQBv+jt3xvnqA@mail.gmail.com>
Subject: Re: [PATCH v5 03/21] KVM: x86/mmu: Derive shadow MMU page role from parent
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
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
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

On Sun, May 15, 2022 at 11:55 PM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
>
> On Sat, May 14, 2022 at 4:28 AM David Matlack <dmatlack@google.com> wrote:
>
> > -static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, gva_t gva,
> > +static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
> >                             u8 level, bool direct)
> >  {
> > +       union kvm_mmu_page_role role;
> >         struct kvm_mmu_page *sp;
> >
> > -       sp = kvm_mmu_get_page(vcpu, gfn, gva, level, direct, ACC_ALL);
> > +       role = vcpu->arch.mmu->root_role;
> > +       role.level = level;
> > +       role.direct = direct;
> > +       role.access = ACC_ALL;
> > +
> > +       if (role.has_4_byte_gpte)
> > +               role.quadrant = quadrant;
> > +
> > +       if (level <= vcpu->arch.mmu->cpu_role.base.level)
> > +               role.passthrough = 0;
> > +
>
>
>
> +       role.level = level;
> +
> +       if (role.has_4_byte_gpte)
> +               role.quadrant = quadrant;
>
> Only these lines are needed because of mmu->pae_root, others are
> the same as vcpu->arch.mmu->root_role.
>
> The argument @direct is vcpu->arch.mmu->root_role.direct.
> vcpu->arch.mmu->root_role.access is always set to be ACC_ALL.
>
> vcpu->arch.mmu->root_role.passthrough is 0 when mmu->pae_root is used.
> Or if vcpu->arch.mmu->root_role.passthrough is 1, @level must be 5
> and vcpu->arch.mmu->cpu_role.base.level must be 4, the code here
> is useless.

Ah, thank you for the tip. That is cleaner.
