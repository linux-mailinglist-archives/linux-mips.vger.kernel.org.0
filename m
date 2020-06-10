Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BF21F5B93
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 20:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgFJS42 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 14:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbgFJS41 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 14:56:27 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA18C08C5C2
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2020 11:56:27 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id n188so844183vkc.11
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2020 11:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7eIpW1TrmjAjBk7KQrsYXoot8/oGn/0TG+dydExJy2w=;
        b=Zt0ORjDTOU4A4Z/iXipnwo1pC3JnqzSsmd5ypTkLOgKENLJmgdAk/ogZdaBrXeKm4G
         kDu+D/hjyT0rpS0gzIsFvo44p5bZGjGsJFvu2tjNW6qm7SZqMENiXuvOqnYibPGwN+1C
         QKQVWcJhGYrCDUOb1ifJ4mL1wa3UBhO4+AcKgl714BEONvkSxYjHpjLEOPxoHRErzeYA
         cDMc97eLeC7E19+RflCNmm/O27QJT802Ym6aPwq4UFRBDd5iSHVrpDJQs1/sfU10UWto
         PO8itFSobsR5+z94ReeJIINHtdccWBoSIRGorciVbvXEgDEpCuRfWrVssLkYdce1lUgI
         xinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7eIpW1TrmjAjBk7KQrsYXoot8/oGn/0TG+dydExJy2w=;
        b=kJrEhLyfB2rZcALNm1Spmk2Yz/Xv8C+at1sMWR1xDrJNqT+ZkHv5108szupnoObPnT
         0l9C7DpYfHgtBPDXPToh0JSUtIXlr8Nlrxy2V59cFcPGAijdpiZ+qpWnVjPHca4HcRNz
         EkVdFblVFjCK5+nPKBddWhKQNr8HBbyPnT8+0N9a0zPVieDGDX/DsSRN/9YmrXU6bbJc
         oZ3qJKuCTFpNQJOjWMNBjlkM17eU8ZA5LkrV1h9a1lTQPjcJA4t+JzvDjw7qB7YqEdF9
         lzQcVPyD97s03uU5+yv+w9/l6O4SeT7NjKaDePN2X25ZUpJX01dRlY3oX4Xyd0jvVJJc
         HoyQ==
X-Gm-Message-State: AOAM531eB7JYUd+h8pH765mN7TQ65Yp/p8nARn/AwaKOTMEapmOq2xru
        fRGdgbncbMc0aOCDHYiK3W6vxUNR9X4BTkAhGWOdtQ==
X-Google-Smtp-Source: ABdhPJzTz3+TLBOLxyJarRjMGjCxCEXEcgNWvchhSDXNpIW/g1/IZl7i88fZ2VTc/j4GkNMODoBhJOAYiSGYjIJjENg=
X-Received: by 2002:a1f:b647:: with SMTP id g68mr2478062vkf.76.1591815385955;
 Wed, 10 Jun 2020 11:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200605213853.14959-1-sean.j.christopherson@intel.com> <20200605213853.14959-14-sean.j.christopherson@intel.com>
In-Reply-To: <20200605213853.14959-14-sean.j.christopherson@intel.com>
From:   Ben Gardon <bgardon@google.com>
Date:   Wed, 10 Jun 2020 11:56:14 -0700
Message-ID: <CANgfPd_YFfE_97W0y2d5dZo1CVgYAc=K3ADDz3azda42P+Ek=A@mail.gmail.com>
Subject: Re: [PATCH 13/21] KVM: x86/mmu: Prepend "kvm_" to memory cache
 helpers that will be global
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Feiner <pfeiner@google.com>,
        Peter Shier <pshier@google.com>,
        Junaid Shahid <junaids@google.com>,
        Christoffer Dall <christoffer.dall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 5, 2020 at 2:39 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> Rename the memory helpers that will soon be moved to common code and be
