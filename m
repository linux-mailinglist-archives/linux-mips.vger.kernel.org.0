Return-Path: <linux-mips+bounces-7865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676EA3C7F0
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E16153AE134
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 18:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C19214A71;
	Wed, 19 Feb 2025 18:48:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9085C1B85D2;
	Wed, 19 Feb 2025 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739990935; cv=none; b=B3ciNe/8R/vtRKacEq6YitdNKFlzQSIloZlW0R8y3p1e3enYHDLxVzDN4VMdck+LaizdU7IteNUvWOp3IhY3a/SbhC2lKdtl2dtvQKYSXjKatzt6NCRJD1pKQ4ns/CjGhb0+IRjaqHp3Rs74aqBwAPeCTkW5P+ZcuM9+GgC7ZQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739990935; c=relaxed/simple;
	bh=lPF34veM0Z+mr0chwyd2uMyRf0S56MYkuUP7GYxGuCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ8LJAmKoTCpHdRxXGwDBeeG/kREbfGqYGWxf+otNWRY1LwQNaJ0hw/0VsXYkGVrbm/rlEf75qg4wnYTsVJeF+/jzrI2i1fceZCOFDQOemMIPto4XdTBXy0aRtjrhQkXWKp7in4n62AiA+dPrVuDiR9+tjvqA5HoMZCuseh/urk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 7D71E72C8F5;
	Wed, 19 Feb 2025 21:48:52 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 6B0D37CCB3A; Wed, 19 Feb 2025 20:48:52 +0200 (IST)
Date: Wed, 19 Feb 2025 20:48:52 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250219184852.GB14216@strace.io>
References: <20250217091020.GC18175@strace.io>
 <alpine.DEB.2.21.2502191642590.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502191642590.65342@angie.orcam.me.uk>

On Wed, Feb 19, 2025 at 05:15:48PM +0000, Maciej W. Rozycki wrote:
> On Mon, 17 Feb 2025, Dmitry V. Levin wrote:
[...]
> > diff --git a/arch/csky/include/asm/syscall.h b/arch/csky/include/asm/syscall.h
> > index 0de5734950bf..30403f7a0487 100644
> > --- a/arch/csky/include/asm/syscall.h
> > +++ b/arch/csky/include/asm/syscall.h
> > @@ -59,6 +59,19 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
> >  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> >  }
> >  
> > +static inline void
> > +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> > +		      const unsigned long *args)
> > +{
> > +	memcpy(&regs->a0, args, 6 * sizeof(regs->a0));
> > +	/*
> > +	 * Also copy the first argument into orig_x0
>                                                   ^
>  Typo here, s/orig_x0/orig_a0/; see below.
> 
> > +	 * so that syscall_get_arguments() would return it
> > +	 * instead of the previous value.
> > +	 */
> > +	regs->orig_a0 = regs->a0;

Indeed, thanks for spotting this.

>  Also:
> 
> > diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> > index 056aa1b713e2..ea050b23d428 100644
> > --- a/arch/mips/include/asm/syscall.h
> > +++ b/arch/mips/include/asm/syscall.h
> > @@ -120,6 +137,21 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  		mips_get_syscall_arg(args++, task, regs, i++);
> >  }
> >  
> > +static inline void syscall_set_arguments(struct task_struct *task,
> > +					 struct pt_regs *regs,
> > +					 unsigned long *args)
> > +{
> > +	unsigned int i = 0;
> > +	unsigned int n = 6;
> > +
> > +	/* O32 ABI syscall() */
> > +	if (mips_syscall_is_indirect(task, regs))
> > +		i++;
> 
> -- given MIPS syscall_set_nr() implementation in 3/6 this conditional is 
> supposed to never be true.  Should it be BUG_ON() or discarded entirely?

I agree it should be discarded: given that the syscall number read from
regs[2] after syscall_trace_enter() invocation is not treated in any
special way with regards to __NR_syscall, it would be incorrect to do
it here either.  In fact, user space is allowed to set regs[2] to
__NR_syscall, even though it's pointless, but it's definitely not a
BUG_ON() situation.

I'll remove this check, thanks for the review!


-- 
ldv

