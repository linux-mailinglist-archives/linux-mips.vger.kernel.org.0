Return-Path: <linux-mips+bounces-15739-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5jD5EvLPUGqT5QIAu9opvQ
	(envelope-from <linux-mips+bounces-15739-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 12:56:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2B739E49
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 12:56:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WJq+UOU1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yhVXiWXC;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WJq+UOU1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yhVXiWXC;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15739-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15739-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 384ED303A507
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 10:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A142A3AC0C7;
	Fri, 10 Jul 2026 10:42:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635A3E3D90
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 10:42:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680155; cv=none; b=k7hMXZU1RNk8lOa5/t+Z2FEN2ozaWoaM2cnvasAjlNR3r10onZ/HN/MNGR0cOCds1adOcWglwAMR1nw9R932KeHMO8gTrE5MgHR+oYwbmBXmtXydFh4JYcsHxsf0v8OFcUiY45OKi+weJKk3DKW7Mzu0YygWflM8QVigyrq8pvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680155; c=relaxed/simple;
	bh=dR/nipZaKd34QxjafZ3MoVjfrPCDpLtwiWhHXfQ67P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKSsxf1GgvL0axqBKpBhVkR0DQKTBaiRy+O5LnivnAkZdMrMINv3cd2qqP7opLBZiz5nbsddaLpytxnJ+tKZXoEAgv0EDese8GIGp/5QvCUkWROMtnQGuz06LLO5cfIuQp0qNigaYPQWZ1tqsCJvIS958K1Qb7MMYo0vpo6HAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WJq+UOU1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yhVXiWXC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WJq+UOU1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yhVXiWXC; arc=none smtp.client-ip=195.135.223.131
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3EFD4759FF;
	Fri, 10 Jul 2026 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783680150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wqonpxFX8zA5SeJ9aTNAypPJBKqme2/IRuMVAQVXJW8=;
	b=WJq+UOU11TT2m9tXBVk/bNw3hAZ2LfII0cW2H4+490h7XznM25yW12rBJ1x5ih/0rLqQIy
	tcWwfm0Dv6lzhHg5eWH1Mm8hKBAs/ciJTj/F0EAuQcJulOj3LnAX2WygYo/JdQqubgRMgN
	KZtFnzYN4wUCl6W6sgerpL9+2Tmk6qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783680150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wqonpxFX8zA5SeJ9aTNAypPJBKqme2/IRuMVAQVXJW8=;
	b=yhVXiWXCXfk628eQRtIWwPPJd4fTAa9yD5daNa5F7LmEHToZq/fS+jdsUyiOEtNTOx0/oK
	GqhMVCOhvfolypAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783680150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wqonpxFX8zA5SeJ9aTNAypPJBKqme2/IRuMVAQVXJW8=;
	b=WJq+UOU11TT2m9tXBVk/bNw3hAZ2LfII0cW2H4+490h7XznM25yW12rBJ1x5ih/0rLqQIy
	tcWwfm0Dv6lzhHg5eWH1Mm8hKBAs/ciJTj/F0EAuQcJulOj3LnAX2WygYo/JdQqubgRMgN
	KZtFnzYN4wUCl6W6sgerpL9+2Tmk6qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783680150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wqonpxFX8zA5SeJ9aTNAypPJBKqme2/IRuMVAQVXJW8=;
	b=yhVXiWXCXfk628eQRtIWwPPJd4fTAa9yD5daNa5F7LmEHToZq/fS+jdsUyiOEtNTOx0/oK
	GqhMVCOhvfolypAA==
Date: Fri, 10 Jul 2026 12:42:29 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 12/18] ptrace, treewide: Rename
 ptrace_report_syscall_entry() to ptrace_report_syscall_permit_entry()
