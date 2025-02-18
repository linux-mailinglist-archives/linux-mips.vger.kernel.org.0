Return-Path: <linux-mips+bounces-7827-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F97A3A10D
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 16:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D161700F6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 15:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E2526B94A;
	Tue, 18 Feb 2025 15:23:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B2226B961;
	Tue, 18 Feb 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892205; cv=none; b=NeROiBEqhv1gqvm+HrcB8puYRfR6WAp7xKRxP44znT1nyHXlkuWZWgwiZl8czkpFs82AWAAZQZ+mKprmcrv43/DQhZyaIRVHcUrW93QheeElgeUQ28ZiqIrlEESpGiWzLPnJCiIWyyBV+ohD06hn1UgCNoXjquOhuOS3cP37Gdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892205; c=relaxed/simple;
	bh=ZRzHzw60MPpYpyLscH3ZqbXx+Bz1tkZ5fJIKSb7q0SY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QO+6My0SKvx2XCiCoAUnivrb96tMwfsWKqOmYt00C7kr2FfMmB7ZrsrXhNRshk+V8OL8VQOupyBHo9natVoIgBHEijUn00rquF05KW7SBAvRCNOXTcoFOXrrjxrui9JXBXTT233vaKxe9Nc6R36FITWPKAxpbnIfOFed0sD8SRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 911CE92009C; Tue, 18 Feb 2025 16:23:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8D5B392009B;
	Tue, 18 Feb 2025 15:23:19 +0000 (GMT)
Date: Tue, 18 Feb 2025 15:23:19 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Huacai Chen <chenhuacai@kernel.org>, 
    Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <Z7SQNhL0FYGkX0Ng@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2502181447490.65342@angie.orcam.me.uk>
References: <20250218090203.43137-1-marco.crivellari@suse.com> <20250218090203.43137-2-marco.crivellari@suse.com> <Z7R2GqWOufd8l6NZ@alpha.franken.de> <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com> <Z7SQNhL0FYGkX0Ng@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Thomas Bogendoerfer wrote:

> > > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > > index a572ce36a24f..9747b216648f 100644
> > > > --- a/arch/mips/kernel/genex.S
> > > > +++ b/arch/mips/kernel/genex.S
> > > > @@ -104,25 +104,27 @@ handle_vcei:
> > > >
> > > >       __FINIT
> > > >
> > > > -     .align  5       /* 32 byte rollback region */
> > > > +     .align  5
> > > >  LEAF(__r4k_wait)
> > > >       .set    push
> > > >       .set    noreorder
> > > > -     /* start of rollback region */
> > > > -     LONG_L  t0, TI_FLAGS($28)
> > > > -     nop
> > > > -     andi    t0, _TIF_NEED_RESCHED
> > > > -     bnez    t0, 1f
> > > > -      nop
> > > > -     nop
> > > > -     nop
> > > > -#ifdef CONFIG_CPU_MICROMIPS
> > > > -     nop
> > > > -     nop
> > > > -     nop
> > > > -     nop
> > > > -#endif
> > >
> > > My quick search didnn't find the reason for the extra NOPs on MICROMIPS, but
> > > they are here for a purpose. I might still need them...
> > The original code needs #ifdef CONFIG_CPU_MICROMIPS because nop in
> > MICROMIPS is 2 bytes, so need another four nop to align. But _ssnop is
> > always 4 bytes, so we can remove #ifdefs.
> 
> ic

 This was wrong anyway (and I had arguments about it with people back in 
the time, but it was a hopeless battle).  Instead `.align ...' or an 
equivalent pseudo-op (`.balign', etc.) should have been used, removing the 
fragility of this piece or the need for CONFIG_CPU_MICROMIPS conditional.  
Here and in other places.

> > > > +     _ssnop
> > > > +     _ssnop
> > > > +     _ssnop
> > >
> > > instead of handcoded hazard nops, use __irq_enable_hazard for that
> > No, I don't think so, this region should make sure be 32 bytes on each
> > platform, but __irq_enable_hazard is not consistent, 3 _ssnop is the
> > fallback implementation but available for all MIPS.
> 
> you are right for most cases, but there is one case
> 
> #elif (defined(CONFIG_CPU_MIPSR1) && !defined(CONFIG_MIPS_ALCHEMY)) || \
>         defined(CONFIG_CPU_BMIPS)
> 
> which uses
> 
> #define __irq_enable_hazard                                             \
>         ___ssnop;                                                       \
>         ___ssnop;                                                       \
>         ___ssnop;                                                       \
>         ___ehb
> 
> if MIPSR1 || BMIPS needs "rollback" handler 3 ssnnop would be wrong as
> irq enable hazard.

 Indeed, EHB must always be included, because for R2+ CPUs SSNOP doesn't 
clear the hazard (it never clears, but with earlier CPUs it just stalls 
the pipeline long enough for the hazard to eventually clear by itself).

> > > But I doubt this works, because the wait instruction is not aligned to
> > > a 32 byte boundary, but the code assuemes this, IMHO.
> > Why? After this patch we only use 4 byte instructions.
> 
> I've should have looked at the compiled output, sorry for the noise

 Umm, there's the commit description to document justification for such 
changes made and it's not the reviewer's duty to chase every such detail 
that has been omitted from a submission.

 FAOD this is a request to include this detail in v3.

> Still this construct feels rather fragile.

 I think `.align', etc. can still be used to ensure enough space has been 
consumed and if you want to make a code sequence's size check, then a 
piece such as:

0:
	nop
	nop
	nop
	nop
1:
	.ifne	1b - 0b - 32
	.error	"code consistency verification failure"
	.endif

should do even where alignment does not matter.  And you could possibly do 
smarter stuff with `.rept' if (1b - 0b) turns out below rather than above 
the threshold required, but I'm leaving it as an exercise for the reader.

  Maciej

