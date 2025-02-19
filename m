Return-Path: <linux-mips+bounces-7846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D86A3AFE1
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 04:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EA0016E91C
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 03:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D6185C5E;
	Wed, 19 Feb 2025 03:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLgVTn4F"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EA128628D;
	Wed, 19 Feb 2025 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739934217; cv=none; b=X3N/tDOSkZL3PDiKZFhx+DVWqhkyjCOyQzm7XwsQSTKR3M+CI2QIj75LyY3WvT/H0afLkn9eLlHJ9twosbHdt3INR9xNeaqiUdFFoSCFwRLzSc5RDy+bG5Tofi1Vqxa7qTiEwuqnZZYe4rWRKlHtKhJwSnQ8RPfR+ZtnyYYSKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739934217; c=relaxed/simple;
	bh=823YSGjZ/fts8Pi6bH2rMVqoh69XMYl9RqrZLvNxu8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRTo5Kyxty/7nLQ5vUWi99TZVkJCpmO8sDD05FUUC7EtDzrIbcaIfWegdIKGZhCMQQKB75VHcXVB3bvg93YEMJG+2QEZYaJxALDEMN5Dwm2ylC555Nj2Y80X3D20aWmGeLM3TdG1/o8ntIPPHrPyT5H5z0U0mTVHEjnHsHgMeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLgVTn4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA279C4CEE7;
	Wed, 19 Feb 2025 03:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739934216;
	bh=823YSGjZ/fts8Pi6bH2rMVqoh69XMYl9RqrZLvNxu8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JLgVTn4FgXFMrOnavtyFMsGJ8f1SeqmyTt857+q9K/pzuzdjFMn+p/pvwDNPb74OD
	 cEK2vlV2d1yqoQwbYjrRMjZwKFWsOhvMbz2n17l6tKRqrk4+zwFs6FYR76ymj2x8WF
	 y8aTjG81BXAS1FeGuvyEP233SRJ8nAHUZ4gSqk7dUpOGSbwJU/iZt6ox7W4jBG/pje
	 6XD23kjDBr5OOSWleXHb2dU9cn/kUo93k6AKJNfG+t1oJpThIw8AN70AzfsKsDcoUV
	 MbNktgNiBVvvoXK1Ns7yf61TJ8+V6GgoRnbTenDH9D5anqAn5Z1vZGEEHVGEG2L5O8
	 orOM0OKa5qr3Q==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso4542674a12.3;
        Tue, 18 Feb 2025 19:03:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/9vBbMKMR4yKTZAT6LccxvKGMQbpT2O4Id6cQpUhPnjzag0tUki2mY6qNmzYq/uPhuH6gzXrtD8z69w==@vger.kernel.org, AJvYcCXXbH3Sse66VcWPe7xum0lgyz1STyI9hcVcfw2TLaKZWZf69dCvsFCBAJoo4X/TQoa0ZapA/nYvWnGMCVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8dCUEGCPGAt2IDdGaLDC0PMWa1yK00MzKBkyxO8gPMHqwcss
	RRqS8H7eMWWvTQwz5MD+nY+dCfgI84EsqBogMiFJtGijprCPAVVd49JVfN0n9ZjMaOhSU1yPyTE
	T9wpEs8nXKZO64EbAfiZidqONG6w=
X-Google-Smtp-Source: AGHT+IE2X9/VM9AUZTraUPRmg4QJ5cYjqTloHovVNqu75KCSz8bGRkLf2c/KZFgTwjSWHd44Akd+FzRmk3bdyyI1Huc=
X-Received: by 2002:a17:906:478d:b0:aba:5e50:6984 with SMTP id
 a640c23a62f3a-abbcccd156amr156510866b.2.1739934215330; Tue, 18 Feb 2025
 19:03:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218090203.43137-1-marco.crivellari@suse.com>
 <20250218090203.43137-2-marco.crivellari@suse.com> <Z7R2GqWOufd8l6NZ@alpha.franken.de>
 <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com> <Z7SQNhL0FYGkX0Ng@alpha.franken.de>
In-Reply-To: <Z7SQNhL0FYGkX0Ng@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Feb 2025 11:03:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cizXw-zta7sW+AKP3UiqRE52K7YdDhH7YoCr=LaCGWA@mail.gmail.com>
X-Gm-Features: AWEUYZnoQ-H6kd4mjCfLOeaxVKSFbu3Y_rLlZZyNV02vMzdET83OZIZqllnOTKY
Message-ID: <CAAhV-H7cizXw-zta7sW+AKP3UiqRE52K7YdDhH7YoCr=LaCGWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 9:51=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Feb 18, 2025 at 08:14:43PM +0800, Huacai Chen wrote:
> > Hi, Thomas,
> >
> > On Tue, Feb 18, 2025 at 7:59=E2=80=AFPM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Tue, Feb 18, 2025 at 10:02:03AM +0100, Marco Crivellari wrote:
> > > > MIPS re-enables interrupts on its idle routine and performs
> > > > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep=
.
> > > >
> > > > The IRQs firing between the check and the 'wait' instruction may se=
t the
> > > > TIF_NEED_RESCHED flag. In order to deal with this possible race, IR=
Qs
> > > > interrupting __r4k_wait() rollback their return address to the
> > > > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > > > again before going back to sleep.
> > > >
> > > > However idle IRQs can also queue timers that may require a tick
> > > > reprogramming through a new generic idle loop iteration but those t=
imers
> > > > would go unnoticed here because __r4k_wait() only checks
> > > > TIF_NEED_RESCHED. It doesn't check for pending timers.
> > > >
> > > > Fix this with fast-forwarding idle IRQs return address to the end o=
f the
> > > > idle routine instead of the beginning, so that the generic idle loo=
p
> > > > handles both TIF_NEED_RESCHED and pending timers.
> > > >
> > > > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > > > ---
> > > >  arch/mips/kernel/genex.S | 39 +++++++++++++++++++++---------------=
---
> > > >  arch/mips/kernel/idle.c  |  1 -
> > > >  2 files changed, 21 insertions(+), 19 deletions(-)
> > > >
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
> > > My quick search didnn't find the reason for the extra NOPs on MICROMI=
PS, but
> > > they are here for a purpose. I might still need them...
> > The original code needs #ifdef CONFIG_CPU_MICROMIPS because nop in
> > MICROMIPS is 2 bytes, so need another four nop to align. But _ssnop is
> > always 4 bytes, so we can remove #ifdefs.
>
> ic
>
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
Emm, this is a problem. I think we can add _ehb after 3 _ssnop. And
then change the below "daddiu k0, 1" to "PTR_ADDIU k0, 5".

Maybe there is a better solution, but I think this is the simplest.

Huacai

>
> > > But I doubt this works, because the wait instruction is not aligned t=
o
> > > a 32 byte boundary, but the code assuemes this, IMHO.
> > Why? After this patch we only use 4 byte instructions.
>
> I've should have looked at the compiled output, sorry for the noise
>
> Still this construct feels rather fragile.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

