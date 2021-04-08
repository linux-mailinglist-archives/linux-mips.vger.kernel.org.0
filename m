Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4A63581D7
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 13:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhDHLbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 07:31:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229803AbhDHLbX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Apr 2021 07:31:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D05D161157;
        Thu,  8 Apr 2021 11:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617881471;
        bh=lqmGrdWSJLE85zUhGL9R6Ph0kAoociMJzmBFMG9Y5+Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iVcsvCliP9dBVAKDs2eboDojut9vUmYksJ1vbwk11ZNACmNrqrZT+5qOaYFL3ZjgC
         2XJ00dcdranzrK8/e0gizBhbhQOKjpLD1nUxZmuDzaQvNG14P8TIt/VoLALpZx7Rcq
         DjQrI3/VNf58DcZA0W9cyOCgHFdggaB2H/bat2qxrBZOnq3/t4eXwzjiF1gUBFTH9B
         fW3zLZzKG8Kqhdv7s0iVP/+HGnVTHCptzb3fXns0KK2H46D1sLtww+ZblHaffdpzQ6
         oSXjGZDMR0kUTTXVk+D7C5zYQdczh1v8YN8Ru6mZ+sd1ypcrCKk2mwS+HFrkHhVPNP
         2yrl6lZYy9L9g==
Received: by mail-il1-f170.google.com with SMTP id c3so1470612ils.2;
        Thu, 08 Apr 2021 04:31:11 -0700 (PDT)
X-Gm-Message-State: AOAM533j2dik4OODo2/2JTPMoIQRiHIrfuoI3FSRy+wHWQU9Vp7D65K9
        FpEwBZW8SEhLdSoHE9zcI4kQpjqrgyBTjlWyhgs=
X-Google-Smtp-Source: ABdhPJwqybGnlGEWDe6mDFDqI6rMIhoNkEqG3INfD7NLlAtBwOBlibcfolFyLXgFtfrnT3oqpqBwK2kHBvTKp5sUps4=
X-Received: by 2002:a05:6e02:1526:: with SMTP id i6mr3047759ilu.270.1617881470939;
 Thu, 08 Apr 2021 04:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210212082058.40792-1-wangrui@loongson.cn>
In-Reply-To: <20210212082058.40792-1-wangrui@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 8 Apr 2021 19:30:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5a6f7SSaMfOJudFuqtzLqkDks_NkjsPe15gN3mJTGBDw@mail.gmail.com>
Message-ID: <CAAhV-H5a6f7SSaMfOJudFuqtzLqkDks_NkjsPe15gN3mJTGBDw@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND] MIPS: tlbex: Avoid access invalid address when
 pmd is modifying
To:     Rui Wang <wangrui@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Rui Wang,

On Fri, Feb 12, 2021 at 4:21 PM Rui Wang <wangrui@loongson.cn> wrote:
>
> From: wangrui <wangrui@loongson.cn>
>
> When user-space program accessing a virtual address and falls into TLB invalid
> exception handling. at almost the same time, if the pmd which that contains this
> virtual address is hit by THP scanning, and then a invalid address access may
> occurs in the tlb handler:
>
>    CPU 0: (userspace)                 | CPU 1: (khugepaged)
> 1:                                    | scan hit: set pmde to invalid_pmd_table
>                                       |  (by pmd_clear)
> 2: handle_tlbl(tlb invalid):          |
>     load pmde for huge page testing,  |
>     pmde doesn't contains _PAGE_HUGE  |
>     bit                               |
> 3:                                    | collapsed: set pmde to huge page format
> 4: handle_tlbl(normal page case):     |
>     load pmde again as base address,  |
>     pmde doesn't contains an address, |
>     access invalid address            |
>
> This patch avoids the inconsistency of two memory loads by reusing the result
> of one load.
>
You can CC stable@vger.kernel.org here.

