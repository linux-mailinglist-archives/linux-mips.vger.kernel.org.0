Return-Path: <linux-mips+bounces-15587-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D4fmChpOTWrixwEAu9opvQ
	(envelope-from <linux-mips+bounces-15587-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 21:06:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B677971EDA8
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 21:06:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VFkWTdo5;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15587-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15587-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 306A1300CDA6
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 19:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B6C3A6EF1;
	Tue,  7 Jul 2026 19:05:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3962F12A5;
	Tue,  7 Jul 2026 19:05:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451159; cv=none; b=pkEvgJ/wGEQHYxNTnXDdjRAdNZ6ke0tREY3EjUFeQGyP17E4byRSUqaFmG0xcXuEyqA2krjEvKEwANDQ9XKDbSp6HHkHRhDc0KH03YiiuNba8/qiZW3ZDqUL9fliqA/etdXvesJbA5zZvnK4WFTpOexSr+LCHPs4xeV9VUJTp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451159; c=relaxed/simple;
	bh=QXLUt1TPzW5KUIfT+EbS13frXZWcSnBhPA0WRti5QHo=;
	h=Date:Message-ID:From:To:Cc:Subject; b=POA9D7ZKW0/zNUHuA5rKB3WkMniTIJteB8EAENg8NhbVwtwBt1fg1LHd6lLxJcr0qlUrf1Pmg0JlU1I6ZWzgY3/UX05uHHb/AeEgLfHkg2qeTewX/n0KReX/MxrzlfZTfT3AJBHZflxvsHuI+ljeIgwraSElD/x/7CLYHHxXlTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFkWTdo5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113781F000E9;
	Tue,  7 Jul 2026 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451156;
	bh=sKaa6jqJcnZ3kixdUKctGHCLE8bgvUhOgv/iQQ4U2eg=;
	h=Date:From:To:Cc:Subject;
	b=VFkWTdo5yhgpXx9sxvRHZ3HlP4xSZ4aHXa1zsGtMnp9mQpMvU4qieroT0K0+AUmNe
	 mH4Zbvrp37BWRtV+WSrFvOBwzQyMx5YfHARXuOrmubRPkhjAk6NgYYQTWgkAhazAju
	 1djGcOQc2V77x2qVXGFvC6BkwM/+Iezw2J7QhqUY7M9Y5saOvbXsETd73JhuSwTJ1e
	 Hk7rq39ys7eddzm/Skk6nfXmoJIZBJVZnDdD7rbJtFga+XVDyFyYEDjJyfJdP9Y2Vt
	 rb/jER5CfvGmtQfb87VuvQHb1UgZTCkpnw26sWY8rQ0z0x4vkc0U56YUbxw1o0tQkB
	 6sQc63NXlLiVQ==
Date: Tue, 07 Jul 2026 21:05:53 +0200
Message-ID: <20260707181957.433213175@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Kees Cook <kees@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 x86@kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>,
 Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>,
 Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [patch 00/18] entry: Consolidate and rework syscall entry handling
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	TAGGED_FROM(0.00)[bounces-15587-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kern
 el.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B677971EDA8

Sorry for the long CC list, but this is a treewide change.

Michal recently posted a RFC patch to separate the potential syscall number
modifications in syscall_enter_user_mode_work() from the information
whether the syscall should be processed and the return value modified:

  https://lore.kernel.org/lkml/CE1qW@kunlun.suse.cz

The existing logic is:

arch_syscall()
	regs->result = -ENOSYS;

	syscallnr = syscall_enter_from_user_mode(regs, syscall);

	if (syscallnr != -1L)
		regs->result = invoke_syscall(regs, syscall;

syscall_enter_from_user_mode() invokes ptrace, seccomp and
tracing/BPF/Probes. All of them can modify the syscall number.

ptrace and seccomp explicitly set the syscall number to -1L to indicate
that the syscall invocation needs to be skipped and the result has not to
be modified as it might have been modified by ptrace or seccomp. The
tracer/BPF/Probes mechanism can modify the syscall number as well and
relies implicitly on the -1L logic.

This can obviously not be differentiated from a syscall invocation where
userspace provided -1 as syscall number.

The general agreement of the discussion was that the current mechanism,
while functionally correct is non-intuitive and something like Michals
proposal would make that code clearer and easier to handle on the
architecture side:

arch_syscall()
	regs->result = -ENOSYS;

	if (syscall_enter_from_user_mode(regs, &syscall)) 
		regs->result = invoke_syscall(regs, syscall;

That discussion made me look deeper into the related code and as usual
there were a lot of other things to discover.

  1) Stack randomization

     add_random_kstack_offset() can only be invoked after
     enter_from_user_mode() established proper state as it calls into
     instrumentable code.

     PowerPC got that wrong and the other architectures either invoke it
     after enter_from_user_mode() or after syscall_enter_from_user_mode().

     The latter is suboptimal as the randomization takes place after all
     the user mode entry work. Aside of that add_random_kstack_offset()
     uses get/put_cpu_var(), which makes it usable in preemptible code, but
     when invoked in the interrupt disabled region that's pointless
     overhead.

  2) As discussed in the above thread just changing the function signature
     of syscall_enter_from_user_mode[_work]() so they take a pointer
     argument for the syscall and then return 0 on success is not really
     intuitive either. Aside of that this breaks the implicit assumption of
     the tracer when setting the syscall number to -1.

  3) The x86 entry code has some historically accumulated oddities

The following series addresses this by:

  1) Providing new [syscall_]enter_from_user_mode() variants, which include
     stack randomization and utilize a new add_random_kstack_offset_irqsoff()
     variant, which avoids the get/put_cpu_var() overhead and converting all
     usage sites over

  2) Picking up Jinjie's seccomp patch from:

     https://lore.kernel.org/lkml/20260629130616.642022-2-ruanjinjie@huawei.com

     and addressing the feedback (renaming the seccomp functions)

  3) Making the ptrace and tracer related functions return a boolean value
     to indicate syscall permission

  4) Addressing the x86 oddities

  5) Converting the tree over to the new scheme

