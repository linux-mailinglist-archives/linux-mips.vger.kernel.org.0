Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB2A277D88
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 03:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgIYBQv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 21:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgIYBQu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 21:16:50 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9413C0613CE
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 18:16:50 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id y9so836635ilq.2
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 18:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ns6EfoJFmlckygboGDS5ISEczvmUEd8piIBG60/RPnA=;
        b=tYrMTFS8xQB2lckV846BmkoCO0Cv972MONPP7RLSo64J77ZlOuk0+OkFNT2IwvIXDI
         CHh6OhEFVncCkxDX5eEoniqtKtLz2VfBhYpyiBjNuFS9EhJLghRXxtcn//5XzJ0bHStW
         bJr98zDdXaG5IFEDTS0YnJe5YMcsapOUPT1/xfiRh3qZEni0jIDAJSZJsbUjCkAl6Ln+
         KJS6usmsE4V8MgGnBTIxgJaM7oBBPXAnh5P7KpmT2VR1n1Z/RpAh/EW4HVdOUh0+QnZ+
         S3hWg9ON6jVsfXW910hfC1sOB9Pqvcsw/WqjvOq6heaKBdqFniAEAsEaRL9CUeTnIH4x
         JHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ns6EfoJFmlckygboGDS5ISEczvmUEd8piIBG60/RPnA=;
        b=RtQaYeKVc/1MwerFSE3bqHCL1BdDeuFwz2VnYmXzW5uWduPps4ToZW1tvLkQXnel7C
         l7owrDUtKSI14vYBfPGsD6/yNdWmxWbhXs7x7SYWMo8bMwATRcHSMikXdoDc4YXCJRK6
         BDtO+E5UsPyslr36QZDp+Paoj6wtqEoJRqvdSLAhO2VOOlqzVauo/WwGmYjTy7/z5RpN
         0Ukzj/3EOwLz7E8RA2I7lJPAv5Rd/arCANV+1dAB4+u/+howMiWFwVAPVN16u/0lDjYi
         dy0AF9rLkt+swkvCGiJGtlvpX5CliH+gON6RIUqdTv5Gcmofn6Vp8GIB1AZHicSBrqSg
         dU7g==
X-Gm-Message-State: AOAM532Pu28r/0h3+qkxy/KQMy+re/FeRyJikoG/XN3FYnqC1UI7hjog
        TvFt4eTKD8WhJFWthdz4fI8n6Ti1RF1XPriJ+AQ/3aaNlEg=
X-Google-Smtp-Source: ABdhPJwgiTJ9dsE2n0/+9L38xoHFTLlQGRdoirOef2P6ht4uRab4cVV+a0GIMJC5iO9rOkCkF+Hvj63vn0v+hxGKDS8=
X-Received: by 2002:a92:a194:: with SMTP id b20mr1192868ill.287.1600996610043;
 Thu, 24 Sep 2020 18:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Fri, 25 Sep 2020 09:16:16 +0800
Message-ID: <CAAhV-H56F2zC35+Gr7X5wu0DQ2PotiB__5L9ZXqvEhKC3kBiww@mail.gmail.com>
Subject: Re: [PATCH 1/3] mips/mm: Add NUMA balancing support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CC linux-mm.