> made globaly available via linux/kvm_host.h.  "mmu" alone is not a
> sufficient namespace for globally available KVM symbols.
>
> Opportunistically add "nr_" in mmu_memory_cache_free_objects() to make
> it clear the function returns the number of free objects, as opposed to
> freeing existing objects.
>
> Suggested-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Reviewed-by: Ben Gardon <bgardon@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 8d66cf558f1b..b85d3e8e8403 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1071,7 +1071,7 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
>                 return (void *)__get_free_page(gfp_flags);
>  }
>
> -static int mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> +static int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
>  {
>         void *obj;
>
> @@ -1086,12 +1086,12 @@ static int mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
>         return 0;
>  }
>
> -static int mmu_memory_cache_free_objects(struct kvm_mmu_memory_cache *mc)
> +static int kvm_mmu_memory_cache_nr_free_objects(struct kvm_mmu_memory_cache *mc)
>  {
>         return mc->nobjs;
>  }
>
> -static void mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc)
> +static void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc)
>  {
>         while (mc->nobjs) {
>                 if (mc->kmem_cache)
> @@ -1106,33 +1106,33 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
>         int r;
>
>         /* 1 rmap, 1 parent PTE per level, and the prefetched rmaps. */
> -       r = mmu_topup_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache,
> -                                  1 + PT64_ROOT_MAX_LEVEL + PTE_PREFETCH_NUM);
> +       r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache,
> +                                      1 + PT64_ROOT_MAX_LEVEL + PTE_PREFETCH_NUM);
>         if (r)
>                 return r;
> -       r = mmu_topup_memory_cache(&vcpu->arch.mmu_shadow_page_cache,
> -                                  PT64_ROOT_MAX_LEVEL);
> +       r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_shadow_page_cache,
> +                                      PT64_ROOT_MAX_LEVEL);
>         if (r)
>                 return r;
>         if (maybe_indirect) {
> -               r = mmu_topup_memory_cache(&vcpu->arch.mmu_gfn_array_cache,
> -                                          PT64_ROOT_MAX_LEVEL);
> +               r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_gfn_array_cache,
> +                                              PT64_ROOT_MAX_LEVEL);
>                 if (r)
>                         return r;
>         }
> -       return mmu_topup_memory_cache(&vcpu->arch.mmu_page_header_cache,
> -                                     PT64_ROOT_MAX_LEVEL);
> +       return kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_header_cache,
> +                                         PT64_ROOT_MAX_LEVEL);
>  }
>
>  static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
>  {
> -       mmu_free_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache);
> -       mmu_free_memory_cache(&vcpu->arch.mmu_shadow_page_cache);
> -       mmu_free_memory_cache(&vcpu->arch.mmu_gfn_array_cache);
> -       mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
> +       kvm_mmu_free_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache);
> +       kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadow_page_cache);
> +       kvm_mmu_free_memory_cache(&vcpu->arch.mmu_gfn_array_cache);
> +       kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
>  }
>
> -static void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
> +static void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
>  {
>         void *p;
>
> @@ -1146,7 +1146,7 @@ static void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
>
>  static struct pte_list_desc *mmu_alloc_pte_list_desc(struct kvm_vcpu *vcpu)
>  {
> -       return mmu_memory_cache_alloc(&vcpu->arch.mmu_pte_list_desc_cache);
> +       return kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_pte_list_desc_cache);
>  }
>
>  static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
> @@ -1417,7 +1417,7 @@ static bool rmap_can_add(struct kvm_vcpu *vcpu)
>         struct kvm_mmu_memory_cache *mc;
>
>         mc = &vcpu->arch.mmu_pte_list_desc_cache;
> -       return mmu_memory_cache_free_objects(mc);
> +       return kvm_mmu_memory_cache_nr_free_objects(mc);
>  }
>
>  static int rmap_add(struct kvm_vcpu *vcpu, u64 *spte, gfn_t gfn)
> @@ -2104,10 +2104,10 @@ static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, int direct
>  {
>         struct kvm_mmu_page *sp;
>
> -       sp = mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> -       sp->spt = mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> +       sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> +       sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
>         if (!direct)
> -               sp->gfns = mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
> +               sp->gfns = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_gfn_array_cache);
>         set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
>
>         /*
> --
> 2.26.0
>
