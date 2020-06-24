Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7041B207C63
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 21:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391355AbgFXTtn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 15:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:41652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391349AbgFXTtn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 15:49:43 -0400
Received: from X1 (nat-ab2241.sltdut.senawave.net [162.218.216.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BA5E2077D;
        Wed, 24 Jun 2020 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593028182;
        bh=GtKiru20fiulDY/NNMBRlZM0+jD6z1T1x8F4QT9oAwI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ikKhPfp3m7n0bBgValXK5Syf2rtX7Uxg67z+h7W1VJPRI+78DWVrafptZHHHuMoNB
         3CuD8QMd7bxaGfF5MRZG/BpL0/gjYrhqy7oeGWxu7/uxOPcWjfyxxJfRH1EsgQ3bk1
         VaFOCm0S8fgjIgEfLGGN+jtolxp0vk28GHgl46h4=
Date:   Wed, 24 Jun 2020 12:49:42 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 1/3] mm: set page fault address for update_mmu_cache_pmd
Message-Id: <20200624124942.374359af3a745e7386f9fc65@linux-foundation.org>
In-Reply-To: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
References: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 24 Jun 2020 17:26:30 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> update_mmu_cache_pmd is used to update tlb for the pmd entry by
> software. On MIPS system, the tlb entry indexed by page fault
> address maybe exists already, only that tlb entry may be small
> page, also it may be huge page. Before updating pmd entry with
> huge page size, older tlb entry need to be invalidated.
> 
> Here page fault address is passed to function update_mmu_cache_pmd,
> rather than pmd huge page start address. The page fault address
> can be used for invalidating older tlb entry.
> 
> ...
>
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -554,11 +554,20 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  #define	__HAVE_ARCH_UPDATE_MMU_TLB
>  #define update_mmu_tlb	update_mmu_cache
>  
> +extern void local_flush_tlb_page(struct vm_area_struct *vma,
> +				unsigned long page);

This is unfortunate.  We can't #include <asm/'tlbflush.h>?

>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>  	unsigned long address, pmd_t *pmdp)
>  {
>  	pte_t pte = *(pte_t *)pmdp;
>  
> +	/*
> +	 * If pmd_none is true, older tlb entry will be normal page.
> +	 * here to invalidate older tlb entry indexed by address
> +	 * parameter address must be page fault address rather than
> +	 * start address of pmd huge page
> +	 */
> +	local_flush_tlb_page(vma, address);
>  	__update_tlb(vma, address, pte);
>  }
>  

