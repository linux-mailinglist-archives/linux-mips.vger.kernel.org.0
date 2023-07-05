Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994BF748B55
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jul 2023 20:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbjGESQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jul 2023 14:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjGESQp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Jul 2023 14:16:45 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7DA19B7
        for <linux-mips@vger.kernel.org>; Wed,  5 Jul 2023 11:16:41 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-401d1d967beso40781cf.0
        for <linux-mips@vger.kernel.org>; Wed, 05 Jul 2023 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688581001; x=1691173001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvseMdfzClF+MPNM/24H781NReITore/0VUmVpYyoUI=;
        b=YWn97/s+haYpnp7JM+lGOqIaNf1PHwHvanWwXP5CzbQa54oQzmrrJ6pXKQLH70ScqZ
         XFCwZ3h5UHPxricAGZ2foWVdgVgoV6BBv5ej1kFNni9LdW3zYm3qgQvEAdRDjQmEjVjB
         dwFy1Uvg5lnQ43M+TrFK5GmoOfRMxtfSxKclahwYbfGOknv7o8JMJlFKmVWlIRyDa6mu
         4769/B5RKe48KrQNEp4lhvtgT30p4ccTsAXVDW5mJnn+YSIzwTIEvZOSi+Pt3tTE+VAC
         rG/SauxRcXhO+WXk48N4URBWOV9AuSLqH+NNRUU2MTMib2QLGh0MIiiCygQe/UDP+3sN
         nVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581001; x=1691173001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvseMdfzClF+MPNM/24H781NReITore/0VUmVpYyoUI=;
        b=XYgq7p9CPQJ0tVa1ixU3PVNgd7CLyqQamjNRDDKYPuuBf20c8YcdsNZRmlbfyvvaHt
         xk8Vfw3X5H70LYddfcNznylwOJSCwCEKf+yhQAv0tNhQgOqLGWa4DBdXYZub/3nOdnK6
         AWMWgXuD1zrwNpWPbtxuqUe00t3fj+77agPsfIhFFt2AWaZE25zESDFct2iluEPJU2vB
         KVWbQZjxxZd1HzY3GcemBHtFbwn7l6aj5+sE0l6z9sqt24m3E6VlsqDwKSXAaGSytaOB
         AyVPf2z6aXABZiuouXlL+fdSassvkzCpTrqdJbZovLes8AOGHfbwmpE8q/eqPto1Ntx0
         ftFA==
X-Gm-Message-State: ABy/qLZKiWuqCV5oTxGXdtye3zdFmGRUt9+gZ9/a+u4Ku3UUMeKAMN8E
        07e9DnUu57AGSbBeE8AdQ/rbTgtcq3m0rsHt+o9ALQ==
X-Google-Smtp-Source: APBJJlHHPAHCADMGOtpqExEIHo4pAuoVXPYM60W1cKm1ySWlgGvmriHeyHCfDzchsTSnbmqE7IlXLycziclYclkRLGM=
X-Received: by 2002:ac8:5ac7:0:b0:3f0:af20:1a37 with SMTP id
 d7-20020ac85ac7000000b003f0af201a37mr13421qtd.15.1688581000623; Wed, 05 Jul
 2023 11:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com> <20230621175002.2832640-3-rananta@google.com>
 <0bdc3105-fc3d-d0e1-60e7-d626171e1057@redhat.com>
In-Reply-To: <0bdc3105-fc3d-d0e1-60e7-d626171e1057@redhat.com>
From:   Raghavendra Rao Ananta <rananta@google.com>
Date:   Wed, 5 Jul 2023 11:16:29 -0700
Message-ID: <CAJHc60yZEbmbak=5kfFd4v60dtk3k0JHbXKh3nCSB3VjFShGUQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To:     Gavin Shan <gshan@redhat.com>
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
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Zenghui Yu <zenghui.yu@linux.dev>
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