With that all architectures using the generic syscall entry code follow the
same scheme, apply stack randomization at the correct and earliest possible
place and skip syscall processing depending on the boolean return value of
syscall_enter_from_user_mode[_work]().

There should be no functional changes, at least there are none intended.

The resulting text size for the syscall entry code on x8664 is slightly
smaller than before these changes.

Testing syscall heavy workloads and micro benchmarks shows a small
performance gain for the general rework, but the last patch, which changes
the logic to be more understandable has no measurable impact in either
direction.

The series applies on Linus tree and is also available from git:

        git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1

Thanks,

	tglx
---
 Documentation/core-api/entry.rst      |   33 +++++---
 arch/alpha/kernel/ptrace.c            |    4 -
 arch/arc/kernel/ptrace.c              |    2 
 arch/arm/kernel/ptrace.c              |    4 -
 arch/arm64/kernel/ptrace.c            |    4 -
 arch/csky/kernel/ptrace.c             |    4 -
 arch/hexagon/kernel/traps.c           |    2 
 arch/loongarch/kernel/syscall.c       |   17 +---
 arch/m68k/kernel/ptrace.c             |    4 -
 arch/microblaze/kernel/ptrace.c       |    2 
 arch/mips/kernel/ptrace.c             |    4 -
 arch/nios2/kernel/ptrace.c            |    2 
 arch/openrisc/kernel/ptrace.c         |    2 
 arch/parisc/kernel/ptrace.c           |   12 +--
 arch/powerpc/kernel/syscall.c         |    5 -
 arch/riscv/kernel/traps.c             |   14 +--
 arch/s390/kernel/syscall.c            |   11 +-
 arch/sh/kernel/ptrace_32.c            |    4 -
 arch/sparc/kernel/ptrace_32.c         |    2 
 arch/sparc/kernel/ptrace_64.c         |    2 
 arch/um/kernel/ptrace.c               |    2 
 arch/um/kernel/skas/syscall.c         |    2 
 arch/x86/entry/syscall_32.c           |   70 +++++++------------
 arch/x86/entry/syscall_64.c           |   61 ++++++----------
 arch/x86/entry/vsyscall/vsyscall_64.c |   14 +--
 arch/x86/include/asm/entry-common.h   |    1 
 arch/x86/include/asm/syscall.h        |   10 --
 arch/xtensa/kernel/ptrace.c           |    5 -
 include/asm-generic/syscall.h         |    4 -
 include/linux/entry-common.h          |  125 ++++++++++++++++++++--------------
 include/linux/irq-entry-common.h      |    6 -
 include/linux/ptrace.h                |   13 +--
 include/linux/randomize_kstack.h      |   19 +++++
 include/linux/seccomp.h               |   12 +--
 kernel/entry/syscall-common.c         |    7 +
 kernel/seccomp.c                      |   35 ++++-----
 36 files changed, 264 insertions(+), 256 deletions(-)



