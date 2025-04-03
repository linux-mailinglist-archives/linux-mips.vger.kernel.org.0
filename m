Return-Path: <linux-mips+bounces-8426-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A332A7A24B
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 14:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50243188EA97
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 12:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39A624C069;
	Thu,  3 Apr 2025 12:00:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EE324BBEF;
	Thu,  3 Apr 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681620; cv=none; b=tM2YYMH/7gAtaw7OoCXLd0nCwU+E9Nne+DgshUe/c0GUzYca564PuQdTVChv5/SIhG8HBqKd07GG7Oop23p8Dlioi/wNyT3fCzVv2TS38zoePekjsyvyLLz+uv44KKsV/VMh+Tw0+pCXlBtiZUWc2tydDel8jWkrRjzaY5ZAcTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681620; c=relaxed/simple;
	bh=gXrlk+N/fddEZ+Yp09kpJuBWkM1jXBr5Bdjrwjx0C6E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V46iEdeJmsAteSU4rY6ZmHSOTExq5F1RdzvyBrftpqtiLvBDGUOwCyFkTfowZcFageLfesL+iIg6jtwff8EzYhUUwBKceJRTL2mR1MvWUrCwiPb7vSl3k6EBISvLYIORNif2BgkzMarZTf6v61yMBO/Dwh9DrQ2Ovu6HqmRlxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B2AF292009C; Thu,  3 Apr 2025 14:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id AC37E92009B;
	Thu,  3 Apr 2025 13:00:15 +0100 (BST)
Date: Thu, 3 Apr 2025 13:00:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com> <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com> <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk> <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Apr 2025, Marco Crivellari wrote:

> > Well, you should be able to set a breakpoint at `rollback_handle_int' and
> > fiddle with $epc by hand to see if the code sequence correctly skips over
> > WAIT.  Though I reckon QEMU used to have an issue with presenting the MIPS
> > privileged context over its debug stub.  Has the issue been fixed?  Either
> > way you should be able to just operate on the copy in $k0 retrieved with
> > (D)MFC0.
> 
> Nope, seems not fixed so far. But yes, changing $k0 is working fine.
> With the cpu in idle code (executing "wait"), ctrl+c, then placed a bp
> in rollback_handle_init+4. Then "c" to hit the bp.
> When the bp is hit, I can see $k0 = r4k_wait_exit.
> 
> I changed $k0 with an address inside the region, and setting a bp on "bne",
>  the value is equal to $k1. I'm assuming the value is also saved
> correctly in $epc,
> considering it points correctly to r4k_wait_exit.

 I think it's enough evidence to prove the code works as expected.

>  > Hmm, "skipover" maybe?
> 
> Now that I'm looking at the code, shouldn't it be better to address this in a
> separate patch or another time?
> 
> I can see the rollback_handler* is exported also in arch/mips/kernel/traps.c
> And there are a few parts that makes use of the "rollback" name; I'm
> wondering if also
> the code should be refactored a bit then,
> eg arch/mips /include/asm/idle.h:using_rollback_handler()

 Yeah, I agree cluttering the semantics change with the rename is not the 
best idea, so a follow-up patch approach will be better.

 Also I wonder if we could come up with yet another name that does not 
have the exact semantics implied, so that if in 20 years' time we change 
our minds again and decide: "Oh, let's do the rollback thing after all," 
we don't have to do the rename again.  Though it's like I'm diverging into 
the bikeshedding area here, so perhaps please just use whatever name you 
have found most reasonable at the time you're about to wrap up with this 
effort.

  Maciej

