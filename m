Return-Path: <linux-mips+bounces-7774-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FABA36270
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 16:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E000518936B8
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 15:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449AD26738A;
	Fri, 14 Feb 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Obkl0/L1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F223D2673A6
	for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739548658; cv=none; b=UviIPvvXX7eWRBUhCHxaFh8l9TnAFVbWYrtZ0zpgI3OK/pkrIf6Ozi5D769GoTGgUMKfYm1SV6Lp1XOUUspuWTpIHw7TqNvmhDTjhOre9uLFidjD18apVhspt5473f5YRPMr/h+4jQv/iyFMCNcq8ZjG2iZadamYJtkJ2AVj0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739548658; c=relaxed/simple;
	bh=D1wbEsB7TFyizka/IHeRNqhm2Jh1CbExzVJuyDFMVEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbkPNqDp6lfUrKAIhQ/EK66blAj+dWHSbKcYgXQZToFOwP96xmjYd2VQtzx52y5sou6I1wAP8MJURwV8u0WPjKGg/GK1o+WXRx6L2WRIu7u3keeN8KnNc7bEMz3VtrC2rC7sAPLJeKx/RGgd0p1QALWpQJuhfKYz8+ryJNeDJqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Obkl0/L1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452c2805bcso698912e87.2
        for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 07:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739548654; x=1740153454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHx17WFnnFivJUIFv2m7lVrUVyw09kYPGsIsDDqzOlQ=;
        b=Obkl0/L1x2AiN7doUxuzjyi0YeaCXQArwsDYJJLgVvCZes/rl7E1XKWDht/ipvDzRw
         hLTH3D52oNM0lIlQxkpmi0py1tSSAauL2dNlaPpCbff6hELXVrAg0FefXJPs1J/0Yz/G
         qoitE9y2dWuox0PRZrwvkZN1NXh1MyGbLAh36ZjmT0Sm+y//k7XT+FSgGIaxjbLjZXpw
         M8MzYevFpiKxMyo0TSoM+zRdtPd+RhxnqQjIw/Q0Xf0r8SXhJGBAooiSOqfe0NSvDzJS
         /Dv1JMzao1KCiXUts3qz/UcwIr1KOO4rIdpaOlI2MSxSIZJ7riwlWjDKCvL09OE9NzK0
         4SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739548654; x=1740153454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHx17WFnnFivJUIFv2m7lVrUVyw09kYPGsIsDDqzOlQ=;
        b=iC6P3w6V9yJaSXuvrbnZuDnZp/v4ozGxUjsXWpFs9goltDcqS5MIpgKr3HXMcirMqx
         0j6GwHxT/0mrcghoxrx6tPguewQTCKCNQEL0gCkAa7et2kynacPfcNBtqDrqq352pSrN
         i41wjwGOz44frspqD7b4o+eCrDsD9Tvl8eIsA6RZBzmV78HJT2XuT0bznc5JT+Y+42cB
         JhCbKUlcXho4Sw1dsI8SyaiUOJ0BNY9JkiVir7L46WY5rrK+/oKXNQMTS74or1GuIT9z
         aqHPAvA3RhPjs9Azfwc90ON+Ho8XoyvIIlcvCXw8zum+Hb7fy0DXPgsOPC3cC2aWgyp7
         s/zw==
X-Gm-Message-State: AOJu0Yw0yx+L61s+3WmLwzd49ISAq64EdcSYTkYeDiZqAn4aG05EQZGt
	nwZy1sXa3dDOVwBqmkic4bPMA9Hb4xpiwSjmDwatY9sErWotdvRXiQeF/iWol0lrIT6t+EDpGON
	ap7T5g+S1edul9BGCnNIFI11ufbRd6nIy13E74w==
X-Gm-Gg: ASbGncvYr6HY2xOcLeIVEaewwlsdzIqnY/edp9vtHsTyX7SsyutRm2ZoGQUhRuVN3bu
	velfQxW/2K2EonJxiuUyE/GapmW2Fu9XmO90F6GMiPXOKkvrNnuzv9jte5sSiUOzLVPXXiYMKQu
	eiWWIA6sj9xYpsfZV1ACbltslqVBYkDw==
X-Google-Smtp-Source: AGHT+IF6cLtumKw5gwUmJWDnoposzLT4HXNcBKi3JpGDWlZkrz1UmThgne6q7oRD/FA6ofAqMRYp7Q+YqVZLueSHux0=
X-Received: by 2002:a05:6512:1111:b0:545:6cf:6f3e with SMTP id
 2adb3069b0e04-5451dde81aemr2973561e87.49.1739548653921; Fri, 14 Feb 2025
 07:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214105047.150835-1-marco.crivellari@suse.com>
 <20250214105047.150835-2-marco.crivellari@suse.com> <CAAhV-H4qY9FOm4C4kBCerM4j+CcezL-Dkitb8gbVZCYjjCxQDA@mail.gmail.com>
