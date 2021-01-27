Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE42C30675A
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 00:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhA0W5Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 17:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbhA0W4P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Jan 2021 17:56:15 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D920AC061756;
        Wed, 27 Jan 2021 14:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ULuGLjzwxtFSy9nTUc2QJKX0McDeCrJVlLHjHSrLJUQ=; b=ekL90Tyh0NH+HZ7P38Jv+7tXVu
        V0h1SMEmsSa5dYOLQ7mbtrO48frvtn1sBgDUeYc4f4XNC9aKBAmk7KtEedc0z/FUPFs+JDguU9QxY
        k3mmlLvm60KJEVI6UAG6AQRnHCwu0/Dr7UQYqw4148K4ZlkIsaUXK+YxpGo6tK4yloYl+e/rrCI6B
        ctAf1mdI8c50oPovdIkjNEHuj3H8v81dfRKlTqXv9PgYI4NTO4WhkobKHigj7092hDLmIwt73cVeJ
        +E9ZvC6vEdLhnYqb8ZUjb+hUALXQwfc/4kM5/foTO1mrQXOVaAgHztGeXn/DtQiaY66Us2amlQ3wa
        whBvdWEw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l4tM6-0006bm-Aw; Wed, 27 Jan 2021 22:32:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 270C83003D8;
        Wed, 27 Jan 2021 23:32:04 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0E4712BDDF79F; Wed, 27 Jan 2021 23:32:04 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:32:03 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
Message-ID: <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-2-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127203627.47510-2-alexander.sverdlin@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 09:36:22PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> On Octeon smp_mb() translates to SYNC while wmb+rmb translates to SYNCW
> only. This brings around 10% performance on tight uncontended spinlock
> loops.
> 
> Refer to commit 500c2e1fdbcc ("MIPS: Optimize spinlocks.") and the link
> below.
> 
> On 6-core Octeon machine:
> sysbench --test=mutex --num-threads=64 --memory-scope=local run
> 
> w/o patch:	1.60s
> with patch:	1.51s
> 
> Link: https://lore.kernel.org/lkml/5644D08D.4080206@caviumnetworks.com/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/include/asm/barrier.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrier.h
> index 49ff172..24c3f2c 100644
> --- a/arch/mips/include/asm/barrier.h
> +++ b/arch/mips/include/asm/barrier.h
> @@ -113,6 +113,15 @@ static inline void wmb(void)
>  					    ".set arch=octeon\n\t"	\
>  					    "syncw\n\t"			\
>  					    ".set pop" : : : "memory")
> +
> +#define __smp_store_release(p, v)					\
> +do {									\
> +	compiletime_assert_atomic_type(*p);				\
> +	__smp_wmb();							\
> +	__smp_rmb();							\
> +	WRITE_ONCE(*p, v);						\
> +} while (0)

This is wrong in general since smp_rmb() will only provide order between
two loads and smp_store_release() is a store.

If this is correct for all MIPS, this needs a giant comment on exactly
how that smp_rmb() makes sense here.
