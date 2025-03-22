Return-Path: <linux-mips+bounces-8309-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9637A6CB5F
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 17:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227BF3AE63E
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 16:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CF954654;
	Sat, 22 Mar 2025 16:08:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D296F800;
	Sat, 22 Mar 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742659722; cv=none; b=YVRabFeB9HcTQayM6w1Tk4vaKVtn8kb1KK1pBnJ3XCpfEcKrXyqTDCgEU+whD28mceO7dKV/B+Gbu8ruobhpbA57JmjWka2Ossp3qgmmAAR0aBh86S1UVsXsIrAUoe639RXzZ+GPytDmqZe3TuyHkikMqdcVEZDZxCbvC+zo8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742659722; c=relaxed/simple;
	bh=alYlhJ9jojWIsrw4svfYuHpf6a7KMSPUhMqoXUXZya8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=irKUjxF58OJGL0fzIDeCXeGmb3mHJ+7+9YDtWixBXAIizDjbeOBdtcx8BlFJcT3U/rDEb0BEB8Rp+KUifgb5M97jmsx4PPB16sdYophEq4WYC31+1UTzgWg4Wme/173TSTRWUYg/092tEqlWZ0Ue9AeTCyQXYwtzBa4wByQfAT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 97C0A92009C; Sat, 22 Mar 2025 17:08:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8954192009B;
	Sat, 22 Mar 2025 16:08:31 +0000 (GMT)
Date: Sat, 22 Mar 2025 16:08:31 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Frederic Weisbecker <frederic@kernel.org>
cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <Z93Vj7BLTEvgWwda@pavilion.home>
Message-ID: <alpine.DEB.2.21.2503221516450.35806@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <Z93Vj7BLTEvgWwda@pavilion.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Frederic Weisbecker wrote:

> > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > index a572ce36a24f..4e012421d00f 100644
> > > --- a/arch/mips/kernel/genex.S
> > > +++ b/arch/mips/kernel/genex.S
> > > @@ -104,27 +104,30 @@ handle_vcei:
> > >  
> > >  	__FINIT
> > >  
> > > -	.align	5	/* 32 byte rollback region */
> > > +	.align	5
> > >  LEAF(__r4k_wait)
> > >  	.set	push
> > >  	.set	noreorder
> > > -	/* start of rollback region */
> > > -	LONG_L	t0, TI_FLAGS($28)
> > > -	nop
> > > -	andi	t0, _TIF_NEED_RESCHED
> > > -	bnez	t0, 1f
> > > -	 nop
> > > -	nop
> > > -	nop
> > > -#ifdef CONFIG_CPU_MICROMIPS
> > > -	nop
> > > -	nop
> > > -	nop
> > > -	nop
> > > -#endif
> > > +	/* Start of idle interrupt region. */
> > > +	MFC0	t0, CP0_STATUS
> > > +	/* Enable interrupt. */
> > > +	ori 	t0, 0x1f
> > 
> >  This instruction sequence still suffers from the coprocessor move delay 
> > hazard.  How many times do I need to request to get it fixed (counting 
> > three so far)?
> 
> This is because your request had follow-ups from Huacai and Marco that
> were left unanswered:
> 
>      https://lore.kernel.org/all/CAAhV-H5ptAzHTPAr1bxrgByZrnFmMK8zJ68Z++RwC=NHWjqZmw@mail.gmail.com/

 The conclusion made there is however wrong: `local_irq_enable' code 
plays no tricks with instruction scheduling and lets the toolchain 
resolve any pipeline hazards automatically, while `__r4k_wait' arranges 
for instructions to be scheduled by hand and any hazards resolved by the 
human writer of the code.  There's even explicit `.set reorder' in 
`local_irq_enable', which is redundant, because it's the default mode 
for inline assembly.

 And I can't emphasise it enough: manual instruction scheduling is tough
and ought to be restricted to cases where there is no other way really, 
such as for placing an instruction in a branch delay slot where there is 
a data antidependency between the branch and the delay-slot instruction.  
Yet this approach has often been used by code authors for other reasons 
(or I daresay no reason at all), leaving it up to the maintainers to 
keep the code working in the changing conditions while the submitter has 
long gone.  I converted some of such code in the past, but it also takes 
time and effort that does not come for free.

>      https://lore.kernel.org/all/CAAofZF4HAczyRmuRe-JmQ2wcZatevLwGTOMLf1V1okGbj7q5Wg@mail.gmail.com/

 I missed that one, sorry.  A ping would have helped, and I never have 
an issue with being pinged.  I do hope I have now addressed that concern 
with my other reply.

 Thank you for the pointers.

> We have detected this longstanding architecture specific timer handling bug on
> loongson and MIPS and we could have just dropped a report and let you guys deal with
> it. Instead we decided to spend time ourselves (especially Marco) working on
> fixes for these architectures we don't run and which we are not familiar with,
> alongway taking reviews seriously and patiently re-iterating accordingly.

 Thank you for your effort, really appreciated.  Any fixes need to be 
technically correct however, it makes no sense to get one bug replaced 
with another one.  We've got enough technical debt accumulated already 
with a platform that no longer has any commercial support and relies 
solely on voluteers keeping it alive in their limited spare time.  I do 
have a long list of outstanding issues to address and ever so little 
time to take care of them, with hardware problems additionally kicking 
in and distracting every so often too.

> So please be gentle with us.

 As always, but also emphatic on this occasion.  We're in the same boat 
really, striving against the lack of resources and issues piling, and 
now we've made some progress.  Thank you for your understanding.

  Maciej

