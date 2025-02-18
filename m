Return-Path: <linux-mips+bounces-7825-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FBA39DFE
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 14:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5FBF173019
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA9B2417E6;
	Tue, 18 Feb 2025 13:51:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BB3238D42;
	Tue, 18 Feb 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739886664; cv=none; b=ht93FRXFRPxAmKEr99PPHW4SL2hz7zRD07OdB5DhZlVSMAWeRZr6DdDw2/iNgt/CeEqqDLOECyX5ZVIRjKHwb/kYXoN8PyYfOZ5fR1wmwpSCabndZdwnxfcDTgUGYzKrkfXYjgEMoDSrH86RprowOrtZUw5RZ7+k0ONtsvYbGkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739886664; c=relaxed/simple;
	bh=Svyq+hoIa69MUfHkJrjLQz9GxkX+VevwbxKnKao3l+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEBtyftNLzsAbNSeCYlAzWqpLSt0CZTKReKDrI1eabkjn7DdDhjFJVzD7tioPOsp10aJq6sm5CqNa9lXkyx/NN5+7MY6+8ioY3kAZG/6SjAJqXs3pAcbnPbgzt8tlb8AmYvd1UlcCtBjC7zsO0UFrugjQz5E/vP6ayeIwGWOXt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tkO01-00054x-00; Tue, 18 Feb 2025 14:50:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AD83BC0135; Tue, 18 Feb 2025 14:50:46 +0100 (CET)
Date: Tue, 18 Feb 2025 14:50:46 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z7SQNhL0FYGkX0Ng@alpha.franken.de>
References: <20250218090203.43137-1-marco.crivellari@suse.com>
 <20250218090203.43137-2-marco.crivellari@suse.com>
 <Z7R2GqWOufd8l6NZ@alpha.franken.de>
 <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com>

On Tue, Feb 18, 2025 at 08:14:43PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Tue, Feb 18, 2025 at 7:59 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Tue, Feb 18, 2025 at 10:02:03AM +0100, Marco Crivellari wrote:
> > > MIPS re-enables interrupts on its idle routine and performs
> > > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> > >
> > > The IRQs firing between the check and the 'wait' instruction may set the
> > > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > > interrupting __r4k_wait() rollback their return address to the
> > > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > > again before going back to sleep.
> > >
> > > However idle IRQs can also queue timers that may require a tick
> > > reprogramming through a new generic idle loop iteration but those timers
> > > would go unnoticed here because __r4k_wait() only checks
> > > TIF_NEED_RESCHED. It doesn't check for pending timers.
> > >
> > > Fix this with fast-forwarding idle IRQs return address to the end of the
> > > idle routine instead of the beginning, so that the generic idle loop
> > > handles both TIF_NEED_RESCHED and pending timers.
> > >
> > > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > > ---
> > >  arch/mips/kernel/genex.S | 39 +++++++++++++++++++++------------------
> > >  arch/mips/kernel/idle.c  |  1 -
> > >  2 files changed, 21 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > index a572ce36a24f..9747b216648f 100644
> > > --- a/arch/mips/kernel/genex.S
> > > +++ b/arch/mips/kernel/genex.S
> > > @@ -104,25 +104,27 @@ handle_vcei:
> > >
> > >       __FINIT
> > >
> > > -     .align  5       /* 32 byte rollback region */
> > > +     .align  5
> > >  LEAF(__r4k_wait)
> > >       .set    push
> > >       .set    noreorder
> > > -     /* start of rollback region */
> > > -     LONG_L  t0, TI_FLAGS($28)
> > > -     nop
> > > -     andi    t0, _TIF_NEED_RESCHED
> > > -     bnez    t0, 1f
> > > -      nop
> > > -     nop
> > > -     nop
> > > -#ifdef CONFIG_CPU_MICROMIPS
> > > -     nop
> > > -     nop
> > > -     nop
> > > -     nop
> > > -#endif
> >
> > My quick search didnn't find the reason for the extra NOPs on MICROMIPS, but
> > they are here for a purpose. I might still need them...
> The original code needs #ifdef CONFIG_CPU_MICROMIPS because nop in
> MICROMIPS is 2 bytes, so need another four nop to align. But _ssnop is
> always 4 bytes, so we can remove #ifdefs.

ic

> > > +     _ssnop
> > > +     _ssnop
> > > +     _ssnop
> >
> > instead of handcoded hazard nops, use __irq_enable_hazard for that
> No, I don't think so, this region should make sure be 32 bytes on each
> platform, but __irq_enable_hazard is not consistent, 3 _ssnop is the
> fallback implementation but available for all MIPS.

you are right for most cases, but there is one case

#elif (defined(CONFIG_CPU_MIPSR1) && !defined(CONFIG_MIPS_ALCHEMY)) || \
        defined(CONFIG_CPU_BMIPS)

which uses

#define __irq_enable_hazard                                             \
        ___ssnop;                                                       \
        ___ssnop;                                                       \
        ___ssnop;                                                       \
        ___ehb

if MIPSR1 || BMIPS needs "rollback" handler 3 ssnnop would be wrong as
irq enable hazard.

> > But I doubt this works, because the wait instruction is not aligned to
> > a 32 byte boundary, but the code assuemes this, IMHO.
> Why? After this patch we only use 4 byte instructions.

I've should have looked at the compiled output, sorry for the noise

Still this construct feels rather fragile.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

