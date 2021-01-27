Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6683067D8
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 00:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhA0XZI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 18:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhA0W41 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Jan 2021 17:56:27 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DD9C06178C;
        Wed, 27 Jan 2021 14:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=cvlrAJZnq6IX7KNiUIZWjYdQaLq5TVfCb9k0Y04B5QA=; b=mdyb7VqWn5FMZa/1xxFmi9xuhx
        XNFizrhQnqrgpWOKZGAF/GUyQ/IcM8+ejDoA4tWBkRuLFJSsF/MGr81LOuekbRSNQ6dHn9hererlK
        WtCxjnJthi1v/PmX52wi1lMxHuuMlJoggW7hfp4oYJgHQfELT4W2Cupzds5JqKAvdBn+HKDoXR/U2
        X+Q6lQ+P7bwEJ4muUXonrRF62gx1thcujMZbIldCeHubMPpMgF7ksmw/hlJ/UQAFTZpPVyEQg/Jqx
        t0t+Z+7qTJ16LYMVOXnXbtvPbIMifaduR33PM5c5CyF49dNdndy+zY2X0bkVMrIGy8D5pUiNgGa6f
        5WB3wihw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l4tR9-007bYi-Vq; Wed, 27 Jan 2021 22:37:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC7823010C8;
        Wed, 27 Jan 2021 23:37:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 990062BDDF79D; Wed, 27 Jan 2021 23:37:19 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:37:19 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] MIPS: cmpxchg: Use cmpxchg_local() for
 {cmp_}xchg_small()
Message-ID: <YBHrH1Rw/nQqgDK4@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-7-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127203627.47510-7-alexander.sverdlin@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 09:36:27PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> It makes no sense to fold smp_mb__before_llsc()/smp_llsc_mb() again and
> again, leave only one barrier pair in the outer function.
> 
> This removes one SYNCW from __xchg_small() and brings around 10%
> performance improvement in a tight spinlock loop with 6 threads on a 6 core
> Octeon.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/kernel/cmpxchg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
> index 89107de..122e85f 100644
> --- a/arch/mips/kernel/cmpxchg.c
> +++ b/arch/mips/kernel/cmpxchg.c
> @@ -41,7 +41,7 @@ unsigned long __xchg_small(volatile void *ptr, unsigned long val, unsigned int s
>  	do {
>  		old32 = load32;
>  		new32 = (load32 & ~mask) | (val << shift);
> -		load32 = cmpxchg(ptr32, old32, new32);
> +		load32 = cmpxchg_local(ptr32, old32, new32);
>  	} while (load32 != old32);
>  
>  	return (load32 & mask) >> shift;
> @@ -97,7 +97,7 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
>  		 */
>  		old32 = (load32 & ~mask) | (old << shift);
>  		new32 = (load32 & ~mask) | (new << shift);
> -		load32 = cmpxchg(ptr32, old32, new32);
> +		load32 = cmpxchg_local(ptr32, old32, new32);
>  		if (load32 == old32)
>  			return old;
>  	}

This is wrong, please use cmpxchg_relaxed() which you've just
introduced. cmpxchg_local() need not be cross-cpu atomic at all (it is
on mips by accident of implementation).
