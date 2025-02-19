Return-Path: <linux-mips+bounces-7864-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CED01A3C7A7
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3A73BDB41
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 18:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0535215041;
	Wed, 19 Feb 2025 18:25:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2657A215051;
	Wed, 19 Feb 2025 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739989501; cv=none; b=FO0psq/YwBdIUoQ2ILfSP/W27PeW+0HbRUTBt6PWuwEnLIklRtuHDPtfMyrxf316+EnMRSGMxi3ah4ay9iRJQ5uJLVmyU23C9nQQouHhv7ZGsqifKNxIOoArZbRZEWmV/syjYVyaMK/C1Ozwg+1LH1muVeKe66bZTPzZ+BOCagk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739989501; c=relaxed/simple;
	bh=GrTE54XdDfZtzydkNGUD7OCxsGhwSrKF0d0bl5d69OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is07F+nF3jBy3/C66xAlfGn7STJKpHt+9UgeumPz4ENMJwMLVFeNnjNler6Szc947pLpl/mZyOokQPI/LKlR+SCxQELjYenWDQSzycrOYZtXJJJzim6J97c1tInns6iwOdWiPX1SMhkCKe8S9llMJ/ayR6r6u9XouIuhP7t1BgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 58E4472C8F5;
	Wed, 19 Feb 2025 21:24:52 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 3EF437CCB3A; Wed, 19 Feb 2025 20:24:52 +0200 (IST)
Date: Wed, 19 Feb 2025 20:24:52 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] syscall.h: introduce syscall_set_nr()
Message-ID: <20250219182451.GA14216@strace.io>
References: <20250217091034.GD18175@strace.io>
 <alpine.DEB.2.21.2502191658530.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502191658530.65342@angie.orcam.me.uk>

On Wed, Feb 19, 2025 at 05:16:05PM +0000, Maciej W. Rozycki wrote:
> On Mon, 17 Feb 2025, Dmitry V. Levin wrote:
> 
> > diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> > index ea050b23d428..b956b015641c 100644
> > --- a/arch/mips/include/asm/syscall.h
> > +++ b/arch/mips/include/asm/syscall.h
> > @@ -41,6 +41,20 @@ static inline long syscall_get_nr(struct task_struct *task,
> >  	return task_thread_info(task)->syscall;
> >  }
> >  
> > +static inline void syscall_set_nr(struct task_struct *task,
> > +				  struct pt_regs *regs,
> > +				  int nr)
> > +{
> > +	/*
> > +	 * New syscall number has to be assigned to regs[2] because
> > +	 * syscall_trace_entry() loads it from there unconditionally.
> 
>  That label is called `trace_a_syscall' in arch/mips/kernel/scall64-o32.S 
> instead.  To bring some order and avoid an inaccuracy here should the odd 
> one be matched to the other three?

Apparently, there are two instances of syscall_trace_entry(), one
n32_syscall_trace_entry(), one trace_a_syscall(), and each of them
is calling syscall_trace_enter(), not to be confused with
syscall_trace_entry():

scall32-o32.S-syscall_trace_entry:
scall32-o32.S-	SAVE_STATIC
scall32-o32.S-	move	a0, sp
scall32-o32.S-
scall32-o32.S:	jal	syscall_trace_enter
scall32-o32.S-
scall32-o32.S-	bltz	v0, 1f			# seccomp failed? Skip syscall
scall32-o32.S-
scall32-o32.S-	RESTORE_STATIC
scall32-o32.S-	lw	v0, PT_R2(sp)		# Restore syscall (maybe modified)
--
scall64-n32.S-n32_syscall_trace_entry:
scall64-n32.S-	SAVE_STATIC
scall64-n32.S-	move	a0, sp
scall64-n32.S:	jal	syscall_trace_enter
scall64-n32.S-
scall64-n32.S-	bltz	v0, 1f			# seccomp failed? Skip syscall
scall64-n32.S-
scall64-n32.S-	RESTORE_STATIC
scall64-n32.S-	ld	v0, PT_R2(sp)		# Restore syscall (maybe modified)
--
scall64-n64.S-syscall_trace_entry:
scall64-n64.S-	SAVE_STATIC
scall64-n64.S-	move	a0, sp
scall64-n64.S:	jal	syscall_trace_enter
scall64-n64.S-
scall64-n64.S-	bltz	v0, 1f			# seccomp failed? Skip syscall
scall64-n64.S-
scall64-n64.S-	RESTORE_STATIC
scall64-n64.S-	ld	v0, PT_R2(sp)		# Restore syscall (maybe modified)
--
scall64-o32.S-trace_a_syscall:
scall64-o32.S-	SAVE_STATIC
scall64-o32.S-	sd	a4, PT_R8(sp)		# Save argument registers
scall64-o32.S-	sd	a5, PT_R9(sp)
scall64-o32.S-	sd	a6, PT_R10(sp)
scall64-o32.S-	sd	a7, PT_R11(sp)		# For indirect syscalls
scall64-o32.S-
scall64-o32.S-	move	a0, sp
scall64-o32.S:	jal	syscall_trace_enter
scall64-o32.S-
scall64-o32.S-	bltz	v0, 1f			# seccomp failed? Skip syscall
scall64-o32.S-
scall64-o32.S-	RESTORE_STATIC
scall64-o32.S-	ld	v0, PT_R2(sp)		# Restore syscall (maybe modified)

I'd change the wording of my comment rather than try to disentangle this.
After all, the most important here is that the new syscall number is
loaded from regs[2] right after the syscall_trace_enter() invocation.

Would you be OK with the following wording:
	/*
	 * New syscall number has to be assigned to regs[2] because it is
	 * loaded from there unconditionally after syscall_trace_enter()
	 * invocation.
	 *
	 * Consequently, if the syscall was indirect and nr != __NR_syscall,
	 * then after this assignment the syscall will cease to be indirect.
	 */
?


-- 
ldv

