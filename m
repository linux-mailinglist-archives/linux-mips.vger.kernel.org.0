Return-Path: <linux-mips+bounces-7782-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC600A36C14
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2025 06:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94753B2223
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2025 05:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92276189905;
	Sat, 15 Feb 2025 05:05:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B9C1581F1;
	Sat, 15 Feb 2025 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739595939; cv=none; b=aPUgDhxOCKuz3DgYwoBd4JbMM+dfgn+yXePcT6naQKabKn062xPjrxB7lqASM3xiO+wxo02e90Xl+JsfgaZ68n9wVGWBDOdPUZYhKsOProqv53KmFUi4jbITNWvdBUWzUHb+KoQdRmPGtUld4+MhuWKO10ieRExHFvhwLDdjLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739595939; c=relaxed/simple;
	bh=SrXTc6X/ECMzZTWLH2SwjL1xlPi7ojTU3gNLDZvCYXk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Gdza1s3zkQxt377d0sm1VPAJkkqS6vEaZiGJ/X7Tw4ar3t/JiIhf+H/liDlKbvDbppmOvFxDoiApgmFJFjbRN2vMeBmSaCbgUT487YMSLt/bZLi33p3neT2WZ0ZQH3CDByA5tXTe1L6I7jWQHerrYefq7qIxXRwOhC/RHrPsOqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A1CB692009C; Sat, 15 Feb 2025 06:05:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 93F0292009B;
	Sat, 15 Feb 2025 05:05:34 +0000 (GMT)
Date: Sat, 15 Feb 2025 05:05:34 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH] MIPS: Fix idle VS timer enqueue
In-Reply-To: <20250214105047.150835-2-marco.crivellari@suse.com>
Message-ID: <alpine.DEB.2.21.2502150409000.65342@angie.orcam.me.uk>
References: <20250214105047.150835-1-marco.crivellari@suse.com> <20250214105047.150835-2-marco.crivellari@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, Marco Crivellari wrote:

> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..a78d5132c940 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,18 +104,16 @@ handle_vcei:
>  
>  	__FINIT
>  
> -	.align	5	/* 32 byte rollback region */
> +	.align	5
>  LEAF(__r4k_wait)
>  	.set	push
>  	.set	noreorder
> -	/* start of rollback region */
> -	LONG_L	t0, TI_FLAGS($28)
> -	nop
> -	andi	t0, _TIF_NEED_RESCHED
> -	bnez	t0, 1f
> -	 nop
> -	nop
> -	nop
> +	/* start of idle interrupt region */
> +	MFC0	k0, CP0_STATUS
> +	/* Enable Interrupt */
> +	ori 	k0, 0x1f

 Data from CP0 will be delivered late to $k0 on MIPS III, you need to fill 
the coprocessor move delay slot here.  Existing code takes care about it. 
I bet you won't trigger this with QEMU, you need to verify with real hw.

 For CONFIG_CPU_HAS_DIEI you want EI here instead.

> +	xori	k0, 0x1e
> +	MTC0	k0, CP0_STATUS

 You need to clear the CP0 hazard here, just as `raw_local_irq_enable' 
does, because WAIT halts the pipeline and the interrupt enable state may 
not have been propagated beforehand otherwise.  Again, not triggerable 
with QEMU.

> @@ -123,11 +121,17 @@ LEAF(__r4k_wait)
>  	nop
>  #endif
>  	.set	MIPS_ISA_ARCH_LEVEL_RAW
> +	/*
> +	 * If an interrupt lands here, between enabling interrupts above and
> +	 * going idle on the next instruction, we must *NOT* go idle since the
> +	 * interrupt could have set TIF_NEED_RESCHED or caused a timer to need
> +	 * resched. Fall through -- see rollback_handler below -- and have
> +	 * the idle loop take care of things.
> +	 */
>  	wait
> -	/* end of rollback region (the region size must be power of two) */
> -1:
> +	/* end of idle interrupt region (the region size must be power of two) */

 Have you verified this still stands with CONFIG_CPU_MICROMIPS after your 
change?

> +SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)
>  	jr	ra
> -	 nop
>  	.set	pop
>  	END(__r4k_wait)

 You're dropping the delay slot NOP here, meaning that whatever comes next 
gets there, possibly "mfc0 $k0, $c0_epc" (depending on alignment), why?

> @@ -136,10 +140,10 @@ LEAF(__r4k_wait)
>  	.set	push
>  	.set	noat
>  	MFC0	k0, CP0_EPC
> -	PTR_LA	k1, __r4k_wait
> -	ori	k0, 0x1f	/* 32 byte rollback region */
> -	xori	k0, 0x1f
> -	bne	k0, k1, \handler
> +	PTR_LA	k1, __r4k_wait_exit
> +	/* 3 instructions rollback region */
> +	ori 	k0, k0, 0x0c
> +	bne 	k0, k1, \handler

 How is `__r4k_wait_exit' guaranteed to have bits 3:2 set and bit 1 (for 
CONFIG_CPU_MICROMIPS) clear?  Also EPC may or may not have bit 1 set.

 NB not a full review and certainly not for the change of semantics, but 
for some issues spotted with the low-level correctness of new code.

  Maciej

