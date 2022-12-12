Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B3864A9EA
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiLLWDu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233690AbiLLWDi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:03:38 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF0C1ADA8
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:03:33 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id x18so5757685qki.4
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H8tNx4JMG+gKP0BZeEF6ikCYeMz41r++QkWX8vYlQZM=;
        b=fxTE10OGf3TVyQxMLoDuqEMEvCKCuX6oKKQscuWuJW8s4G4XvLTdmuezqay8Mg9JYm
         SjIqhlKCJR0Ww+iau0nkyCwnH23sgTOWqnOZvVoQPS4gyvJllvkixGnDaHuYM4MSpPUH
         vlJ5QwL4fXZJkiYDMnhBNhlnIqrbtZ9SwiH8+UXOIFOatiUaZvTURGeq3eeSOKyLuZAK
         He3GLK1W5lEJMqftamCtWkFaxkazZNUe3RGAfK7LbqQH1pwQ3zt3YGHNkoXzME6bNoHB
         S2ESaoEY+DI1mjVH8CgA7w+zhvFCLohTewNQOniHfIQ5HYoZ0uBPJGaY1xD8goR0I/Fi
         l7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8tNx4JMG+gKP0BZeEF6ikCYeMz41r++QkWX8vYlQZM=;
        b=6X6Fu1Yoms3AxWTOLxbIsRAsTf9NdsXst3wn30JF1rsArXqvuYTcciUVc/bZebewRR
         hhYRCfMIFItjjZo1E5A2eahVMjPCNv2B5X4EmhiuI4HmbWaCpneqLrUGKb3U5Jse+OSZ
         xEUuxgkfOcAZW2eDsgMqxuy4bric3S16DVmsiRWOyKAN0GtoNlrhn1PONHbxLbWHE1pI
         ObidCmVXgy0GCQt69//dZUhGfKPNZSFdx8eoKoXgapZvJHugdIJdoFYD4POo9LdMMp0K
         Yu3X6PUPsJ3TQom1dyXMe/kwoQH/2QlmEtpZqOH13Wr9IILbbtmMjAftmx6Y3qn29WiJ
         Facw==
X-Gm-Message-State: ANoB5pn/0MYmmF0pLoKt4PI4cVGyELWBWLrdW6qJia8CY7U7ZJ5jgE8Z
        YcGHvi7ux37qxRXDbdvlwEuVeoMdY/jnhZq40Hd/2A==
X-Google-Smtp-Source: AA0mqf6Lfo5iFMd62emQsE/GPr8MrnqXMWIYcSRSfcv9BTwdZvHpZDZvH+CRfINtutrDx+tvKeU8pqz46nZZZu5exoY=
X-Received: by 2002:a37:808:0:b0:6fe:d95e:3cae with SMTP id
 8-20020a370808000000b006fed95e3caemr8457916qki.768.1670882612067; Mon, 12 Dec
 2022 14:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-34-dmatlack@google.com>
In-Reply-To: <20221208193857.4090582-34-dmatlack@google.com>
From:   Ben Gardon <bgardon@google.com>
Date:   Mon, 12 Dec 2022 14:03:20 -0800
Message-ID: <CANgfPd_069QPNby+mR4GuOWDNJtFk_=9EOffb0=2_V5TH-ZCDA@mail.gmail.com>
Subject: Re: [RFC PATCH 33/37] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 8, 2022 at 11:40 AM David Matlack <dmatlack@google.com> wrote:
>
> Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> range-based TLB invalidation where the range is defined by the memslot.
> Now that kvm_flush_remote_tlbs_range() can be called from common code we
> can just use that and drop a bunch of duplicate code from the arch
> directories.
>
> Note this adds a lockdep assertion for slot_lock being held when calling
> kvm_flush_remote_tlbs_memslot(), which was previously only asserted on
> x86.

Besides the one lockdep assertion, is there any benefit to having this
wrapper function? Open-coding "kvm_flush_remote_tlbs_range(kvm,
memslot->base_gfn, memslot->npages);" is only a slightly longer line
and, IMO, just as readable. I'm happy to see this cleanup, but it
might be just as easy to drop the function.