> Signed-off-by: wangrui <wangrui@loongson.cn>
> ---
>  arch/mips/mm/tlbex.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index a7521b8f7658..2295f1e2db81 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -721,13 +721,12 @@ static void build_huge_tlb_write_entry(u32 **p, struct uasm_label **l,
>   */
>  static void
>  build_is_huge_pte(u32 **p, struct uasm_reloc **r, unsigned int tmp,
> -                 unsigned int pmd, int lid)
> +                 unsigned int pmde, int lid)
>  {
> -       UASM_i_LW(p, tmp, 0, pmd);
>         if (use_bbit_insns()) {
> -               uasm_il_bbit1(p, r, tmp, ilog2(_PAGE_HUGE), lid);
> +               uasm_il_bbit1(p, r, pmde, ilog2(_PAGE_HUGE), lid);
>         } else {
> -               uasm_i_andi(p, tmp, tmp, _PAGE_HUGE);
> +               uasm_i_andi(p, tmp, pmde, _PAGE_HUGE);
>                 uasm_il_bnez(p, r, tmp, lid);
>         }
>  }
> @@ -1103,7 +1102,6 @@ EXPORT_SYMBOL_GPL(build_update_entries);
>  struct mips_huge_tlb_info {
>         int huge_pte;
>         int restore_scratch;
> -       bool need_reload_pte;
>  };
>
>  static struct mips_huge_tlb_info
> @@ -1118,7 +1116,6 @@ build_fast_tlb_refill_handler (u32 **p, struct uasm_label **l,
>
>         rv.huge_pte = scratch;
>         rv.restore_scratch = 0;
> -       rv.need_reload_pte = false;
>
>         if (check_for_high_segbits) {
>                 UASM_i_MFC0(p, tmp, C0_BADVADDR);
> @@ -1323,7 +1320,6 @@ static void build_r4000_tlb_refill_handler(void)
>         } else {
>                 htlb_info.huge_pte = K0;
>                 htlb_info.restore_scratch = 0;
> -               htlb_info.need_reload_pte = true;
>                 vmalloc_mode = refill_noscratch;
>                 /*
>                  * create the plain linear handler
> @@ -1348,11 +1344,14 @@ static void build_r4000_tlb_refill_handler(void)
>                 build_get_pgde32(&p, K0, K1); /* get pgd in K1 */
>  #endif
>
> +               UASM_i_LW(&p, K0, 0, K1); /* get pmd entry in K0 */
>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
> -               build_is_huge_pte(&p, &r, K0, K1, label_tlb_huge_update);
> +               build_is_huge_pte(&p, &r, K1, K0, label_tlb_huge_update);
>  #endif
>
> -               build_get_ptep(&p, K0, K1);
You remove the build_get_ptep here, but this may be wrong for NEVADA.

Huacai
> +               GET_CONTEXT(&p, K1); /* get context reg */
> +               build_adjust_context(&p, K1);
> +               UASM_i_ADDU(&p, K1, K0, K1); /* add in offset */
>                 build_update_entries(&p, K0, K1);
>                 build_tlb_write_entry(&p, &l, &r, tlb_random);
>                 uasm_l_leave(&l, p);
> @@ -1360,8 +1359,6 @@ static void build_r4000_tlb_refill_handler(void)
>         }
>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
>         uasm_l_tlb_huge_update(&l, p);
> -       if (htlb_info.need_reload_pte)
> -               UASM_i_LW(&p, htlb_info.huge_pte, 0, K1);
>         build_huge_update_entries(&p, htlb_info.huge_pte, K1);
>         build_huge_tlb_write_entry(&p, &l, &r, K0, tlb_random,
>                                    htlb_info.restore_scratch);
> @@ -2059,20 +2056,20 @@ build_r4000_tlbchange_handler_head(u32 **p, struct uasm_label **l,
>         build_get_pgde32(p, wr.r1, wr.r2); /* get pgd in ptr */
>  #endif
>
> +       UASM_i_LW(p, wr.r3, 0, wr.r2); /* get pmd entry in wr.r3 */
>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
>         /*
> -        * For huge tlb entries, pmd doesn't contain an address but
> +        * For huge tlb entries, pmde doesn't contain an address but
>          * instead contains the tlb pte. Check the PAGE_HUGE bit and
>          * see if we need to jump to huge tlb processing.
>          */
> -       build_is_huge_pte(p, r, wr.r1, wr.r2, label_tlb_huge_update);
> +       build_is_huge_pte(p, r, wr.r1, wr.r3, label_tlb_huge_update);
>  #endif
>
>         UASM_i_MFC0(p, wr.r1, C0_BADVADDR);
> -       UASM_i_LW(p, wr.r2, 0, wr.r2);
>         UASM_i_SRL(p, wr.r1, wr.r1, PAGE_SHIFT + PTE_ORDER - PTE_T_LOG2);
>         uasm_i_andi(p, wr.r1, wr.r1, (PTRS_PER_PTE - 1) << PTE_T_LOG2);
> -       UASM_i_ADDU(p, wr.r2, wr.r2, wr.r1);
> +       UASM_i_ADDU(p, wr.r2, wr.r3, wr.r1);
>
>  #ifdef CONFIG_SMP
>         uasm_l_smp_pgtable_change(l, *p);
> --
> 2.30.1
>
