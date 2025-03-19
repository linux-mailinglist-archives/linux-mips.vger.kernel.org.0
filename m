Return-Path: <linux-mips+bounces-8234-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5196A692B5
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 16:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B131B856D2
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBB41D516F;
	Wed, 19 Mar 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r91j1lyO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BE1C5F22;
	Wed, 19 Mar 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395400; cv=none; b=YmsN+dXQYHy4vM4MNBPSmNuGPdQldeKR9GRIqfJgZ7XejvTY4xQrqJgZq3lcduoLsQig78alj/lvkb534fBrC5nv199lvwMMNpgoXReVxYwq/KyMf0nRVcbxU0QUlZHJkn4udI2CYmy4dMFsyyD7g3T+IRsqFmWj0A4H9kVYUsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395400; c=relaxed/simple;
	bh=3Kv2dbLsUqvcv+FPPVoPCmI1IHTCg4sBqRaApPlo/h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8twLd5wsJDIi5/oqs8joq+423r1l7NXXt2Jx2zk01yGHh1AIWk7CR6oUWii5Vjeis1Wl6gFUgQsAzm1Gs00ZzIBjOHpS5XSQKjaWGZrfryRq5WRbMaYCA01V0cmedPL+GNCF3ap9kBIikhk2cl1yKtKFCRjuqM4ItAC9LWIIGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r91j1lyO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D278C4CEE4;
	Wed, 19 Mar 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742395400;
	bh=3Kv2dbLsUqvcv+FPPVoPCmI1IHTCg4sBqRaApPlo/h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r91j1lyO8PLITDTAZoSghUcVkM7G5rrxcCxHpZQr1nZPLGB1rT2YJnXYINdxVlWGl
	 bJ6sZzpzgqVBYu7EmedUJt7FxBfhdpgpDC0bbM5rsBDNTyCo/8LNDzVD+/H15UnNlK
	 9qAgX4xoL/DsiSdNJxygCM/FFtrTWeceOCoHx0biKFrKrsH4IhrJXN9N2FYax61Bqx
	 dRBvhjYu6otlJsYlyswXwbU3XObbvbBiWdcpVTyGto8UpCPGZW/iLViQnoZlNH8zuM
	 vra6P3n9l4mpklZclgPsHupj6YyYqy8LqCMfqtJ79PGfG2o9jYlSctIKT1JQaoXlrl
	 2j5h/zT3EI1gQ==
Date: Wed, 19 Mar 2025 15:43:13 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9qlW81QikxeVzQa@alpha.franken.de>

Le Wed, Mar 19, 2025 at 12:07:07PM +0100, Thomas Bogendoerfer a écrit :
> On Sat, Mar 15, 2025 at 08:40:02PM +0100, Marco Crivellari wrote:
> > MIPS re-enables interrupts on its idle routine and performs
> > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> > 
> > The IRQs firing between the check and the 'wait' instruction may set the
> > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > interrupting __r4k_wait() rollback their return address to the
> > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > again before going back to sleep.
> > 
> > However idle IRQs can also queue timers that may require a tick
> > reprogramming through a new generic idle loop iteration but those timers
> > would go unnoticed here because __r4k_wait() only checks
> > TIF_NEED_RESCHED. It doesn't check for pending timers.
> 
> can you give a commit ID, when this change got introduced ?
> 
> > Fix this with fast-forwarding idle IRQs return address to the end of the
> > idle routine instead of the beginning, so that the generic idle loop
> > handles both TIF_NEED_RESCHED and pending timers.
> > 
> > CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
> > There, NOPs are 2 byte in size, so change the code with 3 _ssnop which are
> > always 4 byte and remove the ifdef. Added ehb to make sure the hazard
> > is always cleared.
> > 
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  arch/mips/kernel/genex.S | 42 ++++++++++++++++++++++------------------
> >  arch/mips/kernel/idle.c  |  1 -
> >  2 files changed, 23 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a572ce36a24f..4e012421d00f 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,27 +104,30 @@ handle_vcei:
> >  
> >  	__FINIT
> >  
> > -	.align	5	/* 32 byte rollback region */
> > +	.align	5
> >  LEAF(__r4k_wait)
> >  	.set	push
> >  	.set	noreorder
> > -	/* start of rollback region */
> > -	LONG_L	t0, TI_FLAGS($28)
> > -	nop
> > -	andi	t0, _TIF_NEED_RESCHED
> > -	bnez	t0, 1f
> > -	 nop
> > -	nop
> > -	nop
> > -#ifdef CONFIG_CPU_MICROMIPS
> > -	nop
> > -	nop
> > -	nop
> > -	nop
> > -#endif
> > +	/* Start of idle interrupt region. */
> > +	MFC0	t0, CP0_STATUS
> > +	/* Enable interrupt. */
> > +	ori 	t0, 0x1f
> > +	xori	t0, 0x1e
> > +	MTC0	t0, CP0_STATUS
> > +	_ssnop
> > +	_ssnop
> > +	_ssnop
> > +	_ehb
> >  	.set	MIPS_ISA_ARCH_LEVEL_RAW
> > +	/*
> > +	 * If an interrupt lands here, between enabling interrupts above and
> > +	 * going idle on the next instruction, we must *NOT* go idle since the
> > +	 * interrupt could have set TIF_NEED_RESCHED or caused a timer to need
> > +	 * resched. Fall through -- see rollback_handler below -- and have
> > +	 * the idle loop take care of things.
> > +	 */
> >  	wait
> > -	/* end of rollback region (the region size must be power of two) */
> > +	/* End of idle interrupt region. */
> >  1:
> 
> please give this label a name for example __r4k_wait_exit and do a
> runtime check that it really has 36 bytes offset to __r4k_wait

Where would be the best place for that?

arch/mips/kernel/setup.c:setup_arch() maybe?

Thanks.

