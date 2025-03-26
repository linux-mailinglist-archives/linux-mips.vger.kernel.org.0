Return-Path: <linux-mips+bounces-8372-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68DAA715DD
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 12:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525E73BF73E
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 11:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2531DD0F6;
	Wed, 26 Mar 2025 11:35:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1575C1DBB37;
	Wed, 26 Mar 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988940; cv=none; b=J0yC5Nq1OREfiydaBvYj2T+KzRB83Jd/6ObNz9lzJ0As4qiHuUmssG/oPGK3oT5p3um3DQlyLzuwEWoPIPIXihRE6DmT2dcovxEfzJSCHHqJb+YPzGtxBcPkABMJ7Ie8CjhkunsQW7tBOysTyhwqdv0Yc1FdNe/Z/5FFFeYs7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988940; c=relaxed/simple;
	bh=INj7E8sEIm1QV4p0LYnCXBVskAJ6OA1nNyxY/YLEwxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxcuKLThJN4Nm66nuPNxYiNnuiKA5BbTWb91YJWoAWIWROEnMo2pYcT1rNEzlLv37J4FCrpFz6p3NKO4dnQPpScTCzbz2WBwUaHVgOTXQBaON6ZswuLsni2xc0oNLBRa3gRgpufu0P7R6s1g/CgcJX/XVlJxRHbgMrh9j+CNS1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1txP2f-0006Ln-00; Wed, 26 Mar 2025 12:35:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5B95EC0135; Wed, 26 Mar 2025 12:34:37 +0100 (CET)
Date: Wed, 26 Mar 2025 12:34:37 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z-PmTcGvmHgww6KP@alpha.franken.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk>
 <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <CAAhV-H7Tko290LSCJPuVFE2qds81N4C=8RPz4edC-xddFvZGjA@mail.gmail.com>
 <CAAofZF52_yKcpd+GBE9ygggeNTOVQDP7AKau5xZE+N4fHGCgSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAofZF52_yKcpd+GBE9ygggeNTOVQDP7AKau5xZE+N4fHGCgSQ@mail.gmail.com>

On Wed, Mar 26, 2025 at 10:46:08AM +0100, Marco Crivellari wrote:
> I'm mostly thinking about future changes in this part of the code.
> But if it is ok what we have now, and future changes are not a
> problem, let's keep this version.
> 
> Would this be ok with you @Maciej?
> 
> If so, the region is now 40 bytes. This is what I did yesterday:
> 
> @@ -110,6 +110,7 @@ LEAF(__r4k_wait)
>        .set    noreorder
>        /* Start of idle interrupt region. */
>        MFC0    t0, CP0_STATUS
> +       nop
>        /* Enable interrupt. */
>        ori     t0, 0x1f
>        xori    t0, 0x1e
> @@ -128,7 +129,11 @@ LEAF(__r4k_wait)
>         */
>        wait
>        /* End of idle interrupt region. */
> -1:
> +__r4k_wait_exit:
> +       /* Check idle interrupt region size. */
> +       .if ((__r4k_wait_exit - __r4k_wait) != 40)
> +       .error  "Idle interrupt region size mismatch: expected 40 bytes."
> +       .endif
>        jr      ra
>         nop
>        .set    pop
> @@ -139,10 +144,10 @@ LEAF(__r4k_wait)
>        .set    push
>        .set    noat
>        MFC0    k0, CP0_EPC
> -       PTR_LA  k1, 1b
> -       /* 36 byte idle interrupt region. */
> +       PTR_LA  k1, __r4k_wait_exit
> +       /* 40 byte idle interrupt region. */

IMHO, we can't extend this above 36 bytes, because the interrupt could
hit at the instruction before the wait, which is then in the
next 32byte block.

I was thinking about aligning __r4k_wait 16 byte earlier and place
the wait at the end of the 

Something like:

	.align 5
	.align 4
LEAF(__r4k_wait)
	// irq enable sequence
	wait // align to end of the 32byte block
_r4k_wait_exit:

>        ori     k0, 0x1f
> -       PTR_ADDIU       k0, 5
> +       PTR_ADDIU       k0, 9

this needs to
	PTR_ADDIU       k0, 1

then. and __r4k_wait_exit - __r4k_wait is 48

But there might better ways...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

