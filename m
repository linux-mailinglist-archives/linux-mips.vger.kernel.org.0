Return-Path: <linux-mips+bounces-7785-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC29EA36EDB
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2025 15:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6723F16E5DA
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2025 14:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEA41C863B;
	Sat, 15 Feb 2025 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZwh9tB7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94971624F4;
	Sat, 15 Feb 2025 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739630509; cv=none; b=H9u3CG1e29aEwWyASx/dCHprkewZKvJtal0a7j9hgYDVCydMiHrXV3D/IZiGQSan3WHNTNA+FMAfEDhuwGy6frTwB85DQ4AWMqA4qnYATw79S2yGCgYLWrk0mliXaVhvyeaoDc2nyPbI9NiVYoDCnJpPZZUFf6AV9G1yxynzkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739630509; c=relaxed/simple;
	bh=cMALQlkfyrmyqy4FynTTKBGjYkiowL4RZo6my42A0kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJlytVZ/uFU47K9b3ZAzGU7HdSBInCCGBbO4M/WPTXdI1BwfOnDeHTMAleQ6xLEnEfCBq9Qlag5MA6IS5Z19sFlXPKVwRzbUsygtld8QwRcABvE+ZiLqfj1R8ibkzIDTeiNHe0CjxFh08EtY/Ort0TLch6/2pu8xyT233LYWjuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZwh9tB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614C3C4CEE8;
	Sat, 15 Feb 2025 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739630508;
	bh=cMALQlkfyrmyqy4FynTTKBGjYkiowL4RZo6my42A0kc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cZwh9tB7S2+Y/xS76LfYmbVFHr62MNf1jpmTu9YmyIqE6JcWAEjepIRkbVjdH5WRs
	 3SP10Q95MkIrzS0ReTT8aRo1yLDcqymYnVhTLlkLiuObc9UNQlEZslDYLZeQf2xHRw
	 BbDyovC8/0iUd0oieHzCJJHkLC4t2ywDSa9sXhGPhi4kEdjavgEQkqQEdAhrfbPcxd
	 d8LK8BXatYjCn3ozpkSAOnH4/Rldy8eSJ64HZoFCNqiuHMLts3apUnOz4W7/7in9p6
	 PBlCUczwpYXs1wFWAei9WohqbXgVpIj7+mqBUeMI24+491QdsKk5lhEknOMRJO4KEZ
	 8tb1b8whakQWQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so4841566a12.3;
        Sat, 15 Feb 2025 06:41:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGQ/2mjYqbNOsjrWXdwIIUAk64zwWTsEif4Jp3l5U91+uB2M2Nlpi3JPfniJ5lolGiI9+cAmE8t50S+MI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/pqCd+SzMM58fJMV3c6lw3d9p9jEMonTJGoDFdf39TDYt3QwV
	+3hZP+vnyNsSHZ1U1fAj+55eAkdMD7TfXClXjADpy0LlMv6CMyYM6hlqAbKLrf6XVqK+jOdbiRN
	M0D4fTM+hjm8rhsf2emn+cl50yTk=
X-Google-Smtp-Source: AGHT+IE1EPbH7/8VeD3zieHEsJaiCvQtDLdoGz4sII10N0CcaqbTTsAeMXIJt7fbjMx/ojA+wytmk7ilSy6dYqZvYxg=
X-Received: by 2002:a17:907:72d2:b0:ab3:ed0:8d7 with SMTP id
 a640c23a62f3a-abb70b869efmr280397366b.23.1739630506827; Sat, 15 Feb 2025
 06:41:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214105047.150835-1-marco.crivellari@suse.com>
 <20250214105047.150835-2-marco.crivellari@suse.com> <CAAhV-H4qY9FOm4C4kBCerM4j+CcezL-Dkitb8gbVZCYjjCxQDA@mail.gmail.com>
 <CAAofZF4PVYehyonsmyTC=gKTgucs-jZYzzoQ2dvFcqK9YgsKVw@mail.gmail.com>
