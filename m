Return-Path: <linux-mips+bounces-15604-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yVq6HwpQTWrYyAEAu9opvQ
	(envelope-from <linux-mips+bounces-15604-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 21:14:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824171F114
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 21:14:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jm9Q3Laf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15604-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15604-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EFD430A7A12
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 19:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2863D495509;
	Tue,  7 Jul 2026 19:07:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A801481AA2;
	Tue,  7 Jul 2026 19:07:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451237; cv=none; b=DfzD6HE0w+An/DRz0ozV2++Uv8sYmyPxfRVmmjipCobtNwI9VnSHPKuZ1R8hCoY2MfvA+u7b8i6kCERwdVYP6Z6am+jaX8gMPZuQ+F6H1AHOE07xS2l5aQlyErDLo5yV4wJcy/s8ytGWRc8P+RCX/ly/mitYoKTYKYJk61IgatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451237; c=relaxed/simple;
	bh=p+jiq7Y7/tj9eebBLtaaLd9bUsbt9d4qggac1bs0J40=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lEb+04KUGm/m4wxoWrxxsza3lFhenq0G9bR4slxwHbILZpr0dN6THCqwwv8qwPUff6BDODHfXC7u/KW4ox5BeeR9+p52Wov+/PSoLofDk6qWGplKZqUQ6GApR6JJNgpx/MEtGLa1VJyax/Bs4kR1zNQvlUrD9g3MD0QlmoGbi6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jm9Q3Laf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691E61F000E9;
	Tue,  7 Jul 2026 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451228;
	bh=k5p+gDeGow5od0W2jgXaapJrAZfwc3i2DfCDO4w4k2U=;
	h=Date:From:To:Cc:Subject:References;
	b=jm9Q3Laf3FKmdLmABRbJipEgYAm2Nvq7OuMFuhObrcMDIik3KnCXo3gPTumzB8Ks6
	 R2Gh5AXPLtOPkX4xGcvEbi6QTXdXx5/QVPzzzZ8xwFmaGErRXW49XMgkYcMa3mHP16
	 NZyJRjBGh1rQKkdpKB/7+FFOPY0JXZbeyKYhfMwGWmdrM9iFLD57NkK4L8nzez26ia
	 lSGhDZsXLIy33FDWV2JaQZRiT6U6B6OVrJAobxJY0jyGqtEYE+4QXvbpOMvRDycErW
	 1QLeEAPw7GwrC8w/3TQxgag4cP6oLp2eSVsbIbk2440lpovAypZ3nvHiufLponi5S1
	 lFKuBs3QiJDKw==
Date: Tue, 07 Jul 2026 21:07:05 +0200
Message-ID: <20260707190254.545214398@kernel.org>
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
Subject: [patch 17/18] x86/entry: Simplify the syscall number logic
References: <20260707181957.433213175@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15604-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kern
 el.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3824171F114

Converting from int to long, back to int and then to unsigned int is
confusing at best.

None of this voodoo is required. Negative syscall numbers including -1
don't need any of this treatment and the low level ASM code already does
the sign extension to 64-bit on a 64-bit kernel.

The only point where signedness matters is the comparison against the
maximum syscall number, but that can be simplified by just using a unsigned
argument for the various syscall invocation functions.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 arch/x86/entry/syscall_32.c    |   26 +++++++++++---------------
 arch/x86/entry/syscall_64.c    |   36 ++++++++++++++----------------------
 arch/x86/include/asm/syscall.h |    2 +-
 3 files changed, 26 insertions(+), 38 deletions(-)

--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -41,6 +41,8 @@ const sys_call_ptr_t sys_call_table[] =
 #endif
 
 #define __SYSCALL(nr, sym) case nr: return __ia32_##sym(regs);
+
+/* The unsigned int @nr argument is intentional as it creates denser code in a 64-bit build */
 static noinline long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
 	switch (nr) {
@@ -49,7 +51,7 @@ static noinline long ia32_sys_call(const
 	}
 }
 
-static __always_inline int syscall_32_enter(struct pt_regs *regs)
+static __always_inline long syscall_32_enter(struct pt_regs *regs)
 {
 	if (IS_ENABLED(CONFIG_IA32_EMULATION))
 		current_thread_info()->status |= TS_COMPAT;
@@ -70,17 +72,11 @@ early_param("ia32_emulation", ia32_emula
 /*
  * Invoke a 32-bit syscall.  Called with IRQs on in CT_STATE_KERNEL.
  */
-static __always_inline void do_syscall_32_irqs_on(struct pt_regs *regs, int nr)
+static __always_inline void do_syscall_32_irqs_on(struct pt_regs *regs, unsigned long nr)
 {
-	/*
-	 * Convert negative numbers to very high and thus out of range
-	 * numbers for comparisons.
-	 */
-	unsigned int unr = nr;
-
-	if (likely(unr < IA32_NR_syscalls)) {
-		unr = array_index_nospec(unr, IA32_NR_syscalls);
-		regs->ax = ia32_sys_call(regs, unr);
+	if (likely(nr < IA32_NR_syscalls)) {
+		nr = array_index_nospec(nr, IA32_NR_syscalls);
+		regs->ax = ia32_sys_call(regs, (unsigned int)nr);
 	}
 }
 
@@ -126,7 +122,7 @@ static __always_inline bool int80_is_ext
  */
 __visible noinstr void do_int80_emulation(struct pt_regs *regs)
 {
-	int nr;
+	long nr;
 
 	/* Kernel does not use INT $0x80! */
 	if (unlikely(!user_mode(regs))) {
@@ -205,7 +201,7 @@ static __always_inline bool int80_is_ext
  */
 DEFINE_FREDENTRY_RAW(int80_emulation)
 {
-	int nr;
+	long nr;
 
 	enter_from_user_mode_randomize_stack(regs);
 
@@ -240,7 +236,7 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 /* Handles int $0x80 on a 32bit kernel */
 __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
 {
-	int nr = syscall_32_enter(regs);
+	long nr = syscall_32_enter(regs);
 
 	/*
 	 * Subtlety here: if ptrace pokes something larger than 2^31-1 into
@@ -260,7 +256,7 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 
 static noinstr bool __do_fast_syscall_32(struct pt_regs *regs)
 {
-	int nr = syscall_32_enter(regs);
+	long nr = syscall_32_enter(regs);
 	int res;
 
 	enter_from_user_mode_randomize_stack(regs);
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -32,6 +32,8 @@ const sys_call_ptr_t sys_call_table[] =
 #undef  __SYSCALL
 
 #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
+
+/* The unsigned int @nr argument is intentional as it creates denser code */
 static noinline long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
 	switch (nr) {
@@ -52,39 +54,29 @@ static noinline long x32_sys_call(const
 #endif
 }
 
-static __always_inline bool do_syscall_x64(struct pt_regs *regs, int nr)
+static __always_inline bool do_syscall_x64(struct pt_regs *regs, unsigned long nr)
 {
-	/*
-	 * Convert negative numbers to very high and thus out of range
-	 * numbers for comparisons.
-	 */
-	unsigned int unr = nr;
-
-	if (likely(unr < NR_syscalls)) {
-		unr = array_index_nospec(unr, NR_syscalls);
-		regs->ax = x64_sys_call(regs, unr);
+	if (likely(nr < NR_syscalls)) {
+		nr = array_index_nospec(nr, NR_syscalls);
+		regs->ax = x64_sys_call(regs, (unsigned int)nr);
 		return true;
 	}
 	return false;
 }
 
-static __always_inline void do_syscall_x32(struct pt_regs *regs, int nr)
+static __always_inline void do_syscall_x32(struct pt_regs *regs, unsigned long nr)
 {
-	/*
-	 * Adjust the starting offset of the table, and convert numbers
-	 * < __X32_SYSCALL_BIT to very high and thus out of range
-	 * numbers for comparisons.
-	 */
-	unsigned int xnr = nr - __X32_SYSCALL_BIT;
-
-	if (IS_ENABLED(CONFIG_X86_X32_ABI) && likely(xnr < X32_NR_syscalls)) {
-		xnr = array_index_nospec(xnr, X32_NR_syscalls);
-		regs->ax = x32_sys_call(regs, xnr);
+	/* Adjust the starting offset of the table */
+	nr -= __X32_SYSCALL_BIT;
+
+	if (IS_ENABLED(CONFIG_X86_X32_ABI) && likely(nr < X32_NR_syscalls)) {
+		nr = array_index_nospec(nr, X32_NR_syscalls);
+		regs->ax = x32_sys_call(regs, (unsigned int)nr);
 	}
 }
 
 /* Returns true to return using SYSRET, or false to use IRET */
-__visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
+__visible noinstr bool do_syscall_64(struct pt_regs *regs, long nr)
 {
 	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
 
--- a/arch/x86/include/asm/syscall.h
+++ b/arch/x86/include/asm/syscall.h
@@ -164,7 +164,7 @@ static inline int syscall_get_arch(struc
 		? AUDIT_ARCH_I386 : AUDIT_ARCH_X86_64;
 }
 
-bool do_syscall_64(struct pt_regs *regs, int nr);
+bool do_syscall_64(struct pt_regs *regs, long nr);
 void do_int80_emulation(struct pt_regs *regs);
 
 #endif	/* CONFIG_X86_32 */


