Return-Path: <linux-mips+bounces-7758-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3CCA33EE9
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 13:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19233188E491
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 12:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A376F2139C8;
	Thu, 13 Feb 2025 12:17:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E82322170F;
	Thu, 13 Feb 2025 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449020; cv=none; b=VPoMY3hU5q37rYeYhgojsd057l2y/G9Ar6DgCImGC+Zo0OvoupQpGBL3Oza+ZMqf561cXnKKmufL8z+KBEUuRuJQJBUmC5b5ab05O5nHUHnY9wz9DvvPdvhL4hbbiy+8cSr5vQyZGhKQCi2da1p/mRj1IWRul4pKFPvqL9ixQHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449020; c=relaxed/simple;
	bh=NIEdyetbCs06dTp+Vd4v7oHrstjMbPO12/RYfOF1GpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ4u1cQ+QwzbxFiuhzLyzCiKuIMjFmmA9mTbCVWmOPkfW+HLMquvR3FcBGcKQguBTfXoTQSkchLntyKnfrw9mW0/ql9hP30+zeNU4katVcNoSBfnVgpauM6IXPDPJsidaKCxIeKF/wKOcznKC3xFBU8blZEw+gY7/bJcDR8Rb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tiXeU-0008Sx-00; Thu, 13 Feb 2025 12:45:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DEB86C03B4; Thu, 13 Feb 2025 12:44:35 +0100 (CET)
Date: Thu, 13 Feb 2025 12:44:35 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, strace-devel@lists.strace.io,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: fix mips_get_syscall_arg() for o32
Message-ID: <Z63bI66KShw7Au_s@alpha.franken.de>
References: <alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk>
 <20250211230209.GA19616@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211230209.GA19616@strace.io>

On Wed, Feb 12, 2025 at 01:02:09AM +0200, Dmitry V. Levin wrote:
> This makes ptrace/get_syscall_info selftest pass on mips o32 and
> mips64 o32 by fixing the following two test assertions:
> 
> 1. get_syscall_info test assertion on mips o32:
>   # get_syscall_info.c:218:get_syscall_info:Expected exp_args[5] (3134521044) == info.entry.args[4] (4911432)
>   # get_syscall_info.c:219:get_syscall_info:wait #1: entry stop mismatch
> 
> 2. get_syscall_info test assertion on mips64 o32:
>   # get_syscall_info.c:209:get_syscall_info:Expected exp_args[2] (3134324433) == info.entry.args[1] (18446744072548908753)
>   # get_syscall_info.c:210:get_syscall_info:wait #1: entry stop mismatch
> 
> The first assertion happens due to mips_get_syscall_arg() trying to access
> another task's context but failing to do it properly because get_user() it
> calls just peeks at the current task's context.  It usually does not crash
> because the default user stack always gets assigned the same VMA, but it
> is pure luck which mips_get_syscall_arg() wouldn't have if e.g. the stack
> was switched (via setcontext(3) or however) or a non-default process's
> thread peeked at, and in any case irrelevant data is obtained just as
> observed with the test case.
> 
> mips_get_syscall_arg() ought to be using access_remote_vm() instead to
> retrieve the other task's stack contents, but given that the data has been
> already obtained and saved in `struct pt_regs' it would be an overkill.
> 
> The first assertion is fixed for mips o32 by using struct pt_regs.args
> instead of get_user() to obtain syscall arguments.  This approach works
> due to this piece in arch/mips/kernel/scall32-o32.S:
> 
>         /*
>          * Ok, copy the args from the luser stack to the kernel stack.
>          */
> 
>         .set    push
>         .set    noreorder
>         .set    nomacro
> 
>     load_a4: user_lw(t5, 16(t0))		# argument #5 from usp
>     load_a5: user_lw(t6, 20(t0))		# argument #6 from usp
>     load_a6: user_lw(t7, 24(t0))		# argument #7 from usp
>     load_a7: user_lw(t8, 28(t0))		# argument #8 from usp
>     loads_done:
> 
>         sw	t5, PT_ARG4(sp)		# argument #5 to ksp
>         sw	t6, PT_ARG5(sp)		# argument #6 to ksp
>         sw	t7, PT_ARG6(sp)		# argument #7 to ksp
>         sw	t8, PT_ARG7(sp)		# argument #8 to ksp
>         .set	pop
> 
>         .section __ex_table,"a"
>         PTR_WD	load_a4, bad_stack_a4
>         PTR_WD	load_a5, bad_stack_a5
>         PTR_WD	load_a6, bad_stack_a6
>         PTR_WD	load_a7, bad_stack_a7
>         .previous
> 
> arch/mips/kernel/scall64-o32.S has analogous code for mips64 o32 that
> allows fixing the issue by obtaining syscall arguments from struct
> pt_regs.regs[4..11] instead of the erroneous use of get_user().
> 
> The second assertion is fixed by truncating 64-bit values to 32-bit
> syscall arguments.
> 
> Fixes: c0ff3c53d4f9 ("MIPS: Enable HAVE_ARCH_TRACEHOOK.")
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
> 
> This started as a part of PTRACE_SET_SYSCALL_INFO API series[1].
> It has been rebased on top of [2] as suggested by Maciej in [3].
> 
> [1] https://lore.kernel.org/all/20250210113336.GA887@strace.io/
> [2] https://lore.kernel.org/all/alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk/
> [3] https://lore.kernel.org/all/alpine.DEB.2.21.2502111530080.65342@angie.orcam.me.uk/
> 
>  arch/mips/include/asm/syscall.h | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

