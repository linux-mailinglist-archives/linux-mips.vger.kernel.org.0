Return-Path: <linux-mips+bounces-15606-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f+jsB5qrTWq78gEAu9opvQ
	(envelope-from <linux-mips+bounces-15606-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 03:44:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2E720E84
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 03:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b="5hA9y/nb";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15606-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15606-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3427A300F5FA
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 01:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A306A3B0AF0;
	Wed,  8 Jul 2026 01:44:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9053AEB27;
	Wed,  8 Jul 2026 01:43:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475044; cv=none; b=FJjHZmqpJLHBdzCdPJndvWugXlCzNL53tmGotokUG+zi5OhOJ1i0Ui6Ry+0TNxwW5S8161dwDfrOM1RasIWFCzElSjkGN95r30KClUDRKBDqkwHnuCSrSTMlvC+le6RkCogg4kZ60qtCAYNfSG7PFRoDylt5++ViHhLyBruFf4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475044; c=relaxed/simple;
	bh=oI6J9PYK5j5OgyX7mHeyX7gJd643EKZH+CsT/bdCfBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I6EmMCmULSjA5Wv2SRhN57r3G5BDFdOJRFldBqDB3dADwIHqsJvoo+Az6SjmOJnhz+3AHSxUsl4jkerKENU8YaA8AMPgUUhUNtCsDKT4hcdyoGLp6p4u65g2IjrsCITIblXY342Ge+KVWRTAn23Q6rx3XUsyr1dz4ovZVlJHSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=5hA9y/nb; arc=none smtp.client-ip=113.46.200.222
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PdZvJupbHpc2hOYnTOWKrk/la+Cgt9ShW3j2lWe0WJs=;
	b=5hA9y/nbJT2Rdg9agSG6EdreDMBgYhixnmJvdWlfr8XidFnsSzCZu1Z1RT4/0VWszYj3O4mq/
	EgOdnVoPIUBGLqZev43itv9gO4V5NDlaHCFpwiBMuwwoePes9JuQ/NhfwH1VMdkJPUaHTUdzc7M
	av1A0vhQhzopjwvWZCaC8Vk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gw0y549jNzLlTw;
	Wed,  8 Jul 2026 09:34:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 665034057C;
	Wed,  8 Jul 2026 09:43:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Jul 2026 09:43:48 +0800
Message-ID: <2e6ed364-ce8f-4b4b-8675-acd07f140f4f@huawei.com>
Date: Wed, 8 Jul 2026 09:43:46 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 11/18] seccomp, treewide: Rename and convert
 __secure_computing() to return boolean
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Mark Rutland
	<mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, Yoshinori Sato
	<ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Chris
 Zankel <chris@zankel.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-alpha@vger.kernel.org>, <linux-csky@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-um@lists.infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
	Huacai Chen <chenhuacai@kernel.org>, <loongarch@lists.linux.dev>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, Sven Schnelle <svens@linux.ibm.com>,
	<linux-s390@vger.kernel.org>, <x86@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
	<will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
	<monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
	<linux-snps-arc@lists.infradead.org>, <linux-hexagon@vger.kernel.org>,
	<linux-openrisc@vger.kernel.org>, <sparclinux@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?=
	<msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>,
	<linux-doc@vger.kernel.org>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.230735780@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260707190254.230735780@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,arm.com,kernel.org,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.infradead.org,vger.kernel.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	TAGGED_FROM(0.00)[bounces-15606-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mark.rutland@arm.com,m:kees@kernel.org,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kernel.org
 ,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2A2E720E84



On 7/8/2026 3:06 AM, Thomas Gleixner wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> The return value of __secure_computing() currently uses 0 to indicate
> that a system call should be allowed, and -1 to indicate that it should
> be blocked/killed. This 0/-1 pattern is non-intuitive for a security
> check function and makes the control flow at the call sites less readable.
> 
> Furthermore, any potential future changes to these return values would
> require a high-risk, error-prone audit of all its users across different
> architectures.
> 
> Sanitize this logic by converting the return type of __secure_computing()
> to a proper boolean, where 'true' explicitly means 'allow' and 'false'
> means 'fail/deny'.
> 
> Update all the two dozen or so call sites across the tree to align with
> this new boolean semantic. No functional changes are intended, as the
> callers still return -1 to the lower-level assembly entry code upon
> seccomp denial.
> 
> Rename the function to __seccomp_permit_syscall() so that the purpose is
> entirely clear.
> 
> [ tglx: Rename the function ]
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> ---
>  arch/alpha/kernel/ptrace.c            |    2 -
>  arch/arm/kernel/ptrace.c              |    2 -
>  arch/arm64/kernel/ptrace.c            |    2 -
>  arch/csky/kernel/ptrace.c             |    2 -
>  arch/m68k/kernel/ptrace.c             |    2 -
>  arch/mips/kernel/ptrace.c             |    2 -
>  arch/parisc/kernel/ptrace.c           |    2 -
>  arch/sh/kernel/ptrace_32.c            |    2 -
>  arch/um/kernel/skas/syscall.c         |    2 -
>  arch/x86/entry/vsyscall/vsyscall_64.c |   14 ++++++-------
>  arch/xtensa/kernel/ptrace.c           |    3 --
>  include/linux/entry-common.h          |    9 +++-----
>  include/linux/seccomp.h               |   12 +++++------
>  kernel/seccomp.c                      |   35 +++++++++++++++++-----------------
>  14 files changed, 45 insertions(+), 46 deletions(-)

As Ada pointed out, the description of secure_computing in arch/Kconfig
need to be updated, a possible suggestion:

--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -636,8 +636,8 @@ config HAVE_ARCH_SECCOMP_FILTER
          - syscall_rollback()
          - syscall_set_return_value()
          - SIGSYS siginfo_t support
-         - secure_computing is called from a ptrace_event()-safe context
-         - secure_computing return value is checked and a return value
of -1
+         - seccomp_permits_syscall is called from a ptrace_event()-safe
context
+         - seccomp_permits_syscall return value is checked and if false


Link:
https://lore.kernel.org/all/b8f3b5cd-8d8a-4396-ba0c-011a83234dd9@arm.com/

> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -387,7 +387,7 @@ asmlinkage unsigned long syscall_trace_e
>  	 * If this fails, seccomp may already have set up the return value
>  	 * (e.g. SECCOMP_RET_ERRNO / TRACE).
>  	 */
> -	if (secure_computing() == -1) {
> +	if (!seccomp_permit_syscall()) {
>  		if (regs->r19 == 0 && regs->r0 == (unsigned long)-1)
>  			syscall_set_return_value(current, regs, -ENOSYS, 0);
>  		syscall_set_nr(current, regs, -1);

[...]

> -static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
> +static bool __seccomp_filter(int this_syscall, const bool recheck_after_trace)
>  {
>  	u32 filter_ret, action;
>  	struct seccomp_data sd;
> @@ -1294,7 +1295,7 @@ static int __seccomp_filter(int this_sys
>  	case SECCOMP_RET_TRACE:
>  		/* We've been put in this state by the ptracer already. */
>  		if (recheck_after_trace)
> -			return 0;
> +			return true;
>  
>  		/* ENOSYS these calls if there is no tracer attached. */
>  		if (!ptrace_event_enabled(current, PTRACE_EVENT_SECCOMP)) {
> @@ -1330,19 +1331,19 @@ static int __seccomp_filter(int this_sys
>  		 * a skip would have already been reported.
>  		 */
>  		if (__seccomp_filter(this_syscall, true))
> -			return -1;
> +			return false;

The return value of __seccomp_filter is checked in the wrong way, check
-1 should be replaced with check false, maybe:

-               if (__seccomp_filter(this_syscall, true))
-                       return -1;
+               if (!__seccomp_filter(this_syscall, true))
+                       return false;

otherwise,

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
> -		return 0;
> +		return true;
>  
>  	case SECCOMP_RET_USER_NOTIF:
>  		if (seccomp_do_user_notification(this_syscall, match, &sd))
>  			goto skip;
>  
> -		return 0;
> +		return true;
>  
>  	case SECCOMP_RET_LOG:
>  		seccomp_log(this_syscall, 0, action, true);
> -		return 0;
> +		return true;
>  
>  	case SECCOMP_RET_ALLOW:
>  		/*
> @@ -1350,7 +1351,7 @@ static int __seccomp_filter(int this_sys
>  		 * this action since SECCOMP_RET_ALLOW is the starting
>  		 * state in seccomp_run_filters().
>  		 */
> -		return 0;
> +		return true;
>  
>  	case SECCOMP_RET_KILL_THREAD:
>  	case SECCOMP_RET_KILL_PROCESS:
> @@ -1367,46 +1368,46 @@ static int __seccomp_filter(int this_sys
>  		} else {
>  			do_exit(SIGSYS);
>  		}
> -		return -1; /* skip the syscall go directly to signal handling */
> +		return false; /* skip the syscall go directly to signal handling */
>  	}
>  
>  	unreachable();
>  
>  skip:
>  	seccomp_log(this_syscall, 0, action, match ? match->log : false);
> -	return -1;
> +	return false;
>  }
>  #else
> -static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
> +static bool __seccomp_filter(int this_syscall, const bool recheck_after_trace)
>  {
>  	BUG();
>  
> -	return -1;
> +	return false;
>  }
>  #endif
>  
> -int __secure_computing(void)
> +bool __seccomp_permit_syscall(void)
>  {
>  	int mode = current->seccomp.mode;
>  	int this_syscall;
>  
>  	if (IS_ENABLED(CONFIG_CHECKPOINT_RESTORE) &&
>  	    unlikely(current->ptrace & PT_SUSPEND_SECCOMP))
> -		return 0;
> +		return true;
>  
>  	this_syscall = syscall_get_nr(current, current_pt_regs());
>  
>  	switch (mode) {
>  	case SECCOMP_MODE_STRICT:
>  		__secure_computing_strict(this_syscall);  /* may call do_exit */
> -		return 0;
> +		return true;
>  	case SECCOMP_MODE_FILTER:
>  		return __seccomp_filter(this_syscall, false);
>  	/* Surviving SECCOMP_RET_KILL_* must be proactively impossible. */
>  	case SECCOMP_MODE_DEAD:
>  		WARN_ON_ONCE(1);
>  		do_exit(SIGKILL);
> -		return -1;
> +		return false;
>  	default:
>  		BUG();
>  	}
> 


