Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F251DD719
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 21:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729759AbgEUTWN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 15:22:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:56476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729475AbgEUTWN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 May 2020 15:22:13 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C508C207D3;
        Thu, 21 May 2020 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590088932;
        bh=Xx9qW9ha/ibRe3B+F/Oe3JRqdiaTcE+wCB2B8xz3EOw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r+A+zO53GL07D8OUlZ9WEBdBqdHIPOe25kASDVIQzMpOKlb5RNC5OpdGrKJNpoK6a
         fGuZc2LDxh2lAP8L6qddM/hEqGyiH6uO/NdtaQJJTpN4dc+wjP7kIF6UFgvoAtPa8x
         BVQgw8wycvY4W4a4BtwhOKtftCupVk+dsOhs5W0k=
Date:   Thu, 21 May 2020 12:22:11 -0700
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
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 2/4] mm/memory.c: Update local TLB if PTE entry
 exists
Message-Id: <20200521122211.7450025a41865a67df6a7303@linux-foundation.org>
In-Reply-To: <1590031837-9582-2-git-send-email-maobibo@loongson.cn>
References: <1590031837-9582-1-git-send-email-maobibo@loongson.cn>
        <1590031837-9582-2-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 21 May 2020 11:30:35 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> If two threads concurrently fault at the same address, the thread that
> won the race updates the PTE and its local TLB. For now, the other
> thread gives up, simply does nothing, and continues.
> 
> It could happen that this second thread triggers another fault, whereby
> it only updates its local TLB while handling the fault. Instead of
> triggering another fault, let's directly update the local TLB of the
> second thread.
> 
> It is only useful to architectures where software can update TLB, it may
> bring out some negative effect if update_mmu_cache is used for other
> purpose also. It seldom happens where multiple threads access the same
> page at the same time, so the negative effect is limited on other arches.
> 
> With specjvm2008 workload, smp-race pgfault counts is about 3% to 4%
> of the total pgfault counts by watching /proc/vmstats information
> 

I'm sorry to keep thrashing this for so long, but I'd really prefer not
to add any overhead to architectures which don't need it.  However,
we're getting somewhere!

> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2436,10 +2436,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>  			/*
>  			 * Other thread has already handled the fault
> -			 * and we don't need to do anything. If it's
> -			 * not the case, the fault will be triggered
> -			 * again on the same address.
> +			 * and update local tlb only
>  			 */
> +			update_mmu_cache(vma, addr, vmf->pte);

Now, all the patch does is to add new calls to update_mmu_cache().

So can we replace all these with a call to a new
update_mmu_cache_sw_tlb() (or whatever) which is a no-op on
architectures which don't need the additional call?

Also, I wonder about the long-term maintainability.  People who
regularly work on this code won't be thinking of this MIPS peculiarity
and it's likely that any new calls to update_mmu_cache_sw_tlb() won't
be added where they should have been.  Hopefully copy-and-paste from
the existing code will serve us well.  Please do ensure that the
update_mmu_cache_sw_tlb() implementation is carefully commented so
that people can understand where they should (and shouldn't) include
this call.

