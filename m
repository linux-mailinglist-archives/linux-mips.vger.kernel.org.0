Return-Path: <linux-mips+bounces-7428-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE02A0FF2E
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 04:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E679A169235
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 03:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6F92309AE;
	Tue, 14 Jan 2025 03:29:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8728233522;
	Tue, 14 Jan 2025 03:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825363; cv=none; b=VdFO4QO8gcykLsChoZrJAN4JzoDtlPL1tx1czpCTBp7o3eGs5jBpZ4Wkn/fa8P84JszRorXgwbb8pfEiyX/CymD1JnGplDn4Zgo1MnMWOPXc3ZuGsN/aXD5OfRsv2vUZ4HDpZO8pRn+9bEPtgfW2LExNDJnopA7vl1lKLcAHJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825363; c=relaxed/simple;
	bh=GJ6z5jcm52G9Utfwetg3YCJYKg8tKZYfHIfYHOJpGnM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sZumWwFklNleP5m5OVvJO41Cf7GXPAJKjjvYMAKLR59nigkbBTShwnlL50SapnFcXIudc9u2uf9uYpP1jmXA5PC7Hfw91weKoijqCiWst8blTLwqYWVjrDPyb/d21gb2nbXGdg40g/fo3pCN/vMzNr+F+2W8289ksCOPHN2VdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B9FAA92009D; Tue, 14 Jan 2025 04:29:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B2C2192009C;
	Tue, 14 Jan 2025 03:29:11 +0000 (GMT)
Date: Tue, 14 Jan 2025 03:29:11 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Dmitry V. Levin" <ldv@strace.io>
cc: Oleg Nesterov <oleg@redhat.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Eugene Syromyatnikov <evgsyr@gmail.com>, 
    Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, 
    Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] mips: fix mips_get_syscall_arg() for O32 and
 N32
In-Reply-To: <20250113171114.GB589@strace.io>
Message-ID: <alpine.DEB.2.21.2501140213050.50458@angie.orcam.me.uk>
References: <20250113171114.GB589@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Jan 2025, Dmitry V. Levin wrote:

> Fix the following get_syscall_info test assertion on mips O32:
>   # get_syscall_info.c:218:get_syscall_info:Expected exp_args[5] (3134521044) == info.entry.args[4] (4911432)
>   # get_syscall_info.c:219:get_syscall_info:wait #1: entry stop mismatch
> 
> Fix the following get_syscall_info test assertion on mips64 O32 and mips64 N32:
>   # get_syscall_info.c:209:get_syscall_info:Expected exp_args[2] (3134324433) == info.entry.args[1] (18446744072548908753)
>   # get_syscall_info.c:210:get_syscall_info:wait #1: entry stop mismatch

 How did you produce these results?

> This makes ptrace/get_syscall_info selftest pass on mips O32,
> mips64 O32, and mips64 N32.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
> 
> Note that I'm not a MIPS expert, so I cannot tell why the get_user()
> approach doesn't work for O32.  Also, during experiments I discovered that
> regs->pad0 approach works for O32, but why it works remains a mystery.

 The patch is definitely broken, the calling convention is the same 
between n32 and n64: 64-bit arguments in $4 through $11 registers as 
required, and your change makes n32 truncate arguments to 32 bits.

 The regs->pad0 approach works due to this piece:

	/*
	 * Ok, copy the args from the luser stack to the kernel stack.
	 */

	.set    push
	.set    noreorder
	.set	nomacro

load_a4: user_lw(t5, 16(t0))		# argument #5 from usp
load_a5: user_lw(t6, 20(t0))		# argument #6 from usp
load_a6: user_lw(t7, 24(t0))		# argument #7 from usp
load_a7: user_lw(t8, 28(t0))		# argument #8 from usp
loads_done:

	sw	t5, 16(sp)		# argument #5 to ksp
	sw	t6, 20(sp)		# argument #6 to ksp
	sw	t7, 24(sp)		# argument #7 to ksp
	sw	t8, 28(sp)		# argument #8 to ksp
	.set	pop

	.section __ex_table,"a"
	PTR_WD	load_a4, bad_stack_a4
	PTR_WD	load_a5, bad_stack_a5
	PTR_WD	load_a6, bad_stack_a6
	PTR_WD	load_a7, bad_stack_a7
	.previous

in arch/mips/kernel/scall32-o32.S (and arch/mips/kernel/scall64-o32.S has 
analogous code to adapt to the native n64 calling convention instead), but 
this doesn't seem to me to be the correct approach here.  At first glance 
`mips_get_syscall_arg' does appear fine as it is, so I'd like to know how 
you obtained your results.

  Maciej