In-Reply-To: <CAAofZF4PVYehyonsmyTC=gKTgucs-jZYzzoQ2dvFcqK9YgsKVw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Feb 2025 22:41:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7bTHmbY13eiUR47Q4kcbb7VSU__WqY56WzSkmP6vYwZA@mail.gmail.com>
X-Gm-Features: AWEUYZl0r-ydt010uYZuzP-JtdhqkVHS9FeD6aCv2KYWelXAKwy9VS6b3Xq9d5o
Message-ID: <CAAhV-H7bTHmbY13eiUR47Q4kcbb7VSU__WqY56WzSkmP6vYwZA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 11:57=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Hi, thanks for the replies!
>
> Huacai: I used the '1' label when I compiled the first time, but I
> noticed this warning, so I decided to use the label to avoid this:
>
> "WARNING: modpost: vmlinux: section mismatch in reference:
> rollback_except_vec_vi+0x4 (section: .text) -> except_vec4 (section:
> .init.text)"
>
> By the way, I will use the 1 label like you suggested.
>
> > For MIPS the rollback region is not 3 instructions, and so you cannot
> > use 0xc below. I think there is no chance for the wait instruction
> > after this patch.
>
> About this, does it look better if i don't change this part of the
> code (except for PTR_LA  k1, 1b) ?
> eg.
>
> @@ -136,7 +144,7 @@ LEAF(__r4k_wait)
>        .set    push
>        .set    noat
>        MFC0    k0, CP0_EPC
> -       PTR_LA  k1, __r4k_wait
> +       PTR_LA  k1, 1b
>        ori     k0, 0x1f        /* 32 byte rollback region */
>        xori    k0, 0x1f
>        bne     k0, k1, \handler
>
> So the real change would be:
>
> -       /* start of rollback region */
> -       LONG_L  t0, TI_FLAGS($28)
> +       /* start of idle interrupt region */
> +       MFC0    k0, CP0_STATUS
>        nop
> -       andi    t0, _TIF_NEED_RESCHED
> -       bnez    t0, 1f
> -        nop
> +       /* Enable Interrupt */
> +       ori     k0, 0x1f
> +       xori    k0, 0x1e
> +       MTC0    k0, CP0_STATUS
>        nop
>        nop
>
> Maybe what I'm going to say is silly...
> But considering the region should be a power of 2, maybe can also be
> changed with:
> ori   k0, 0x0f
> addi  k0, 1
>
> Thanks for your time!
I think you didn't get my key point, and maybe also didn't get
Maciej's point, I paste my whole changes here which is tested on real
hardware.

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index b6de8e88c1bd..4b55115160f0 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -104,25 +104,27 @@ handle_vcei:

        __FINIT

-       .align  5       /* 32 byte rollback region */
+       .align  5
 LEAF(__r4k_wait)
        .set    push
        .set    noreorder
-       /* start of rollback region */
-       LONG_L  t0, TI_FLAGS($28)
-       nop
-       andi    t0, _TIF_NEED_RESCHED
-       bnez    t0, 1f
-        nop
-       nop
-       nop
-#ifdef CONFIG_CPU_MICROMIPS
-       nop
-       nop
-       nop
-       nop
-#endif
+       /* start of idle interrupt region */
+       MFC0    t0, CP0_STATUS
+       /* Enable Interrupt */
+       ori     t0, 0x1f
+       xori    t0, 0x1e
+       MTC0    t0, CP0_STATUS
+       _ssnop
+       _ssnop
+       _ssnop
        .set    MIPS_ISA_ARCH_LEVEL_RAW
+       /*
+        * If an interrupt lands here, between enabling interrupts above an=
d
+        * going idle on the next instruction, we must *NOT* go idle since =
the
+        * interrupt could have set TIF_NEED_RESCHED or caused a timer to n=
eed
+        * resched. Fall through -- see rollback_handler below -- and have
+        * the idle loop take care of things.
+        */
        wait
        /* end of rollback region (the region size must be power of two) */
 1:
@@ -136,9 +138,10 @@ LEAF(__r4k_wait)
        .set    push
        .set    noat
        MFC0    k0, CP0_EPC
-       PTR_LA  k1, __r4k_wait
-       ori     k0, 0x1f        /* 32 byte rollback region */
-       xori    k0, 0x1f
+       PTR_LA  k1, 1b
+       /* 32 byte idle interrupt region */
+       ori     k0, 0x1f
+       daddiu  k0, 1
        bne     k0, k1, \handler
        MTC0    k0, CP0_EPC
        .set pop
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 5abc8b7340f8..1f74c0589f7e 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -37,7 +37,6 @@ static void __cpuidle r3081_wait(void)

 void __cpuidle r4k_wait(void)
 {
-       raw_local_irq_enable();
        __r4k_wait();
        raw_local_irq_disable();
 }

Huacai

