Return-Path: <linux-mips+bounces-8018-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0CBA47CB1
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 12:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FA361891790
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C654227B9C;
	Thu, 27 Feb 2025 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ou/6+bJf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84EA1662EF;
	Thu, 27 Feb 2025 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740657406; cv=none; b=cmrnVAJVxThk5VqNOwz6ZrRgCg0V1uLVHLbJ9mwc4DQ1j2MMAe/ZCXuNkhDInxAd7bA12TPpEDWJ7V3uNPjD0mn2bF+5Fz/RWtj8EmPiJKyZPissbqKfIDI83g22RFwpugddQuRPIdmeIxhGzc9QQj7b1pLYOcKaUQO9ix9ugQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740657406; c=relaxed/simple;
	bh=NJIOgMUndKNbaY8JtwzbXcjzluNdFWYYBygt5gf1tMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgJaNeY7yiJ1TyyV9kOC7oa4rijp0VmDFpDWyIkfJivGQ50GQBinn7ZuosbRTlNSOEhCKFDHZi2O6/sK6eP6TYz/GAc4Xiwp6d2qLNtTfuhhiSMrSdFQnJgwYyHKpMwgEpk6JLHnL1k7+nFrbIbQJjBfsHFHzTcJ+KH0D2KYtgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ou/6+bJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB8DC4CEE5;
	Thu, 27 Feb 2025 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740657405;
	bh=NJIOgMUndKNbaY8JtwzbXcjzluNdFWYYBygt5gf1tMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ou/6+bJfpEoa3LZ40lYvYY5yJqRy2fuhsMqYc2nMBTewlGUUE04gU/93I3bZqx6Nh
	 R6q6GvlOQEhmYUkwmxOnMHD9SHxvbwCB6wHklGK10G1TiNjIHyh9A/IV20FDrUNcB5
	 KmTrCOj+Gdp6Issoo6wNh61Bbl3g/fPnDTh5bO1nNWZXfgtkw8SF74oJiI/JCmlfwT
	 CU+bm6lD6VV9B/2FS/2oibOcA9nkRSTSuD9yDPhqjWogbYiMwwqFxhCH2t749vUqhX
	 FXw4+lIa4uGZKkw265gZhvRjlN+QQRQ7tOPt2ULxSLWGXD8V9baxIt4M1z2sR46wSg
	 7LkO6AONH5n1g==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaec61d0f65so171336166b.1;
        Thu, 27 Feb 2025 03:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiHVtm1g2ndC7ruiOpYZ+G6GAYRLzw2TrJ5y88jcocFRsulbDtJxSB2aVR8WR8EUVYb8RoOVb9tsaYcFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/fnUPVl/mtsyBdJtKgi549B2AEjnoNH/qdNnbkeawWxbE7ar
	JSr5FCKNmT7h1RTKi4pIREYtRNLo0nuTYcoLHIZPE3N8YshOwwxGI0WdD24RbvrWkbXs6gFHu1V
	pQFov8K0+CjmuYgTBUwKItAjYEow=
X-Google-Smtp-Source: AGHT+IGA2K8S/HeiixN2R52w/wwpaeLWfR+Y0JOToC7MAkRZKjv8VmBSrBgT5vmHkQvWdA7TJ0f0BYVK2+L8Kj99HNo=
X-Received: by 2002:a17:907:98b:b0:abb:b209:aba6 with SMTP id
 a640c23a62f3a-abed0c5c015mr1459880066b.3.1740657403912; Thu, 27 Feb 2025
 03:56:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227114141.242421-1-marco.crivellari@suse.com> <20250227114141.242421-2-marco.crivellari@suse.com>
In-Reply-To: <20250227114141.242421-2-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Feb 2025 19:56:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4MVzL6A6_nxPHTX-2XpaA8tgH56P_R9_RNDp2PFY5W+Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jpw9PynXc7rGbAkxp8BotJHSfLZ36Pg3n2p7v-OL0ZdAdxp4wL9cUETLPA
Message-ID: <CAAhV-H4MVzL6A6_nxPHTX-2XpaA8tgH56P_R9_RNDp2PFY5W+Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] MIPS: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco,

On Thu, Feb 27, 2025 at 7:41=E2=80=AFPM Marco Crivellari
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
>  arch/mips/kernel/genex.S | 40 ++++++++++++++++++++++------------------
>  arch/mips/kernel/idle.c  |  1 -
>  2 files changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..7b66ab239049 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,25 +104,28 @@ handle_vcei:
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
>         /* end of rollback region (the region size must be power of two) =
*/
Now you add a _ehb in this version, so "(the region size must be power
of two)" should be removed.

>  1:
> @@ -136,9 +139,10 @@ LEAF(__r4k_wait)
>         .set    push
>         .set    noat
>         MFC0    k0, CP0_EPC
> -       PTR_LA  k1, __r4k_wait
> -       ori     k0, 0x1f        /* 32 byte rollback region */
> -       xori    k0, 0x1f
> +       PTR_LA  k1, 1b
> +       /* 32 byte idle interrupt region */
And now the region is 36 bytes. :)

Huacai

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