On Tue, Jul 4, 2023 at 4:38=E2=80=AFPM Gavin Shan <gshan@redhat.com> wrote:
>
> On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> > From: David Matlack <dmatlack@google.com>
> >
> > Use kvm_arch_flush_remote_tlbs() instead of
> > CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> > problem, allowing architecture-specific code to provide a non-IPI
> > implementation of remote TLB flushing.
> >
> > Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> > all architectures on kvm_arch_flush_remote_tlbs() instead of maintainin=
g
> > two mechanisms.
> >
> > Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> >
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> >
> > No functional change intended.
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> It's not true and please refer to the below explanation.
>
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
> > Acked-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 3 +++
> >   arch/arm64/kvm/Kconfig            | 1 -
> >   arch/arm64/kvm/mmu.c              | 6 +++---
> >   virt/kvm/Kconfig                  | 3 ---
> >   virt/kvm/kvm_main.c               | 2 --
> >   5 files changed, 6 insertions(+), 9 deletions(-)
> >
>
> The changes make sense and look good to me. However, there is a functiona=
l change because
> the generic kvm_arch_flush_remote_tlbs() isn't exactly same to ARM64's va=
riant. Strictly
> speaking, they're not interchangeable. In the generic function, both stat=
istics (
> remote_tlb_flush_requests and remote_tlb_flush) are increased. Only the f=
ormer statistic
> is increased in ARM64's variant.
>
> It looks correct to increase both statistics, but the commit log may need=
 tweak to reflect
> it. With this resolved:
Good catch! I agree, there's a slight functional change here and I'll
adjust the commit message in my next revision.

Thank you.
Raghavendra

> Reviewed-by: Gavin Shan <gshan@redhat.com>
>
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm=
/kvm_host.h
> > index 7e7e19ef6993e..81ab41b84f436 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1078,6 +1078,9 @@ int __init kvm_set_ipa_limit(void);
> >   #define __KVM_HAVE_ARCH_VM_ALLOC
> >   struct kvm *kvm_arch_alloc_vm(void);
> >
> > +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> > +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
> > +
> >   static inline bool kvm_vm_is_protected(struct kvm *kvm)
> >   {
> >       return false;
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index f531da6b362e9..6b730fcfee379 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -25,7 +25,6 @@ menuconfig KVM
> >       select MMU_NOTIFIER
> >       select PREEMPT_NOTIFIERS
> >       select HAVE_KVM_CPU_RELAX_INTERCEPT
> > -     select HAVE_KVM_ARCH_TLB_FLUSH_ALL
> >       select KVM_MMIO
> >       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >       select KVM_XFER_TO_GUEST_WORK
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 3b9d4d24c361a..d0a0d3dca9316 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -81,15 +81,15 @@ static bool memslot_is_logging(struct kvm_memory_sl=
ot *memslot)
> >   }
> >
> >   /**
> > - * kvm_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> > + * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> >    * @kvm:    pointer to kvm structure.
> >    *
> >    * Interface to HYP function to flush all VM TLB entries
> >    */
> > -void kvm_flush_remote_tlbs(struct kvm *kvm)
> > +int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> >   {
> > -     ++kvm->stat.generic.remote_tlb_flush_requests;
> >       kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> > +     return 0;
> >   }
> >
> >   static bool kvm_is_device_pfn(unsigned long pfn)
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index b74916de5183a..484d0873061ca 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
> >   config KVM_VFIO
> >          bool
> >
> > -config HAVE_KVM_ARCH_TLB_FLUSH_ALL
> > -       bool
> > -
> >   config HAVE_KVM_INVALID_WAKEUPS
> >          bool
> >
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index a475ff9ef156d..600a985b86215 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -350,7 +350,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, uns=
igned int req)
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
> >
> > -#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
> >   void kvm_flush_remote_tlbs(struct kvm *kvm)
> >   {
> >       ++kvm->stat.generic.remote_tlb_flush_requests;
> > @@ -371,7 +370,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
> >               ++kvm->stat.generic.remote_tlb_flush;
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
> > -#endif
> >
> >   static void kvm_flush_shadow_all(struct kvm *kvm)
> >   {
>
