Return-Path: <linux-mips+bounces-7816-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E07A39BFF
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83F93A6611
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DF4241CA9;
	Tue, 18 Feb 2025 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNc4iIhi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC452417FE;
	Tue, 18 Feb 2025 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880895; cv=none; b=PdspIIEs1QfLYvPxtoQCqxg7IG9hNpPvRWRd4C/VSIvnbJg7vMWIWwIl+yfV/sNfjdaXe2DcS1RaFh1TJ+PSTUsA+lxdc/DlK7//0V0Wc1y54MQk0fhBaGK9Qi6cz54E0S/q5xugOOtE1Zy2NpsbdTTVtRQx8Oo/hkLmu/6OF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880895; c=relaxed/simple;
	bh=LTSo8Agy/nExTYTZxbEQAoh8tLG/nA+3zjIYwRAUxOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5WU6LFhvc8cOAI3Nx1S9zJid4dS4cSOC57X/HeM6ltNXWywykv9yPjo6DyDjIwDKh7zdHyzePo2K0UqcXoh7nSsSxjy9i2RpOycf9Fh4bBztOJomxQNSrMaWD1Z8cmb5V7JGzyaaDxPA0UISv/MpLtuEEww8JLH9H7eGE8y+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNc4iIhi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82EBC4AF09;
	Tue, 18 Feb 2025 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739880894;
	bh=LTSo8Agy/nExTYTZxbEQAoh8tLG/nA+3zjIYwRAUxOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KNc4iIhi3cVv69cNHNKZxG2ndFAoTf+xQChFSzej5gDGl78A1f+NFM4boLd/14Xnf
	 4Cb1pC09fLgU61LTYdw4r2DJLwW8lKP6/5whtiu0mqy67ACH7qzqeDLwZAjdxLDwcI
	 ALw6KZvb+ulRJx1xmEpHRYETq+FcmhWyB5itezRbcDk2GqbMXabhsn5F5R5mn4ILzd
	 qPjYoYUcfq6rzVS0TAg/PuKwpDSgzQXLqN5P5qDaKwJJp/1GjcUKhjqfLUtSnR6PsL
	 1tq3z6cCOChkFbVOnI6TlGdue3L/K9Mgeb1gJWPywHMqbO6JIh3kuNXMT6zdlSeJEu
	 bCa73vShHVYgw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so8664629a12.2;
        Tue, 18 Feb 2025 04:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU15yYh9FnljtXYXwcAy04mip8l7O68FOTQMNM4lQUO1eTUChj2HUSmsOrh8A9qlqgVBGYcykTdLrmAg==@vger.kernel.org, AJvYcCXuPVVu76IjTfsw7DjaZQX+KRY7pLhc3e209sDfs4+vj1nlntk0t1LrzAHpliOqaM3tElOcB2kMl6M+cpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEHsYHuJpGLwsT3K9zV3PESG8PcUGfNBJDn3DHhdhlLCS925b
	jRUjp0BzGuzcXh0KqcV2WOJvkj9h3K5Qbi70tHuPo2hrX32zKnai+tDKf67ytKzWVyYyeFqqpje
	UpM8m48Gzi5OFrZDo5mSv0nKeKm4=
X-Google-Smtp-Source: AGHT+IFuVGG1XrvqcLnNLAY/HGhENwIbMXMdpev+Al2TfN7nR/foQLjCn1Urh26wF6Kee88QiO/aEEw8X6lVOn1D3WY=
X-Received: by 2002:a17:906:4786:b0:aa6:9503:aa73 with SMTP id
 a640c23a62f3a-abb70df5273mr1369897766b.51.1739880893475; Tue, 18 Feb 2025
 04:14:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218090203.43137-1-marco.crivellari@suse.com>
 <20250218090203.43137-2-marco.crivellari@suse.com> <Z7R2GqWOufd8l6NZ@alpha.franken.de>
In-Reply-To: <Z7R2GqWOufd8l6NZ@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Feb 2025 20:14:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com>
X-Gm-Features: AWEUYZnJtQB_vmOMbs3Rk6htt3KbMOglHsH-NuzM3O91b2KozwB66g7OsNzds8w
Message-ID: <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

