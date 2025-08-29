Return-Path: <linux-mips+bounces-10813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F425B3B8D7
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E9AA05E3A
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F49C30C63D;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE1F3054E9;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463485; cv=none; b=oPriI6OG0PblMQBLcBqQEmMOWntkT1IZfVX1zZ9B+frsSUl36BfCD5LuLFtOAdJjmuwP6QpiN7hAV8VtBXGHQBuv7iVAykgwILaL/fgZ+/DWFAE+70hJex7X7ogTuwTjgTYMJx1bOK9sYdZ7cFdjIlHu7bi8rWq3iv1TyqOQdA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463485; c=relaxed/simple;
	bh=k/Ux2LAh/ziRrcYbe5+YO3YaWkgLVowuW5e+SMpJppk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFc0XOpPh7Cw3hGr0lVv0t1cC58df4HIxKcHkEboxzotsRvZETf8VBs3ZjtRi64GtyorcnVl263w5FY0O86SROvrogdQG4thSYUODj0Q2RfpPdJP4NCfX1QWGB0MVhCgC4oN76008l4vXmhQnYM8zJyMPFDwYZ2t/cSg13RYaGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004FU-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B9B9AC0810; Fri, 29 Aug 2025 12:21:28 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:21:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Huth <thuth@redhat.com>
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mips: Replace __ASSEMBLY__ with __ASSEMBLER__ in the
 mips headers
Message-ID: <aLF_KF9yQ8Vm-Mf-@alpha.franken.de>
References: <20250804065629.55397-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804065629.55397-1-thuth@redhat.com>

On Mon, Aug 04, 2025 at 08:56:29AM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembler code, __ASSEMBLY__ is a macro
> that only gets defined by the Makefiles in the kernel. Defining
> such a macro was necessary in the early days of the kernel, since GCC
> only started providing __ASSEMBLER__ since version 3.0 in 2000 (see
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=f8f769ea4e69 ).
> However, having two macros can be very confusing nowadays for the
> developers when switching between userspace and kernelspace coding,
> or when dealing with uapi headers that should use __ASSEMBLER__
> instead. So let's now standardize on the __ASSEMBLER__ macro that is
> provided by the compilers.
> 
> This is almost a completely mechanical patch (done with a simple
> "sed -i" statement), with just one comment tweaked manually in
> arch/mips/include/asm/cpu.h (that was missing some underscores).
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3: Updated the patch description according to the suggestions of Maciej
> 
>  arch/mips/include/asm/addrspace.h            |  4 +--
>  arch/mips/include/asm/asm-eva.h              |  6 ++--
>  arch/mips/include/asm/asm.h                  |  8 ++---
>  arch/mips/include/asm/bmips.h                |  4 +--
>  arch/mips/include/asm/cpu.h                  |  4 +--
>  arch/mips/include/asm/dec/ecc.h              |  2 +-
>  arch/mips/include/asm/dec/interrupts.h       |  4 +--
>  arch/mips/include/asm/dec/kn01.h             |  2 +-
>  arch/mips/include/asm/dec/kn02.h             |  2 +-
>  arch/mips/include/asm/dec/kn02xa.h           |  2 +-
>  arch/mips/include/asm/eva.h                  |  4 +--
>  arch/mips/include/asm/ftrace.h               |  8 ++---
>  arch/mips/include/asm/hazards.h              |  4 +--
>  arch/mips/include/asm/irqflags.h             |  4 +--
>  arch/mips/include/asm/jazz.h                 | 16 ++++-----
>  arch/mips/include/asm/jump_label.h           |  4 +--
>  arch/mips/include/asm/linkage.h              |  2 +-
>  arch/mips/include/asm/mach-generic/spaces.h  |  4 +--
>  arch/mips/include/asm/mips-boards/bonito64.h |  4 +--
>  arch/mips/include/asm/mipsmtregs.h           |  6 ++--
>  arch/mips/include/asm/mipsregs.h             |  6 ++--
>  arch/mips/include/asm/msa.h                  |  4 +--
>  arch/mips/include/asm/pci/bridge.h           |  4 +--
>  arch/mips/include/asm/pm.h                   |  6 ++--
>  arch/mips/include/asm/prefetch.h             |  2 +-
>  arch/mips/include/asm/regdef.h               |  4 +--
>  arch/mips/include/asm/sibyte/board.h         |  4 +--
>  arch/mips/include/asm/sibyte/sb1250.h        |  2 +-
>  arch/mips/include/asm/sibyte/sb1250_defs.h   |  6 ++--
>  arch/mips/include/asm/smp-cps.h              |  6 ++--
>  arch/mips/include/asm/sn/addrs.h             | 18 +++++-----
>  arch/mips/include/asm/sn/gda.h               |  4 +--
>  arch/mips/include/asm/sn/kldir.h             |  4 +--
>  arch/mips/include/asm/sn/klkernvars.h        |  4 +--
>  arch/mips/include/asm/sn/launch.h            |  4 +--
>  arch/mips/include/asm/sn/nmi.h               |  8 ++---
>  arch/mips/include/asm/sn/sn0/addrs.h         | 14 ++++----
>  arch/mips/include/asm/sn/sn0/hub.h           |  2 +-
>  arch/mips/include/asm/sn/sn0/hubio.h         | 36 ++++++++++----------
>  arch/mips/include/asm/sn/sn0/hubmd.h         |  4 +--
>  arch/mips/include/asm/sn/sn0/hubni.h         |  6 ++--
>  arch/mips/include/asm/sn/sn0/hubpi.h         |  4 +--
>  arch/mips/include/asm/sn/types.h             |  2 +-
>  arch/mips/include/asm/sync.h                 |  2 +-
>  arch/mips/include/asm/thread_info.h          |  4 +--
>  arch/mips/include/asm/unistd.h               |  4 +--
>  arch/mips/include/asm/vdso/gettimeofday.h    |  4 +--
>  arch/mips/include/asm/vdso/processor.h       |  4 +--
>  arch/mips/include/asm/vdso/vdso.h            |  4 +--
>  arch/mips/include/asm/vdso/vsyscall.h        |  4 +--
>  arch/mips/include/asm/xtalk/xtalk.h          |  4 +--
>  arch/mips/include/asm/xtalk/xwidget.h        |  4 +--
>  drivers/soc/bcm/brcmstb/pm/pm.h              |  2 +-
>  53 files changed, 142 insertions(+), 142 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

