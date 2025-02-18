Return-Path: <linux-mips+bounces-7815-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA8A39BA6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5897E17459A
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5292243958;
	Tue, 18 Feb 2025 11:59:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D0D243382;
	Tue, 18 Feb 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879984; cv=none; b=EkFhutx064XDjHTiWNk+iteavOh5V9bavj9VB2M0aKjeOmBw7trV2FmnfBqBEoEhW9toU1+HWm+9QDGRncjTDScs0r4vREm9aTDkaIW0K0D8iB+rVl/Sg1wSO2Hiy7s4ccTv9ZpQQp05qkHIkVG7Um/qfBlERrI3RSr8NzCrx3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879984; c=relaxed/simple;
	bh=1D33RCtmi7vCn2j9HDe8yb+48Ne+e3YQjNztgt08SfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5N+ClYU5WLp9VYI/59DgKtIN4I6xtfZimD/QkIL/scdzHcwnsAEWJSoJICmTmxJXbrLb2vmXXXaZ7hpX54hG2ywsGBhPHLElm8sSEuzkzX6+MoIRVOzjkLzWTBg0D10e/32+DEpdCM+3SYj3s0vb1zNcMEI2sHY3uMRGY2zfiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tkMGA-0003sS-00; Tue, 18 Feb 2025 12:59:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7D1DAC0135; Tue, 18 Feb 2025 12:59:22 +0100 (CET)
Date: Tue, 18 Feb 2025 12:59:22 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z7R2GqWOufd8l6NZ@alpha.franken.de>
References: <20250218090203.43137-1-marco.crivellari@suse.com>
 <20250218090203.43137-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218090203.43137-2-marco.crivellari@suse.com>

On Tue, Feb 18, 2025 at 10:02:03AM +0100, Marco Crivellari wrote:
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
>  arch/mips/kernel/genex.S | 39 +++++++++++++++++++++------------------
>  arch/mips/kernel/idle.c  |  1 -
>  2 files changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..9747b216648f 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,25 +104,27 @@ handle_vcei:
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

My quick search didnn't find the reason for the extra NOPs on MICROMIPS, but
they are here for a purpose. I might still need them...

> +	/* start of idle interrupt region */
> +	MFC0	t0, CP0_STATUS
> +	/* Enable Interrput */
> +	ori 	t0, 0x1f
> +	xori	t0, 0x1e
> +	MTC0	t0, CP0_STATUS
> +	_ssnop
> +	_ssnop
> +	_ssnop

instead of handcoded hazard nops, use __irq_enable_hazard for that

>  	.set	MIPS_ISA_ARCH_LEVEL_RAW
> +	/*
> +	 * If an interrupt lands here, between enabling interrupts above and
> +	 * going idle on the next instruction, we must *NOT* go idle since the
> +	 * interrupt could have set TIF_NEED_RESCHED or caused a timer to need
> +	 * resched. Fall through -- see rollback_handler below -- and have
> +	 * the idle loop take care of things.
> +	 */
>  	wait
>  	/* end of rollback region (the region size must be power of two) */
>  1:
> @@ -136,9 +138,10 @@ LEAF(__r4k_wait)
>  	.set	push
>  	.set	noat
>  	MFC0	k0, CP0_EPC
> -	PTR_LA	k1, __r4k_wait
> -	ori	k0, 0x1f	/* 32 byte rollback region */
> -	xori	k0, 0x1f
> +	PTR_LA	k1, 1b
> +	/* 32 byte idle interrupt region */
> +	ori 	k0, 0x1f
> +	daddiu	k0, 1

/local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S: Assembler messages:
/local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S:151: Error: opcode not supported on this processor: mips32r2 (mips32r2) `daddiu $26,1'
/local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S:271: Error: opcode not supported on this processor: mips32r2 (mips32r2) `daddiu $26,1'

looks like you haven't compiled this code for 32bit. Use PTR_ADDIU, which
will use the correct instuction for 32 and 64bit.

But I doubt this works, because the wait instruction is not aligned to
a 32 byte boundary, but the code assuemes this, IMHO.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