>
> On Fri, Feb 14, 2025 at 3:47=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Marco,
> >
> > On Fri, Feb 14, 2025 at 6:51=E2=80=AFPM Marco Crivellari
> > <marco.crivellari@suse.com> wrote:
> > >
> > > MIPS re-enables interrupts on its idle routine and performs
> > > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> > >
> > > The IRQs firing between the check and the 'wait' instruction may set =
the
> > > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > > interrupting __r4k_wait() rollback their return address to the
> > > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > > again before going back to sleep.
> > >
> > > However idle IRQs can also queue timers that may require a tick
> > > reprogramming through a new generic idle loop iteration but those tim=
ers
> > > would go unnoticed here because __r4k_wait() only checks
> > > TIF_NEED_RESCHED. It doesn't check for pending timers.
> > >
> > > Fix this with fast-forwarding idle IRQs return address to the end of =
the
> > > idle routine instead of the beginning, so that the generic idle loop
> > > handles both TIF_NEED_RESCHED and pending timers.
> > >
> > > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > > ---
> > >  arch/mips/kernel/genex.S | 36 ++++++++++++++++++++----------------
> > >  arch/mips/kernel/idle.c  |  1 -
> > >  2 files changed, 20 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > index a572ce36a24f..a78d5132c940 100644
> > > --- a/arch/mips/kernel/genex.S
> > > +++ b/arch/mips/kernel/genex.S
> > > @@ -104,18 +104,16 @@ handle_vcei:
> > >
> > >         __FINIT
> > >
> > > -       .align  5       /* 32 byte rollback region */
> > > +       .align  5
> > >  LEAF(__r4k_wait)
> > >         .set    push
> > >         .set    noreorder
> > > -       /* start of rollback region */
> > > -       LONG_L  t0, TI_FLAGS($28)
> > > -       nop
> > > -       andi    t0, _TIF_NEED_RESCHED
> > > -       bnez    t0, 1f
> > > -        nop
> > > -       nop
> > > -       nop
> > > +       /* start of idle interrupt region */
> > > +       MFC0    k0, CP0_STATUS
> > > +       /* Enable Interrupt */
> > > +       ori     k0, 0x1f
> > > +       xori    k0, 0x1e
> > > +       MTC0    k0, CP0_STATUS
> > >  #ifdef CONFIG_CPU_MICROMIPS
> > >         nop
> > >         nop
> > > @@ -123,11 +121,17 @@ LEAF(__r4k_wait)
> > >         nop
> > >  #endif
> > >         .set    MIPS_ISA_ARCH_LEVEL_RAW
> > > +       /*
> > > +        * If an interrupt lands here, between enabling interrupts ab=
ove and
> > > +        * going idle on the next instruction, we must *NOT* go idle =
since the
> > > +        * interrupt could have set TIF_NEED_RESCHED or caused a time=
r to need
> > > +        * resched. Fall through -- see rollback_handler below -- and=
 have
> > > +        * the idle loop take care of things.
> > > +        */
> > >         wait
> > > -       /* end of rollback region (the region size must be power of t=
wo) */
> > > -1:
> > > +       /* end of idle interrupt region (the region size must be powe=
r of two) */
> > > +SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)
> > You can also use label 1 as the LoongArch version.
> >
> > >         jr      ra
> > > -        nop
> > >         .set    pop
> > >         END(__r4k_wait)
> > >
> > > @@ -136,10 +140,10 @@ LEAF(__r4k_wait)
> > >         .set    push
> > >         .set    noat
> > >         MFC0    k0, CP0_EPC
> > > -       PTR_LA  k1, __r4k_wait
> > > -       ori     k0, 0x1f        /* 32 byte rollback region */
> > > -       xori    k0, 0x1f
> > > -       bne     k0, k1, \handler
> > > +       PTR_LA  k1, __r4k_wait_exit
> > > +       /* 3 instructions rollback region */
> > For MIPS the rollback region is not 3 instructions, and so you cannot
> > use 0xc below. I think there is no chance for the wait instruction
> > after this patch.
> >
> > Huacai
> >
> > > +       ori     k0, k0, 0x0c
> > > +       bne     k0, k1, \handler
> > >         MTC0    k0, CP0_EPC
> > >         .set pop
> > >         .endm
> > > diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> > > index 5abc8b7340f8..1f74c0589f7e 100644
> > > --- a/arch/mips/kernel/idle.c
> > > +++ b/arch/mips/kernel/idle.c
> > > @@ -37,7 +37,6 @@ static void __cpuidle r3081_wait(void)
> > >
> > >  void __cpuidle r4k_wait(void)
> > >  {
> > > -       raw_local_irq_enable();
> > >         __r4k_wait();
> > >         raw_local_irq_disable();
> > >  }
> > > --
> > > 2.48.1
> > >
> > >
>
>
>
> --
>
> Marco Crivellari
>
> L3 Support Engineer, Technology & Product
>
>
>
>
> marco.crivellari@suse.com

