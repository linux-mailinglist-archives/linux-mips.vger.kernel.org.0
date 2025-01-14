Return-Path: <linux-mips+bounces-7432-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34485A10257
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 09:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6294F1889629
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 08:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF8A1D5AB2;
	Tue, 14 Jan 2025 08:47:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5349E224FD;
	Tue, 14 Jan 2025 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736844434; cv=none; b=r9OrlT+dBDkvH+jJiuNIIUR37oCy0Lk7GubW5JVFc0nxx19YqXwHHbdKuGtPfzYHTRXMTbslyGW6Nhx+OyecWw63FCV+G08PQXM4ZJmNhsR3aV1mcHyb0yH049qbie4U4g9LjIXdhGg7GRzj7eMbbnDrP1H9iOwXv6LZlRneLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736844434; c=relaxed/simple;
	bh=yHbL+NU8PSzDZ+vg2NzuR2Dxr0BhqlELoQGhBYyPi84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDzHHKw5A/0hpcswX28rBHhacGJI67+wPdTQ5pe0nZAywRXFgOEImkoSr7N4IC+kI65Dxx+PjtvtpHoQfd4GYtwQb9b2Rs0FLICulkYa4x7FkCfkKmbCqFzOZ7B0gzFYK7jdbABpHNSqqep19PJkIRG7dRoFN/79JkvwIBYeY7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id C915A72C8CC;
	Tue, 14 Jan 2025 11:47:09 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id B62197CCB3A; Tue, 14 Jan 2025 10:47:09 +0200 (IST)
Date: Tue, 14 Jan 2025 10:47:09 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] mips: fix mips_get_syscall_arg() for O32 and N32
Message-ID: <20250114084709.GA3580@strace.io>
References: <20250113171114.GB589@strace.io>
 <alpine.DEB.2.21.2501140213050.50458@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501140213050.50458@angie.orcam.me.uk>

On Tue, Jan 14, 2025 at 03:29:11AM +0000, Maciej W. Rozycki wrote:
> On Mon, 13 Jan 2025, Dmitry V. Levin wrote:
> 
> > Fix the following get_syscall_info test assertion on mips O32:
> >   # get_syscall_info.c:218:get_syscall_info:Expected exp_args[5] (3134521044) == info.entry.args[4] (4911432)
> >   # get_syscall_info.c:219:get_syscall_info:wait #1: entry stop mismatch
> > 
> > Fix the following get_syscall_info test assertion on mips64 O32 and mips64 N32:
> >   # get_syscall_info.c:209:get_syscall_info:Expected exp_args[2] (3134324433) == info.entry.args[1] (18446744072548908753)
> >   # get_syscall_info.c:210:get_syscall_info:wait #1: entry stop mismatch
> 
>  How did you produce these results?

$ PATH="$HOME/x-tools/mips64-unknown-linux-gnu/bin:$PATH" make -j`nproc` ARCH=mips CROSS_COMPILE=mips64-unknown-linux-gnu- -C tools/testing/selftests TARGETS=ptrace USERLDFLAGS='-static' USERCFLAGS='-mabi=32'
$ echo init |(cd tools/testing/selftests/ptrace && ln -snf get_syscall_info init && cpio --dereference -o -H newc -R 0:0) |gzip >get_syscall_info.mips-o32.img
$ qemu-system-mips -nographic -kernel vmlinuz -initrd get_syscall_info.mips-o32.img -append 'console=ttyS0'

Likewise for mips64, but the patch for kselftest_harness.h from [1]
is needed to see correct mismatch values in the test diagnostics.

[1] https://lore.kernel.org/all/20250108170757.GA6723@strace.io/

> > This makes ptrace/get_syscall_info selftest pass on mips O32,
> > mips64 O32, and mips64 N32.
> > 
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > ---
> > 
> > Note that I'm not a MIPS expert, so I cannot tell why the get_user()
> > approach doesn't work for O32.  Also, during experiments I discovered that
> > regs->pad0 approach works for O32, but why it works remains a mystery.
> 
>  The patch is definitely broken, the calling convention is the same 
> between n32 and n64: 64-bit arguments in $4 through $11 registers as 
> required, and your change makes n32 truncate arguments to 32 bits.

There must be something very specific to n32 then: apparently,
__kernel_ulong_t is a 32-bit type on n32, so the syscall arguments are
32-bit values, at some point (in glibc?) they get sign-extended from 32 to
64 bits, and syscall_get_arguments returns them as 64-bit values different
from the original syscall arguments, breaking the test.

If this is the expected behaviour, then I'd have to add an exception for
mips n32 both to the kernel test and to strace that uses this interface.

>  The regs->pad0 approach works due to this piece:
> 
> 	/*
> 	 * Ok, copy the args from the luser stack to the kernel stack.
> 	 */
> 
> 	.set    push
> 	.set    noreorder
> 	.set	nomacro
> 
> load_a4: user_lw(t5, 16(t0))		# argument #5 from usp
> load_a5: user_lw(t6, 20(t0))		# argument #6 from usp
> load_a6: user_lw(t7, 24(t0))		# argument #7 from usp
> load_a7: user_lw(t8, 28(t0))		# argument #8 from usp
> loads_done:
> 
> 	sw	t5, 16(sp)		# argument #5 to ksp
> 	sw	t6, 20(sp)		# argument #6 to ksp
> 	sw	t7, 24(sp)		# argument #7 to ksp
> 	sw	t8, 28(sp)		# argument #8 to ksp
> 	.set	pop
> 
> 	.section __ex_table,"a"
> 	PTR_WD	load_a4, bad_stack_a4
> 	PTR_WD	load_a5, bad_stack_a5
> 	PTR_WD	load_a6, bad_stack_a6
> 	PTR_WD	load_a7, bad_stack_a7
> 	.previous
> 
> in arch/mips/kernel/scall32-o32.S (and arch/mips/kernel/scall64-o32.S has 
> analogous code to adapt to the native n64 calling convention instead), but 
> this doesn't seem to me to be the correct approach here.  At first glance 
> `mips_get_syscall_arg' does appear fine as it is, so I'd like to know how 
> you obtained your results.
> 
>   Maciej

-- 
ldv