In-Reply-To: <CAAhV-H4qY9FOm4C4kBCerM4j+CcezL-Dkitb8gbVZCYjjCxQDA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 14 Feb 2025 16:57:22 +0100
X-Gm-Features: AWEUYZk6Vjn3NzgRt01zDBdJAFiUfGq908c3RjrX1jgAjpL0SbUS3Wge4zdYVXs
Message-ID: <CAAofZF4PVYehyonsmyTC=gKTgucs-jZYzzoQ2dvFcqK9YgsKVw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix idle VS timer enqueue
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thanks for the replies!

Huacai: I used the '1' label when I compiled the first time, but I
noticed this warning, so I decided to use the label to avoid this:

"WARNING: modpost: vmlinux: section mismatch in reference:
rollback_except_vec_vi+0x4 (section: .text) -> except_vec4 (section:
.init.text)"

By the way, I will use the 1 label like you suggested.

> For MIPS the rollback region is not 3 instructions, and so you cannot
> use 0xc below. I think there is no chance for the wait instruction
> after this patch.

About this, does it look better if i don't change this part of the
code (except for PTR_LA  k1, 1b) ?
eg.

@@ -136,7 +144,7 @@ LEAF(__r4k_wait)
       .set    push
       .set    noat
       MFC0    k0, CP0_EPC
-       PTR_LA  k1, __r4k_wait
+       PTR_LA  k1, 1b
       ori     k0, 0x1f        /* 32 byte rollback region */
       xori    k0, 0x1f
       bne     k0, k1, \handler

So the real change would be:

-       /* start of rollback region */
-       LONG_L  t0, TI_FLAGS($28)
+       /* start of idle interrupt region */
+       MFC0    k0, CP0_STATUS
       nop
-       andi    t0, _TIF_NEED_RESCHED
-       bnez    t0, 1f
-        nop
+       /* Enable Interrupt */
+       ori     k0, 0x1f
+       xori    k0, 0x1e
+       MTC0    k0, CP0_STATUS
       nop
       nop

Maybe what I'm going to say is silly...
But considering the region should be a power of 2, maybe can also be
changed with:
ori   k0, 0x0f
addi  k0, 1

Thanks for your time!

On Fri, Feb 14, 2025 at 3:47=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Marco,
>
> On Fri, Feb 14, 2025 at 6:51=E2=80=AFPM Marco Crivellari
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
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  arch/mips/kernel/genex.S | 36 ++++++++++++++++++++----------------
> >  arch/mips/kernel/idle.c  |  1 -
> >  2 files changed, 20 insertions(+), 17 deletions(-)
> >
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a572ce36a24f..a78d5132c940 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,18 +104,16 @@ handle_vcei:
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
> > +       /* start of idle interrupt region */
> > +       MFC0    k0, CP0_STATUS
> > +       /* Enable Interrupt */
> > +       ori     k0, 0x1f
> > +       xori    k0, 0x1e
> > +       MTC0    k0, CP0_STATUS
> >  #ifdef CONFIG_CPU_MICROMIPS
> >         nop
> >         nop
> > @@ -123,11 +121,17 @@ LEAF(__r4k_wait)
> >         nop
> >  #endif
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
> > -       /* end of rollback region (the region size must be power of two=
) */
> > -1:
> > +       /* end of idle interrupt region (the region size must be power =
of two) */
> > +SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)
> You can also use label 1 as the LoongArch version.
>
> >         jr      ra
> > -        nop
> >         .set    pop
> >         END(__r4k_wait)
> >
> > @@ -136,10 +140,10 @@ LEAF(__r4k_wait)
> >         .set    push
> >         .set    noat
> >         MFC0    k0, CP0_EPC
> > -       PTR_LA  k1, __r4k_wait
> > -       ori     k0, 0x1f        /* 32 byte rollback region */
> > -       xori    k0, 0x1f
> > -       bne     k0, k1, \handler
> > +       PTR_LA  k1, __r4k_wait_exit
> > +       /* 3 instructions rollback region */
> For MIPS the rollback region is not 3 instructions, and so you cannot
> use 0xc below. I think there is no chance for the wait instruction
> after this patch.
>
> Huacai
>
> > +       ori     k0, k0, 0x0c
> > +       bne     k0, k1, \handler
> >         MTC0    k0, CP0_EPC
> >         .set pop
> >         .endm
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
> >



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

