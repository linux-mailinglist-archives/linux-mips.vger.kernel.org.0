Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F42521A3B
	for <lists+linux-mips@lfdr.de>; Tue, 10 May 2022 15:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243729AbiEJNy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 May 2022 09:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243744AbiEJNpl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 May 2022 09:45:41 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9442BE7323
        for <linux-mips@vger.kernel.org>; Tue, 10 May 2022 06:31:26 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id x88so4333119pjj.1
        for <linux-mips@vger.kernel.org>; Tue, 10 May 2022 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eAkpZobv3rZ1Hb3Ti+DnJgCEz5o6zS6z0CRMJI9AM3s=;
        b=jBI/IJVRvrcXrn0dmybmF38aVhy0igFdbEZFkPme71/HQ9GvoJ+XAo/584Dy/1j/IA
         eKmiNsg0QRnSUTK2r3JdsiSVecH2pp3BGQdPp8VUZP0AqAKfmpxphSqIYnjeLfeiFQPG
         4Oyh1vHBKMAuToyEeJKAEgJwkwHU1mz4dTg0y1Ydho5V/mtT1ywbMxTJ9EVQ5RngOgK4
         eRanlq+s+j1OL6oL8R7ETXaFshDMsAfkYQ7LzPnxpf6kZ6VCMXr3Kv9r4owShVPjEnc9
         5kAIxQgrPSRtOygh+uwcCxIwjofUsWOOJSGJo5Md3peUgiztJejwvlLNLjWbLn4m1Njx
         nmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eAkpZobv3rZ1Hb3Ti+DnJgCEz5o6zS6z0CRMJI9AM3s=;
        b=GOwesegh3nvJ02ZemcpM/vmPL9BKDLhN49Zgpd1wheHa3Dx+EVHQlpc++XTlY53e7y
         o1SEzV/BkU/ZMtDHPjBSqpMGhkHYLfiZfjff4HcuMrZS1779M+B/6c6Tzevx4O6k4a5k
         UirvhtOWkt4/033pJHt8ONYoehORo6OrZYqrQqWPQbGFauxfKfcVR/bpPe6YwD7tccyS
         Zltwv7HZqJU6FI+ZSYCcboh30AL8N+UIZRyxPw5SSH6xTp99stDrn3+eul4mSvgeAUen
         /C+SIsOUgCSEq0pkgALSCUiIaT+CiKsDAXr9kp/yF1Vz/iAYHnMkSkz3ynaHjl/fNN8r
         KBNw==
X-Gm-Message-State: AOAM531GoMvOL0VNiSXZ7ei64gF4E/52xDhRDqYJGCRTPBP4S3xBt9k9
        MXIOPzuxD/Ch5zoau+JioAXR8w==
X-Google-Smtp-Source: ABdhPJy7im86kJAw08T88EHkeZvOY5JH1GuJc2LoV3L/ahvJpYDIzSXEONMZQ/5L8AsbQATcBcnd/Q==
X-Received: by 2002:a17:902:d4ce:b0:15e:90f8:216c with SMTP id o14-20020a170902d4ce00b0015e90f8216cmr21440392plg.65.1652189485589;
        Tue, 10 May 2022 06:31:25 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902ea4500b0015eddb8e450sm2048059plg.25.2022.05.10.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 06:31:25 -0700 (PDT)
Date:   Tue, 10 May 2022 13:31:21 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     David Matlack <dmatlack@google.com>,
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v4 03/20] KVM: x86/mmu: Derive shadow MMU page role from
 parent
Message-ID: <YnppKY8j78Z1E6bH@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-4-dmatlack@google.com>
 <75fbbcb6-d9bb-3d30-0bf4-fbf925517d09@gmail.com>
 <CALzav=dmseUw6khErkiSV7T5K88QvaRvWvBpvrb6VNOQTE3bQQ@mail.gmail.com>
 <CAJhGHyDQn=atFmn5o2TREW9cSY5Tv1F1vsSekzor6uYQxDgcfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJhGHyDQn=atFmn5o2TREW9cSY5Tv1F1vsSekzor6uYQxDgcfQ@mail.gmail.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 10, 2022, Lai Jiangshan wrote:
> ()
> 
> On Tue, May 10, 2022 at 5:04 AM David Matlack <dmatlack@google.com> wrote:
> >
> > On Sat, May 7, 2022 at 1:28 AM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
> > > > +static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
> > > > +{
> > > > +     struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
> > > > +     union kvm_mmu_page_role role;
> > > > +
> > > > +     role = parent_sp->role;
> > > > +     role.level--;
> > > > +     role.access = access;
> > > > +     role.direct = direct;
> > > > +
> > > > +     /*
> > > > +      * If the guest has 4-byte PTEs then that means it's using 32-bit,
> > > > +      * 2-level, non-PAE paging. KVM shadows such guests using 4 PAE page
> > > > +      * directories, each mapping 1/4 of the guest's linear address space
> > > > +      * (1GiB). The shadow pages for those 4 page directories are
> > > > +      * pre-allocated and assigned a separate quadrant in their role.
> > >
> > >
> > > It is not going to be true in patchset:
> > > [PATCH V2 0/7] KVM: X86/MMU: Use one-off special shadow page for special roots
> > >
> > > https://lore.kernel.org/lkml/20220503150735.32723-1-jiangshanlai@gmail.com/
> > >
> > > The shadow pages for those 4 page directories are also allocated on demand.
> >
> > Ack. I can even just drop this sentence in v5, it's just background information.
> 
> No, if one-off special shadow pages are used.
> 
> kvm_mmu_child_role() should be:
> 
> +       if (role.has_4_byte_gpte) {
> +               if (role.level == PG_LEVEL_4K)
> +                       role.quadrant = (sptep - parent_sp->spt) % 2;
> +               if (role.level == PG_LEVEL_2M)

If the code ends up looking anything like this, please use PT32_ROOT_LEVEL instead
of PG_LEVEL_2M.  PSE paging has 4M huge pages, using PG_LEVEL_2M is confusing.

Or even better might be to do:

		if (role.level == PG_LEVEL_4k)
			...
		else
			...

Or arithmetic using role.level directly, a la the current code.
