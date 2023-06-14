Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6BE7302CA
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jun 2023 17:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245738AbjFNPGL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jun 2023 11:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245717AbjFNPGI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jun 2023 11:06:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF1C19B;
        Wed, 14 Jun 2023 08:06:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5B7164274;
        Wed, 14 Jun 2023 15:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A5AC433C8;
        Wed, 14 Jun 2023 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686755166;
        bh=mYL5daBcxMikalMhh9cCFY+r9XquqesA54K3hjfOLTg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=STNRxM+Y/xkG0QyBoc53kcCb5yG1Ly+XJdRdHc/zJ1TCbDaJDD0OuxmfQFFT6l7Kq
         qCp4eYGEWaY44zLye/aA/Sc6bwWU7i2YmGCf+enSLd3bLx7RIr/9d9ksK/M8XETdpa
         h/shck3gYngL3WCudQKzi54g1OqDGBTFn+RvxrwG+iuix2d51fV9RXhELY1o9p6nzP
         PK46LJSg5B9o0xTe73U8Gbss933xivoRdOgA30zw2Sz2WY7mXiXJkZyDnMtU6ViDZX
         9gqDJzLtn1zUkTLc7vaWLzH0+Q5q/9ETD/YLmVjUjGTzC8B0nzsq7nYMwwuGkaFucZ
         jo9CN9hwdi+0A==
Date:   Wed, 14 Jun 2023 18:05:28 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 21/34] arm64: Convert various functions to use ptdescs
Message-ID: <20230614150528.GT52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-22-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-22-vishal.moola@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 12, 2023 at 02:04:10PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm64/include/asm/tlb.h | 14 ++++++++------
>  arch/arm64/mm/mmu.c          |  7 ++++---
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index c995d1f4594f..2c29239d05c3 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -75,18 +75,20 @@ static inline void tlb_flush(struct mmu_gather *tlb)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
>  				  unsigned long addr)
>  {
> -	pgtable_pte_page_dtor(pte);
> -	tlb_remove_table(tlb, pte);
> +	struct ptdesc *ptdesc = page_ptdesc(pte);
> +
> +	pagetable_pte_dtor(ptdesc);
> +	tlb_remove_ptdesc(tlb, ptdesc);
>  }
>  
>  #if CONFIG_PGTABLE_LEVELS > 2
>  static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
>  				  unsigned long addr)
>  {
> -	struct page *page = virt_to_page(pmdp);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
>  
> -	pgtable_pmd_page_dtor(page);
> -	tlb_remove_table(tlb, page);
> +	pagetable_pmd_dtor(ptdesc);
> +	tlb_remove_ptdesc(tlb, ptdesc);
>  }
>  #endif
>  
> @@ -94,7 +96,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
>  static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
>  				  unsigned long addr)
>  {
> -	tlb_remove_table(tlb, virt_to_page(pudp));
> +	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pudp));
>  }
>  #endif
>  
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index af6bc8403ee4..5867a0e917b9 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -426,6 +426,7 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
>  static phys_addr_t pgd_pgtable_alloc(int shift)
>  {
>  	phys_addr_t pa = __pgd_pgtable_alloc(shift);
> +	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
>  
>  	/*
>  	 * Call proper page table ctor in case later we need to
> @@ -433,12 +434,12 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>  	 * this pre-allocated page table.
>  	 *
>  	 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
> -	 * folded, and if so pgtable_pmd_page_ctor() becomes nop.
> +	 * folded, and if so pagetable_pte_ctor() becomes nop.
>  	 */
>  	if (shift == PAGE_SHIFT)
> -		BUG_ON(!pgtable_pte_page_ctor(phys_to_page(pa)));
> +		BUG_ON(!pagetable_pte_ctor(ptdesc));
>  	else if (shift == PMD_SHIFT)
> -		BUG_ON(!pgtable_pmd_page_ctor(phys_to_page(pa)));
> +		BUG_ON(!pagetable_pmd_ctor(ptdesc));
>  
>  	return pa;
>  }
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