>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/arm64/kvm/arm.c     |  6 ------
>  arch/mips/kvm/mips.c     | 10 ++--------
>  arch/riscv/kvm/mmu.c     |  6 ------
>  arch/x86/kvm/mmu/mmu.c   | 16 +---------------
>  arch/x86/kvm/x86.c       |  2 +-
>  include/linux/kvm_host.h |  7 +++----
>  virt/kvm/kvm_main.c      | 17 +++++++++++++++--
>  7 files changed, 22 insertions(+), 42 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 0e0d4c4f79a2..4f1549c1d2d2 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1430,12 +1430,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       kvm_flush_remote_tlbs(kvm);
> -}
> -
>  static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
>                                         struct kvm_arm_device_addr *dev_addr)
>  {
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..ecd8a051fd6b 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -209,7 +209,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>         /* Flush slot from GPA */
>         kvm_mips_flush_gpa_pt(kvm, slot->base_gfn,
>                               slot->base_gfn + slot->npages - 1);
> -       kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> +       kvm_flush_remote_tlbs_memslot(kvm, slot);
>         spin_unlock(&kvm->mmu_lock);
>  }
>
> @@ -245,7 +245,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>                 needs_flush = kvm_mips_mkclean_gpa_pt(kvm, new->base_gfn,
>                                         new->base_gfn + new->npages - 1);
>                 if (needs_flush)
> -                       kvm_arch_flush_remote_tlbs_memslot(kvm, new);
> +                       kvm_flush_remote_tlbs_memslot(kvm, new);
>                 spin_unlock(&kvm->mmu_lock);
>         }
>  }
> @@ -997,12 +997,6 @@ int kvm_arch_flush_remote_tlb(struct kvm *kvm)
>         return 1;
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       kvm_flush_remote_tlbs(kvm);
> -}
> -
>  long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>         long r;
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index a8281a65cb3d..98bf3719a396 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -406,12 +406,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       kvm_flush_remote_tlbs(kvm);
> -}
> -
>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free)
>  {
>  }
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 19963ed83484..f2602ee1771f 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6524,7 +6524,7 @@ static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
>          */
>         if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
>                               PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1, true))
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> +               kvm_flush_remote_tlbs_memslot(kvm, slot);
>  }
>
>  void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
> @@ -6543,20 +6543,6 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
>         }
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       /*
> -        * All current use cases for flushing the TLBs for a specific memslot
> -        * related to dirty logging, and many do the TLB flush out of mmu_lock.
> -        * The interaction between the various operations on memslot must be
> -        * serialized by slots_locks to ensure the TLB flush from one operation
> -        * is observed by any other operation on the same memslot.
> -        */
> -       lockdep_assert_held(&kvm->slots_lock);
> -       kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
> -}
> -
>  void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
>                                    const struct kvm_memory_slot *memslot)
>  {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 517c8ed33542..95ff95da55d5 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12574,7 +12574,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
>                  * See is_writable_pte() for more details (the case involving
>                  * access-tracked SPTEs is particularly relevant).
>                  */
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, new);
> +               kvm_flush_remote_tlbs_memslot(kvm, new);
>         }
>  }
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d9a7f559d2c5..46ed0ef4fb79 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1366,6 +1366,8 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
>
>  void kvm_flush_remote_tlbs(struct kvm *kvm);
>  void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
> +void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
> +                                  const struct kvm_memory_slot *memslot);
>
>  #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
>  int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
> @@ -1394,10 +1396,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>                                         unsigned long mask);
>  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot);
>
> -#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot);
> -#else /* !CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
> +#ifndef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
>  int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log);
>  int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
>                       int *is_dirty, struct kvm_memory_slot **memslot);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 662ca280c0cf..39c2efd15504 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -388,6 +388,19 @@ void __weak kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pa
>         kvm_flush_remote_tlbs(kvm);
>  }
>
> +void kvm_flush_remote_tlbs_memslot(struct kvm *kvm, const struct kvm_memory_slot *memslot)
> +{
> +       /*
> +        * All current use cases for flushing the TLBs for a specific memslot
> +        * related to dirty logging, and many do the TLB flush out of mmu_lock.
> +        * The interaction between the various operations on memslot must be
> +        * serialized by slots_locks to ensure the TLB flush from one operation
> +        * is observed by any other operation on the same memslot.
> +        */
> +       lockdep_assert_held(&kvm->slots_lock);
> +       kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
> +}
> +
>  static void kvm_flush_shadow_all(struct kvm *kvm)
>  {
>         kvm_arch_flush_shadow_all(kvm);
> @@ -2197,7 +2210,7 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
>         }
>
>         if (flush)
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
> +               kvm_flush_remote_tlbs_memslot(kvm, memslot);
>
>         if (copy_to_user(log->dirty_bitmap, dirty_bitmap_buffer, n))
>                 return -EFAULT;
> @@ -2314,7 +2327,7 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
>         KVM_MMU_UNLOCK(kvm);
>
>         if (flush)
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
> +               kvm_flush_remote_tlbs_memslot(kvm, memslot);
>
>         return 0;
>  }
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>
