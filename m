Return-Path: <linux-mips+bounces-7772-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B1A360C5
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 15:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C18D170763
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106D526659A;
	Fri, 14 Feb 2025 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDog0RD0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9902641F7;
	Fri, 14 Feb 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739544425; cv=none; b=VN8WE3nZebmj6d24E/7q80jCgVimbmIcdf4lQF8rSS/Y5e4EdZPPsKCEUCykxStNNj4RTWv7Z66d21f0qmwIrQ2+WDFbY+xP3crcbnajej/ezkbH4xBoO3ekd84fW9O1sTAkr8J9npPtd6Eh8M4/BamdleoGXasH1R3ZmGh5m+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739544425; c=relaxed/simple;
	bh=SyLU6IbvipwhDabpk1usdLGba4ULwr4q4Ssvnk0UWkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB1z762kv4Jvb0m1hKz3u8o2+7B0osLZzEOt1zRnW2aclcFNH/EvceMIDLtJ1I6AtfRYaziPoaVAZVC0NhZdRqe4+/pjDXBsP+mH7lPWH89QtguJD/TEX/eW2MZ5keLBtnf4M7B0Poj74Xw45sNf9grGu+1Kfbip/X26+XfGl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDog0RD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52213C4CEDF;
	Fri, 14 Feb 2025 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739544424;
	bh=SyLU6IbvipwhDabpk1usdLGba4ULwr4q4Ssvnk0UWkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XDog0RD0zyKTUqYTNfkdQ9i5DtlIr2wbzNHfRbfGqX0mkCexjvzTruiY/kjLnK8J3
	 +xH+ahja8v4AX7rkW+0b3hBsG/sk1t09wxK/YXH6ACQ80OKnOY4xCcAl28f3ciXFkP
	 5CAzKyvRKHHgEsgGaUZSbZt5JJtd9iYjqmmcJIRp5bMjgw+gXz5IUGpl5En7yEMPFf
	 xjphbfPTs8wXkwHjl5yxGzCFjHH5G8yc6YzWFCpjVzdcNJQq2+7tLopdDeJaXsGf0A
	 hivuSAu0ZxLSIb3xI5SY1oHsdMWfXQHLxC70x4cIIjvQbGZc299L6eP7Xw9Nwv+OP5
	 jb61l0lRfE7aA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso4308616a12.0;
        Fri, 14 Feb 2025 06:47:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/SX+kW9A3mmRrSgRpPzqg5RahHe/B9ZFEHf9gycvGzu6sklMEZjBx1IbtO9uLnGpo/0b8OcxrR1WK+xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YylHGuoEwUfk2o24cpiOWKeb5F+szqQZWZvGuUv74mr+w4qv3Vi
	CAfICTQr4zt3bc0Vfdds+e6x54UUl+0NpqHO0zMFh3sR2Iml8vxzcr7OJ5j2PmsP75l3eWimLC3
	GhWpjyCY1D4Zf254Vic6pDxzU4Ao=
X-Google-Smtp-Source: AGHT+IGLP2hfLxyhDNLDMFXVxFjF7thUSuEvL0i10rfKHQr5NwdBRqYExxq+8zSv4dyiGdV3AS67Or9gUJzpXwcXVXo=
X-Received: by 2002:a17:907:770f:b0:abb:2e65:96f7 with SMTP id
 a640c23a62f3a-abb2e660cd1mr57018866b.43.1739544422884; Fri, 14 Feb 2025
 06:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214105047.150835-1-marco.crivellari@suse.com> <20250214105047.150835-2-marco.crivellari@suse.com>
In-Reply-To: <20250214105047.150835-2-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Feb 2025 22:46:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qY9FOm4C4kBCerM4j+CcezL-Dkitb8gbVZCYjjCxQDA@mail.gmail.com>
X-Gm-Features: AWEUYZnwAMKYhkoagxpnGYT5f00p8m0OnzKLWg0cGlI_vqI7kw1yteYhWCjuifs
Message-ID: <CAAhV-H4qY9FOm4C4kBCerM4j+CcezL-Dkitb8gbVZCYjjCxQDA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco,

