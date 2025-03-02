Return-Path: <linux-mips+bounces-8063-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C9A4AE9D
	for <lists+linux-mips@lfdr.de>; Sun,  2 Mar 2025 01:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13ED23AEDB6
	for <lists+linux-mips@lfdr.de>; Sun,  2 Mar 2025 00:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523118F6C;
	Sun,  2 Mar 2025 00:54:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A2CFBF6;
	Sun,  2 Mar 2025 00:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740876874; cv=none; b=HSNigN7VsGSJmpAex3j3dOzQrp8pkYzanNQ8psVWgR6XROEYZRFw7XZHQIdvo6va9eKtEAGMYWOAY+EMC+Y798XZ2WHbKdN2SQqp9pN+oxlNgQ5+qkWP7zTsoa7Hk5CggXUkFn5bbQ6C6bqrgw/XN1sao1Irto9Mg5a9a0hkNZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740876874; c=relaxed/simple;
	bh=Jpd0cs6jQ/uM2bY2Lr1XjevgxrLlCbZgd2FnliUYzYM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dMzXBER6q+4AF6IjHXkQUA51kRaLuAjThNzPlQ/77kMHQGycsXkofC5tzbF1lWxzLCTtvAyxFLhulDpvEmMJhB61qKhT5LuLRtrKpDAmWQTOVGUoPtKPemwk4+E/mCLr40JW9hCP0bbh9pAU/AVhqBPV+1NRWnotnJvlpRTwovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7B3BE92009E; Sun,  2 Mar 2025 01:54:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6CCA792009C;
	Sun,  2 Mar 2025 00:54:23 +0000 (GMT)
Date: Sun, 2 Mar 2025 00:54:23 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v5 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <20250228100509.91121-2-marco.crivellari@suse.com>
Message-ID: <alpine.DEB.2.21.2503020042100.12637@angie.orcam.me.uk>
References: <20250228100509.91121-1-marco.crivellari@suse.com> <20250228100509.91121-2-marco.crivellari@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Feb 2025, Marco Crivellari wrote:

> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a572ce36a24f..474738d9124e 100644
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
> +	/* start of idle interrupt region */
> +	MFC0	t0, CP0_STATUS
> +	/* Enable Interrput */
                        ^^
 Typo here; also please capitalise sentences and use full stops.

> +	ori 	t0, 0x1f

 No time for a thorough review here as I'm heading for a holiday right 
away, but I can see you still have a coprocessor move hazard here with 
MIPS III hardware.  The incoming value of $t0 to ORI is not what MFC0 has 
obtained.  It's the value from before MFC0.

> +	xori	t0, 0x1e

 And then it's only this XORI that sees the output from MFC0 (though 
there's actually a race between the two competing writes to $t0), so 
effectively you clobber the CP0.Status register...

> +	MTC0	t0, CP0_STATUS

 ... here.  You need to schedule your instructions differently.  But do 
you need `.set noreorder' in the first place?  Can you maybe find a way to 
avoid it, making all the hazard avoidance stuff much easier?

  Maciej

