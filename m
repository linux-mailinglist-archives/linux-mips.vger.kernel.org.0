Return-Path: <linux-mips+bounces-8240-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B742A69BCD
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 23:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D97C57A41ED
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 22:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E4321481D;
	Wed, 19 Mar 2025 22:09:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717B12135C1;
	Wed, 19 Mar 2025 22:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422153; cv=none; b=sHsUqW9NcnDxH0eDySW3Pn0EmVlWPHnMaO3c0qwf3YR7W2PolL23wIjXJW1VfUkCIKcp7YI1Nv0FuQiX5b5D9yj2wGejWD2wKkA9JE/n3+sBv5EqWuqfliogrxnnw6q2YJurdtRa4QLL/1+jLlL7Gvpz4v7/ILylE8vjU3w0SqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422153; c=relaxed/simple;
	bh=rMrD+gVX33Z0UQ+LB5hOlZxquvmbGDl/Q8xCXT2cVNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faualQxCPZ2D5Hfie+oU/NDmeJ1vvAa1QBfjliWW0OXsYHp36duRrdak1Ny77hLpSzPPfNXaMdHjGr8HUHW6oCJ7h8NbQwxIhzlL1Kdids8G18NKINUa/CHqKWpbaKuBh6WvOkHZIf8zrOxBqy6uiS4zY5jc7+ZEQVd6IYl3uyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tv1ax-0005mD-00; Wed, 19 Mar 2025 23:09:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A73D3C0135; Wed, 19 Mar 2025 16:31:49 +0100 (CET)
Date: Wed, 19 Mar 2025 16:31:49 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z9rjZf0ZT7iejVlA@alpha.franken.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>

On Wed, Mar 19, 2025 at 03:43:13PM +0100, Frederic Weisbecker wrote:
> > >  	.set	MIPS_ISA_ARCH_LEVEL_RAW
> > > +	/*
> > > +	 * If an interrupt lands here, between enabling interrupts above and
> > > +	 * going idle on the next instruction, we must *NOT* go idle since the
> > > +	 * interrupt could have set TIF_NEED_RESCHED or caused a timer to need
> > > +	 * resched. Fall through -- see rollback_handler below -- and have
> > > +	 * the idle loop take care of things.
> > > +	 */
> > >  	wait
> > > -	/* end of rollback region (the region size must be power of two) */
> > > +	/* End of idle interrupt region. */
> > >  1:
> > 
> > please give this label a name for example __r4k_wait_exit and do a
> > runtime check that it really has 36 bytes offset to __r4k_wait
> 
> Where would be the best place for that?
> 
> arch/mips/kernel/setup.c:setup_arch() maybe?

scratch runtime check, a compile check is what I wanted to write...

something like

.if ((__r4k_wait_exit - __r4k_wait) != 36)
.err
.endif

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

