Return-Path: <linux-mips+bounces-8255-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E388A6BA3E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DC03B5D2F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 12:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE633223321;
	Fri, 21 Mar 2025 12:02:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474541E7C05;
	Fri, 21 Mar 2025 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742558570; cv=none; b=bN3YFzEkCbWum7i+AhMM/he7qjvW+EL46AfUKbkbYdXxs0uKZvCZSPUS4UWkYViL+/y4YUkGQE9B+w0axui258FdYjx5ZMAHysFJQ/lOFIngQBbR78Nk291XO/0SZsdzodO7VeBtZx5WMSlv9NPdy7UG/ou0yci+stIPQhaEajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742558570; c=relaxed/simple;
	bh=xQuQWBl3YDTvsKZ1bGcMCXStglc8Qam908NyGesIKtE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=okYKaIZBdrTB5iN1oTix+hz09kyQ+0Jd2TpEcr6F/uVoUWr2d+G6CzYS9hXy2k+wJbN1nUM9faUZbJ7PUIrVNR4s3djh2CaqjbuY3RTlbhEUsmWd3yz9y/1nJttvfCP0IHAU6L8tRiD+tk0qLxvsEtV+WY5/G7qwBxD/JKWCNd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C5A1C92009C; Fri, 21 Mar 2025 12:53:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C1A1C92009B;
	Fri, 21 Mar 2025 11:53:54 +0000 (GMT)
Date: Fri, 21 Mar 2025 11:53:54 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <20250315194002.13778-2-marco.crivellari@suse.com>
Message-ID: <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 Mar 2025, Marco Crivellari wrote:

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

 This instruction sequence still suffers from the coprocessor move delay 
hazard.  How many times do I need to request to get it fixed (counting 
three so far)?

  Maciej

