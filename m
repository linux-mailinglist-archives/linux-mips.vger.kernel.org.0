Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37211306748
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 23:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhA0WzP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 17:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbhA0WzK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Jan 2021 17:55:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84A7C06178A;
        Wed, 27 Jan 2021 14:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=lByFNuR88RDNsuzHcedrvnGTtel5nV7mTgNs/bJdJiQ=; b=PwAq2xuFOaHMMyzEakUXaEWjR9
        dFVNMxUZg71O5aUOYVYFV4dTjFpyI18evbjPpGixHqE9Wuwtj493M/L+ip6qc1psfG4C59DnYY9dT
        BkprR1G9U3kKCVHUuQwhlX0uB+a7jCw6J1q/SRHd5ohDfMfsE4eIO6TK0OzTsCuHaDXPnRVT3t8Ic
        W7OttOZbBOlOdj2+9qUpE1EUlWVjqPoVJ7+0LJQlKF2sY91gazRBCcfQl+iXaO+osxZ6To3GME31O
        ZKgL119TLMK1HxgW+0WDyJ5QDolDR6YUU5XdJa/L9tnTbbZdgR7Dixyb5+X+toHkmeDefbsGYrdDQ
        Tdg0neDw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l4tOU-007bNn-Ch; Wed, 27 Jan 2021 22:34:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B1FF23010C8;
        Wed, 27 Jan 2021 23:34:33 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 99E132073198D; Wed, 27 Jan 2021 23:34:33 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:34:33 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] MIPS: Octeon: qspinlock: Flush write buffer
Message-ID: <YBHqeXPMILg+352D@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-4-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127203627.47510-4-alexander.sverdlin@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 09:36:24PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Flushing the write buffer brings aroung 10% performace on the tight
> uncontended spinlock loops on Octeon. Refer to commit 500c2e1fdbcc
> ("MIPS: Optimize spinlocks.").

No objection to the patch, but I don't find the above referenced commit
to be enlightening wrt nudge_writes(). The best it has to offer is the
comment that's already in the code.

> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/include/asm/spinlock.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
> index 8a88eb2..0a707f3 100644
> --- a/arch/mips/include/asm/spinlock.h
> +++ b/arch/mips/include/asm/spinlock.h
> @@ -24,6 +24,9 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>  	/* This could be optimised with ARCH_HAS_MMIOWB */
>  	mmiowb();
>  	smp_store_release(&lock->locked, 0);
> +#ifdef CONFIG_CPU_CAVIUM_OCTEON
> +	nudge_writes();
> +#endif
>  }
>  
>  #include <asm/qspinlock.h>
> -- 
> 2.10.2
> 
