Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A79F3074E2
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 12:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhA1LeS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 06:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhA1LeP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 06:34:15 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D55C061573;
        Thu, 28 Jan 2021 03:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=IUujPNoLJPhaulCTunLzVc+aMIY9llkn0PPsho9EbXg=; b=q3UUj0cFxO4alOPCMS3cjAmR2u
        wKGu2iv+3Xuhu5QxISZ9ZZJOS0pQ2GtYBzM2WVMeV/OjggbcOPiwNYxDFIMtyPTaQQNEfDT3TiBRa
        T2jqi9yZtEYNpyo8eWXOLUxU7qpevo/JsbDXxfyfVkLMIGRwvjs2vWY/xyZ4uxlb5nBRtnoEeY/Vz
        fNXHgwNNCn0CkkC50pTDfRy/lp82nWMy/ehsqAnHAvFgetp5EfxO9fCtX3g4dO9VR1FE8nvUlZ7sr
        Bn2IZGGGDInHvCbndLjrJ6PQb82695qmeQv5WYiqTsI+D4GBDKWySAoA5Hwf+wgeENaCSuuQq68TP
        +CCtbJiQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l55YF-0003Z2-KG; Thu, 28 Jan 2021 11:33:27 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1E9BF300B22;
        Thu, 28 Jan 2021 12:33:26 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id EF281200D4EEC; Thu, 28 Jan 2021 12:33:25 +0100 (CET)
Date:   Thu, 28 Jan 2021 12:33:25 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
Message-ID: <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-2-alexander.sverdlin@nokia.com>
 <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
 <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 28, 2021 at 08:27:29AM +0100, Alexander Sverdlin wrote:

> >> +#define __smp_store_release(p, v)					\
> >> +do {									\
> >> +	compiletime_assert_atomic_type(*p);				\
> >> +	__smp_wmb();							\
> >> +	__smp_rmb();							\
> >> +	WRITE_ONCE(*p, v);						\
> >> +} while (0)
> > This is wrong in general since smp_rmb() will only provide order between
> > two loads and smp_store_release() is a store.
> > 
> > If this is correct for all MIPS, this needs a giant comment on exactly
> > how that smp_rmb() makes sense here.
> 
> ... the macro is provided for Octeon only, and __smp_rmb() is actually a NOP
> there, but I thought to "document" the flow of thoughts from the discussion
> above by including it anyway.

Random discussions on the internet do not absolve you from having to
write coherent comments. Especially so where memory ordering is
concerned.

This, from commit 6b07d38aaa52 ("MIPS: Octeon: Use optimized memory
barrier primitives."):

	#define smp_mb__before_llsc() smp_wmb()
	#define __smp_mb__before_llsc() __smp_wmb()

is also dodgy as hell and really wants a comment too. I'm not buying the
Changelog of that commit either, __smp_mb__before_llsc should also
ensure the LL cannot happen earlier, but SYNCW has no effect on loads.
So what stops the load from being speculated?


