Return-Path: <linux-mips+bounces-8805-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1AA9E24C
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 11:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 791757A54C5
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 09:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CED2248865;
	Sun, 27 Apr 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk14C0Z6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250453D3B8;
	Sun, 27 Apr 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745747647; cv=none; b=n9AJx3L7m/8XAJ6MhHGnC9BcAlvGdLkhLKzlnShxo3eSd3ZpgZQ1FmqJ4JEgptNsKmrr3PdmN/VCdXsr+td/soyFQAFoLEgiSBhbQ84+qd4s00GB+RxfV0a6IKS1gi4TeenytHsHZnGBydj8xxuBSSv+RghQmcAcUe0MTgFScu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745747647; c=relaxed/simple;
	bh=lJywy2heovpguXmU4RXA81i8PyjXRqZ9d0GMwK1U8GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P99+p1D95u9BIzhluhXcuPyhCkzYaYZ1eZlx3mqJsTLAr1HNHHL0/N0OXrXbhOOa22HBLDvj0xddhMxhQrm7sN3lWdwZ3jIcKTj9nuvajIkWVwvsu9uaNKgHgmSFGBHOvGa0yE9D0O/jMj7qQJmoFIu9RJE0+SLe5xrfWSONROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk14C0Z6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6A1C4CEEE;
	Sun, 27 Apr 2025 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745747646;
	bh=lJywy2heovpguXmU4RXA81i8PyjXRqZ9d0GMwK1U8GI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dk14C0Z6CUa16mxHCfUfO8KFnrgzSDj9cZSevSs1v0YzK2zKzThHyf+NMQTYl7q44
	 9uM1IbEk7Mw/3f2AcH7A+9YTDALUMoYJfwRNDUNHu2YojafjjfYy0qqT+PVI/tKb8E
	 rNY21xvWOQMFXX3Dag5YW06hbYRNwsn01kyEYOlsrfGVet3IV4CMk4sK2nHLNZ1tFd
	 pCdQOjYNV0+iL//mvpwghV62lyLgM7KblTcTHixOXuGtLe+rrawgoc8s78asuFSwez
	 mqakfNrte3usR5YprLC2lnQP0EM/yM+VScG2wvvbkSjwSCDsHH+W+CxH4i/apCY7/Q
	 vQwrppNbgow5Q==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace98258d4bso106372066b.1;
        Sun, 27 Apr 2025 02:54:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2yurXpnHLHvrLi//RWA0pvZcErm4AAew4Qs8QScZuVGxoDsf1UW90PGpgNoTJZjvboh32k21StdbPvss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNmzS+hfc0xusfJOHHrsk9K4zQExJ3MS+Szs//5y2Esjy3ZP1
	7MRHStdCF+Xajlj+dqEJWE1APi8psLJdv9ZjycIYeesWR761S0IQeos17lW948Y4TtfbvMWub3T
	BPCKh0k2b/FObxdDSMIa/6D3EOCI=
X-Google-Smtp-Source: AGHT+IFdd2EJQ7n8SypqXMqm8qzf6ftGrwF80c/azWJ3IohnTTU+rfmczlWwbqE06/zNhcJM7ZIcoskdFpILELI+8yE=
X-Received: by 2002:a17:906:6a13:b0:ace:6a1e:61e0 with SMTP id
 a640c23a62f3a-ace71105624mr700041466b.25.1745747645198; Sun, 27 Apr 2025
 02:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com> <20250403161143.361461-2-marco.crivellari@suse.com>
In-Reply-To: <20250403161143.361461-2-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 27 Apr 2025 17:53:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6WszbD2o=fUqzz-FcOho-=ZxMQjW3EHKE5z=azntdbeQ@mail.gmail.com>
X-Gm-Features: ATxdqUG7O6UOZTB94ey4wgCL-bRgs7u44phjvOJQ9mMKeiAx0hFOrzW3s2BZXec
Message-ID: <CAAhV-H6WszbD2o=fUqzz-FcOho-=ZxMQjW3EHKE5z=azntdbeQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco and Thomas,

