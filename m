Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DB1531A99
	for <lists+linux-mips@lfdr.de>; Mon, 23 May 2022 22:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241166AbiEWSAn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 May 2022 14:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242832AbiEWR7z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 May 2022 13:59:55 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF66E27B05
        for <linux-mips@vger.kernel.org>; Mon, 23 May 2022 10:46:11 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s5so18066639ljd.10
        for <linux-mips@vger.kernel.org>; Mon, 23 May 2022 10:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lt+QmLRlAmSG7nATNb3de1rpq1KDptBx8X9RCMbUflw=;
        b=Rr3FTbZSH6OEOK11OGjw8VhElwCyNuOyvzb6UGiQa0VN2z4nznXexLQevuNvWvmzge
         CTYxbMdQDt/ABY+5MJUs3UQ9cjgZB5HpfDYKoRS1NjSjEXU07Em23YCDUfUVa0uX8nb/
         9z73CqVXPwVsA8Daek73ky1cd2penETPszXb/oyC1JTxYrs3iF1+pny/UHRiTwvpdI8k
         g8tK6SALO5ySpktT2RjFFNN6TQsPT7nll0EKnmQlStwKvKJ60ZHIYNM+jC9XU/fKERYw
         C53AE92+J6jh3ctfSI6kiJseh3KT/sVgJBhffuZkOWwWVE+RPT6LvCRHczR7+R0zJEmT
         JfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lt+QmLRlAmSG7nATNb3de1rpq1KDptBx8X9RCMbUflw=;
        b=T9D2iZbwgNaPQlpSRvW70DWEDRdIqlFEpqRnCH4Mm0cT6J2uReTZBuPPmh/pDSlygI
         QeOnI9TnjXDW98pBAlEYMSfM2mSlf86tQoKJGAM9ZArGCwNmsGRIZWxZWAl1/iEACRB+
         wv7c/ggAS0vhgE9WrNUEsR2Ahlk3Is8hPFfmKe5JoIqK+G3GlIG5Cd5r/Dq016U/hfWN
         DybZURBEyZaApz0x2o/p+jhkeFzVL1oTOrSTNvfpsdojrJkavfrQ/V5xuUEl1gIbI8dz
         Nj6Ht7qxKzxlz105YugTT859d7i1H0VLSO2iJgVKjKUAZqWDl0QRAEy+dhVP+3iB2asp
         VZAw==
X-Gm-Message-State: AOAM531ijizgs65nn1KxA8PFsq/8OCPli4ogJPwYgIUgt4rcW4VwhYPK
        SlORygKUtML9jBx64bU9iVU/SCw9Yarcdzb4+ca99A==
X-Google-Smtp-Source: ABdhPJzDb1QQeQPt37UpqWbTLpFmjnccbcNhzyRtox2/Lhza8BwHrGwgro263+zixdfWhTwF6P7oNs645WQMXX3iLvE=
X-Received: by 2002:a05:651c:b20:b0:253:f4ec:b7d0 with SMTP id
 b32-20020a05651c0b2000b00253f4ecb7d0mr159601ljr.198.1653327872507; Mon, 23
 May 2022 10:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com> <20220516232138.1783324-22-dmatlack@google.com>
 <CAL715WJ5DVM-A8EFND0iQ-MH9nAhE3rvWdYWaEgRTCJEVeegRg@mail.gmail.com> <YovGUDrYZMZ7PXeY@google.com>
In-Reply-To: <YovGUDrYZMZ7PXeY@google.com>
From:   David Matlack <dmatlack@google.com>
Date:   Mon, 23 May 2022 10:44:05 -0700
Message-ID: <CALzav=fUTYGjDuWQxJusH4CzkEwGja-4xAmpqEOZdUfBftYwYw@mail.gmail.com>
Subject: Re: [PATCH v6 21/22] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
To:     Sean Christopherson <seanjc@google.com>
Cc:     Mingwei Zhang <mizhang@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, May 23, 2022 at 10:37 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, May 20, 2022, Mingwei Zhang wrote:
> > On Mon, May 16, 2022 at 4:24 PM David Matlack <dmatlack@google.com> wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index e089db822c12..5e2e75014256 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -369,14 +369,31 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
> > >                 return (void *)__get_free_page(gfp_flags);
> > >  }
> > >
> > > -int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> > > +static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
> > >  {
> > > +       gfp_t gfp = GFP_KERNEL_ACCOUNT;
> > >         void *obj;
> > >
> > >         if (mc->nobjs >= min)
> > >                 return 0;
> > > -       while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
> > > -               obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
> > > +
> > > +       if (unlikely(!mc->objects)) {
> > > +               if (WARN_ON_ONCE(!capacity))
> > > +                       return -EIO;
> > > +
> > > +               mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
> > > +               if (!mc->objects)
> > > +                       return -ENOMEM;
> > > +
> > > +               mc->capacity = capacity;
> >
> > Do we want to ensure the minimum value of the capacity? I think
> > otherwise, we may more likely start using memory from GFP_ATOMIC if
> > the capacity is less than, say 5? But the minimum value seems related
> > to each cache type.
>
> Eh, if we specify a minimum, just make the arch default the minimum.  That way we
> avoid adding even more magic/arbitrary numbers.  E.g. for whatever reason, MIPS's
> default is '4'.

I'm not exactly sure what you had in mind Mingwei. But there is a bug
in this code if min > capacity. This function will happily return 0
after filling up the cache, even though it did not allocate min
objects. The same bug existed before this patch if min >
ARRAY_SIZE(mc->objects). I can include a separate patch to fix this
bug (e.g. WARN and return -ENOMEM if min > capacity).
