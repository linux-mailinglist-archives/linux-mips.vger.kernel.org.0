Return-Path: <linux-mips+bounces-8024-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4EA47F5F
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 14:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B6F16BCDD
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DB622D4F9;
	Thu, 27 Feb 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OYvCZrDj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F692206AC
	for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663290; cv=none; b=nmfz7CdZV6g6OvVK8zNaF9VoXs3o2XIRpZPSiaMCZ7LhAKeCheE0FSC/PYZ0Sub0pqkhGa1PNluyOtN5rcd5JCOdNYmCVp2a1f9rthb+rPKn3S82LC7uJV4c3TsN4WWTxS5D3At1ubsDZKKqqYlhnZ2cQVh8xzD7XU9zHtDK4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663290; c=relaxed/simple;
	bh=0M2WmYjO1xgOd0eFwiKYedB9fY112jhiSfw4FJkXC6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUmdGCxTfrxkoHzwqWts5TWxXDvlA+wZ1/U+u3StbX/yzcCGJjNjvnek8WSy2guWWjKhZMbCPdXgLfNYNP1y2YnO3Al8wOHZCvFYRXD0SvCrBg+UMCUKBTcT2belPhVfw4HE+RQtwdeGKf1gECsURB4Rau1PIvbPV6/QB8TCGhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OYvCZrDj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5462ea9691cso988187e87.2
        for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740663286; x=1741268086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiVrC1DW5CsgsTGK3acbzw2cH0RgjFdHaGDXEJuK9h0=;
        b=OYvCZrDjjm5KXRegAtU2wU+KgFizQi18mzsDlBu43RR3rwqdDHmdkAMHIh9GTeNUSR
         Flsi3fk53/bFJ74dMtNJnn+Y9qWjT5d9Obf6g4FUle/WhAHHLA6ZWg2f72TL0AXuTWWy
         9UV4ckqusBP0nXBsEAdbOrwYkDzf+aWUaKKlOYs/2W6E/cmVhaq/YeVbs2HcvqbTYJIN
         ZkoKw4JX24kxkcvM3saSbX42ggPiPncOqeDYw1MAGkvADwYBZQPr0uHBlIo9AvWYsHmT
         xZuuNDTSFzLtnfIMyi/WslZjczqPM3He6EW5CJQk5XRimuOvKSkx3VblfHNEqntZXLhB
         bcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663286; x=1741268086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiVrC1DW5CsgsTGK3acbzw2cH0RgjFdHaGDXEJuK9h0=;
        b=UlAikp3b5T2SRtwPZMRUTOWjc8lbpwikhZLY0FpFDiSs3CtLG73rm4SVjzdkzscVeD
         AN/Aa7ipP3libQNAImzCXkFSTI1+t8L0TsStfI7edg+lZAp704rZeRTTo3EZeKVpX5/3
         UE7bfQ9eiEDxUjjwmz6xkI1oI+S7RZ83MpWWcFRkCuKeJC+V56Nrb//kjsvkD7KSe6Lu
         DrN7u4Z7KAKLwYIat1JJM4hY1ePZQXZz1i6w7DIrslUUh08hcAqgbf6aZMa5h5e1wLSh
         eyDe2YNMeEUr91e2b0xYAe9lU9Oj8h3qlthYRaZEExUVBznsTasRSpfQsx8unmM26U9g
         39SQ==
X-Gm-Message-State: AOJu0YzyOw76SvUc6SdGJqUcdsrRGJUKDI3ienx//F6PYRIXKF8GRX4E
	Pa5g65Ph4KKpx/Umhgnn7ZHqVBBoN7LEwuhOF+OASDgI6VlkF0bx26l8ZgE7poSjDACs8RJqMGA
	i+ZXAhh7iCrnUc6mqy/Ll1vYCySxkSJ4Qjsq8ew==
X-Gm-Gg: ASbGncuUpHbt53bpiTzCcFcFrlW588V1KVgS4JJ+6owPxhZDmT3SgCF114r0U2Yue6W
	+q7Ig11D9746mMZ0ewC09MSHN01KXZOlC+DTTG6dKUqSa+orPhP8U+jra5tDRJkO6zlXTNWQzGQ
	xY2BCVFP8XivG7Q+y6/Jfg5gh1AUFo1LovLfvBzoUx
