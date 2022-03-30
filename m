Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A454EC682
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 16:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245102AbiC3OaD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 10:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiC3OaC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 10:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CBD7E1C16C6
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648650494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0MdzdhvbcfTH7B0x9nhddVD3XG1EagzEGRM2HvvMoaM=;
        b=eH2T2cZaoD8Fq5sAoZ2OHcCnwRk438rwFvx+rElxE0GBbbr04iIh9BgAFEklvG4cLJP4R+
        65GJ1N7uYxMYZ9Neray14V/GZz0mVUHRfHrtQR6Sr2npvGSRv2Z+1r1KHLrWx+FETL+7B/
        5PC+uRadFqIZC/6XxpnqndQZCGX7I90=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-k56nrDVeP-qAj-lsxK2X7A-1; Wed, 30 Mar 2022 10:28:13 -0400
X-MC-Unique: k56nrDVeP-qAj-lsxK2X7A-1
Received: by mail-qk1-f197.google.com with SMTP id m23-20020a05620a221700b006809e1fa4fdso11259250qkh.6
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 07:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0MdzdhvbcfTH7B0x9nhddVD3XG1EagzEGRM2HvvMoaM=;
        b=HH7Yc4VSPGxvLLS2JN5J/noWNsSqYpKK/alDhxX/RaoKqr9f9Z6woTVe6rUXFVi4Qx
         FCXz+oFmQXI62j40SJQwcrqvkb31PUmQd3Dzok1cYuARZL34t46cKVODSIUGF5wA6Bm6
         qLsk4txAcKjgR26JwDXQ8m1x35NQt/9IEE9lGWqE1+F2HUgRvc7CgUCmTvtMLYBuZDRy
         5G/xoIwftwH9NBNr5oUmjOu7FBa+E75JFTEHCZ5Vdf27Cc4V6EvYfSbesYZjjpzFwswE
         X2rQEHDtWEEv1KP87nX7YqFuQVr/fMGuK9g7wEeRa3A5jvdB8lFIPk4YjQtE3hNPA2C8
         Es9w==
X-Gm-Message-State: AOAM532uJ7hNG7+Ak5/7FRq8RL2o2dh6kNM/fM/nl7hPvH936DHJjZpP
        dzTbPlb6UQa7+1QHxOyMpXd01NFffcaujiS0ud28j73TFTA6mrNhNiCQ+5QjJ32oxnG6ejTsok8
        SQY9y4KU/Udi5UmltvoY62A==
X-Received: by 2002:ac8:580d:0:b0:2e1:c641:8c21 with SMTP id g13-20020ac8580d000000b002e1c6418c21mr32693441qtg.677.1648650492834;
        Wed, 30 Mar 2022 07:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj9mfWzYsrvAU4I7K8iuYgWUFquDhfKr86ywKhvihB398kljxjsCy0kviStlHnrVX/SZQbLA==
X-Received: by 2002:ac8:580d:0:b0:2e1:c641:8c21 with SMTP id g13-20020ac8580d000000b002e1c6418c21mr32693412qtg.677.1648650492602;
        Wed, 30 Mar 2022 07:28:12 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id d12-20020a05620a158c00b00648ec3fcbdfsm10572195qkk.72.2022.03.30.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 07:28:12 -0700 (PDT)
Date:   Wed, 30 Mar 2022 10:28:10 -0400
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
Subject: Re: [PATCH v2 05/26] KVM: x86/mmu: Rename shadow MMU functions that
 deal with shadow pages
Message-ID: <YkRo+rJwYJoOmXmW@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-6-dmatlack@google.com>
 <YjBTtz6wo/zQEHCv@xz-m1.local>
 <CALzav=c0ccztDULiVMwR4K20iYc0WH53ApeOCorhjKwaMNL5Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALzav=c0ccztDULiVMwR4K20iYc0WH53ApeOCorhjKwaMNL5Sg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 22, 2022 at 02:35:25PM -0700, David Matlack wrote:
> On Tue, Mar 15, 2022 at 1:52 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Mar 11, 2022 at 12:25:07AM +0000, David Matlack wrote:
> > > Rename 3 functions:
> > >
> > >   kvm_mmu_get_page()   -> kvm_mmu_get_shadow_page()
> > >   kvm_mmu_alloc_page() -> kvm_mmu_alloc_shadow_page()
> > >   kvm_mmu_free_page()  -> kvm_mmu_free_shadow_page()
> > >
> > > This change makes it clear that these functions deal with shadow pages
> > > rather than struct pages. Prefer "shadow_page" over the shorter "sp"
> > > since these are core routines.
> > >
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> >
> > Acked-by: Peter Xu <peterx@redhat.com>
> 
> What's the reason to use Acked-by for this patch but Reviewed-by for others?

A weak version of r-b?  I normally don't do the rename when necessary (and
I'm pretty poor at naming..), in this case I don't have a strong opinion.
I should have left nothing then it's less confusing. :)

-- 
Peter Xu

