Return-Path: <linux-mips+bounces-15718-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TbECJDLWT2r0owIAu9opvQ
	(envelope-from <linux-mips+bounces-15718-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 19:11:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B6733BA4
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 19:11:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rendec.net header.s=default header.b=HOQdvRC4;
	dmarc=pass (policy=reject) header.from=rendec.net;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15718-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15718-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 762D730338BD
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 17:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651EE39B95D;
	Thu,  9 Jul 2026 17:04:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE66823393E;
	Thu,  9 Jul 2026 17:03:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616643; cv=none; b=r2Otq6Ehxkfo/r156U4/A0Fhp4c35tPhwqjZ4qTmo4J1/cUBdb5PwA1JbIFvEeZFx//gxJWEdEhaRwBmGwCXeunkh65+IBf+r4RWEMwhc8UrXdOfrLInsSsJfeqsVQ2XHakvWrRVkDANNXdzG4JKGirO//+8G8yIf2gOO4RuDCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616643; c=relaxed/simple;
	bh=/bD4BeTxdfxYh0darR2dlQC+0vxoNknWmqlPDt7NGm8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EuFD/6IeWemB0P1DPnHavgj09dQXj2R7erSyFAkDUbR4GyOj5M4DiGTGtmXQc+rEADo8cU+dcbcq5F5/HxzEl+OwrNoswX6/l1x3Nz8YcH/gB4wARYtvhXRZGlRxZ9yYumrzBJwzmF1/rfwlGGJSL/s8lZ8ohclzS4YFzdkRhdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=HOQdvRC4; arc=none smtp.client-ip=80.86.107.70
Received: from bat.kanata.rendec.net (unknown [24.114.110.115])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 635A0C3444;
	Thu,  9 Jul 2026 20:03:34 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 635A0C3444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783616636;
	bh=QeTQcmCkS021HmkZ3w/J1fE+WH2x3hk465jNzOmdiww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HOQdvRC4cpDjWxoO4q76o7VJpxbZjQlbfuUOsiqDAUaPuPJStaRmbiQcxJQ980Eps
	 MKFq/GOxxZLqgfu23csRihSSRUSW/5gctxpZAo1uinpu1GDEqcDEuIex/Mzbgh47ta
	 cCEipZ2fxijuCgu82+Hv9gPEgIpv+01gj1FsjVkBe0BVe8PsJncm6hNS4/ilHElftk
	 flFvwyBgIEh76z+XJg23ownBxmO2Sv8OyobBemr1+LB6/Q+hd+F4qDL8I9pInHlerr
	 toXkuZm1JvzkIIQQaZAtM1eVcf+e7dYfEcqZsxsJx1eEuphZ7eWQNXng18btEVDbYR
	 zQBb+9iNgz9Dg==
Message-ID: <390d4e005e22d64734167b656f393518682e0613.camel@rendec.net>
Subject: Re: [patch 12/18] ptrace, treewide: Rename
 ptrace_report_syscall_entry() to ptrace_report_syscall_permit_entry()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Vineet Gupta	 <vgupta@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren	 <guoren@kernel.org>, Brian Cain
 <bcain@kernel.org>, Geert Uytterhoeven	 <geert@linux-m68k.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer	 <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Helge Deller	 <deller@gmx.de>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "David S. Miller"	
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Chris Zankel	
 <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, Michael Ellerman	
 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>,  Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>,  Michal
 =?ISO-8859-1?Q?Such=E1nek?=	 <msuchanek@suse.de>, Jonathan Corbet
 <corbet@lwn.net>, 	linux-doc@vger.kernel.org
Date: Thu, 09 Jul 2026 13:03:28 -0400
In-Reply-To: <20260707190254.280015701@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190254.280015701@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rendec.net,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rendec.net:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15718-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:arnd@arndb.de,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:vgupta@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:guoren@kernel.org,m:bcain@kernel.org,m:geert@linux-m68k.org,m:monstr@monstr.eu,m:tsbogend@alpha.franken.de,m:dinguyen@kernel.org,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:davem@davemloft.net,m:andreas@gaisler.com,m:chris@zankel.net,m:linux-alpha@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arch@vger.kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:ch
 enhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:richard@nod.at,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[radu@rendec.net,linux-mips@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[infradead.org,arndb.de,redhat.com,linaro.org,kernel.org,armlinux.org.uk,arm.com,linux-m68k.org,monstr.eu,alpha.franken.de,gmx.de,users.sourceforge.jp,davemloft.net,gaisler.com,zankel.net,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,huawei.com,nod.at,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radu@rendec.net,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[rendec.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C6B6733BA4

On Tue, 2026-07-07 at 21:06 +0200, Thomas Gleixner wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>=20
> Rename the function so the purpose is clear and make the return type bool=
.
>=20
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Brian Cain <bcain@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> ---
> =C2=A0arch/alpha/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 2 +-
> =C2=A0arch/arc/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/arm/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/arm64/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 2 +-
> =C2=A0arch/csky/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/hexagon/kernel/traps.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 2 +-
> =C2=A0arch/m68k/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/microblaze/kernel/ptrace.c |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/mips/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/nios2/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 2 +-
> =C2=A0arch/openrisc/kernel/ptrace.c=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/parisc/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1=
0 ++++------
> =C2=A0arch/sh/kernel/ptrace_32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 2 +-
> =C2=A0arch/sparc/kernel/ptrace_32.c=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/sparc/kernel/ptrace_64.c=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/um/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0arch/xtensa/kernel/ptrace.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 2 +-
> =C2=A0include/asm-generic/syscall.h=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 4 ++-=
-
> =C2=A0include/linux/entry-common.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 25 +++=
+++++++++-------------
> =C2=A0include/linux/ptrace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 13 ++++++-------
> =C2=A020 files changed, 40 insertions(+), 44 deletions(-)
>=20
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -375,7 +375,7 @@ asmlinkage unsigned long syscall_trace_e
> =C2=A0	struct pt_regs *regs =3D current_pt_regs();
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -		ptrace_report_syscall_entry(regs)) {
> +		!ptrace_report_syscall_permit_entry(regs)) {
> =C2=A0		syscall_set_nr(current, regs, -1);
> =C2=A0		if (regs->r19 =3D=3D 0 && regs->r0 =3D=3D (unsigned long)-1)
> =C2=A0			syscall_set_return_value(current, regs, -ENOSYS, 0);
> --- a/arch/arc/kernel/ptrace.c
> +++ b/arch/arc/kernel/ptrace.c
> @@ -342,7 +342,7 @@ long arch_ptrace(struct task_struct *chi
> =C2=A0asmlinkage int syscall_trace_enter(struct pt_regs *regs)
> =C2=A0{
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		if (ptrace_report_syscall_entry(regs))
> +		if (!ptrace_report_syscall_permit_entry(regs))
> =C2=A0			return ULONG_MAX;
> =C2=A0
> =C2=A0#ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
> --- a/arch/arm/kernel/ptrace.c
> +++ b/arch/arm/kernel/ptrace.c
> @@ -840,7 +840,7 @@ static void report_syscall(struct pt_reg
> =C2=A0
> =C2=A0	if (dir =3D=3D PTRACE_SYSCALL_EXIT)
> =C2=A0		ptrace_report_syscall_exit(regs, 0);
> -	else if (ptrace_report_syscall_entry(regs))
> +	else if (!ptrace_report_syscall_permit_entry(regs))
> =C2=A0		current_thread_info()->abi_syscall =3D -1;
> =C2=A0
> =C2=A0	regs->ARM_ip =3D ip;
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2379,7 +2379,7 @@ static int report_syscall_entry(struct p
> =C2=A0	int regno, ret;
> =C2=A0
> =C2=A0	saved_reg =3D ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
> -	ret =3D ptrace_report_syscall_entry(regs);
> +	ret =3D !ptrace_report_syscall_permit_entry(regs);
> =C2=A0	if (ret)
> =C2=A0		forget_syscall(regs);
> =C2=A0	regs->regs[regno] =3D saved_reg;
> --- a/arch/csky/kernel/ptrace.c
> +++ b/arch/csky/kernel/ptrace.c
> @@ -320,7 +320,7 @@ long arch_ptrace(struct task_struct *chi
> =C2=A0asmlinkage int syscall_trace_enter(struct pt_regs *regs)
> =C2=A0{
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		if (ptrace_report_syscall_entry(regs))
> +		if (!ptrace_report_syscall_permit_entry(regs))
> =C2=A0			return -1;
> =C2=A0
> =C2=A0	if (!seccomp_permit_syscall())
> --- a/arch/hexagon/kernel/traps.c
> +++ b/arch/hexagon/kernel/traps.c
> @@ -345,7 +345,7 @@ void do_trap0(struct pt_regs *regs)
> =C2=A0
> =C2=A0		/* allow strace to catch syscall args=C2=A0 */
> =C2=A0		if (unlikely(test_thread_flag(TIF_SYSCALL_TRACE) &&
> -			ptrace_report_syscall_entry(regs)))
> +			!ptrace_report_syscall_permit_entry(regs)))
> =C2=A0			return;=C2=A0 /*=C2=A0 return -ENOSYS somewhere?=C2=A0 */
> =C2=A0
> =C2=A0		/* Interrupts should be re-enabled for syscall processing */
> --- a/arch/m68k/kernel/ptrace.c
> +++ b/arch/m68k/kernel/ptrace.c
> @@ -279,7 +279,7 @@ asmlinkage int syscall_trace_enter(void)
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		ret =3D ptrace_report_syscall_entry(task_pt_regs(current));
> +		ret =3D !ptrace_report_syscall_permit_entry(task_pt_regs(current));
> =C2=A0
> =C2=A0	if (!seccomp_permit_syscall())
> =C2=A0		return -1;
> --- a/arch/microblaze/kernel/ptrace.c
> +++ b/arch/microblaze/kernel/ptrace.c
> @@ -139,7 +139,7 @@ asmlinkage unsigned long do_syscall_trac
> =C2=A0	secure_computing_strict(regs->r12);
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_entry(regs))
> +	=C2=A0=C2=A0=C2=A0 !ptrace_report_syscall_permit_entry(regs))
> =C2=A0		/*
> =C2=A0		 * Tracing decided this syscall should not happen.
> =C2=A0		 * We'll return a bogus call number to get an ENOSYS
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1324,7 +1324,7 @@ asmlinkage long syscall_trace_enter(stru
> =C2=A0	user_exit();
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
> -		if (ptrace_report_syscall_entry(regs))
> +		if (!ptrace_report_syscall_permit_entry(regs))
> =C2=A0			return -1;
> =C2=A0	}
> =C2=A0
> --- a/arch/nios2/kernel/ptrace.c
> +++ b/arch/nios2/kernel/ptrace.c
> @@ -133,7 +133,7 @@ asmlinkage int do_syscall_trace_enter(vo
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		ret =3D ptrace_report_syscall_entry(task_pt_regs(current));
> +		ret =3D !ptrace_report_syscall_permit_entry(task_pt_regs(current));
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> --- a/arch/openrisc/kernel/ptrace.c
> +++ b/arch/openrisc/kernel/ptrace.c
> @@ -293,7 +293,7 @@ asmlinkage long do_syscall_trace_enter(s
> =C2=A0	long ret =3D 0;
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_entry(regs))
> +	=C2=A0=C2=A0=C2=A0 !ptrace_report_syscall_permit_entry(regs))
> =C2=A0		/*
> =C2=A0		 * Tracing decided this syscall should not happen.
> =C2=A0		 * We'll return a bogus call number to get an ENOSYS
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -326,7 +326,7 @@ long compat_arch_ptrace(struct task_stru
> =C2=A0long do_syscall_trace_enter(struct pt_regs *regs)
> =C2=A0{
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
> -		int rc =3D ptrace_report_syscall_entry(regs);
> +		bool permit =3D ptrace_report_syscall_permit_entry(regs);
> =C2=A0
> =C2=A0		/*
> =C2=A0		 * As tracesys_next does not set %r28 to -ENOSYS
> @@ -334,12 +334,10 @@ long do_syscall_trace_enter(struct pt_re
> =C2=A0		 */
> =C2=A0		regs->gr[28] =3D -ENOSYS;
> =C2=A0
> -		if (rc) {
> +		if (!permit) {
> =C2=A0			/*
> -			 * A nonzero return code from
> -			 * ptrace_report_syscall_entry() tells us
> -			 * to prevent the syscall execution.=C2=A0 Skip
> -			 * the syscall call and the syscall restart handling.
> +			 * Skip the syscall call and the syscall restart
> +			 * handling.
> =C2=A0			 *
> =C2=A0			 * Note that the tracer may also just change
> =C2=A0			 * regs->gr[20] to an invalid syscall number,
> --- a/arch/sh/kernel/ptrace_32.c
> +++ b/arch/sh/kernel/ptrace_32.c
> @@ -455,7 +455,7 @@ long arch_ptrace(struct task_struct *chi
> =C2=A0asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
> =C2=A0{
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_entry(regs)) {
> +	=C2=A0=C2=A0=C2=A0 !ptrace_report_syscall_permit_entry(regs)) {
> =C2=A0		regs->regs[0] =3D -ENOSYS;
> =C2=A0		return -1;
> =C2=A0	}
> --- a/arch/sparc/kernel/ptrace_32.c
> +++ b/arch/sparc/kernel/ptrace_32.c
> @@ -441,7 +441,7 @@ asmlinkage int syscall_trace(struct pt_r
> =C2=A0		if (syscall_exit_p)
> =C2=A0			ptrace_report_syscall_exit(regs, 0);
> =C2=A0		else
> -			ret =3D ptrace_report_syscall_entry(regs);
> +			ret =3D !ptrace_report_syscall_permit_entry(regs);
> =C2=A0	}
> =C2=A0
> =C2=A0	return ret;
> --- a/arch/sparc/kernel/ptrace_64.c
> +++ b/arch/sparc/kernel/ptrace_64.c
> @@ -1093,7 +1093,7 @@ asmlinkage int syscall_trace_enter(struc
> =C2=A0		user_exit();
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		ret =3D ptrace_report_syscall_entry(regs);
> +		ret =3D !ptrace_report_syscall_permit_entry(regs);
> =C2=A0
> =C2=A0	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> =C2=A0		trace_sys_enter(regs, regs->u_regs[UREG_G1]);
> --- a/arch/um/kernel/ptrace.c
> +++ b/arch/um/kernel/ptrace.c
> @@ -135,7 +135,7 @@ int syscall_trace_enter(struct pt_regs *
> =C2=A0	if (!test_thread_flag(TIF_SYSCALL_TRACE))
> =C2=A0		return 0;
> =C2=A0
> -	return ptrace_report_syscall_entry(regs);
> +	return !ptrace_report_syscall_permit_entry(regs);
> =C2=A0}
> =C2=A0
> =C2=A0void syscall_trace_leave(struct pt_regs *regs)
> --- a/arch/xtensa/kernel/ptrace.c
> +++ b/arch/xtensa/kernel/ptrace.c
> @@ -547,7 +547,7 @@ int do_syscall_trace_enter(struct pt_reg
> =C2=A0		regs->areg[2] =3D -ENOSYS;
> =C2=A0
> =C2=A0	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_entry(regs)) {
> +	=C2=A0=C2=A0=C2=A0 !ptrace_report_syscall_permit_entry(regs)) {
> =C2=A0		regs->areg[2] =3D -ENOSYS;
> =C2=A0		regs->syscall =3D NO_SYSCALL;
> =C2=A0		return 0;
> --- a/include/asm-generic/syscall.h
> +++ b/include/asm-generic/syscall.h
> @@ -58,8 +58,8 @@ void syscall_set_nr(struct task_struct *
> =C2=A0 *
> =C2=A0 * It's only valid to call this when @task is stopped for system
> =C2=A0 * call exit tracing (due to %SYSCALL_WORK_SYSCALL_TRACE or
> - * %SYSCALL_WORK_SYSCALL_AUDIT), after ptrace_report_syscall_entry()
> - * returned nonzero to prevent the system call from taking place.
> + * %SYSCALL_WORK_SYSCALL_AUDIT), after ptrace_report_syscall_permit_entr=
y()
> + * returned False to prevent the system call from taking place.
> =C2=A0 *
> =C2=A0 * This rolls back the register state in @regs so it's as if the
> =C2=A0 * system call instruction was a no-op.=C2=A0 The registers contain=
ing
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -38,21 +38,22 @@
> =C2=A0				 SYSCALL_WORK_SYSCALL_EXIT_TRAP)
> =C2=A0
> =C2=A0/**
> - * arch_ptrace_report_syscall_entry - Architecture specific ptrace_repor=
t_syscall_entry() wrapper
> + * arch_ptrace_report_syscall_permit_entry - Architecture specific wrapp=
er for
> + *					=C2=A0=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_permit_entry()
> =C2=A0 * @regs: Pointer to the register state at syscall entry
> =C2=A0 *
> - * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entr=
y().
> + * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_perm=
it_entry().
> =C2=A0 *
> - * This allows architecture specific ptrace_report_syscall_entry()
> + * This allows architecture specific ptrace_report_syscall_permit_entry(=
)
> =C2=A0 * implementations. If not defined by the architecture this falls b=
ack to
> - * to ptrace_report_syscall_entry().
> + * to ptrace_report_syscall_permit_entry().
> =C2=A0 */
> -static __always_inline int arch_ptrace_report_syscall_entry(struct pt_re=
gs *regs);
> +static __always_inline bool arch_ptrace_report_syscall_permit_entry(stru=
ct pt_regs *regs);
> =C2=A0
> -#ifndef arch_ptrace_report_syscall_entry
> -static __always_inline int arch_ptrace_report_syscall_entry(struct pt_re=
gs *regs)
> +#ifndef arch_ptrace_report_syscall_permit_entry
> +static __always_inline bool arch_ptrace_report_syscall_permit_entry(stru=
ct pt_regs *regs)
> =C2=A0{
> -	return ptrace_report_syscall_entry(regs);
> +	return ptrace_report_syscall_permit_entry(regs);
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> @@ -73,8 +74,6 @@ static inline void syscall_enter_audit(s
> =C2=A0static __always_inline long syscall_trace_enter(struct pt_regs *reg=
s, unsigned long work,
> =C2=A0						long syscall)
> =C2=A0{
> -	long ret =3D 0;
> -
> =C2=A0	/*
> =C2=A0	 * Handle Syscall User Dispatch.=C2=A0 This must comes first, sinc=
e
> =C2=A0	 * the ABI here can be something that doesn't make sense for
> @@ -95,8 +94,8 @@ static __always_inline long syscall_trac
> =C2=A0
> =C2=A0	/* Handle ptrace */
> =C2=A0	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)=
) {
> -		ret =3D arch_ptrace_report_syscall_entry(regs);
> -		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
> +		if (!arch_ptrace_report_syscall_permit_entry(regs) ||
> +		=C2=A0=C2=A0=C2=A0 (work & SYSCALL_WORK_SYSCALL_EMU))
> =C2=A0			return -1L;
> =C2=A0	}
> =C2=A0
> @@ -137,7 +136,7 @@ static __always_inline long syscall_trac
> =C2=A0 * It handles the following work items:
> =C2=A0 *
> =C2=A0 *=C2=A0 1) syscall_work flag dependent invocations of
> - *=C2=A0=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_entry(), __seccomp_perm=
it_syscall(), trace_sys_enter()
> + *=C2=A0=C2=A0=C2=A0=C2=A0 ptrace_report_syscall_permit_entry(), __secco=
mp_permit_syscall(), trace_sys_enter()
> =C2=A0 *=C2=A0 2) Invocation of audit_syscall_entry()
> =C2=A0 */
> =C2=A0static __always_inline long syscall_enter_from_user_mode_work(struc=
t pt_regs *regs, long syscall)
> --- a/include/linux/ptrace.h
> +++ b/include/linux/ptrace.h
> @@ -405,13 +405,13 @@ extern void sigaction_compat_abi(struct
> =C2=A0/*
> =C2=A0 * ptrace report for syscall entry and exit looks identical.
> =C2=A0 */
> -static inline int ptrace_report_syscall(unsigned long message)
> +static inline bool ptrace_report_syscall(unsigned long message)
> =C2=A0{
> =C2=A0	int ptrace =3D current->ptrace;
> =C2=A0	int signr;
> =C2=A0
> =C2=A0	if (!(ptrace & PT_PTRACED))
> -		return 0;
> +		return true;
> =C2=A0
> =C2=A0	signr =3D ptrace_notify(SIGTRAP | ((ptrace & PT_TRACESYSGOOD) ? 0x=
80 : 0),
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message);
> @@ -424,11 +424,11 @@ static inline int ptrace_report_syscall(
> =C2=A0	if (signr)
> =C2=A0		send_sig(signr, current, 1);
> =C2=A0
> -	return fatal_signal_pending(current);
> +	return !fatal_signal_pending(current);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * ptrace_report_syscall_entry - task is about to attempt a system call
> + * ptrace_report_syscall_permit_entry - task is about to attempt a syste=
m call
> =C2=A0 * @regs:		user register state of current task
> =C2=A0 *
> =C2=A0 * This will be called if %SYSCALL_WORK_SYSCALL_TRACE or
> @@ -438,7 +438,7 @@ static inline int ptrace_report_syscall(
> =C2=A0 * call number and arguments to be tried.=C2=A0 It is safe to block=
 here,
> =C2=A0 * preventing the system call from beginning.
> =C2=A0 *
> - * Returns zero normally, or nonzero if the calling arch code should abo=
rt
> + * Returns True normally, or False if the calling architecture code shou=
ld abort
> =C2=A0 * the system call.=C2=A0 That must prevent normal entry so no syst=
em call is
> =C2=A0 * made.=C2=A0 If @task ever returns to user mode after this, its r=
egister state
> =C2=A0 * is unspecified, but should be something harmless like an %ENOSYS=
 error
> @@ -447,8 +447,7 @@ static inline int ptrace_report_syscall(
> =C2=A0 *
> =C2=A0 * Called without locks, just after entering kernel mode.
> =C2=A0 */
> -static inline __must_check int ptrace_report_syscall_entry(
> -	struct pt_regs *regs)
> +static inline __must_check bool ptrace_report_syscall_permit_entry(struc=
t pt_regs *regs)
> =C2=A0{
> =C2=A0	return ptrace_report_syscall(PTRACE_EVENTMSG_SYSCALL_ENTRY);
> =C2=A0}

Reviewed-by: Radu Rendec <radu@rendec.net>