On Fri, Jul 31, 2020 at 6:10 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> NUMA balancing is available on nearly all architectures, but MIPS lacks
> it for a long time. In theory, the current NUMA balancing framework only
> need a "PROTNONE" page table bit and some APIs to manipulate it. So, it
> is time for us to add MIPS's NUMA balancing support (Only for 64bit now
> because NUMA balancing depends on huge page implicitly).
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/Kconfig                    |  1 +
>  arch/mips/include/asm/pgtable-64.h   |  2 +-
>  arch/mips/include/asm/pgtable-bits.h | 17 +++++++++++++++++
>  arch/mips/include/asm/pgtable.h      | 18 +++++++++++++++---
>  4 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 499a20d..62d2b95 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -9,6 +9,7 @@ config MIPS
>         select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_HAS_UBSAN_SANITIZE_ALL
> +       select ARCH_SUPPORTS_NUMA_BALANCING if 64BIT
>         select ARCH_SUPPORTS_UPROBES
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
> index 1e7d6ce..2aef74b 100644
> --- a/arch/mips/include/asm/pgtable-64.h
> +++ b/arch/mips/include/asm/pgtable-64.h
> @@ -266,7 +266,7 @@ static inline int pmd_present(pmd_t pmd)
>  {
>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
>         if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
> -               return pmd_val(pmd) & _PAGE_PRESENT;
> +               return pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE);
>  #endif
>
>         return pmd_val(pmd) != (unsigned long) invalid_pte_table;
> diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
> index e26dc41..f697c32 100644
> --- a/arch/mips/include/asm/pgtable-bits.h
> +++ b/arch/mips/include/asm/pgtable-bits.h
> @@ -52,6 +52,9 @@ enum pgtable_bits {
>         _PAGE_WRITE_SHIFT,
>         _PAGE_ACCESSED_SHIFT,
>         _PAGE_MODIFIED_SHIFT,
> +#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
> +       _PAGE_PROTNONE_SHIFT,
> +#endif
>  #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
>         _PAGE_SPECIAL_SHIFT,
>  #endif
> @@ -84,6 +87,9 @@ enum pgtable_bits {
>         _PAGE_WRITE_SHIFT,
>         _PAGE_ACCESSED_SHIFT,
>         _PAGE_MODIFIED_SHIFT,
> +#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
> +       _PAGE_PROTNONE_SHIFT,
> +#endif
>  #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
>         _PAGE_SPECIAL_SHIFT,
>  #endif
> @@ -102,6 +108,9 @@ enum pgtable_bits {
>         _PAGE_WRITE_SHIFT,
>         _PAGE_ACCESSED_SHIFT,
>         _PAGE_MODIFIED_SHIFT,
> +#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
> +       _PAGE_PROTNONE_SHIFT,
> +#endif
>  #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
>         _PAGE_SPECIAL_SHIFT,
>  #endif
> @@ -131,6 +140,9 @@ enum pgtable_bits {
>  #if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
>         _PAGE_HUGE_SHIFT,
>  #endif
> +#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
> +       _PAGE_PROTNONE_SHIFT,
> +#endif
>  #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
>         _PAGE_SPECIAL_SHIFT,
>  #endif
> @@ -158,6 +170,11 @@ enum pgtable_bits {
>  #if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
>  # define _PAGE_HUGE            (1 << _PAGE_HUGE_SHIFT)
>  #endif
> +#if defined(CONFIG_ARCH_SUPPORTS_NUMA_BALANCING)
> +# define _PAGE_PROTNONE                (1 <<_PAGE_PROTNONE_SHIFT)
> +#else
> +# define _PAGE_PROTNONE                0
> +#endif
>  #if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
>  # define _PAGE_SPECIAL         (1 << _PAGE_SPECIAL_SHIFT)
>  #else
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index dd7a0f5..3434073 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -25,7 +25,7 @@
>  struct mm_struct;
>  struct vm_area_struct;
>
> -#define PAGE_NONE      __pgprot(_PAGE_PRESENT | _PAGE_NO_READ | \
> +#define PAGE_NONE      __pgprot(_PAGE_PROTNONE | _PAGE_NO_READ | \
>                                  _page_cachable_default)
>  #define PAGE_SHARED    __pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
>                                  _page_cachable_default)
> @@ -188,7 +188,7 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
>  #else
>
>  #define pte_none(pte)          (!(pte_val(pte) & ~_PAGE_GLOBAL))
> -#define pte_present(pte)       (pte_val(pte) & _PAGE_PRESENT)
> +#define pte_present(pte)       (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROTNONE))
>  #define pte_no_exec(pte)       (pte_val(pte) & _PAGE_NO_EXEC)
>
>  /*
> @@ -707,7 +707,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>
>  static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>  {
> -       pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY);
> +       pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_PROTNONE | _PAGE_DIRTY);
>
>         return pmd;
>  }
> @@ -729,6 +729,18 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>
> +#ifdef CONFIG_NUMA_BALANCING
> +static inline long pte_protnone(pte_t pte)
> +{
> +       return (pte_val(pte) & _PAGE_PROTNONE);
> +}
> +
> +static inline long pmd_protnone(pmd_t pmd)
> +{
> +       return (pmd_val(pmd) & _PAGE_PROTNONE);
> +}
> +#endif /* CONFIG_NUMA_BALANCING */
> +
>  #ifdef _PAGE_HUGE
>  #define pmd_leaf(pmd)  ((pmd_val(pmd) & _PAGE_HUGE) != 0)
>  #define pud_leaf(pud)  ((pud_val(pud) & _PAGE_HUGE) != 0)
> --
> 2.7.0
>
