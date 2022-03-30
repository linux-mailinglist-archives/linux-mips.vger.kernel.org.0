Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBA34ECC5D
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 20:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350445AbiC3SiT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 14:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352834AbiC3SgN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 14:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99DDC546BF
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 11:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648665265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BO423QJpHjYuJkP0ZfVrkV5p4JcZ6+8e4Hhk2wmOLQ4=;
        b=irXBaQGlWjn8xxvUtHFR1Nx1ZqBp5AO3u9OgTUkkmW7UeQgaMNZvhYdHcAve+QWmVTpugk
        VLgpjhD1JgBNdSAK+Qc35RNbnZIVQaKO/CUa5P4MAKYXu2fZQvqA+qbr8fQfKE8yhyRW6j
        sk6YS/Yx0A7PNpOmsmU262X30YSsuuw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-8D0b8JwbPMGSHveZUR0DqA-1; Wed, 30 Mar 2022 14:34:24 -0400
X-MC-Unique: 8D0b8JwbPMGSHveZUR0DqA-1
Received: by mail-qt1-f199.google.com with SMTP id t26-20020ac8739a000000b002e06aa03d4cso18052820qtp.13
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 11:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BO423QJpHjYuJkP0ZfVrkV5p4JcZ6+8e4Hhk2wmOLQ4=;
        b=IxHo3ZnZ8bOphu7ku9I+xi8TgsXe3PIjm8xkqyfNL+FhahS+mxBLlaPbQDDOa+VSXJ
         xYCJo9AdQVHYGi7cMrfOHDHwSXIQYOX9NSc8GMmwtlMFyd9RUT4VTbrBVZ9h3DPUasmo
         ww3aUfuC01buzn8fWwKV4wWfnpV+YvRIGPvHgQbKe9eV22mFjpuNPMnbxdICzrOlUK4s
         sgUwXBS3Fte5a2sRh5PxzZphY1eb+ud+xL+VjTIPisQyvb2DNCKpUcPviiVl8810RMcX
         GJjvXa+SuYc88KGv5ZMvVtPjz/k8CUQl01Ku5tAMVeren408NdYH3o1Jen+8mHrZllcv
         iiHw==
X-Gm-Message-State: AOAM532vUiAgzyKQq9j1M6b32qmGmISrDtxwG00f8ZsuIPexSvW/EHDi
        uzxkHsCzaIIxfmbpsidBBAANS6g2ex9+v6zz4HRcmAE15RitHhJR1zSCOMXLkRKoa+s9NCFdx8z
        XfMP4OBih273u8jNqvhZtfQ==
X-Received: by 2002:a05:6214:52:b0:440:f824:a7f3 with SMTP id c18-20020a056214005200b00440f824a7f3mr680784qvr.125.1648665263568;
        Wed, 30 Mar 2022 11:34:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpEYagEUKrFreUNZJWPbgOd2iyA4mWjJAcuNj/S06/ZmWXmhH8bpHqRFw8Cg5TxB9Aa+BVhQ==
X-Received: by 2002:a05:6214:52:b0:440:f824:a7f3 with SMTP id c18-20020a056214005200b00440f824a7f3mr680755qvr.125.1648665263302;
        Wed, 30 Mar 2022 11:34:23 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id m14-20020a05622a054e00b002e2072cffe6sm17042300qtx.5.2022.03.30.11.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 11:34:23 -0700 (PDT)
Date:   Wed, 30 Mar 2022 14:34:21 -0400
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
Subject: Re: [PATCH v2 20/26] KVM: x86/mmu: Extend Eager Page Splitting to
 the shadow MMU
Message-ID: <YkSirYT6s8YtUr4w@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-21-dmatlack@google.com>
 <YjG7Zh4zwTDsO3L1@xz-m1.local>
 <CALzav=fRFzbGEVhdMSwhX1Gs1++DGW6MOWvKzeQ-RTtLsus=SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALzav=fRFzbGEVhdMSwhX1Gs1++DGW6MOWvKzeQ-RTtLsus=SQ@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 22, 2022 at 04:58:08PM -0700, David Matlack wrote:
> > > +static int prepare_to_split_huge_page(struct kvm *kvm,
> > > +                                   const struct kvm_memory_slot *slot,
> > > +                                   u64 *huge_sptep,
> > > +                                   struct kvm_mmu_page **spp,
> > > +                                   bool *flush,
> > > +                                   bool *dropped_lock)
> > > +{
> > > +     int r = 0;
> > > +
> > > +     *dropped_lock = false;
> > > +
> > > +     if (kvm_mmu_available_pages(kvm) <= KVM_MIN_FREE_MMU_PAGES)
> > > +             return -ENOSPC;
> > > +
> > > +     if (need_resched() || rwlock_needbreak(&kvm->mmu_lock))
> > > +             goto drop_lock;
> > > +
> >
> > Not immediately clear on whether there'll be case that *spp is set within
> > the current function.  Some sanity check might be nice?
> 
> Sorry I'm not sure what you mean here. What kind of sanity check did
> you have in mind?

Something like "WARN_ON_ONCE(*spp);"?

> 
> >
> > > +     *spp = kvm_mmu_alloc_direct_sp_for_split(true);
> > > +     if (r)
> > > +             goto drop_lock;
> > > +
> > > +     return 0;

Thanks,

-- 
Peter Xu