On Tue, Feb 18, 2025 at 7:59=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Feb 18, 2025 at 10:02:03AM +0100, Marco Crivellari wrote:
> > MIPS re-enables interrupts on its idle routine and performs
> > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> >
> > The IRQs firing between the check and the 'wait' instruction may set th=
e
> > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > interrupting __r4k_wait() rollback their return address to the
> > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > again before going back to sleep.
> >
> > However idle IRQs can also queue timers that may require a tick
> > reprogramming through a new generic idle loop iteration but those timer=
s
> > would go unnoticed here because __r4k_wait() only checks
> > TIF_NEED_RESCHED. It doesn't check for pending timers.
> >
> > Fix this with fast-forwarding idle IRQs return address to the end of th=
e
> > idle routine instead of the beginning, so that the generic idle loop
> > handles both TIF_NEED_RESCHED and pending timers.
> >
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  arch/mips/kernel/genex.S | 39 +++++++++++++++++++++------------------
> >  arch/mips/kernel/idle.c  |  1 -
> >  2 files changed, 21 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a572ce36a24f..9747b216648f 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,25 +104,27 @@ handle_vcei:
> >
> >       __FINIT
> >
> > -     .align  5       /* 32 byte rollback region */
> > +     .align  5
> >  LEAF(__r4k_wait)
> >       .set    push
> >       .set    noreorder
> > -     /* start of rollback region */
> > -     LONG_L  t0, TI_FLAGS($28)
> > -     nop
> > -     andi    t0, _TIF_NEED_RESCHED
> > -     bnez    t0, 1f
> > -      nop
> > -     nop
> > -     nop
> > -#ifdef CONFIG_CPU_MICROMIPS
> > -     nop
> > -     nop
> > -     nop
> > -     nop
> > -#endif
>
> My quick search didnn't find the reason for the extra NOPs on MICROMIPS, =
but
> they are here for a purpose. I might still need them...
The original code needs #ifdef CONFIG_CPU_MICROMIPS because nop in
MICROMIPS is 2 bytes, so need another four nop to align. But _ssnop is
always 4 bytes, so we can remove #ifdefs.

>
> > +     /* start of idle interrupt region */
> > +     MFC0    t0, CP0_STATUS
> > +     /* Enable Interrput */
> > +     ori     t0, 0x1f
> > +     xori    t0, 0x1e
> > +     MTC0    t0, CP0_STATUS
> > +     _ssnop
> > +     _ssnop
> > +     _ssnop
>
> instead of handcoded hazard nops, use __irq_enable_hazard for that
No, I don't think so, this region should make sure be 32 bytes on each
platform, but __irq_enable_hazard is not consistent, 3 _ssnop is the
fallback implementation but available for all MIPS.

>
> >       .set    MIPS_ISA_ARCH_LEVEL_RAW
> > +     /*
> > +      * If an interrupt lands here, between enabling interrupts above =
and
> > +      * going idle on the next instruction, we must *NOT* go idle sinc=
e the
> > +      * interrupt could have set TIF_NEED_RESCHED or caused a timer to=
 need
> > +      * resched. Fall through -- see rollback_handler below -- and hav=
e
> > +      * the idle loop take care of things.
> > +      */
> >       wait
> >       /* end of rollback region (the region size must be power of two) =
*/
> >  1:
> > @@ -136,9 +138,10 @@ LEAF(__r4k_wait)
> >       .set    push
> >       .set    noat
> >       MFC0    k0, CP0_EPC
> > -     PTR_LA  k1, __r4k_wait
> > -     ori     k0, 0x1f        /* 32 byte rollback region */
> > -     xori    k0, 0x1f
> > +     PTR_LA  k1, 1b
> > +     /* 32 byte idle interrupt region */
> > +     ori     k0, 0x1f
> > +     daddiu  k0, 1
>
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S: Assembler messa=
ges:
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S:151: Error: opco=
de not supported on this processor: mips32r2 (mips32r2) `daddiu $26,1'
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S:271: Error: opco=
de not supported on this processor: mips32r2 (mips32r2) `daddiu $26,1'
>
> looks like you haven't compiled this code for 32bit. Use PTR_ADDIU, which
> will use the correct instuction for 32 and 64bit.
Sorry, this is my mistake.

>
> But I doubt this works, because the wait instruction is not aligned to
> a 32 byte boundary, but the code assuemes this, IMHO.
Why? After this patch we only use 4 byte instructions.


Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

