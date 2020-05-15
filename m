Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDC51D5AC8
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 22:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgEOUkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 16:40:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:35872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgEOUkr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 16:40:47 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90FD92065C;
        Fri, 15 May 2020 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589575247;
        bh=7/Rpg+KXflBLuZsnLoyMnGo3Y9ufgp8qwJuPpO7BwaA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yYiOrVlBnM3aO59WMqUm3FSSQzFJGNL3VqcYNpP/dJzArRZ14W3EckZ3tyQpIm3P+
         MrBsYFDV0RlVmYXRJ5hqynPd8nRvqZpfj1XibvEeXHaFByurO0jEiypqW5nKXCJHlS
         5FbAPrnmkaWnlNtI5oAHxBPHONNGNE0HtTdo43GQ=
Date:   Fri, 15 May 2020 13:40:46 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm/memory.c: Update local TLB if PTE entry exists
Message-Id: <20200515134046.cf107c6a13b9604c46ad71b8@linux-foundation.org>
In-Reply-To: <1589515809-32422-2-git-send-email-maobibo@loongson.cn>
References: <1589515809-32422-1-git-send-email-maobibo@loongson.cn>
        <1589515809-32422-2-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 May 2020 12:10:08 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> If there are two threads hitting page fault at the same page,
> one thread updates PTE entry and local TLB, the other can
> update local tlb also, rather than give up and do page fault
> again.
>
> ...
>
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1770,8 +1770,8 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>  			}
>  			entry = pte_mkyoung(*pte);
>  			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> -			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> -				update_mmu_cache(vma, addr, pte);
> +			ptep_set_access_flags(vma, addr, pte, entry, 1);
> +			update_mmu_cache(vma, addr, pte);

Presumably these changes mean that other architectures will run
update_mmu_cache() more frequently than they used to.  How much more
frequently, and what will be the impact of this change?  (Please fully
explain all this in the changelog).

>  		}
>  		goto out_unlock;
>  	}
>
> ...
>
> @@ -2463,7 +2462,8 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>  		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
>  		locked = true;
>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
> -			/* The PTE changed under us. Retry page fault. */
> +			/* The PTE changed under us, update local tlb */
> +			pdate_mmu_cache(vma, addr, vmf->pte);

Missing a 'u' there.  Which tells me this patch isn't the one which you
tested!

>  			ret = false;
>  			goto pte_unlock;
>  		}
>
> ...
>
