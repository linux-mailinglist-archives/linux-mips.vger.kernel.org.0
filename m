Return-Path: <linux-mips+bounces-8420-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2B9A763DD
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 12:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9BE168253
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 10:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907721DF248;
	Mon, 31 Mar 2025 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A/QVcg1l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA471DE2DE
	for <linux-mips@vger.kernel.org>; Mon, 31 Mar 2025 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415877; cv=none; b=BcbNQVcPaF5MrWUv3DtbKN3MuSw1xhKdUrTzb/P1/A1R3nctEQ4BJ6eU1TfrofmCLWrtnEcfLYZTB8jPjKTtp+fw25q1/ZVOq4609f/vEeHTPytMdpRzwD6o8GxXP8QItc/lB3CcpbDUlv6FQvj49nG7VCEEdINGjLcF6QUm/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415877; c=relaxed/simple;
	bh=4E+rqgzOPii8ZkaNY96euQo75I4gKZ0UoY92dEzqulk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsmAeyqvaRE5WwEKyjdg+G9oQbvdO/d3q3RS+mhDMwlLjdqLZOC1wZFFAymaAFjA7Bw52jdKXgsycNYeGIbCk9UnXKiOAieoRcLCx1DezJtmYEtUbx1FG43Z0HYUDl/cMoZxnaq5foOxJq5vYP1ujkaHt5tquO+xX7JPRfUGBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A/QVcg1l; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54963160818so4695550e87.2
        for <linux-mips@vger.kernel.org>; Mon, 31 Mar 2025 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743415873; x=1744020673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVu7eDCoTYIi6WEGQxF3gwr4ie8yk6mI7q0l1JApErg=;
        b=A/QVcg1luRX9lUno4RAZdWPHKMoDsTakRchZJp02VejGrmikdMNbzXEnD4c1lTn1Bi
         kVIKLwqY/+276UvGz+jMQbaGlyKQaFkYHjrTkPpz8ilVjYCjuqTDmTYlSAaX+4wJ38Nx
         EE7/ZYgmApdrnQPDs+HQSjiQD37vJrNM92UxfOYhN3XGzVBmKtSPrGWVs26IgFXr/C7q
         4YqOs/q+NlDRtoX6mr3H2UKjEcKwzlplI5zEAl4EANWDFxp76dJSgcdUgAKtf1D9NnPE
         /+IQvG50VAHvJ9Iy7TufdR5vjItqKMnEgALqlLWkEUetN3K7ztVHjNnHCg1r++v7Q94Y
         /vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415873; x=1744020673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVu7eDCoTYIi6WEGQxF3gwr4ie8yk6mI7q0l1JApErg=;
        b=kMmSFAQjjZ7R8fEQJ7+WtjOOBlna3MCQ4oBBOkkGQtOnMJn9wzetx+gjwcHoM7LnpO
         AGWl5NmN1kZtyRj2KWiM7gL5Ni3utKIKCSWpqs3eQrC5drzSt8ig8q7DQQB7T3X3+XH8
         zxK6VkW1wvUzUMabqHXYzut8w8Va92BfbBErqTtcprytOJTLofY2gaYpwROM6yw+nTlU
         GeNOfxW9/g8z29Z862f9HAsrW7pr6Yq0ohnV0Gd8qYZ7TV3sd1tFhPzSCvq82iw+Ekv8
         zRzgAIeaedkk7Pf7PdVubtA9BkCAtqeI3vAK4Y5NNctnIzKs/VE4fURXGUE/wDcq0LU8
         p/iQ==
X-Gm-Message-State: AOJu0YxeMVD8RK2iagEUBhw7epaR65sS6bL7UoEAa6m5g2AvrI+XQPVR
	1g8MmHTGgkaOtgiROobdFlkQbU5Wy70TPJunAHKo2wByD5k/iXyBYcWqPkPCh0Dtvx23ERPpF7/
	wD/Kt2nWgp57CCjYLWXOyRn89Sq8LJpaDKV871Q==
X-Gm-Gg: ASbGncv+Mo97BPnHurNEKHbOHuI0JLHdgRddjYRpHQvMB7ibJiPGpYT7/tpLQehrlAT
	Qq/Sz07EG+cXDWkrEMj+JdjTLw+Ms0Kx6g8gp4zkTY6aovmedL4dcDnohk0NadJ3OmtfhCq0rsk
	JUePCMswA+jm2Ss+xrYGelqJCQvBoheW59NolAvco07UMPZrXTNRnW5ajiEvA=