On Fri, Apr 4, 2025 at 12:11=E2=80=AFAM Marco Crivellari
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
> Fixes: c65a5480ff29 ("[MIPS] Fix potential latency problem due to non-ato=
mic cpu_wait.")
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Acked-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  arch/mips/include/asm/idle.h |  3 +-
>  arch/mips/kernel/genex.S     | 62 +++++++++++++++++++++---------------
>  arch/mips/kernel/idle.c      |  7 ----
>  3 files changed, 37 insertions(+), 35 deletions(-)
>
> diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
> index 0992cad9c632..2bc3678455ed 100644
> --- a/arch/mips/include/asm/idle.h
> +++ b/arch/mips/include/asm/idle.h
> @@ -6,8 +6,7 @@
>  #include <linux/linkage.h>
>
>  extern void (*cpu_wait)(void);
> -extern void r4k_wait(void);
> -extern asmlinkage void __r4k_wait(void);
> +extern asmlinkage void r4k_wait(void);
>  extern void r4k_wait_irqoff(void);
>
>  static inline int using_rollback_handler(void)
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..46d975d00298 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,42 +104,52 @@ handle_vcei:
>
>         __FINIT
>
> -       .align  5       /* 32 byte rollback region */
> -LEAF(__r4k_wait)
> -       .set    push
> -       .set    noreorder
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
> +       /* Align to 32 bytes for the maximum idle interrupt region size. =
*/
> +       .align  5
> +LEAF(r4k_wait)
> +       /* Keep the ISA bit clear for calculations on local labels here. =
*/
> +0:     .fill   0
> +       /* Start of idle interrupt region. */
> +       local_irq_enable
> +       /*
> +        * If an interrupt lands here, before going idle on the next
> +        * instruction, we must *NOT* go idle since the interrupt could
> +        * have set TIF_NEED_RESCHED or caused a timer to need resched.
> +        * Fall through -- see rollback_handler below -- and have the
> +        * idle loop take care of things.
> +        */
> +1:     .fill   0
> +       /* The R2 EI/EHB sequence takes 8 bytes, otherwise pad up.  */
> +       .if             1b - 0b > 32
> +       .error  "overlong idle interrupt region"
> +       .elseif 1b - 0b > 8
> +       .align  4
> +       .endif
> +2:     .fill   0
> +       .equ    r4k_wait_idle_size, 2b - 0b
> +       /* End of idle interrupt region; size has to be a power of 2. */
>         .set    MIPS_ISA_ARCH_LEVEL_RAW
> +r4k_wait_insn:
>         wait
> -       /* end of rollback region (the region size must be power of two) =
*/
> -1:
> +r4k_wait_exit:
> +       .set    mips0
> +       local_irq_disable
>         jr      ra
> -        nop
> -       .set    pop
> -       END(__r4k_wait)
> +       END(r4k_wait)
> +       .previous
I'm very sorry for the late response, but I think ".previous" should
be moved to the second patch.

Huacai

>
>         .macro  BUILD_ROLLBACK_PROLOGUE handler
>         FEXPORT(rollback_\handler)
>         .set    push
>         .set    noat
>         MFC0    k0, CP0_EPC
> -       PTR_LA  k1, __r4k_wait
> -       ori     k0, 0x1f        /* 32 byte rollback region */
> -       xori    k0, 0x1f
> +       /* Subtract/add 2 to let the ISA bit propagate through the mask. =
 */
> +       PTR_LA  k1, r4k_wait_insn - 2
> +       ori     k0, r4k_wait_idle_size - 2
> +       .set    noreorder
>         bne     k0, k1, \handler
> +       PTR_ADDIU       k0, r4k_wait_exit - r4k_wait_insn + 2
> +       .set    reorder
>         MTC0    k0, CP0_EPC
>         .set pop
>         .endm
> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
> index 5abc8b7340f8..80e8a04a642e 100644
> --- a/arch/mips/kernel/idle.c
> +++ b/arch/mips/kernel/idle.c
> @@ -35,13 +35,6 @@ static void __cpuidle r3081_wait(void)
>         write_c0_conf(cfg | R30XX_CONF_HALT);
>  }
>
> -void __cpuidle r4k_wait(void)
> -{
> -       raw_local_irq_enable();
> -       __r4k_wait();
> -       raw_local_irq_disable();
> -}
> -
>  /*
>   * This variant is preferable as it allows testing need_resched and goin=
g to
>   * sleep depending on the outcome atomically.  Unfortunately the "It is
> --
> 2.49.0
>

