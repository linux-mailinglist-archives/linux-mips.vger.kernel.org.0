Return-Path: <linux-mips+bounces-7757-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10EA33EE6
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 13:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92198188E491
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 12:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB0322156C;
	Thu, 13 Feb 2025 12:16:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CCA15383A;
	Thu, 13 Feb 2025 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449015; cv=none; b=CwXLKI6CkueTXYjGynGhBB69xXo1q+h2nKtlU1Xvr5jNtY1xxaHZCH6/iZ0XKquFJTAXveJOkH6EhpqScCVtfbvSYpzeOWInbR+GgCaO8qmNK8bzchZ3iAdHfZwB56LoTIo6CgmfHA9JrVQi6RcT5ngsnQQ9Izz7gGYuHmSDIP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449015; c=relaxed/simple;
	bh=7h4/miE/eb7wVe6jGvFdG24fyoi8YCdWW5S8Ddbk6ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPjAEm4+Ww6jgCBsBlOAiF8YOyQB5w545kbMTAqo3UOA4FU3Wtp8u0IssJwy4tZGdtzYD4YfmPPqwcEyRk43BbV/f++Nq1MzIgt9cVEBcTTxEOJiRIZ+FhRzcoC6KHU+nOuy0D0t50Q84uhcadFhi7VWqf9KGlM8J9LeyiMXz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tiXeU-0008Sz-00; Thu, 13 Feb 2025 12:45:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 31B61C0135; Thu, 13 Feb 2025 12:44:17 +0100 (CET)
Date: Thu, 13 Feb 2025 12:44:17 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Oleg Nesterov <oleg@redhat.com>, "Dmitry V. Levin" <ldv@strace.io>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Export syscall stack arguments properly for remote
 use
Message-ID: <Z63bEfoSJnLumOCa@alpha.franken.de>
References: <alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk>

On Tue, Feb 11, 2025 at 06:22:30PM +0000, Maciej W. Rozycki wrote:
> We have several places across the kernel where we want to access another 
> task's syscall arguments, such as ptrace(2), seccomp(2), etc., by making 
> a call to syscall_get_arguments().
> 
> This works for register arguments right away by accessing the task's 
> `regs' member of `struct pt_regs', however for stack arguments seen with 
> 32-bit/o32 kernels things are more complicated.  Technically they ought 
> to be obtained from the user stack with calls to an access_remote_vm(), 
> but we have an easier way available already.
> 
> So as to be able to access syscall stack arguments as regular function 
> arguments following the MIPS calling convention we copy them over from 
> the user stack to the kernel stack in arch/mips/kernel/scall32-o32.S, in 
> handle_sys(), to the current stack frame's outgoing argument space at 
> the top of the stack, which is where the handler called expects to see 
> its incoming arguments.  This area is also pointed at by the `pt_regs'
> pointer obtained by task_pt_regs().
> 
> Make the o32 stack argument space a proper member of `struct pt_regs' 
> then, by renaming the existing member from `pad0' to `args' and using 
> generated offsets to access the space.  No functional change though.
> 
> With the change in place the o32 kernel stack frame layout at the entry 
> to a syscall handler invoked by handle_sys() is therefore as follows:
> 
> $sp + 68 -> |         ...         | <- pt_regs.regs[9]
>             +---------------------+
> $sp + 64 -> |         $t0         | <- pt_regs.regs[8]
>             +---------------------+
> $sp + 60 -> |   $a3/argument #4   | <- pt_regs.regs[7]
>             +---------------------+
> $sp + 56 -> |   $a2/argument #3   | <- pt_regs.regs[6]
>             +---------------------+
> $sp + 52 -> |   $a1/argument #2   | <- pt_regs.regs[5]
>             +---------------------+
> $sp + 48 -> |   $a0/argument #1   | <- pt_regs.regs[4]
>             +---------------------+
> $sp + 44 -> |         $v1         | <- pt_regs.regs[3]
>             +---------------------+
> $sp + 40 -> |         $v0         | <- pt_regs.regs[2]
>             +---------------------+
> $sp + 36 -> |         $at         | <- pt_regs.regs[1]
>             +---------------------+
> $sp + 32 -> |        $zero        | <- pt_regs.regs[0]
>             +---------------------+
> $sp + 28 -> |  stack argument #8  | <- pt_regs.args[7]
>             +---------------------+
> $sp + 24 -> |  stack argument #7  | <- pt_regs.args[6]
>             +---------------------+
> $sp + 20 -> |  stack argument #6  | <- pt_regs.args[5]
>             +---------------------+
> $sp + 16 -> |  stack argument #5  | <- pt_regs.args[4]
>             +---------------------+
> $sp + 12 -> | psABI space for $a3 | <- pt_regs.args[3]
>             +---------------------+
> $sp +  8 -> | psABI space for $a2 | <- pt_regs.args[2]
>             +---------------------+
> $sp +  4 -> | psABI space for $a1 | <- pt_regs.args[1]
>             +---------------------+
> $sp +  0 -> | psABI space for $a0 | <- pt_regs.args[0]
>             +---------------------+
> 
> holding user data received and with the first 4 frame slots reserved by 
> the psABI for the compiler to spill the incoming arguments from $a0-$a3 
> registers (which it sometimes does according to its needs) and the next 
> 4 frame slots designated by the psABI for any stack function arguments 
> that follow.  This data is also available for other tasks to peek/poke 
> at as reqired and where permitted.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/include/asm/ptrace.h |    4 ++--
>  arch/mips/kernel/asm-offsets.c |    6 ++++++
>  arch/mips/kernel/scall32-o32.S |    8 ++++----
>  3 files changed, 12 insertions(+), 6 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

