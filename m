Return-Path: <linux-mips+bounces-15605-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DYhhGtlQTWojyQEAu9opvQ
	(envelope-from <linux-mips+bounces-15605-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 21:17:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F406E71F1E8
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 21:17:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AHEhZEMB;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15605-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15605-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BFFE31492A8
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 19:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE688379C53;
	Tue,  7 Jul 2026 19:07:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584148BD56;
	Tue,  7 Jul 2026 19:07:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451245; cv=none; b=FnVFvsQFasZwV69f4to1LS0uYHO+WoZmdkUYibvZP4lo25BGRmRNP4ONQn/lQzYwbMkOz+gxMUW3OiFYImDOUgFxMZtUD5Et/Q5z+AnY4App5NCOvFDGnEaa/tRfAshRDvwV6xFjzt+LsdmGyxaCY9xt2dzG/olviCivQcG97MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451245; c=relaxed/simple;
	bh=qidwgz2JI9Io+EYfmSyqNxasGkS+3VHzmC5tYP+sG+o=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=XQ+x6nqglB+XsHm6xF4KiV6dyhEopIYa1NQwDoKs+Wq8F7YgucCCXJSHt9nxL9bLu41YnOyezZSjOn4WZ85XwMuTt9DIlfs3JGgHevl1jZYZR+AXm+KSw7hMk+31uMlNU9It4wltvQSL0OAtIUNANiiKkV/rphAODPdwti67vDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHEhZEMB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959C01F00A3E;
	Tue,  7 Jul 2026 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451232;
	bh=ujg63nFpNppD6hh8ErFLF1J5JX2ZfpeEoGN6ZrinWc0=;
	h=Date:From:To:Cc:Subject:References;
	b=AHEhZEMBYzBtdLcDTyhlS45Q7S7ZwTjKIqiJzRbhD5/XAbHDISjmwksUK82ZNX4eN
	 v/56KPMLh+ap7XlsQOg/BTaFcC0r6cCqimRsKEEjnM7HqpHCJ0wTkRT4YpPRqksdHy
	 hbur5BBOkf2MqLhVXO+OEJPygToMV0GfcDHqGyXAo5xm9el2SAov1vxRwDLsZ9mDTO
	 8DMadvH3j+KUyVnLd3M9IfC7bg8qqqSHv1wejHUyEH+mIuHPWHU4dWWsyjmGqtk7PJ
	 8vvvohEhLbaJuT/nrhqQWxuMcj0mhqi8CGIjfadl6DsadWHk3iOaJCLltrwK6NFjAk
	 oac7QSSvNoGEw==
Date: Tue, 07 Jul 2026 21:07:09 +0200
Message-ID: <20260707190254.603111179@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 Kees Cook <kees@kernel.org>,
 x86@kernel.org,
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
 linux-arch@vger.kernel.org
Subject: [patch 18/18] entry,
 treewide: Make syscall_enter_from_user_mode[_work]() indicate syscall
 execution
References: <20260707181957.433213175@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.11 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15605-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:arnd@arndb.de,m:mark.rutland@arm.com,m:chenhuacai@kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:svens@linux.ibm.com,m:linux-doc@vger.kernel.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:kees@kernel.org,m:x86@kernel.org,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists
 .infradead.org,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[infradead.org,suse.de,lwn.net,arndb.de,arm.com,kernel.org,ellerman.id.au,linux.ibm.com,dabbelt.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,monstr.eu,davemloft.net,gaisler.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F406E71F1E8

From: Michal Suchánek <msuchanek@suse.de>

The return values of syscall_enter_from_user_mode[_work]() are
non-intuitive. Both functions return the syscall number which should be
invoked by the architecture specific syscall entry code. The returned
number can be:

  - the unmodified syscall number which was handed in by the caller

  - a modified syscall number (ptrace, seccomp, trace/probe/bpf)

That has an additional twist. If the return value is -1L then the caller is
not allowed to modify the return value as that indicates that the modifying
entity requests to abort the syscall and set the return value already. That
can obviously not be differentiated from a syscall which handed in -1 as
syscall number.

The established way to deal with that is:

    set_return_value(regs, -ENOSYS);
    nr = syscall_enter_from_user_mode(regs, nr);
    if ((unsigned)nr < SYSCALLNR_MAX)
    	handle_syscall(regs, nr);
    else if (nr != -1)
    	set_return_value(regs, -ENOSYS);

The latter is obviously redundant, but that's just a leftover of the
historical evolution of this code. S390 has some special requirements here,
which can be avoided when the return value is not ambiguous.

Now that the functions which modify the syscall number and want to abort
are converted to indicate that with a boolean return value, it's obvious to
hand this through to the callers.

Rework syscall_enter_from_user_mode[_work]) so they take a pointer to the
syscall number and return a boolean, which indicates whether the syscall
should be handled or not.

That's not only more intuitive, it also results in slightly denser
executable code on x86 at least, but perf results are neutral and within
the noise.

[ tglx: Adopted it to the changes in the generic entry code, fixed up the
  	32-bit fallout and rewrote change log ]

Signed-off-by: Michal Suchánek <msuchanek@suse.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-doc@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
---
 Documentation/core-api/entry.rst |   18 +++++++++++-------
 arch/loongarch/kernel/syscall.c  |   14 +++++++-------
 arch/powerpc/kernel/syscall.c    |    3 ++-
 arch/riscv/kernel/traps.c        |   11 +++++------
 arch/s390/kernel/syscall.c       |    7 +++++--
 arch/x86/entry/syscall_32.c      |   25 ++++++++++++-------------
 arch/x86/entry/syscall_64.c      |   12 ++++++------
 include/linux/entry-common.h     |   12 +++++-------
 8 files changed, 53 insertions(+), 49 deletions(-)

--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -68,16 +68,20 @@ low-level C code must not be instrumente
   noinstr void syscall(struct pt_regs *regs, int nr)
   {
 	arch_syscall_enter(regs);
-	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
-
-	instrumentation_begin();
-	if (!invoke_syscall(regs, nr) && nr != -1)
-	 	result_reg(regs) = __sys_ni_syscall(regs);
-	instrumentation_end();
-
+	result_reg(regs) = -ENOSYS;
+	if (syscall_enter_from_user_mode_randomize_stack(regs, &nr)) {
+		instrumentation_begin();
+		if (!invoke_syscall(regs, nr))
+			result_reg(regs) = __sys_ni_syscall(regs);
+		instrumentation_end();
+	}
 	syscall_exit_to_user_mode(regs);
   }
 
+It is required that either the low level assembly code or the syscall
+function sets the result register to -ENOSYS before invoking the generic
+code.
+
 syscall_enter_from_user_mode_randomize_stack() first invokes
 enter_from_user_mode_randomize_stack() which establishes state in the
 following order:
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -57,8 +57,8 @@ typedef long (*sys_call_fn)(unsigned lon
 
 void noinstr __no_stack_protector do_syscall(struct pt_regs *regs)
 {
-	unsigned long nr;
 	sys_call_fn syscall_fn;
+	unsigned long nr;
 
 	nr = regs->regs[11];
 	/* Set for syscall restarting */
@@ -69,12 +69,12 @@ void noinstr __no_stack_protector do_sys
 	regs->orig_a0 = regs->regs[4];
 	regs->regs[4] = -ENOSYS;
 
-	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
-
-	if (nr < NR_syscalls) {
-		syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
-		regs->regs[4] = syscall_fn(regs->orig_a0, regs->regs[5], regs->regs[6],
-					   regs->regs[7], regs->regs[8], regs->regs[9]);
+	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
+		if (nr < NR_syscalls) {
+			syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
+			regs->regs[4] = syscall_fn(regs->orig_a0, regs->regs[5], regs->regs[6],
+						   regs->regs[7], regs->regs[8], regs->regs[9]);
+		}
 	}
 
 	syscall_exit_to_user_mode(regs);
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -18,7 +18,8 @@ notrace long system_call_exception(struc
 	long ret;
 	syscall_fn f;
 
-	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
+	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
+		return syscall_get_error(current, regs);
 
 	if (unlikely(r0 >= NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -332,13 +332,12 @@ void do_trap_ecall_u(struct pt_regs *reg
 
 		riscv_v_vstate_discard(regs);
 
-		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
-
-		if (syscall >= 0 && syscall < NR_syscalls) {
-			syscall = array_index_nospec(syscall, NR_syscalls);
-			syscall_handler(regs, syscall);
+		if (syscall_enter_from_user_mode_randomize_stack(regs, &syscall)) {
+			if (syscall >= 0 && syscall < NR_syscalls) {
+				syscall = array_index_nospec(syscall, NR_syscalls);
+				syscall_handler(regs, syscall);
+			}
 		}
-
 		syscall_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
--- a/arch/s390/kernel/syscall.c
+++ b/arch/s390/kernel/syscall.c
@@ -96,6 +96,7 @@ SYSCALL_DEFINE0(ni_syscall)
 void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
 {
 	unsigned long nr;
+	bool permit;
 
 	enter_from_user_mode_randomize_stack(regs);
 
@@ -121,7 +122,9 @@ void noinstr __do_syscall(struct pt_regs
 		regs->psw.addr = current->restart_block.arch_data;
 		current->restart_block.arch_data = 1;
 	}
-	nr = syscall_enter_from_user_mode_work(regs, nr);
+
+	permit = syscall_enter_from_user_mode_work(regs, &nr);
+
 	/*
 	 * In the s390 ptrace ABI, both the syscall number and the return value
 	 * use gpr2. However, userspace puts the syscall number either in the
@@ -129,7 +132,7 @@ void noinstr __do_syscall(struct pt_regs
 	 * work, the ptrace code sets PIF_SYSCALL_RET_SET, which is checked here
 	 * and if set, the syscall will be skipped.
 	 */
-	if (unlikely(test_and_clear_pt_regs_flag(regs, PIF_SYSCALL_RET_SET)))
+	if (unlikely(test_and_clear_pt_regs_flag(regs, PIF_SYSCALL_RET_SET) || !permit))
 		goto out;
 	regs->gprs[2] = -ENOSYS;
 	if (likely(nr < NR_syscalls)) {
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -161,8 +161,9 @@ static __always_inline bool int80_is_ext
 	nr = syscall_32_enter(regs);
 
 	local_irq_enable();
-	nr = syscall_enter_from_user_mode_work(regs, nr);
-	do_syscall_32_irqs_on(regs, nr);
+
+	if (likely(syscall_enter_from_user_mode_work(regs, &nr)))
+		do_syscall_32_irqs_on(regs, nr);
 
 	instrumentation_end();
 	syscall_exit_to_user_mode(regs);
@@ -223,8 +224,8 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 	nr = syscall_32_enter(regs);
 
 	local_irq_enable();
-	nr = syscall_enter_from_user_mode_work(regs, nr);
-	do_syscall_32_irqs_on(regs, nr);
+	if (likely(syscall_enter_from_user_mode_work(regs, &nr)))
+		do_syscall_32_irqs_on(regs, nr);
 
 	instrumentation_end();
 	syscall_exit_to_user_mode(regs);
@@ -243,13 +244,13 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 	 * orig_ax, the int return value truncates it. This matches
 	 * the semantics of syscall_get_nr().
 	 */
-	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
-
-	instrumentation_begin();
+	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
+		instrumentation_begin();
 
-	do_syscall_32_irqs_on(regs, nr);
+		do_syscall_32_irqs_on(regs, nr);
 
-	instrumentation_end();
+		instrumentation_end();
+	}
 	syscall_exit_to_user_mode(regs);
 }
 #endif /* !CONFIG_IA32_EMULATION */
@@ -286,10 +287,8 @@ static noinstr bool __do_fast_syscall_32
 		return false;
 	}
 
-	nr = syscall_enter_from_user_mode_work(regs, nr);
-
-	/* Now this is just like a normal syscall. */
-	do_syscall_32_irqs_on(regs, nr);
+	if (likely(syscall_enter_from_user_mode_work(regs, &nr)))
+		do_syscall_32_irqs_on(regs, nr);
 
 	instrumentation_end();
 	syscall_exit_to_user_mode(regs);
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -78,14 +78,14 @@ static __always_inline void do_syscall_x
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, long nr)
 {
-	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
+	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
+		instrumentation_begin();
 
-	instrumentation_begin();
+		if (!do_syscall_x64(regs, nr))
+			do_syscall_x32(regs, nr);
 
-	if (!do_syscall_x64(regs, nr))
-		do_syscall_x32(regs, nr);
-
-	instrumentation_end();
+		instrumentation_end();
+	}
 	syscall_exit_to_user_mode(regs);
 
 	/*
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -71,7 +71,7 @@ static inline void syscall_enter_audit(s
 	}
 }
 
-static __always_inline bool syscall_trace_enter(struct pt_regs *regs, unsigned long work,
+static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
 						long *syscall)
 {
 	/*
@@ -141,16 +141,14 @@ static __always_inline bool syscall_trac
  *     ptrace_report_syscall_permit_entry(), __seccomp_permit_syscall(), trace_sys_enter()
  *  2) Invocation of audit_syscall_entry()
  */
-static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *regs, long syscall)
+static __always_inline bool syscall_enter_from_user_mode_work(struct pt_regs *regs, long *syscall)
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
-	if (work & SYSCALL_WORK_ENTER) {
-		if (!syscall_trace_enter(regs, work, &syscall))
-			return -1L;
-	}
+	if (unlikely(work & SYSCALL_WORK_ENTER))
+		return syscall_trace_enter(regs, work, syscall);
 
-	return syscall;
+	return true;
 }
 
 /**