X-Google-Smtp-Source: AGHT+IHI7OfOM8qbzt8kyL3m5v5JxgK+nvZfKZJd/XFkEPgQstLatm843kB5EqMJxTbJz1JAkgCdkzLzAN6kMF6xO8k=
X-Received: by 2002:a05:6512:6d2:b0:545:f4b:ed66 with SMTP id
 2adb3069b0e04-54b10dc8e7emr2315432e87.21.1743415873190; Mon, 31 Mar 2025
 03:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 31 Mar 2025 12:11:02 +0200
X-Gm-Features: AQ5f1Jq3wmmW3EWERHeSXn-4ELCO8r2qaLKHh9rU6TaYKayh4VK82dzP0k4OIR4
Message-ID: <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

>It has to be M4K there, and that isn't the most fortunate choice, because
>it's a manual for the specific microarchitecture and then one that doesn't
>usually run Linux, because it has no TLB.

Ah... my bad. I've also searched the manuals name you gave me.
I had one of them, but a specific volume:

"MIPS Architecture For Programmers Volume II-A: The MIPS64 Instruction
Set Reference Manual"

> There's some complication here coming from the need to factor in the ISA
> bit in the microMIPS mode; something that hasn't been discussed so far.
> The `.fill 0' approach is a hack and it has struck me that we need to add
> a `.noinsn' pseudo-op to GAS for this purpose, complementing `.insn', but
> we need to stick with the hack for now anyway as it will take years until
> we can rely on a new feature in the assembler.

Ah, interesting. So de facto having the "repeat" to 0, will generate nothin=
g.

> NB don't refer to a local label from a macro as such a reference may end
> up pointing not where you want it to from the place the macro is pasted
> at.  For example with your v6 code BUILD_ROLLBACK_PROLOGUE refers to the
> intended label in `__r4k_wait' when pasted for `handle_int', but then to
> the label in `except_vec4' instead when pasted for `except_vec_vi' furthe=
r
> down.

> Technically it is correct and likely the original MIPSCO assembler from
> 1985 or one supplied with IRIX were smarter, but GAS won't itself ever
> reorder instructions other than to fill branch delay slots, so we don't
> have to be worried.

Thank you!