On Fri, Feb 14, 2025 at 6:51=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> MIPS re-enables interrupts on its idle routine and performs
> a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
>
> The IRQs firing between the check and the 'wait' instruction may set the
> TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> interrupting __r4k_wait() rollback their return address to the
> beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> again before going back to sleep.
>
> However idle IRQs can also queue timers that may require a tick
> reprogramming through a new generic idle loop iteration but those timers
> would go unnoticed here because __r4k_wait() only checks
> TIF_NEED_RESCHED. It doesn't check for pending timers.
>
> Fix this with fast-forwarding idle IRQs return address to the end of the
> idle routine instead of the beginning, so that the generic idle loop
> handles both TIF_NEED_RESCHED and pending timers.
>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  arch/mips/kernel/genex.S | 36 ++++++++++++++++++++----------------
>  arch/mips/kernel/idle.c  |  1 -
>  2 files changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..a78d5132c940 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,18 +104,16 @@ handle_vcei:
>
>         __FINIT
>
> -       .align  5       /* 32 byte rollback region */
> +       .align  5
>  LEAF(__r4k_wait)
>         .set    push
>         .set    noreorder
> -       /* start of rollback region */
> -       LONG_L  t0, TI_FLAGS($28)
> -       nop
> -       andi    t0, _TIF_NEED_RESCHED
> -       bnez    t0, 1f
> -        nop
> -       nop
> -       nop
> +       /* start of idle interrupt region */
> +       MFC0    k0, CP0_STATUS
> +       /* Enable Interrupt */
> +       ori     k0, 0x1f
> +       xori    k0, 0x1e
> +       MTC0    k0, CP0_STATUS
>  #ifdef CONFIG_CPU_MICROMIPS
>         nop
>         nop
> @@ -123,11 +121,17 @@ LEAF(__r4k_wait)
>         nop
>  #endif
>         .set    MIPS_ISA_ARCH_LEVEL_RAW
> +       /*
> +        * If an interrupt lands here, between enabling interrupts above =
and
> +        * going idle on the next instruction, we must *NOT* go idle sinc=
e the
> +        * interrupt could have set TIF_NEED_RESCHED or caused a timer to=
 need
> +        * resched. Fall through -- see rollback_handler below -- and hav=
e
> +        * the idle loop take care of things.
> +        */
>         wait
> -       /* end of rollback region (the region size must be power of two) =
*/
> -1:
> +       /* end of idle interrupt region (the region size must be power of=
 two) */
> +SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)
You can also use label 1 as the LoongArch version.

>         jr      ra
> -        nop
>         .set    pop
>         END(__r4k_wait)
>
> @@ -136,10 +140,10 @@ LEAF(__r4k_wait)
>         .set    push
>         .set    noat
>         MFC0    k0, CP0_EPC
> -       PTR_LA  k1, __r4k_wait
> -       ori     k0, 0x1f        /* 32 byte rollback region */
> -       xori    k0, 0x1f
> -       bne     k0, k1, \handler
> +       PTR_LA  k1, __r4k_wait_exit
> +       /* 3 instructions rollback region */
For MIPS the rollback region is not 3 instructions, and so you cannot
use 0xc below. I think there is no chance for the wait instruction
after this patch.

Huacai

> +       ori     k0, k0, 0x0c
> +       bne     k0, k1, \handler
>         MTC0    k0, CP0_EPC
>         .set pop
>         .endm
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 5abc8b7340f8..1f74c0589f7e 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -37,7 +37,6 @@ static void __cpuidle r3081_wait(void)
>
>  void __cpuidle r4k_wait(void)
>  {
> -       raw_local_irq_enable();
>         __r4k_wait();
>         raw_local_irq_disable();
>  }
> --
> 2.48.1
>
>

