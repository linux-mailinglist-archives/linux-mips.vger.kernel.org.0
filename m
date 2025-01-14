Return-Path: <linux-mips+bounces-7438-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2840A10BB0
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 17:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B5E43A1339
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 16:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D751614831D;
	Tue, 14 Jan 2025 16:03:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33A6232451;
	Tue, 14 Jan 2025 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870613; cv=none; b=iGXG9rXim6PBuLCjQg+cQCRUj6ML0aa6SLiVNvXojpSNzNX0qcWE17R98QJgP8Ox63/XT1A1HM8ZBmmggg4K25+SUA17u8h2upG8luAyOdwzR3hqqn0lw2oaAp7SUAa6dFISyCGae8Ypf9++phXlGPizpHF/Oko+UMJlQ/loBac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870613; c=relaxed/simple;
	bh=mWdlkF2RMDdTZECk8c0RrH7D4Bctf2LejbcyUkQ2UNM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RoEeDeVGv+FbMERKAKOxj4HoVGj8/aiG1ONSKXtPz2giY0Jw0mr9zXjChH83wLAHwLH5c4UhoTK8HGBMTMosR1x8y5TT5nZuxMfNx+ZKyciMcuRnFWyNe5wNNGyjD5G0mm2UW1IEApDKbLPzGMjMQHoWJSHUh/e23xAuHjyV7lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A040B92009C; Tue, 14 Jan 2025 17:03:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9A3A492009B;
	Tue, 14 Jan 2025 16:03:28 +0000 (GMT)
Date: Tue, 14 Jan 2025 16:03:28 +0000 (GMT)
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
In-Reply-To: <20250114084709.GA3580@strace.io>
Message-ID: <alpine.DEB.2.21.2501141351140.50458@angie.orcam.me.uk>
References: <20250113171114.GB589@strace.io> <alpine.DEB.2.21.2501140213050.50458@angie.orcam.me.uk> <20250114084709.GA3580@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jan 2025, Dmitry V. Levin wrote:

> >  How did you produce these results?
> 
> $ PATH="$HOME/x-tools/mips64-unknown-linux-gnu/bin:$PATH" make -j`nproc` ARCH=mips CROSS_COMPILE=mips64-unknown-linux-gnu- -C tools/testing/selftests TARGETS=ptrace USERLDFLAGS='-static' USERCFLAGS='-mabi=32'
> $ echo init |(cd tools/testing/selftests/ptrace && ln -snf get_syscall_info init && cpio --dereference -o -H newc -R 0:0) |gzip >get_syscall_info.mips-o32.img
> $ qemu-system-mips -nographic -kernel vmlinuz -initrd get_syscall_info.mips-o32.img -append 'console=ttyS0'
> 
> Likewise for mips64, but the patch for kselftest_harness.h from [1]
> is needed to see correct mismatch values in the test diagnostics.
> 
> [1] https://lore.kernel.org/all/20250108170757.GA6723@strace.io/

 Thanks, I'll try to see what's going on with `get_user'.

> >  The patch is definitely broken, the calling convention is the same 
> > between n32 and n64: 64-bit arguments in $4 through $11 registers as 
> > required, and your change makes n32 truncate arguments to 32 bits.
> 
> There must be something very specific to n32 then: apparently,
> __kernel_ulong_t is a 32-bit type on n32, so the syscall arguments are
> 32-bit values, at some point (in glibc?) they get sign-extended from 32 to
> 64 bits, and syscall_get_arguments returns them as 64-bit values different
> from the original syscall arguments, breaking the test.

 This matters at least for `lseek', which has an `off64_t' aka `long long' 
argument on n32 (there's no `_llseek' on n32).  Since arguments are passed 
via 64-bit registers and a `long long' datum is held in just one this is 
transparent between n32 and n64 (of course on n64 this corresponds to the 
plain `long' data type, so the kernel, which is always n64 for 64-bit 
configurations, sees the incoming argument as `long', and the same stands 
for the outgoing return value).

 Surely non-LFS lseek(2) will produce the syscall's `long long' argument 
truncated (cf. sysdeps/unix/sysv/linux/mips/mips64/n32/lseek.c in glibc), 
but both LFS lseek(2) and lseek64(2) will pass the native value on n32.

> If this is the expected behaviour, then I'd have to add an exception for
> mips n32 both to the kernel test and to strace that uses this interface.

 Is MIPS n32 the only psABI across all our architectures supported that 
can have `long long' syscall arguments?  I guess it might actually be the 
case, in which case I won't be surprised it needs specific handling.

  Maciej