X-Google-Smtp-Source: AGHT+IEMYsWO2UIj0uiCuxX0dhE2DmSJ//u+MeU1Hr0gD69Zne7Tj0URYXPsU1WOs0JmyPPuY5gjM6VLHyGQ1Y3kV0g=
X-Received: by 2002:a05:6512:3a82:b0:545:271d:f92 with SMTP id
 2adb3069b0e04-5493c57ef04mr4211562e87.25.1740663286036; Thu, 27 Feb 2025
 05:34:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227114141.242421-1-marco.crivellari@suse.com>
 <20250227114141.242421-2-marco.crivellari@suse.com> <CAAhV-H4MVzL6A6_nxPHTX-2XpaA8tgH56P_R9_RNDp2PFY5W+Q@mail.gmail.com>
In-Reply-To: <CAAhV-H4MVzL6A6_nxPHTX-2XpaA8tgH56P_R9_RNDp2PFY5W+Q@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 27 Feb 2025 14:34:35 +0100
X-Gm-Features: AQ5f1JoC2nl_WtMTZXWtXGvEMS_G_IxHiXHcjmzOeEHpt9wlGnQYVBm3RfDjQPo
Message-ID: <CAAofZF7bZDJcDBqUanFxnnbxkiAeDkv60=NGXnT+5cbHfye2=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] MIPS: Fix idle VS timer enqueue
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

sorry, I completely forgot to check the comments!





On Thu, Feb 27, 2025 at 12:56=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Marco,
>
> On Thu, Feb 27, 2025 at 7:41=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
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
> > CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
> > There, NOPs are 2 byte in size, so change the code with 3 _ssnop which =
are
> > always 4 byte and remove the ifdef. Added ehb to make sure the hazard
> > is always cleared.
> >
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  arch/mips/kernel/genex.S | 40 ++++++++++++++++++++++------------------
> >  arch/mips/kernel/idle.c  |  1 -
> >  2 files changed, 22 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a572ce36a24f..7b66ab239049 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,25 +104,28 @@ handle_vcei:
> >
> >         __FINIT
> >
> > -       .align  5       /* 32 byte rollback region */
> > +       .align  5
> >  LEAF(__r4k_wait)
> >         .set    push
> >         .set    noreorder
> > -       /* start of rollback region */
> > -       LONG_L  t0, TI_FLAGS($28)
> > -       nop
> > -       andi    t0, _TIF_NEED_RESCHED
> > -       bnez    t0, 1f
> > -        nop
> > -       nop
> > -       nop
> > -#ifdef CONFIG_CPU_MICROMIPS
> > -       nop
> > -       nop
> > -       nop
> > -       nop
> > -#endif
> > +       /* start of idle interrupt region */
> > +       MFC0    t0, CP0_STATUS
> > +       /* Enable Interrput */
> > +       ori     t0, 0x1f
> > +       xori    t0, 0x1e
> > +       MTC0    t0, CP0_STATUS
> > +       _ssnop
> > +       _ssnop
> > +       _ssnop
> > +       _ehb
> >         .set    MIPS_ISA_ARCH_LEVEL_RAW
> > +       /*
> > +        * If an interrupt lands here, between enabling interrupts abov=
e and
> > +        * going idle on the next instruction, we must *NOT* go idle si=
nce the
> > +        * interrupt could have set TIF_NEED_RESCHED or caused a timer =
to need
> > +        * resched. Fall through -- see rollback_handler below -- and h=
ave
> > +        * the idle loop take care of things.
> > +        */
> >         wait
> >         /* end of rollback region (the region size must be power of two=
) */
> Now you add a _ehb in this version, so "(the region size must be power
> of two)" should be removed.
>
> >  1:
> > @@ -136,9 +139,10 @@ LEAF(__r4k_wait)
> >         .set    push
> >         .set    noat
> >         MFC0    k0, CP0_EPC
> > -       PTR_LA  k1, __r4k_wait
> > -       ori     k0, 0x1f        /* 32 byte rollback region */
> > -       xori    k0, 0x1f
> > +       PTR_LA  k1, 1b
> > +       /* 32 byte idle interrupt region */
> And now the region is 36 bytes. :)
>
> Huacai
>
> > +       ori     k0, 0x1f
> > +       PTR_ADDIU       k0, 5
> >         bne     k0, k1, \handler
> >         MTC0    k0, CP0_EPC
> >         .set pop
> > diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> > index 5abc8b7340f8..1f74c0589f7e 100644
> > --- a/arch/mips/kernel/idle.c
> > +++ b/arch/mips/kernel/idle.c
> > @@ -37,7 +37,6 @@ static void __cpuidle r3081_wait(void)
> >
> >  void __cpuidle r4k_wait(void)
> >  {
> > -       raw_local_irq_enable();
> >         __r4k_wait();
> >         raw_local_irq_disable();
> >  }
> > --
> > 2.48.1
> >



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