> I gave it some thought and concluded that the interrupt handling path has
> to be optimised for performance and the idle routine does not.  Therefore
> I think we need to stick to the power-of-two size for the idle interrupt
> region, because in that case the check for an interrupt arriving within
>` r4k_wait' but ahead of the WAIT instruction can be done with a pair of
> ALU operations and a single branch.  Anything more complex would require
> more operations in the interrupt handling path.

Clear, thanks.

> I can't imagine how we'd advance past WAIT without these instructions,
> what do you have in mind?

I've not been precise, sorry.
I meant to remove the instructions like they are now because the
region would have
been different, then.
So, those instructions would have needed a change, in practice.

> NB how do you actually verify this stuff with QEMU?  Is it by injecting
> an interrupt by hand at a chosen code location via GDB attached to QEMU's
> built-in debug stub?

Short answer: I am not able to fully test this, I can only boot.

The reason is that gdb-multiarch is not working as expected.
The binary in my distribution has the python support broken. So when I try =
to
inject the interrupt, I'm receiving a python error (actually, I receive the=
 same
error after the "target remote" command).
I've also tried to compile the binary from source, but again,
I understand why in OBS the build I found is broken...

> Below I've included a complete change based on the outline above.

Well, thanks a lot for that.

> Below I've included a complete change based on the outline above.  It
> seems to do the right thing for a couple of my configurations, but I've
> only eyeballed the resulting code and haven't tried running it.  Most of
> my hardware doesn't implement the WAIT instruction anyway.

It means it would be better to have someone else try the resulting
patch, I guess.

Once I have your final thoughts about the questions / observations below,
I will submit the V7 with all the changes.

> Let me know if you find anything here unclear or have any questions or
> comments.

1)

> /* Keep the ISA bit clear for calculations on local labels here. */

The ISA bit should be the bit 0, correct?
So, also in the macro code, it's done to preserve that bit.

2)
.section .cpuidle.text,"ax"

This should be a single patch, right?
Based on what I understood, 'a' should be the allocation, and 'x' the
executable attribute.
This should be in order to mark those symbols like "cpuidle text":

$ nm -n vmlinux | grep -A3 "cpuidle_text"
ffffffff80a127e0 T __cpuidle_text_start
ffffffff80a127e0 T r4k_wait
ffffffff80a12800 t r4k_wait_insn
ffffffff80a12804 t r4k_wait_exit
--
ffffffff80a12c00 T __cpuidle_text_end
ffffffff80a12c00 T __noinstr_text_end
ffffffff80a12c00 t rest_init
ffffffff80a12ccc t kernel_init

I guess it is used in order to understand if the instruction pointer is ins=
ide
one of these functions / labels.

How does a commit description sound like this?

"
mips: Add dedicated .cpuidle.text section for CPU idle routines

Add a dedicated executable section for CPU idle code to properly organize
and identify idle-related functions inside the .text section.
"

3)

> I think we also need to replace "rollback" with
> another name as with new code we don't roll back anymore.

Should be changed with "region", instead of rollback, maybe?
Do you have something better to suggest?

Thanks a lot!


On Fri, Mar 28, 2025 at 3:18=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Fri, 28 Mar 2025, Maciej W. Rozycki wrote:
>
> > just massaged a little.  FWIW I went ahead and chose to cook this piece=
 up
> > myself since I realised how complex this issue actually is and that it
> > would take us forever to get all the individual aspects nailed over e-m=
ail
> > communication.
>
>  And yet after this many of internal iterations I did manage to miss one
> bit.  In the optimised version proposed we need to explicitly skip over
> the WAIT instruction like this:
>
> r4k_wait_insn:
>         wait
> r4k_wait_exit:
>
> and then:
>
>         .set    noreorder
>         bne     k0, k1, \handler
>          PTR_ADDIU      k0, r4k_wait_exit - r4k_wait_insn + 2
>         .set    reorder
>
> (and here we have a legitimate use for `.set noreorder' to avoid wasting =
a
> NOP for the branch delay slot due to a data antidependency on $k0; it's
> fine to clobber $k0 in the branch-taken case as by definition the registe=
r
> is dead at the exit from this macro).
>
>  Updated patch follows.  I think we also need to replace "rollback" with
> another name as with new code we don't roll back anymore.
>
>   Maciej
>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/include/asm/idle.h |    3 --
>  arch/mips/kernel/genex.S     |   63 +++++++++++++++++++++++++-----------=
-------
>  arch/mips/kernel/idle.c      |    7 ----
>  3 files changed, 38 insertions(+), 35 deletions(-)
>
> linux-mips-idle-vs-timer.diff
> Index: linux-macro/arch/mips/include/asm/idle.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-macro.orig/arch/mips/include/asm/idle.h
> +++ linux-macro/arch/mips/include/asm/idle.h
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
> Index: linux-macro/arch/mips/kernel/genex.S
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-macro.orig/arch/mips/kernel/genex.S
> +++ linux-macro/arch/mips/kernel/genex.S
> @@ -104,42 +104,53 @@ NESTED(except_vec3_r4000, 0, sp)
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
> +       .section .cpuidle.text,"ax"
> +       /* Align to 32 bytes for the maximum idle interrupt region size. =
 */
> +       .align  5
> +LEAF(r4k_wait)
> +       /* Keep the ISA bit clear for calculations on local labels here. =
 */
> +0:     .fill   0
> +       /* Start of idle interrupt region.  */
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
> +       .if     1b - 0b > 32
> +       .error  "overlong idle interrupt region"
> +       .elseif 1b - 0b > 8
> +       .align  4
> +       .endif
> +2:     .fill   0
> +       .equ    r4k_wait_idle_size, 2b - 0b
> +       /* End of idle interrupt region; size has to be a power of 2.  */
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
> +        PTR_ADDIU      k0, r4k_wait_exit - r4k_wait_insn + 2
> +       .set    reorder
>         MTC0    k0, CP0_EPC
>         .set pop
>         .endm
> Index: linux-macro/arch/mips/kernel/idle.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-macro.orig/arch/mips/kernel/idle.c
> +++ linux-macro/arch/mips/kernel/idle.c
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



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

