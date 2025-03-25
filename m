Return-Path: <linux-mips+bounces-8343-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB98A7029E
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2824D3B9C2F
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE74258CCD;
	Tue, 25 Mar 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQ4xG7Yp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8A1DE8B4;
	Tue, 25 Mar 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742909484; cv=none; b=UpIytnRlgbefpSg+hBo5LX7nZGQqUr5WA8fXD8ZqQRU/E0ZEOgGZQIZQOD8VFlIyELuYNVeaOdjMX5nnHnwsHSniA/F0CH/qxy2cmLd95w+ESs9FDIHb8ZZi4G4AsQ7nbLPP6wa/Qw157f6VAgFrr264j7DaDYC2vdbKFV8NBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742909484; c=relaxed/simple;
	bh=q4pxLc2dsJbpfFd+rTznh5LCvEgCmB34/vWrz6De0hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9TK2kPk0vj0bGv1hq1iB1q3Y03g2+quPtR8VH98VZRV0uzzQ0Pwqy4R0d+oN/CCqy8a8WikhkkTxgUm8X+nX6WRd2AbWjXKQqzZylEGH+s2U6UU0+8WHtIlHed59pTUtnFjDVfKyZeESYFGWdNqhiAr/kihYj88tQ1bawBGA9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQ4xG7Yp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47520C4CEE4;
	Tue, 25 Mar 2025 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742909483;
	bh=q4pxLc2dsJbpfFd+rTznh5LCvEgCmB34/vWrz6De0hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQ4xG7YpFCzolFz84asQ+QJ82OXo1g1LtIlsQlOWhhRwD+nk18Wd8Jf0edbDo3O9U
	 NW7lerGkosc0mN4dYIHBovNJkXACPYbipALjVO2ZHIwln7oZH/Fn4QsB6ikndNydrQ
	 8tJOOrGbO2B0JqCZO7Hiu73r+TsSCSR/SlKwVd3uj65HDnWj15IAgPrZOdq3OHh8Uq
	 Rlfa9zMdWSdlHsvZWyIy0iRF/W6OsruZyjF2sIADhDZ9WpP5ufT0B/s9aOZkSr9lHB
	 LQhpsKOsKzFlk8Em3jsjGHeiPBQdq02DDHw2lxomba7WgCi9tuBMnmiSWmrekqVOac
	 I6tI1K4JAQB9A==
Date: Tue, 25 Mar 2025 14:31:20 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z-KwKACJQhH98EoW@localhost.localdomain>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <Z93Vj7BLTEvgWwda@pavilion.home>
 <alpine.DEB.2.21.2503221516450.35806@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2503221516450.35806@angie.orcam.me.uk>

Le Sat, Mar 22, 2025 at 04:08:31PM +0000, Maciej W. Rozycki a écrit :
> On Fri, 21 Mar 2025, Frederic Weisbecker wrote:
> 
> > > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > > index a572ce36a24f..4e012421d00f 100644
> > > > --- a/arch/mips/kernel/genex.S
> > > > +++ b/arch/mips/kernel/genex.S
> > > > @@ -104,27 +104,30 @@ handle_vcei:
> > > >  
> > > >  	__FINIT
> > > >  
> > > > -	.align	5	/* 32 byte rollback region */
> > > > +	.align	5
> > > >  LEAF(__r4k_wait)
> > > >  	.set	push
> > > >  	.set	noreorder
> > > > -	/* start of rollback region */
> > > > -	LONG_L	t0, TI_FLAGS($28)
> > > > -	nop
> > > > -	andi	t0, _TIF_NEED_RESCHED
> > > > -	bnez	t0, 1f
> > > > -	 nop
> > > > -	nop
> > > > -	nop
> > > > -#ifdef CONFIG_CPU_MICROMIPS
> > > > -	nop
> > > > -	nop
> > > > -	nop
> > > > -	nop
> > > > -#endif
> > > > +	/* Start of idle interrupt region. */
> > > > +	MFC0	t0, CP0_STATUS
> > > > +	/* Enable interrupt. */
> > > > +	ori 	t0, 0x1f
> > > 
> > >  This instruction sequence still suffers from the coprocessor move delay 
> > > hazard.  How many times do I need to request to get it fixed (counting 
> > > three so far)?
> > 
> > This is because your request had follow-ups from Huacai and Marco that
> > were left unanswered:
> > 
> >      https://lore.kernel.org/all/CAAhV-H5ptAzHTPAr1bxrgByZrnFmMK8zJ68Z++RwC=NHWjqZmw@mail.gmail.com/
> 
>  The conclusion made there is however wrong: `local_irq_enable' code 
> plays no tricks with instruction scheduling and lets the toolchain 
> resolve any pipeline hazards automatically, while `__r4k_wait' arranges 
> for instructions to be scheduled by hand and any hazards resolved by the 
> human writer of the code.  There's even explicit `.set reorder' in 
> `local_irq_enable', which is redundant, because it's the default mode 
> for inline assembly.
> 
>  And I can't emphasise it enough: manual instruction scheduling is tough
> and ought to be restricted to cases where there is no other way really, 
> such as for placing an instruction in a branch delay slot where there is 
> a data antidependency between the branch and the delay-slot instruction.  
> Yet this approach has often been used by code authors for other reasons 
> (or I daresay no reason at all), leaving it up to the maintainers to 
> keep the code working in the changing conditions while the submitter has 
> long gone.  I converted some of such code in the past, but it also takes 
> time and effort that does not come for free.
> 
> >      https://lore.kernel.org/all/CAAofZF4HAczyRmuRe-JmQ2wcZatevLwGTOMLf1V1okGbj7q5Wg@mail.gmail.com/
> 
>  I missed that one, sorry.  A ping would have helped, and I never have 
> an issue with being pinged.  I do hope I have now addressed that concern 
> with my other reply.

Hopefully, I'll let Marco follow-up on that as I must confess I'm lost
with these details. But your help has been very valuable!

> 
> > We have detected this longstanding architecture specific timer handling bug on
> > loongson and MIPS and we could have just dropped a report and let you guys deal with
> > it. Instead we decided to spend time ourselves (especially Marco) working on
> > fixes for these architectures we don't run and which we are not familiar with,
> > alongway taking reviews seriously and patiently re-iterating accordingly.
> 
>  Thank you for your effort, really appreciated.  Any fixes need to be 
> technically correct however, it makes no sense to get one bug replaced 
> with another one.  We've got enough technical debt accumulated already 
> with a platform that no longer has any commercial support and relies 
> solely on voluteers keeping it alive in their limited spare time.  I do 
> have a long list of outstanding issues to address and ever so little 
> time to take care of them, with hardware problems additionally kicking 
> in and distracting every so often too.

Yeah I totally understand that!

> 
> > So please be gentle with us.
> 
>  As always, but also emphatic on this occasion.  We're in the same boat 
> really, striving against the lack of resources and issues piling, and 
> now we've made some progress.  Thank you for your understanding.

Heh I know... Thanks a lot!

> 
>   Maciej

