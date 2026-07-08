Return-Path: <linux-mips+bounces-15629-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OqzSEJO0TmrvSgIAu9opvQ
	(envelope-from <linux-mips+bounces-15629-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 22:35:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C60372A3CE
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 22:35:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KBWaMMj7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15629-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15629-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D26E0302D131
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE213E5EC2;
	Wed,  8 Jul 2026 20:34:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FD3E00BD;
	Wed,  8 Jul 2026 20:34:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542882; cv=none; b=Di1mqWoiLRZeNH3bh97qyMZtTVEUYMgYZc6Rov9w+JJ0SE0Y5V/at9Q9yihVRDp4IHjcnd/H1Zzj8fa3ZdtuEAX08jI8wefWzBqQ4tCc+Vv+3g/stq26pzCjaBEnAQIAmqfh8XgxhnBSPZ9utkvLMZ3iOe5SKBrhTixATKIkV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542882; c=relaxed/simple;
	bh=3v+6WJABaaO66B/xl+FmF/glWoWCQWj5sfHWj7p866k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LwlLDYiQylTeWkl1l6JiJ/SYMMcRryEJQYDkj6lq+iIXZlC/AEcAJ0Xos3jglIGVuaXoM3G/0NEumFX37QDzJZORNBFge9tj2ZESescXgSq4gP90KKDESWY9grsXVgp0NXi6hBVqRmd9dNOEw/BCBxFSPWLN2e2oDCDaoip0kng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBWaMMj7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409811F000E9;
	Wed,  8 Jul 2026 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783542881;
	bh=XV21Gvu/Emr9nQ/q86judRNj/QbZCrZ1m+LE1leOgZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KBWaMMj7fzOLrPcoUgRkEtUqRrOJt9n/xdiqN+Vs1q483RrbzeqFzVIrn8qMV348q
	 fzALagUxxo9GHkkXN5K0/pDuyT5lcQFCVrkB3TakI/fH+yX9o21lm17cG/w9mcHlZt
	 oOe4IwVYpbdQ7YFJViRdEjACSmNZ7bCvgRqE44efYSbmZ/P80pUYjPSalQk74K4UGs
	 q1YlQWzgYxg2l/Bqj4QTlBIMbTxy/KKKjGg1H5q7buDTYhJYNVZ+fvvvrIQPf0vACG
	 w9E8v6hcqzE35uRohSqIVauWdUc6/brHFDi4/JJnpbWlnb2h8H6ZQU4FGa9vyFJjCE
	 1BJealh9MtrdA==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type bool
In-Reply-To: <ak5ySpil83TNWxeq@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org> <ak5ySpil83TNWxeq@kunlun.suse.cz>
Date: Wed, 08 Jul 2026 22:34:38 +0200
Message-ID: <87se5tqkyp.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15629-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:msuchanek@suse.de,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@ker
 nel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fw13:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C60372A3CE

On Wed, Jul 08 2026 at 17:52, Michal Such=C3=A1nek wrote:
> On Tue, Jul 07, 2026 at 09:06:48PM +0200, Thomas Gleixner wrote:
>> In preparation of converting the return value of
>> syscall_enter_from_user_mode[_work]() bool, rework trace_syscall_enter()=
 to
>>=20
>>  - update the syscall number via a pointer argument
>>=20
>>  - Return True if the syscall number is !=3D -1, False otherwise
>
> This does not achieve the goal of the initial RFC: To detangle the
> return value of syscall_enter_from_user_mode from the syscall number.

As I explained to you before: Your RFC broke the implicit assumption of
tracing, which is way worse than having this oddity.

> This still conflates them, making it impossible to tell if the syscall
> was rejected or syscall number was -1 to start with. Now also obfuscated
> by performing the check deeper inside the common code.

That's where it belongs. It's a problem to solve within the given
semantics of trace_syscall_enter() and not a problem to be worked around
at the call sites if you want to have consolidated semantics.

>> The only difference is that this also returns False, when the syscall
>> number was already -1 to begin with, but there is not much which can be
>> done about that. As the architecture has to preset the return value to
>> -ENOSYS anyway, that results in the correct return value for such an
>> invalid syscall.
>
> That's not possible to do for architectures where the syscall number and
> the syscall return value are in the same register.
>
> You suggested that it is possible to not write the return value into an
> actual register but use an additional field for that, and have the exit
> code write the register.
>
> However, that's not what is documented, nor what is currently done.

Just because S390 screwed up their ABI and then on top of that failed to
do what _every_ other architecture in the kernel does, i.e. having a
result storage which is preset to -ENOSYS does not mean that S390 did
the right thing just because it was not documented. Kernel documentation
is known to be incomplete and I fixed it up in the last patch as you
might have noticed.

Just for the record. Presetting the return value to -ENOSYS has been
practice for three decades. I couldn't be bothered to do a full search
in the history trees to figure out the exact point, but as of 2.1.9,
which was released in Nov. 1996, this is definitely the case.

So don't tell me that because S390 missed the train when it was
added to mainline in 2007 (, i.e. 11 years _after_ this "undocumented" rule=
 was
established that now 20 years later the world has to revolve around S390
and your personal idea of "clear and intelligible":

> While this is an improvement in some respects the goal to have clear and
> intelligible API around the generic entry is not acheived.

I'm honestly not sure whether I should laugh or cry.

You are completely missing the point:

  1) The set in stone rule is that if the entry code returns -1L as the
     syscall number then the architecture code has to skip the syscall
     invocation _and_ is not supposed to change the return value.

  2) There is no guarantee and never has been that any of the involved
     mechanisms (ptrace, seccomp, tracing) will change the return value
     when it sets the syscall number to -1L.

     Quite the contrary there has been a long time (30 years at least)
     expectation that the return value has been preset to -ENOSYS.

  3) It's trivial as demonstrated to make ptrace and seccomp more
     comprehensible but that does not invalidate #2

  4) Due to the historical integration of tracing (+probes/BPF) there is
     an implicit assumption that the return code is preset to -ENOSYS.
     See #2

  5) There is an obvious ambiguity between the initial syscall number
     being -1 and the change of syscall number to -1 in the case of
     tracing, but that's not unique to tracing:

     If e.g. seccomp() observes the handed in syscall number to be -1
     and tells in the return code to skip the syscall, then it can
     rightfully assume that the return code will be -ENOSYS and has no
     obligation to set it explicitly. See #2

Q: Is it perfect?
A: No

Q: Can it be made perfect?
A: No, because you can't change history and established practice.

Just for illustration. Changing the logic in trace_syscall_enter() to:

--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -9,13 +9,15 @@
=20
 bool trace_syscall_enter(struct pt_regs *regs, long *syscall)
 {
+	long orig_syscall =3D *syscall;
+
 	trace_sys_enter(regs, *syscall);
 	/*
 	 * Probes or BPF hooks in the tracepoint may have changed the
 	 * system call number. Reread it.
 	 */
 	*syscall =3D syscall_get_nr(current, regs);
-	return *syscall !=3D -1L;
+	return *syscall =3D=3D orig_syscall || *syscall !=3D -1L;
 }
=20
 void trace_syscall_exit(struct pt_regs *regs, long ret)

does not make #2 magically go away. It's still the same problem whether
you like it or not.

Thanks,

        tglx
---
        Ignorance is bliss --  Thomas Gray, 1742

