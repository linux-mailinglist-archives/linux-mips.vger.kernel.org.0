Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47CC7A4DE8
	for <lists+linux-mips@lfdr.de>; Mon, 18 Sep 2023 18:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjIRQDh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Sep 2023 12:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjIRQDg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 Sep 2023 12:03:36 -0400
Received: from mail-oo1-xc49.google.com (mail-oo1-xc49.google.com [IPv6:2607:f8b0:4864:20::c49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AD1468F
        for <linux-mips@vger.kernel.org>; Mon, 18 Sep 2023 09:01:36 -0700 (PDT)
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-57332cb9adfso6337688eaf.0
        for <linux-mips@vger.kernel.org>; Mon, 18 Sep 2023 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695052640; x=1695657440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNXD76U7haNeW91VMZlpdLB8TVqFEiovhx95zes76gg=;
        b=RRXggicHTzfdwEWCphG/MJTsC/CIPnhJhlwTDAfnVT+tK3AGV3znmWyWptu9nZPF0x
         KPjT1UsVcrH17v7AeL0Kzd88HYaFIseUuWvMJGBbpsxpHlJbYdcZTPtro9wKCjRp5fdw
         2qyxlHWaP3S4uLkjDg8Mxk8gH/YE+GS0xudUW4pJPeSx9+x5ipux2aG2g6hzKl6dYU28
         Eqz9HUvi032kzZCZ3CJ5jo4dMLDajHN4r3WGA8sLgbfMh3QmcKA+UE7EhmgFOY2KLfbA
         Bldq998Vb6/HcGS1M6+Oa8z1FQndcHQkqCMcg1OB2ZlOpfX6RlZdD3JVVbHdTv17l72v
         phAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052640; x=1695657440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNXD76U7haNeW91VMZlpdLB8TVqFEiovhx95zes76gg=;
        b=DB/3HPIGLtgeBfFQl0sspCYJNqUr6OkXRq4eL3j/w4EnpT3l3g1d6Dvfxx/emXy4Dm
         Sv4faYSvmzPBLSuVbsZF/TujJ4QcOv5PDHhjwe1SMCM395/+FpB3erPRypoQ9nU7wYdg
         87EIkqVJWAETb9dEmlyV1GEILBUjSypIik9zYl3WheVnTp5aCeZudLCm5ceY37c8kAM3
         L32nDAgdGh2oR4P4y8+rZ1YKtfo+6h1wgaG67i002FXNkiBRI7xzAg2GDz6/44WYKIyU
         pgWNK/oKZvTKmGpleC8ZsQsJO+/Z/WTDvP5fk3AMklyWIDD47D5vtii4m2nhjzEMKaa6
         XZXg==
X-Gm-Message-State: AOJu0Ywj1tyOr7zHMm2XV5YngeVsL4Wj/7wtMtAntmVZykUjxl6Z4s1j
        sCkxJ5iY+yYz5pwpndE/6LhzrF8Bmes=
X-Google-Smtp-Source: AGHT+IE1DPoRp0N2nDleDeL+nMknRqhKzdJCPwHMJrwMUBjkYLBNjcfJz91+ASKxJdGzFGGlGgloaP/fXoU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2411:0:b0:d81:78ec:c403 with SMTP id
 k17-20020a252411000000b00d8178ecc403mr192905ybk.12.1695052199184; Mon, 18 Sep
 2023 08:49:59 -0700 (PDT)
Date:   Mon, 18 Sep 2023 08:49:57 -0700
In-Reply-To: <20230918152110.GI13795@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca>
Message-ID: <ZQhxpesyXeG+qbS6@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
From:   Sean Christopherson <seanjc@google.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > KVM and VFIO do symbol lookups increases the overall complexity and places
> > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  drivers/vfio/vfio.h      |  2 ++
> >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> >  include/linux/vfio.h     |  4 ++-
> >  virt/kvm/vfio.c          |  9 +++--
> >  4 files changed, 47 insertions(+), 42 deletions(-)
> 
> I don't mind this, but Christoph had disliked my prior attempt to do
> this with function pointers..
> 
> The get can be inlined, IIRC, what about putting a pointer to the put
> inside the kvm struct?

That wouldn't allow us to achieve our goal, which is to hide the details of
"struct kvm" from VFIO (and the rest of the kernel).

What's the objection to handing VFIO a function pointer?

> The the normal kvm get/put don't have to exported symbols at all?

The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).

Gah, KVMGT doesn't actually need to call get/put, that can be handled by
kvm_page_track_register_notifier().

I am planning on making exports for sub-modules conditional on there actually
being submodules, so that's 2 of the 3 gone, but tackling the s390 crypto driver
is an entirely different story.
