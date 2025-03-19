Return-Path: <linux-mips+bounces-8231-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E1A68B63
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 12:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925578A14BF
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A826257AEC;
	Wed, 19 Mar 2025 11:07:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38DC25744E;
	Wed, 19 Mar 2025 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382444; cv=none; b=DCXwOVahL0iXWvFp4RWDpi3+USVQ7O0XS3dfS0lhYk4UKJY3pj13HAY/YvbQmwMIzCTUjxZ4X+uBwkg/D1zGVjzzVZ+5xMFogddgeEofqxeNW0RkjwdGr8OYAKXkGgp/vnMC0LRo/Nvx+ZPFqQ8OmiksJ8l8NfRoZ38NWDyjgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382444; c=relaxed/simple;
	bh=qNafoaAFFn4oXzMocj+psFvfP6YABXGF8gtrTOOH3Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZYcaBKBaApprYhzPW9RpzNDH+9McrOyUTtTd+5NaKI1qh2yR9MppY9BfcjAGXDKyHUrC4bQ/VCpfE7zUZnjCZCCAyUJ6VkGNrn2XdrIJpxXGWwUSA+T57Qt1C3iOslq/MkBEOk5/RyvAAORHHC/lkNPWu53TXq4vDJONAP4bVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1turGX-0004H5-00; Wed, 19 Mar 2025 12:07:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7BE90C0135; Wed, 19 Mar 2025 12:07:07 +0100 (CET)
Date: Wed, 19 Mar 2025 12:07:07 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z9qlW81QikxeVzQa@alpha.franken.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315194002.13778-2-marco.crivellari@suse.com>

On Sat, Mar 15, 2025 at 08:40:02PM +0100, Marco Crivellari wrote:
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

can you give a commit ID, when this change got introduced ?

> Fix this with fast-forwarding idle IRQs return address to the end of the
> idle routine instead of the beginning, so that the generic idle loop
> handles both TIF_NEED_RESCHED and pending timers.
> 
> CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
> There, NOPs are 2 byte in size, so change the code with 3 _ssnop which are
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
> index a572ce36a24f..4e012421d00f 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,27 +104,30 @@ handle_vcei:
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
> -#ifdef CONFIG_CPU_MICROMIPS
> -	nop
> -	nop
> -	nop
> -	nop
> -#endif
> +	/* Start of idle interrupt region. */
> +	MFC0	t0, CP0_STATUS
> +	/* Enable interrupt. */
> +	ori 	t0, 0x1f
> +	xori	t0, 0x1e
> +	MTC0	t0, CP0_STATUS
> +	_ssnop
> +	_ssnop
> +	_ssnop
> +	_ehb
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
> +	/* End of idle interrupt region. */
>  1:

please give this label a name for example __r4k_wait_exit and do a
runtime check that it really has 36 bytes offset to __r4k_wait

>  	jr	ra
>  	 nop
> @@ -136,9 +139,10 @@ LEAF(__r4k_wait)
>  	.set	push
>  	.set	noat
>  	MFC0	k0, CP0_EPC
> -	PTR_LA	k1, __r4k_wait
> -	ori	k0, 0x1f	/* 32 byte rollback region */
> -	xori	k0, 0x1f
> +	PTR_LA	k1, 1b

this is part of a macro, so I don't think using a commonly used label name
is a safe thing, that's why I want a named label here.

> +	/* 36 byte idle interrupt region. */
> +	ori 	k0, 0x1f
> +	PTR_ADDIU	k0, 5
>  	bne	k0, k1, \handler
>  	MTC0	k0, CP0_EPC
>  	.set pop

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

