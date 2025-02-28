Return-Path: <linux-mips+bounces-8033-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A9A49002
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 05:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57B1416E5C9
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 04:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBEF1BEF82;
	Fri, 28 Feb 2025 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7aPGZ5e"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A221BEF77;
	Fri, 28 Feb 2025 04:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715962; cv=none; b=XzvRjvKFpz5RXp/3y0TfLVhPCjSQ9XJ4p30tCSEHpl2aYtq/norv4TsXHsLzgE4L4er91FgOUC9zP1rqZba6gNwc8Xejx2qDPcNVzxINn0Qj2shFKbTwPuVPdMFn2m1uMxADr1iC5MeOJR2RWlfNqC3ObULwb8Ix+RU8fIzXeew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715962; c=relaxed/simple;
	bh=FvZPNbx5Q2m1gAoxzfB4hFFsiiy5F8PtvQBiBlL4Pow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRg1fe9u9E8kt5yjxGaV/bPA8jqU/yOpFu/TsrOJ344XWUGHLmB5hwPhfq0SdKo4sMF0vK0jWC1wl6bgHwpqQLkGgVmfIV3mp2FPF31XCgwzJfwVnYEFnt4OmXUy8iVaChA88M1awxWUannMS9PxNIaq2dcLoBknFylnzWAXDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7aPGZ5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98792C4CEF6;
	Fri, 28 Feb 2025 04:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740715961;
	bh=FvZPNbx5Q2m1gAoxzfB4hFFsiiy5F8PtvQBiBlL4Pow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p7aPGZ5eXgnWu9A0Ea+dKSS08y2a1/EKC3UE/Z2FEipoGmFug6U2/VPCpdALCrbev
	 LWLYgY5slJIp6msFH5PifaBFnncPID5fOt0WPkN12UBhfDZNQvGCOtYxz98AFwQi9r
	 WgAMNScUHgU/QCjIKBdM+8toLz0a69cR+y5wAfUL4XD0c2BeHTwNCj0rzEjg7t/9jk
	 ztjGkYoqwsoe90w5wMaOO2qloHvLVN/nr5b6wbQvI6qWPhBrUhwPfLI8l+1c+B6Thq
	 ulyHRyvkxI9G4GoAz23IVUQD3B6jXfZUXSLnQ7KRRzCbYXuYs+PWcPp/VNturJjJVp
	 +DhyJ3PhSI9Og==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso258047766b.2;
        Thu, 27 Feb 2025 20:12:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEB5g99z1wh0IHEjwCD3kwvUcn+fDyL7M636h6b5wVw2i/Jn2nnGQge0su5sENZJYTmO/CLJqvznRHBEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwQ3NCJufw/Ow6+GDcYlLrhlsRaAR5JoUlNgEpdwjWTCi7C5s
	K8M6utEyfI4tgRpZANLGwXZ2qGO9RbpBDXGAhtQ80u5qvYvot4K3KpufAoHWV2jUUOvsRDUezdg
	Xpe4F+5nVq4ibL1HMjuvt8s41fjY=
X-Google-Smtp-Source: AGHT+IG+IXmafpOkUuzzS8tQrRn3X2e+N/GjztXEBD4K6dhIwhLqaGLVg7e2U/2l0BG19YB0NjX5QGMi2+bDYhFmsMk=
X-Received: by 2002:a17:907:3f25:b0:ab7:b5d9:525a with SMTP id
 a640c23a62f3a-abf265cee06mr203938466b.37.1740715960093; Thu, 27 Feb 2025
 20:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227134539.267169-1-marco.crivellari@suse.com> <20250227134539.267169-2-marco.crivellari@suse.com>
In-Reply-To: <20250227134539.267169-2-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Feb 2025 12:12:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7U1CMrCqWwjYYhuZjD3-Fu7Wi__mUwvjvzLO5bZADr8w@mail.gmail.com>
X-Gm-Features: AQ5f1JoUBrJ2oAhPHBMSw5VZwty-bCqwbvdZHp2bJ-aPgIkFg8cVthJRihCfcAU
Message-ID: <CAAhV-H7U1CMrCqWwjYYhuZjD3-Fu7Wi__mUwvjvzLO5bZADr8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] MIPS: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:45=E2=80=AFPM Marco Crivellari
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
> CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
> There, NOPs are 2 byte in size, so change the code with 3 _ssnop which ar=
e
> always 4 byte and remove the ifdef. Added ehb to make sure the hazard
> is always cleared.
>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  arch/mips/kernel/genex.S | 42 ++++++++++++++++++++++------------------
>  arch/mips/kernel/idle.c  |  1 -
>  2 files changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..5e333cd27fc7 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,27 +104,30 @@ handle_vcei:
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
> -#ifdef CONFIG_CPU_MICROMIPS
> -       nop
> -       nop
> -       nop
> -       nop
> -#endif
> +       /* start of idle interrupt region */
> +       MFC0    t0, CP0_STATUS
> +       /* Enable Interrput */
> +       ori     t0, 0x1f
> +       xori    t0, 0x1e
> +       MTC0    t0, CP0_STATUS
> +       _ssnop
> +       _ssnop
> +       _ssnop
> +       _ehb
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
> +       /* end of rollback region */
Oh, no, still something wrong.... "rollback region" here should be
"idle interrupt region".
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Huacai

>  1:
>         jr      ra
>          nop
> @@ -136,9 +139,10 @@ LEAF(__r4k_wait)
>         .set    push
>         .set    noat
>         MFC0    k0, CP0_EPC
> -       PTR_LA  k1, __r4k_wait
> -       ori     k0, 0x1f        /* 32 byte rollback region */
> -       xori    k0, 0x1f
> +       PTR_LA  k1, 1b
> +       /* 36 byte idle interrupt region */
> +       ori     k0, 0x1f
> +       PTR_ADDIU       k0, 5
>         bne     k0, k1, \handler
>         MTC0    k0, CP0_EPC
>         .set pop
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

