Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0B5F75FC80
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jul 2023 18:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjGXQsD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jul 2023 12:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjGXQsA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jul 2023 12:48:00 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18D910CE
        for <linux-mips@vger.kernel.org>; Mon, 24 Jul 2023 09:47:58 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-346258cf060so505ab.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Jul 2023 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690217278; x=1690822078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK3B5wZw1OFgk2DT1iEhz+umMy+9ra8FX/pBQvU+W/w=;
        b=xY3tx3WTK4KdOY0TvcsLtqmIECu15VlVbTEUqZLznKTrcEQ3qq9MZ8A73xGTPHFhur
         A/0lC2YaasiB2qtLY96CMo7gEkIDOmPcUEvCDuOPhXiO41+3fvy2/Skq1jEll2CJZ4lB
         wyvmFXGj4o8we+38ahIX0hi2cof+wdyVSxg0IuxH6YMIzNwMT6/bsiJ/gjrGwSSgyJjB
         nLN8V8tWusmsM+7/fZZ4n+x9rbksRwiIno10akUtzIy+PPeQIuE7QuixtX1MDApQ0wfG
         +Jl9ixl11ZsGp2pA/Fh2BIytERW9S4aYDU7b7oeTBewyBL4tWEcTlqqwi4vIUmQP0co3
         8Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217278; x=1690822078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK3B5wZw1OFgk2DT1iEhz+umMy+9ra8FX/pBQvU+W/w=;
        b=cS+hNzY4DCeUxHlAhFNGqGN5QH/08Smbe6skd0WZt3Lh+XdobC0gasqjKBEtHcCelr
         mTSQprR1wupm8vKMhknImqt2OjnmfKSjtjYNZhUxwP5UzY20aDRwbfGWBbBHmgVgKxkN
         fj/58oylHobqsHGpCHy8Obzu2Bu9kwnG1FlX+bGtVQl7jd4cmrwI0r7YIeftmr9zllby
         sqpG+8HzyzOzSbv233Pl6AO8vrpFnL5G4JdbaULEIqViFg/TVA6cYohkVM0nA7S4/1ke
         HF9IhTOoBeJDLnqv9OLIxI5opUPeBJcXIY/z/hip/79h+sezc1IpgQQCxPD3Xoo86iS1
         XXFg==
X-Gm-Message-State: ABy/qLaOlW8ces9f6YKcSy16CoPOhMQLSpCJ7uK9WaOFZN4OQvpUm+kq
        izrb+xWwcbL2SUEmRgWZ5+lGHlG1NXoDtcC4fR+acg==
X-Google-Smtp-Source: APBJJlFsPT/IwrE4lZVNtp/1e+lmtgN7VA69U7UflS8F9GMvZ0xsWoBJPqsBR24E0XAF1wZyOEEj+fEvQ3/vP7Be/nQ=
X-Received: by 2002:a05:6e02:1a0d:b0:348:cfeb:f52 with SMTP id
 s13-20020a056e021a0d00b00348cfeb0f52mr272705ild.7.1690217278012; Mon, 24 Jul
 2023 09:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-13-rananta@google.com>
 <0841aca6-2824-6a1b-a568-119f8bd220de@redhat.com>
In-Reply-To: <0841aca6-2824-6a1b-a568-119f8bd220de@redhat.com>
From:   Raghavendra Rao Ananta <rananta@google.com>
Date:   Mon, 24 Jul 2023 09:47:46 -0700
Message-ID: <CAJHc60znT5ThqKE3TgTW-0Us3oNv8+KF=81TSK0PbG3tTyJLFQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for unmap
To:     Shaoqin Huang <shahuang@redhat.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 24, 2023 at 2:35=E2=80=AFAM Shaoqin Huang <shahuang@redhat.com>=
 wrote:
>
> Hi Raghavendra,
>
> On 7/22/23 10:22, Raghavendra Rao Ananta wrote:
> > The current implementation of the stage-2 unmap walker traverses
> > the given range and, as a part of break-before-make, performs
> > TLB invalidations with a DSB for every PTE. A multitude of this
> > combination could cause a performance bottleneck on some systems.
> >
> > Hence, if the system supports FEAT_TLBIRANGE, defer the TLB
> > invalidations until the entire walk is finished, and then
> > use range-based instructions to invalidate the TLBs in one go.
> > Condition deferred TLB invalidation on the system supporting FWB,
> > as the optimization is entirely pointless when the unmap walker
> > needs to perform CMOs.
> >
> > Rename stage2_put_pte() to stage2_unmap_put_pte() as the function
> > now serves the stage-2 unmap walker specifically, rather than
> > acting generic.
> >
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > ---
> >   arch/arm64/kvm/hyp/pgtable.c | 67 +++++++++++++++++++++++++++++++----=
-
> >   1 file changed, 58 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.=
c
> > index 5ef098af1736..cf88933a2ea0 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -831,16 +831,54 @@ static void stage2_make_pte(const struct kvm_pgta=
ble_visit_ctx *ctx, kvm_pte_t n
> >       smp_store_release(ctx->ptep, new);
> >   }
> >
> > -static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, st=
ruct kvm_s2_mmu *mmu,
> > -                        struct kvm_pgtable_mm_ops *mm_ops)
> > +struct stage2_unmap_data {
> > +     struct kvm_pgtable *pgt;
> > +     bool defer_tlb_flush_init;
> > +};
> > +
> > +static bool __stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
> > +{
> > +     /*
> > +      * If FEAT_TLBIRANGE is implemented, defer the individual
> > +      * TLB invalidations until the entire walk is finished, and
> > +      * then use the range-based TLBI instructions to do the
> > +      * invalidations. Condition deferred TLB invalidation on the
> > +      * system supporting FWB, as the optimization is entirely
> > +      * pointless when the unmap walker needs to perform CMOs.
> > +      */
> > +     return system_supports_tlb_range() && stage2_has_fwb(pgt);
> > +}
> > +
> > +static bool stage2_unmap_defer_tlb_flush(struct stage2_unmap_data *unm=
ap_data)
> > +{
> > +     bool defer_tlb_flush =3D __stage2_unmap_defer_tlb_flush(unmap_dat=
a->pgt);
> > +
> > +     /*
> > +      * Since __stage2_unmap_defer_tlb_flush() is based on alternative
> > +      * patching and the TLBIs' operations behavior depend on this,
> > +      * track if there's any change in the state during the unmap sequ=
ence.
> > +      */
> > +     WARN_ON(unmap_data->defer_tlb_flush_init !=3D defer_tlb_flush);
> > +     return defer_tlb_flush;
> > +}
> > +
> > +static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *c=
tx,
> > +                             struct kvm_s2_mmu *mmu,
> > +                             struct kvm_pgtable_mm_ops *mm_ops)
> >   {
> > +     struct stage2_unmap_data *unmap_data =3D ctx->arg;
> > +
> >       /*
> > -      * Clear the existing PTE, and perform break-before-make with
> > -      * TLB maintenance if it was valid.
> > +      * Clear the existing PTE, and perform break-before-make if it wa=
s
> > +      * valid. Depending on the system support, the TLB maintenance fo=
r
> > +      * the same can be deferred until the entire unmap is completed.
> >        */
> >       if (kvm_pte_valid(ctx->old)) {
> >               kvm_clear_pte(ctx->ptep);
> > -             kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ct=
x->level);
> > +
> > +             if (!stage2_unmap_defer_tlb_flush(unmap_data))
> Why not directly check (unmap_data->defer_tlb_flush_init) here?
>
(Re-sending the reply as the previous one was formatted as HTML and
was blocked by many lists)

No particular reason per say, but I was just going with the logic of
determining if we need to defer the flush and the WARN_ON() parts
separate.
Any advantage if we directly check in stage2_unmap_put_pte() that I
missed or is this purely for readability?

> > +                     kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
> > +                                     ctx->addr, ctx->level);
> Small indent hint. The ctx->addr can align with __kvm_tlb_flush_vmid_ipa.
>
Ah, yes. I'll adjust this if I send out a v8.

Thank you.
Raghavendra
> Thanks,
> Shaoqin
> >       }
> >
> >       mm_ops->put_page(ctx->ptep);
> > @@ -1070,7 +1108,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtab=
le *pgt, u64 addr, u64 size,
> >   static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ct=
x,
> >                              enum kvm_pgtable_walk_flags visit)
> >   {
> > -     struct kvm_pgtable *pgt =3D ctx->arg;
> > +     struct stage2_unmap_data *unmap_data =3D ctx->arg;
> > +     struct kvm_pgtable *pgt =3D unmap_data->pgt;
> >       struct kvm_s2_mmu *mmu =3D pgt->mmu;
> >       struct kvm_pgtable_mm_ops *mm_ops =3D ctx->mm_ops;
> >       kvm_pte_t *childp =3D NULL;
> > @@ -1098,7 +1137,7 @@ static int stage2_unmap_walker(const struct kvm_p=
gtable_visit_ctx *ctx,
> >        * block entry and rely on the remaining portions being faulted
> >        * back lazily.
> >        */
> > -     stage2_put_pte(ctx, mmu, mm_ops);
> > +     stage2_unmap_put_pte(ctx, mmu, mm_ops);
> >
> >       if (need_flush && mm_ops->dcache_clean_inval_poc)
> >               mm_ops->dcache_clean_inval_poc(kvm_pte_follow(ctx->old, m=
m_ops),
> > @@ -1112,13 +1151,23 @@ static int stage2_unmap_walker(const struct kvm=
_pgtable_visit_ctx *ctx,
> >
> >   int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 s=
ize)
> >   {
> > +     int ret;
> > +     struct stage2_unmap_data unmap_data =3D {
> > +             .pgt =3D pgt,
> > +             .defer_tlb_flush_init =3D __stage2_unmap_defer_tlb_flush(=
pgt),
> > +     };
> >       struct kvm_pgtable_walker walker =3D {
> >               .cb     =3D stage2_unmap_walker,
> > -             .arg    =3D pgt,
> > +             .arg    =3D &unmap_data,
> >               .flags  =3D KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABL=
E_POST,
> >       };
> >
> > -     return kvm_pgtable_walk(pgt, addr, size, &walker);
> > +     ret =3D kvm_pgtable_walk(pgt, addr, size, &walker);
> > +     if (stage2_unmap_defer_tlb_flush(&unmap_data))
> > +             /* Perform the deferred TLB invalidations */
> > +             kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
> > +
> > +     return ret;
> >   }
> >
> >   struct stage2_attr_data {
>
> --
> Shaoqin
>
