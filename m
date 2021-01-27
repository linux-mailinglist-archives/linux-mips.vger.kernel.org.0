Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813DA3067D2
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 00:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhA0XYT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 18:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhA0W4o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Jan 2021 17:56:44 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE0AC06178B;
        Wed, 27 Jan 2021 14:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=J0YNgnqUBBqsZrfgOeLhh0XCgX2gBtZoSs7ELzA89O0=; b=KXPuEOMQhBvaHEr4So2lSDTpdm
        fAPo+9QunbnFGavkwLKAAlE+u6n8zodrF1Hf3FdZXM5wS+jI0CrprZgq5RaL/Eha1ky14O5TaFBNO
        J7hLQibV9+/Q8V2HxfR99FKKnHF7P6Q4q3X/fKbI62Xf0kyxVZO1OMyZJJKSPEaMMR8z4ODd/pICn
        wP3OB/F1UYHLj2wd4JBdT35IHWWpieXKTeGCXWXFiR/Q8WCm9lmQXLvXAtmo4w2ex0X8/1Rsf302q
        8vZwbtMJ+GI+acQ5zMSCxeQQ5xkgyt4Rb6ws7VSglHwvWYNhFqRJCOiSF0BnCdpKfu08PJuyefx+D
        vXjodpEw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l4tPX-0006mk-7W; Wed, 27 Jan 2021 22:35:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 630283010C8;
        Wed, 27 Jan 2021 23:35:36 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 539C12BDDF79D; Wed, 27 Jan 2021 23:35:36 +0100 (CET)
Date:   Wed, 27 Jan 2021 23:35:36 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] MIPS: Octeon: qspinlock: Exclude mmiowb()
Message-ID: <YBHquK0VQCk36T6k@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-5-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127203627.47510-5-alexander.sverdlin@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 09:36:25PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> On Octeon mmiowb() is SYNCW, which is already contained in
> smp_store_release(). Removing superfluous barrier brings around 10%
> performance on uncontended tight spinlock loops.

It is only implied when CONFIG_SMP, does OCTEON mandate CONFIG_SMP ?

The code could use a comment to explain this for the next poor sod
trying to understand it.

> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/include/asm/spinlock.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
> index 0a707f3..fbe97b4 100644
> --- a/arch/mips/include/asm/spinlock.h
> +++ b/arch/mips/include/asm/spinlock.h
> @@ -21,8 +21,10 @@
>   */
>  static inline void queued_spin_unlock(struct qspinlock *lock)
>  {
> +#ifndef CONFIG_CPU_CAVIUM_OCTEON
>  	/* This could be optimised with ARCH_HAS_MMIOWB */
>  	mmiowb();
> +#endif
>  	smp_store_release(&lock->locked, 0);
>  #ifdef CONFIG_CPU_CAVIUM_OCTEON
>  	nudge_writes();
> -- 
> 2.10.2
> 
