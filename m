Return-Path: <linux-mips+bounces-15639-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id muwTB178TmqfYQIAu9opvQ
	(envelope-from <linux-mips+bounces-15639-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 03:41:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC572BB49
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 03:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=gWx7PLKQ;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15639-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15639-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1888302DB7E
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 01:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637672E1EE0;
	Thu,  9 Jul 2026 01:41:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03F282F3B;
	Thu,  9 Jul 2026 01:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783561304; cv=none; b=PSNvTvkeOdRhZqQtVmUNU11ESHhqkFF302Ptl3WNKBWYg+FljDNmkryS1K0Xz+GA6h/Q6SlwNm5YkKMuT3cu2ttpkkevhpaPQjeGpGSYXgGBJpibIcKXPWcabQHrI8TOn8PDpSCKE2/Cpq1+x9DipfcVYpUQg+9unSbDB0/mDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783561304; c=relaxed/simple;
	bh=UChpmtX0rQDDkApsnRqSCqBqYdyd7qGUXLGX0oZnhTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K8f10r9jDDHmMqRhUR4FhRgVit8o/ff/52xWT7zKMRop4LU1IBGFATW4KevWsQZTSYoDVkyRDCK4DjlX3YkmuEv3QJtLnf1JA5sjPsbau0heJ4GHRgePmQwdKJRBue/yHzQe8VAPgeTOSpgVi/SLgcDxm3FzvpwYc8h9NFmXhs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gWx7PLKQ; arc=none smtp.client-ip=113.46.200.221
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lWJC/T42Y9Sctt8rfR0gbHYHLNR85QUffiSqQbtjZWU=;
	b=gWx7PLKQYMG59jNzPyTqABRgFGdzDXuNK+aKu4gTd6cfqGrBhsk7NJaJseY55RiMHidGwPKa/
	InQtchs+8Rj1ylu7LahYH9QcUc7E6+6QeMicGFQKMsw7lP8LiguRhka+2ExKpHbscls/EwgObTE
	cW4ikU/U5n8c2VG7mabAV/I=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gwcrp64RQzRhTc;
	Thu,  9 Jul 2026 09:32:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0104940575;
	Thu,  9 Jul 2026 09:41:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 09:41:19 +0800
Message-ID: <8bcac80c-7f5d-4bfb-ac54-b659b4e999f1@huawei.com>
Date: Thu, 9 Jul 2026 09:41:18 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 12/18] ptrace, treewide: Rename
 ptrace_report_syscall_entry() to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo
 Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, Helge Deller
	<deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Chris
 Zankel <chris@zankel.net>, <linux-alpha@vger.kernel.org>,
	<linux-snps-arc@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-csky@vger.kernel.org>, <linux-hexagon@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-openrisc@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
	<linux-um@lists.infradead.org>, <linux-arch@vger.kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
	<linuxppc-dev@lists.ozlabs.org>, Kees Cook <kees@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, <loongarch@lists.linux.dev>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, Sven Schnelle <svens@linux.ibm.com>,
	<linux-s390@vger.kernel.org>, <x86@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>, Richard Weinberger
	<richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.280015701@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260707190254.280015701@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:arnd@arndb.de,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:vgupta@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:guoren@kernel.org,m:bcain@kernel.org,m:geert@linux-m68k.org,m:monstr@monstr.eu,m:tsbogend@alpha.franken.de,m:dinguyen@kernel.org,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:davem@davemloft.net,m:andreas@gaisler.com,m:chris@zankel.net,m:linux-alpha@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arch@vger.kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:ch
 enhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:luto@kernel.org,m:richard@nod.at,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[infradead.org,arndb.de,redhat.com,linaro.org,kernel.org,armlinux.org.uk,arm.com,linux-m68k.org,monstr.eu,alpha.franken.de,gmx.de,users.sourceforge.jp,davemloft.net,gaisler.com,zankel.net,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,nod.at,suse.de,lwn.net];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15639-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AABC572BB49



On 7/8/2026 3:06 AM, Thomas Gleixner wrote:
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 


