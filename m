Return-Path: <linux-mips+bounces-7440-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A9A10C8C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 17:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF263A085B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 16:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1201B192580;
	Tue, 14 Jan 2025 16:43:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFB1160884;
	Tue, 14 Jan 2025 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736872981; cv=none; b=tD4qWhmysxLIBbTJQUWsB3Mo6qBRANQhsYbK+FXoO3y39sidnTlmhJyOPsVnWwRlWz47+sw8mTTuemmM/OAljVX3lBpt1JL/7AKRmxtNKw69blbkWoPh4o6sjk6Ia/5xItu0bgA+XCnIqLyelM+Eo+v+UV3aHCCgp+A0tI2EfP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736872981; c=relaxed/simple;
	bh=As/K2QIkosG3isqM+IoeUEvO861JhemFkp9To4LR2As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGo/08yux74TXX2HPmeuFjcnFvM4CD/tH1jx5VE6c6sozNhWmbnQ3c9kwTizFwcdXnuoqA9H/IpgoPQhde2tRTs7qN5bjWQ6xhN2kJufFkQD2f3A7ZP4SmsIwI80JGHMUxQ1WXKQ+ZIErJM8A67kKswhiAHetVxD2Y85AnBvlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 9537572C8CC;
	Tue, 14 Jan 2025 19:42:56 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 670637CCB3A; Tue, 14 Jan 2025 18:42:56 +0200 (IST)
Date: Tue, 14 Jan 2025 18:42:56 +0200
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
Message-ID: <20250114164256.GA11820@strace.io>
References: <20250113171114.GB589@strace.io>
 <alpine.DEB.2.21.2501140213050.50458@angie.orcam.me.uk>
 <20250114084709.GA3580@strace.io>
 <alpine.DEB.2.21.2501141351140.50458@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501141351140.50458@angie.orcam.me.uk>

On Tue, Jan 14, 2025 at 04:03:28PM +0000, Maciej W. Rozycki wrote:
> On Tue, 14 Jan 2025, Dmitry V. Levin wrote:
> 
> > >  How did you produce these results?
> > 
> > $ PATH="$HOME/x-tools/mips64-unknown-linux-gnu/bin:$PATH" make -j`nproc` ARCH=mips CROSS_COMPILE=mips64-unknown-linux-gnu- -C tools/testing/selftests TARGETS=ptrace USERLDFLAGS='-static' USERCFLAGS='-mabi=32'
> > $ echo init |(cd tools/testing/selftests/ptrace && ln -snf get_syscall_info init && cpio --dereference -o -H newc -R 0:0) |gzip >get_syscall_info.mips-o32.img
> > $ qemu-system-mips -nographic -kernel vmlinuz -initrd get_syscall_info.mips-o32.img -append 'console=ttyS0'
> > 
> > Likewise for mips64, but the patch for kselftest_harness.h from [1]
> > is needed to see correct mismatch values in the test diagnostics.
> > 
> > [1] https://lore.kernel.org/all/20250108170757.GA6723@strace.io/
> 
>  Thanks, I'll try to see what's going on with `get_user'.

Thanks.

> > >  The patch is definitely broken, the calling convention is the same 
> > > between n32 and n64: 64-bit arguments in $4 through $11 registers as 
> > > required, and your change makes n32 truncate arguments to 32 bits.
> > 
> > There must be something very specific to n32 then: apparently,
> > __kernel_ulong_t is a 32-bit type on n32, so the syscall arguments are
> > 32-bit values, at some point (in glibc?) they get sign-extended from 32 to
> > 64 bits, and syscall_get_arguments returns them as 64-bit values different
> > from the original syscall arguments, breaking the test.
> 
>  This matters at least for `lseek', which has an `off64_t' aka `long long' 
> argument on n32 (there's no `_llseek' on n32).  Since arguments are passed 
> via 64-bit registers and a `long long' datum is held in just one this is 
> transparent between n32 and n64 (of course on n64 this corresponds to the 
> plain `long' data type, so the kernel, which is always n64 for 64-bit 
> configurations, sees the incoming argument as `long', and the same stands 
> for the outgoing return value).
> 
>  Surely non-LFS lseek(2) will produce the syscall's `long long' argument 
> truncated (cf. sysdeps/unix/sysv/linux/mips/mips64/n32/lseek.c in glibc), 
> but both LFS lseek(2) and lseek64(2) will pass the native value on n32.
> 
> > If this is the expected behaviour, then I'd have to add an exception for
> > mips n32 both to the kernel test and to strace that uses this interface.
> 
>  Is MIPS n32 the only psABI across all our architectures supported that 
> can have `long long' syscall arguments?  I guess it might actually be the 
> case, in which case I won't be surprised it needs specific handling.

This is very similar to x32, with the only essential difference:
on x32 the 64-bitness of syscall arguments is exposed to userspace via
__kernel_ulong_t:

arch/x86/include/uapi/asm/posix_types_x32.h:typedef unsigned long long __kernel_ulong_t;

In fact, there is a workaround in strace for this case, and now I realized
that it ceased to work on mips n32 long time ago:

# if defined HAVE___KERNEL_LONG_T && defined HAVE___KERNEL_ULONG_T

#  include <asm/posix_types.h>

typedef __kernel_long_t kernel_long_t;
typedef __kernel_ulong_t kernel_ulong_t;

# elif (defined __x86_64__ && defined __ILP32__) || defined LINUX_MIPSN32

typedef long long kernel_long_t;
typedef unsigned long long kernel_ulong_t;

# else

typedef long kernel_long_t;
typedef unsigned long kernel_ulong_t;

# endif


-- 
ldv