Message-ID: <alDMlSYN1eKkjNCL@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.280015701@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.280015701@kernel.org>
X-Spam-Flag: YES
X-Spam-Level: *************
X-Spamd-Bar: +++++++++++++
X-Spam-Score: 13.38
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.34 / 15.00];
	SPAM_FLAG(5.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15739-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:arnd@arndb.de,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:vgupta@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:guoren@kernel.org,m:bcain@kernel.org,m:geert@linux-m68k.org,m:monstr@monstr.eu,m:tsbogend@alpha.franken.de,m:dinguyen@kernel.org,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:davem@davemloft.net,m:andreas@gaisler.com,m:chris@zankel.net,m:linux-alpha@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arch@vger.kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:ch
 enhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:richard@nod.at,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[msuchanek@suse.de,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,arndb.de,redhat.com,linaro.org,kernel.org,armlinux.org.uk,arm.com,linux-m68k.org,monstr.eu,alpha.franken.de,gmx.de,users.sourceforge.jp,davemloft.net,gaisler.com,zankel.net,lists.infradead.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,huawei.com,nod.at,lwn.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msuchanek@suse.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8C2B739E49

Hello,

why is the syscall -1 special-cased here?

Wouldn't any invalid syscall number such as -2 work equally well, making
this whole 'permit' pinned on the -1 value bogus?

On Tue, Jul 07, 2026 at 09:06:44PM +0200, Thomas Gleixner wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
> 
> Rename the function so the purpose is clear and make the return type bool.
> 
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
>  arch/alpha/kernel/ptrace.c      |    2 +-
>  arch/arc/kernel/ptrace.c        |    2 +-
>  arch/arm/kernel/ptrace.c        |    2 +-
>  arch/arm64/kernel/ptrace.c      |    2 +-
>  arch/csky/kernel/ptrace.c       |    2 +-
>  arch/hexagon/kernel/traps.c     |    2 +-
>  arch/m68k/kernel/ptrace.c       |    2 +-
>  arch/microblaze/kernel/ptrace.c |    2 +-
>  arch/mips/kernel/ptrace.c       |    2 +-
>  arch/nios2/kernel/ptrace.c      |    2 +-
>  arch/openrisc/kernel/ptrace.c   |    2 +-
>  arch/parisc/kernel/ptrace.c     |   10 ++++------
>  arch/sh/kernel/ptrace_32.c      |    2 +-
>  arch/sparc/kernel/ptrace_32.c   |    2 +-
>  arch/sparc/kernel/ptrace_64.c   |    2 +-
>  arch/um/kernel/ptrace.c         |    2 +-
>  arch/xtensa/kernel/ptrace.c     |    2 +-
>  include/asm-generic/syscall.h   |    4 ++--
>  include/linux/entry-common.h    |   25 ++++++++++++-------------
>  include/linux/ptrace.h          |   13 ++++++-------
>  20 files changed, 40 insertions(+), 44 deletions(-)
> 
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -375,7 +375,7 @@ asmlinkage unsigned long syscall_trace_e
>  	struct pt_regs *regs = current_pt_regs();
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -		ptrace_report_syscall_entry(regs)) {
> +		!ptrace_report_syscall_permit_entry(regs)) {
>  		syscall_set_nr(current, regs, -1);

Why is this done here?

Presumably the ptrace_report_syscall_entry returns false here becasue
the tracer put -1 into whatever register specifies the syscall number
(or it was there to start with) which was then read back, compared to
-1, leading to returning false.  Now it's set to -1 again?

Thanks

Michal

>  		if (regs->r19 == 0 && regs->r0 == (unsigned long)-1)
>  			syscall_set_return_value(current, regs, -ENOSYS, 0);
> --- a/arch/arc/kernel/ptrace.c
> +++ b/arch/arc/kernel/ptrace.c
> @@ -342,7 +342,7 @@ long arch_ptrace(struct task_struct *chi
>  asmlinkage int syscall_trace_enter(struct pt_regs *regs)
>  {
>  	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		if (ptrace_report_syscall_entry(regs))
> +		if (!ptrace_report_syscall_permit_entry(regs))
>  			return ULONG_MAX;
>  
>  #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
> --- a/arch/arm/kernel/ptrace.c
> +++ b/arch/arm/kernel/ptrace.c
> @@ -840,7 +840,7 @@ static void report_syscall(struct pt_reg
>  
>  	if (dir == PTRACE_SYSCALL_EXIT)
>  		ptrace_report_syscall_exit(regs, 0);
> -	else if (ptrace_report_syscall_entry(regs))
> +	else if (!ptrace_report_syscall_permit_entry(regs))
>  		current_thread_info()->abi_syscall = -1;
>  
>  	regs->ARM_ip = ip;
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2379,7 +2379,7 @@ static int report_syscall_entry(struct p
>  	int regno, ret;
>  
>  	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
> -	ret = ptrace_report_syscall_entry(regs);
> +	ret = !ptrace_report_syscall_permit_entry(regs);
>  	if (ret)
>  		forget_syscall(regs);
>  	regs->regs[regno] = saved_reg;
> --- a/arch/csky/kernel/ptrace.c
> +++ b/arch/csky/kernel/ptrace.c
> @@ -320,7 +320,7 @@ long arch_ptrace(struct task_struct *chi
>  asmlinkage int syscall_trace_enter(struct pt_regs *regs)
>  {
>  	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		if (ptrace_report_syscall_entry(regs))
> +		if (!ptrace_report_syscall_permit_entry(regs))
>  			return -1;
>  
>  	if (!seccomp_permit_syscall())
> --- a/arch/hexagon/kernel/traps.c
> +++ b/arch/hexagon/kernel/traps.c
> @@ -345,7 +345,7 @@ void do_trap0(struct pt_regs *regs)
>  
>  		/* allow strace to catch syscall args  */
>  		if (unlikely(test_thread_flag(TIF_SYSCALL_TRACE) &&
> -			ptrace_report_syscall_entry(regs)))
> +			!ptrace_report_syscall_permit_entry(regs)))
>  			return;  /*  return -ENOSYS somewhere?  */
>  
>  		/* Interrupts should be re-enabled for syscall processing */
> --- a/arch/m68k/kernel/ptrace.c
> +++ b/arch/m68k/kernel/ptrace.c
> @@ -279,7 +279,7 @@ asmlinkage int syscall_trace_enter(void)
>  	int ret = 0;
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		ret = ptrace_report_syscall_entry(task_pt_regs(current));
> +		ret = !ptrace_report_syscall_permit_entry(task_pt_regs(current));
>  
>  	if (!seccomp_permit_syscall())
>  		return -1;
> --- a/arch/microblaze/kernel/ptrace.c
> +++ b/arch/microblaze/kernel/ptrace.c
> @@ -139,7 +139,7 @@ asmlinkage unsigned long do_syscall_trac
>  	secure_computing_strict(regs->r12);
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	    ptrace_report_syscall_entry(regs))
> +	    !ptrace_report_syscall_permit_entry(regs))
>  		/*
>  		 * Tracing decided this syscall should not happen.
>  		 * We'll return a bogus call number to get an ENOSYS
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1324,7 +1324,7 @@ asmlinkage long syscall_trace_enter(stru
>  	user_exit();
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
> -		if (ptrace_report_syscall_entry(regs))
> +		if (!ptrace_report_syscall_permit_entry(regs))
>  			return -1;
>  	}
>  
> --- a/arch/nios2/kernel/ptrace.c
> +++ b/arch/nios2/kernel/ptrace.c
> @@ -133,7 +133,7 @@ asmlinkage int do_syscall_trace_enter(vo
>  	int ret = 0;
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		ret = ptrace_report_syscall_entry(task_pt_regs(current));
> +		ret = !ptrace_report_syscall_permit_entry(task_pt_regs(current));
>  
>  	return ret;
>  }
> --- a/arch/openrisc/kernel/ptrace.c
> +++ b/arch/openrisc/kernel/ptrace.c
> @@ -293,7 +293,7 @@ asmlinkage long do_syscall_trace_enter(s
>  	long ret = 0;
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	    ptrace_report_syscall_entry(regs))
> +	    !ptrace_report_syscall_permit_entry(regs))
>  		/*
>  		 * Tracing decided this syscall should not happen.
>  		 * We'll return a bogus call number to get an ENOSYS
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -326,7 +326,7 @@ long compat_arch_ptrace(struct task_stru
>  long do_syscall_trace_enter(struct pt_regs *regs)
>  {
>  	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
> -		int rc = ptrace_report_syscall_entry(regs);
> +		bool permit = ptrace_report_syscall_permit_entry(regs);
>  
>  		/*
>  		 * As tracesys_next does not set %r28 to -ENOSYS
> @@ -334,12 +334,10 @@ long do_syscall_trace_enter(struct pt_re
>  		 */
>  		regs->gr[28] = -ENOSYS;
>  
> -		if (rc) {
> +		if (!permit) {
>  			/*
> -			 * A nonzero return code from
> -			 * ptrace_report_syscall_entry() tells us
> -			 * to prevent the syscall execution.  Skip
> -			 * the syscall call and the syscall restart handling.
> +			 * Skip the syscall call and the syscall restart
> +			 * handling.
>  			 *
>  			 * Note that the tracer may also just change
>  			 * regs->gr[20] to an invalid syscall number,
> --- a/arch/sh/kernel/ptrace_32.c
> +++ b/arch/sh/kernel/ptrace_32.c
> @@ -455,7 +455,7 @@ long arch_ptrace(struct task_struct *chi
>  asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
>  {
>  	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	    ptrace_report_syscall_entry(regs)) {
> +	    !ptrace_report_syscall_permit_entry(regs)) {
>  		regs->regs[0] = -ENOSYS;
>  		return -1;
>  	}
> --- a/arch/sparc/kernel/ptrace_32.c
> +++ b/arch/sparc/kernel/ptrace_32.c
> @@ -441,7 +441,7 @@ asmlinkage int syscall_trace(struct pt_r
>  		if (syscall_exit_p)
>  			ptrace_report_syscall_exit(regs, 0);
>  		else
> -			ret = ptrace_report_syscall_entry(regs);
> +			ret = !ptrace_report_syscall_permit_entry(regs);
>  	}
>  
>  	return ret;
> --- a/arch/sparc/kernel/ptrace_64.c
> +++ b/arch/sparc/kernel/ptrace_64.c
> @@ -1093,7 +1093,7 @@ asmlinkage int syscall_trace_enter(struc
>  		user_exit();
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE))
> -		ret = ptrace_report_syscall_entry(regs);
> +		ret = !ptrace_report_syscall_permit_entry(regs);
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->u_regs[UREG_G1]);
> --- a/arch/um/kernel/ptrace.c
> +++ b/arch/um/kernel/ptrace.c
> @@ -135,7 +135,7 @@ int syscall_trace_enter(struct pt_regs *
>  	if (!test_thread_flag(TIF_SYSCALL_TRACE))
>  		return 0;
>  
> -	return ptrace_report_syscall_entry(regs);
> +	return !ptrace_report_syscall_permit_entry(regs);
>  }
>  
>  void syscall_trace_leave(struct pt_regs *regs)
> --- a/arch/xtensa/kernel/ptrace.c
> +++ b/arch/xtensa/kernel/ptrace.c
> @@ -547,7 +547,7 @@ int do_syscall_trace_enter(struct pt_reg
>  		regs->areg[2] = -ENOSYS;
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> -	    ptrace_report_syscall_entry(regs)) {
> +	    !ptrace_report_syscall_permit_entry(regs)) {
>  		regs->areg[2] = -ENOSYS;
>  		regs->syscall = NO_SYSCALL;
>  		return 0;
> --- a/include/asm-generic/syscall.h
> +++ b/include/asm-generic/syscall.h
> @@ -58,8 +58,8 @@ void syscall_set_nr(struct task_struct *
>   *
>   * It's only valid to call this when @task is stopped for system
>   * call exit tracing (due to %SYSCALL_WORK_SYSCALL_TRACE or
> - * %SYSCALL_WORK_SYSCALL_AUDIT), after ptrace_report_syscall_entry()
> - * returned nonzero to prevent the system call from taking place.
> + * %SYSCALL_WORK_SYSCALL_AUDIT), after ptrace_report_syscall_permit_entry()
> + * returned False to prevent the system call from taking place.
>   *
>   * This rolls back the register state in @regs so it's as if the
>   * system call instruction was a no-op.  The registers containing
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -38,21 +38,22 @@
>  				 SYSCALL_WORK_SYSCALL_EXIT_TRAP)
>  
>  /**
> - * arch_ptrace_report_syscall_entry - Architecture specific ptrace_report_syscall_entry() wrapper
> + * arch_ptrace_report_syscall_permit_entry - Architecture specific wrapper for
> + *					     ptrace_report_syscall_permit_entry()
>   * @regs: Pointer to the register state at syscall entry
>   *
> - * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
> + * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_permit_entry().
>   *
> - * This allows architecture specific ptrace_report_syscall_entry()
> + * This allows architecture specific ptrace_report_syscall_permit_entry()
>   * implementations. If not defined by the architecture this falls back to
> - * to ptrace_report_syscall_entry().
> + * to ptrace_report_syscall_permit_entry().
>   */
> -static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
> +static __always_inline bool arch_ptrace_report_syscall_permit_entry(struct pt_regs *regs);
>  
> -#ifndef arch_ptrace_report_syscall_entry
> -static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
> +#ifndef arch_ptrace_report_syscall_permit_entry
> +static __always_inline bool arch_ptrace_report_syscall_permit_entry(struct pt_regs *regs)
>  {
> -	return ptrace_report_syscall_entry(regs);
> +	return ptrace_report_syscall_permit_entry(regs);
>  }
>  #endif
>  
> @@ -73,8 +74,6 @@ static inline void syscall_enter_audit(s
>  static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
>  						long syscall)
>  {
> -	long ret = 0;
> -
>  	/*
>  	 * Handle Syscall User Dispatch.  This must comes first, since
>  	 * the ABI here can be something that doesn't make sense for
> @@ -95,8 +94,8 @@ static __always_inline long syscall_trac
>  
>  	/* Handle ptrace */
>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
> -		ret = arch_ptrace_report_syscall_entry(regs);
> -		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
> +		if (!arch_ptrace_report_syscall_permit_entry(regs) ||
> +		    (work & SYSCALL_WORK_SYSCALL_EMU))
>  			return -1L;
>  	}
>  
> @@ -137,7 +136,7 @@ static __always_inline long syscall_trac
>   * It handles the following work items:
>   *
>   *  1) syscall_work flag dependent invocations of
> - *     ptrace_report_syscall_entry(), __seccomp_permit_syscall(), trace_sys_enter()
> + *     ptrace_report_syscall_permit_entry(), __seccomp_permit_syscall(), trace_sys_enter()
>   *  2) Invocation of audit_syscall_entry()
>   */
>  static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *regs, long syscall)
> --- a/include/linux/ptrace.h
> +++ b/include/linux/ptrace.h
> @@ -405,13 +405,13 @@ extern void sigaction_compat_abi(struct
>  /*
>   * ptrace report for syscall entry and exit looks identical.
>   */
> -static inline int ptrace_report_syscall(unsigned long message)
> +static inline bool ptrace_report_syscall(unsigned long message)
>  {
>  	int ptrace = current->ptrace;
>  	int signr;
>  
>  	if (!(ptrace & PT_PTRACED))
> -		return 0;
> +		return true;
>  
>  	signr = ptrace_notify(SIGTRAP | ((ptrace & PT_TRACESYSGOOD) ? 0x80 : 0),
>  			      message);
> @@ -424,11 +424,11 @@ static inline int ptrace_report_syscall(
>  	if (signr)
>  		send_sig(signr, current, 1);
>  
> -	return fatal_signal_pending(current);
> +	return !fatal_signal_pending(current);
>  }
>  
>  /**
> - * ptrace_report_syscall_entry - task is about to attempt a system call
> + * ptrace_report_syscall_permit_entry - task is about to attempt a system call
>   * @regs:		user register state of current task
>   *
>   * This will be called if %SYSCALL_WORK_SYSCALL_TRACE or
> @@ -438,7 +438,7 @@ static inline int ptrace_report_syscall(
>   * call number and arguments to be tried.  It is safe to block here,
>   * preventing the system call from beginning.
>   *
> - * Returns zero normally, or nonzero if the calling arch code should abort
> + * Returns True normally, or False if the calling architecture code should abort
>   * the system call.  That must prevent normal entry so no system call is
>   * made.  If @task ever returns to user mode after this, its register state
>   * is unspecified, but should be something harmless like an %ENOSYS error
> @@ -447,8 +447,7 @@ static inline int ptrace_report_syscall(
>   *
>   * Called without locks, just after entering kernel mode.
>   */
> -static inline __must_check int ptrace_report_syscall_entry(
> -	struct pt_regs *regs)
> +static inline __must_check bool ptrace_report_syscall_permit_entry(struct pt_regs *regs)
>  {
>  	return ptrace_report_syscall(PTRACE_EVENTMSG_SYSCALL_ENTRY);
>  }
> 

