Return-Path: <linux-mips+bounces-15633-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tWy/K9a/TmrBTQIAu9opvQ
	(envelope-from <linux-mips+bounces-15633-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 23:23:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204572A814
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 23:23:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rendec.net header.s=default header.b=H73P2hvf;
	dmarc=pass (policy=reject) header.from=rendec.net;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15633-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15633-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16C67308E61D
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 21:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165193F54DD;
	Wed,  8 Jul 2026 21:21:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D63F39D3;
	Wed,  8 Jul 2026 21:21:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545712; cv=none; b=u/gO+z4qePqq5xo28Gb4af6A83kgyDleUIrBSB5jaRG8s9rzVigEwqFx1cb8RzcvKiyipNrqmWuXl7jyE3th7B4pU7HLbyUt1/EfrS+FJbfHSqbTbKgkbyvUOH4icwiAJv3r4zJ5cmxidMEpquuDINtNhSsCFF17D/mQgmKZn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545712; c=relaxed/simple;
	bh=gA90Ha6tpVTtSvyChMKd7EA+UzPuD3ZxiiumMcmVt04=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n3I+6c3wzlboWQvrTup4gNdWrkLGWfQVMLi3yxVNWqKU7Sigtkw4SSKyCYecj0H+1r2dPt2xK+JLByuBQplhB7U9ezD0TtJ5gGgJq8vkP3Il2dOEH3HQ2cLO0ZnLetK3HB7woRpiQGkKz/a62/o5B0nQbGf7NJYulmKMmvrOBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=H73P2hvf; arc=none smtp.client-ip=80.86.107.70
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 861B2C343F;
	Thu,  9 Jul 2026 00:21:24 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 861B2C343F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783545706;
	bh=kcBzFv6UQNpvLv0B/9fxsmBCsaF3luDIfOX4WPfJ0LI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=H73P2hvfJZwIoqeJMs+L8qKs84L6aXmcpvOfF+kp0m/siC+vpb3dmh5/rQGzQvZb1
	 KAdLUM9HsIAVBSvQjur23GoqyvDR1vgkeRT+zXhGdund4eNITGlrejtsuhMxfFKCAR
	 IZ2RR1YudeVpqiP4/BJTXsJStEaItfFAHRrFL/MeBdH47TYEEwHpIXXyM29AJ0RJba
	 vDIsPAjX9g3lfxQFYB1UHQ6gSu4bIZDX60YvEcwW27AO+k2CzGxaM5EC7xOeYYIbCf
	 SQX7lGJfXcy7EYovUwRvpU/bXxv/k8y5ltB87qAr3f6aIyyUbl73d4R/VmW3qRZE22
	 yV9hYRdOWZEFg==
Message-ID: <28fb0a8fd840bbf5223c60fea156584cb0f0f208.camel@rendec.net>
Subject: Re: [patch 09/18] entry: Remove syscall_enter_from_user_mode()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>,  Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>,  Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven	 <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Helge Deller	 <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, 	linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, 	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, 	linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta	 <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>,  Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>,  Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?ISO-8859-1?Q?Such=E1nek?=	
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Date: Wed, 08 Jul 2026 17:21:19 -0400
In-Reply-To: <20260707190254.132654198@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190254.132654198@kernel.org>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rendec.net,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rendec.net:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15633-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[radu@rendec.net,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rendec.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radu@rendec.net,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,rendec.net:from_mime,rendec.net:dkim,rendec.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3204572A814

On Tue, 2026-07-07 at 21:06 +0200, Thomas Gleixner wrote:
> All architecture use either:
>=20
> =C2=A0=C2=A0=C2=A0 nr =3D enter_from_user_mode_randomize_stack(regs, nr);

You probably mean syscall_enter_from_user_mode_randomize_stack.

>=20
> or
>=20
> =C2=A0=C2=A0=C2=A0 enter_from_user_mode_randomize_stack(regs);
> =C2=A0=C2=A0=C2=A0 nr =3D syscall_enter_from_user_mode_work(regs, nr);
>=20
> Remove the now unused function.
>=20
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
> =C2=A0Documentation/core-api/entry.rst |=C2=A0=C2=A0 17 +++++++++-------
> =C2=A0include/linux/entry-common.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
40 +++------------------------------------
> =C2=A0include/linux/irq-entry-common.h |=C2=A0=C2=A0=C2=A0 6 ++---
> =C2=A03 files changed, 17 insertions(+), 46 deletions(-)
>=20
> --- a/Documentation/core-api/entry.rst
> +++ b/Documentation/core-api/entry.rst
> @@ -68,7 +68,7 @@ low-level C code must not be instrumente
> =C2=A0=C2=A0 noinstr void syscall(struct pt_regs *regs, int nr)
> =C2=A0=C2=A0 {
> =C2=A0	arch_syscall_enter(regs);
> -	nr =3D syscall_enter_from_user_mode(regs, nr);
> +	nr =3D syscall_enter_from_user_mode_randomize_stack(regs, nr);
> =C2=A0
> =C2=A0	instrumentation_begin();
> =C2=A0	if (!invoke_syscall(regs, nr) && nr !=3D -1)
> @@ -78,12 +78,14 @@ low-level C code must not be instrumente
> =C2=A0	syscall_exit_to_user_mode(regs);
> =C2=A0=C2=A0 }
> =C2=A0
> -syscall_enter_from_user_mode() first invokes enter_from_user_mode() whic=
h
> -establishes state in the following order:
> +syscall_enter_from_user_mode_randomize_stack() first invokes
> +enter_from_user_mode_randomize_stack() which establishes state in the
> +following order:
> =C2=A0
> =C2=A0=C2=A0 * Lockdep
> =C2=A0=C2=A0 * RCU / Context tracking
> =C2=A0=C2=A0 * Tracing
> +=C2=A0 * Apply stack randomization
> =C2=A0
> =C2=A0and then invokes the various entry work functions like ptrace, secc=
omp, audit,
> =C2=A0syscall tracing, etc. After all that is done, the instrumentable in=
voke_syscall
> @@ -99,10 +101,11 @@ that it invokes exit_to_user_mode() whic
> =C2=A0=C2=A0 * RCU / Context tracking
> =C2=A0=C2=A0 * Lockdep
> =C2=A0
> -syscall_enter_from_user_mode() and syscall_exit_to_user_mode() are also
> -available as fine grained subfunctions in cases where the architecture c=
ode
> -has to do extra work between the various steps. In such cases it has to
> -ensure that enter_from_user_mode() is called first on entry and
> +syscall_enter_from_user_mode_randomize_stack() and
> +syscall_exit_to_user_mode() are also available as fine grained subfuncti=
ons
> +in cases where the architecture code has to do extra work between the
> +various steps. In such cases it has to ensure that
> +enter_from_user_mode_randomize_stack() is called first on entry and
> =C2=A0exit_to_user_mode() is called last on exit.
> =C2=A0
> =C2=A0Do not nest syscalls. Nested syscalls will cause RCU and/or context=
 tracking
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -19,7 +19,7 @@
> =C2=A0#endif
> =C2=A0
> =C2=A0/*
> - * SYSCALL_WORK flags handled in syscall_enter_from_user_mode()
> + * SYSCALL_WORK flags handled in syscall_enter_from_user_mode_work()
> =C2=A0 */
> =C2=A0#define SYSCALL_WORK_ENTER	(SYSCALL_WORK_SECCOMP |			\
> =C2=A0				 SYSCALL_WORK_SYSCALL_TRACEPOINT |	\
> @@ -205,42 +205,10 @@ do {									\
> =C2=A0	_ret;								\
> =C2=A0})
> =C2=A0
> -/**
> - * syscall_enter_from_user_mode - Establish state and check and handle w=
ork
> - *				=C2=A0 before invoking a syscall
> - * @regs:	Pointer to currents pt_regs
> - * @syscall:	The syscall number
> - *
> - * Invoked from architecture specific syscall entry code with interrupts
> - * disabled. The calling code has to be non-instrumentable. When the
> - * function returns all state is correct, interrupts are enabled and the
> - * subsequent functions can be instrumented.
> - *
> - * This is the combination of enter_from_user_mode() and
> - * syscall_enter_from_user_mode_work() to be used when there is no
> - * architecture specific work to be done between the two.
> - *
> - * Returns: The original or a modified syscall number. See
> - * syscall_enter_from_user_mode_work() for further explanation.
> - */
> -static __always_inline long syscall_enter_from_user_mode(struct pt_regs =
*regs, long syscall)
> -{
> -	long ret;
> -
> -	enter_from_user_mode(regs);
> -
> -	instrumentation_begin();
> -	local_irq_enable();
> -	ret =3D syscall_enter_from_user_mode_work(regs, syscall);
> -	instrumentation_end();
> -
> -	return ret;
> -}
> -
> =C2=A0/*
> - * If SYSCALL_EMU is set, then the only reason to report is when
> - * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).=C2=A0 This syscall
> - * instruction has been already reported in syscall_enter_from_user_mode=
().
> + * If SYSCALL_EMU is set, then the only reason to report is when SINGLES=
TEP is
> + * set (i.e. PTRACE_SYSEMU_SINGLESTEP).=C2=A0 This syscall instruction h=
as been
> + * already reported in syscall_enter_from_user_mode_work().
> =C2=A0 */
> =C2=A0static __always_inline bool report_single_step(unsigned long work)
> =C2=A0{
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -49,9 +49,9 @@
> =C2=A0 * Defaults to an empty implementation. Can be replaced by architec=
ture
> =C2=A0 * specific code.
> =C2=A0 *
> - * Invoked from syscall_enter_from_user_mode() in the non-instrumentable
> - * section. Use __always_inline so the compiler cannot push it out of li=
ne
> - * and make it instrumentable.
> + * Invoked from enter_from_user_mode_syscall_and_randomize_stack() in th=
e
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Probably syscall_enter_from_user_mode_randomize_stack()? But the
reality is it's only ever invoked from enter_from_user_mode(), which is
below in the same file (include/linux/irq-entry-common.h).

Granted, that's an always inline function, and it's used by both macros
you added (since the second one uses the first one).

> + * non-instrumentable section. Use __always_inline so the compiler canno=
t push
> + * it out of line and make it instrumentable.
> =C2=A0 */
> =C2=A0static __always_inline void arch_enter_from_user_mode(struct pt_reg=
s *regs);
> =C2=A0


