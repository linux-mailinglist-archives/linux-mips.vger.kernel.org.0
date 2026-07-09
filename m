Return-Path: <linux-mips+bounces-15728-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d0vEJCb1T2p2rAIAu9opvQ
	(envelope-from <linux-mips+bounces-15728-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 21:23:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CB867734E8B
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 21:23:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FJEzWz3C;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15728-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15728-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A37F43019B07
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 19:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B52E399897;
	Thu,  9 Jul 2026 19:10:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBD3537D0
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 19:10:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624241; cv=none; b=S6w9FdrWVInJvjnrufpcSXiYDeJoNihXtuHgmlOD8NJsjFgcXna9s/UjeUspt1mV6zN7gQm8oSL9Ax+JGeCI8s0iLLNBNemD9bzrvDJ30MOsBHaOwX/vqsDh8gb5IC42w4ZJiH4XfX0uHpwCgdDgOPyOwlPy6nBHtBM+wGdgQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624241; c=relaxed/simple;
	bh=r/QQlmrJdbGDvO500PKX/NU2Q7BMk0sP6jnQ5CxvlzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USMFQXs0SowAWhmqvZl0eb3XRqVXExZIAAiXKb/rVdYy1RDZkjBwjiaGE4yaztmvVvxts7yLUNPpz8qFJ51fetgb704c+9Tm9zzLFYmJbfSnkskKrV7jssEq/1pdvb82F/aCAEOLpHYhM0sEdVuc9Enxu7Fm5Ka25FGjNYxyq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJEzWz3C; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38511175ad3so233565a91.2
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783624236; x=1784229036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WLiLUcdHKcbdohnfRqoOLrBkSnwixIbkHxH0bk89UM=;
        b=FJEzWz3CLaShLbMo7Iq3aX6axNOngzcR3SPJrD/IoGCT+ZdBeYgdpK9pjRPlnczjBv
         DMvxSQqv7Tu8IyW93N+9mJG5F2rW04DmcQaHpt7OrP2Jo1EnTa4kx1TPH1eGnlL9edCS
         ZuwHwLCbxsTnYBHG3wn+xt+BNarRmMWpY44B+m1d+2nlEy9s5uBAlJdiu5wgohYSabEJ
         gUD5zxFRKxYISiunn4o0rwqcH8dWqyHGDxpkzOAXMy1kiEkWay9Rg6ACVVP+Xs+0CChF
         b8zmI+q6PXw/t6Pg15nmqT3nodi7Zo1V0Sxdd8j+X0JAaGNkYu2l46kC8vwOrhS0n0He
         7j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624236; x=1784229036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WLiLUcdHKcbdohnfRqoOLrBkSnwixIbkHxH0bk89UM=;
        b=l+GyWx53OEIB+iie8IZOD+0WDSnS6FKjKiFYfcl/8TdzlQB7cD3ewh0cnGeJAC+prD
         f0JSudwda41r6rox4i5+I4K0gDMxzQSEJV1MW++pn456ITLtMtujhy7z8qhYw6y3of6j
         ITiTpJrzLG2JYLBSHec+QuHhLgibg0b01wuMrOgk/xaCkU9CU0OZF/yCvjFIIfzPNk7e
         jfjHOhYIcEzfPuUncAuXA7Vjz/koCxk6ifsMt9QQ9OoTVwo+snOg91KuLR/ZUnqJkJtn
         FhIhsQ7gNL/yi3uIFk9Lwv9Y65wjQqitfFq+u4kTmi3Nhlg3PNh1uVb7xZjZGt3KzZr7
         F5MA==
X-Forwarded-Encrypted: i=1; AHgh+RofwWHWPnM+ydOBUvvs8tCCsVSfSi8FtQZMRPOYcdy3jFfjtGD7U2/de+Hl/c6VwMTLHDfigqJEKRpz@vger.kernel.org
X-Gm-Message-State: AOJu0YzSd3AHmbjQqAhlK0XWoOX2XCFklp1m42iWi+SyGYR/0CRYRkX1
	/mXdiLe1XZVOZslAQo+4wMpqJg2OVUPM4qnWlV47q8Ug/76xh/ysBvoX
X-Gm-Gg: AfdE7ckmPSOKpCSXnt9cyJ7W8cQun49IOM2hnO02kymkqG2fLuTOjFtwTK981rc9d7m
	cK97w7lZc2lKxD7ldUaD7t0fRhQR1EuabNHSOQN84fOI5Sd0pEox1mQPjWofanE/S8BwIPl4dlP
	BUWj1qEKfUBtaM4gQLT5x0BwyqKBRMsCiAUu1LkKF16G/NsxnifaT8aj1X1vzIXB5lgxlhfYUQt
	qGzOUr+g0h6jKT0s86E7hAhjH0kg7C+vVTMOUPAzOoJmfasF2Y/kbnsW2fMSUhjgH9gMzlbLDPm
	0qRq7BPc6Q0iWwjsuq4GikrBaG5ecyAQq+sL4ARHjmvY2HTvwjUN4HIvbg3GO/ZrgFe65qAxsnS
	GQJ29AeS0tby1aBgeeEUuN0005R2dHX4Vogk3AY3sKRWx/Rpi5oAFQ4WVrdG0mUQLdwjrY2WBOq
	zuOkoBIpFioQJWCaI9gNqXdQzR1qVVxMrrVaqKb/gHOt4Ry21c8Kq5QhHrpxjY
X-Received: by 2002:a17:90a:c2d0:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38941ebc22dmr8070366a91.33.1783624236407;
        Thu, 09 Jul 2026 12:10:36 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a92eccsm30700023eec.23.2026.07.09.12.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:10:35 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:40:00 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 11/18] seccomp, treewide: Rename and convert
 __secure_computing() to return boolean
Message-ID: <ak_x_ndzTNX2hfSG@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.230735780@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.230735780@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15728-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,arm.com,huawei.com,kernel.org,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.infradead.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:kees@kernel.org,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB867734E8B

On Tue, Jul 07, 2026 at 09:06:40PM +0200, Thomas Gleixner wrote:
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
> --- a/arch/arm/kernel/ptrace.c
> +++ b/arch/arm/kernel/ptrace.c
> @@ -855,7 +855,7 @@ asmlinkage int syscall_trace_enter(struc
>  
>  	/* Do seccomp after ptrace; syscall may have changed. */
>  #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		return -1;
>  #else
>  	/* XXX: remove this once OABI gets fixed */
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2420,7 +2420,7 @@ int syscall_trace_enter(struct pt_regs *
>  	}
>  
>  	/* Do the secure computing after ptrace; failures should be fast. */
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		return NO_SYSCALL;
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> --- a/arch/csky/kernel/ptrace.c
> +++ b/arch/csky/kernel/ptrace.c
> @@ -323,7 +323,7 @@ asmlinkage int syscall_trace_enter(struc
>  		if (ptrace_report_syscall_entry(regs))
>  			return -1;
>  
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		return -1;
>  
>  	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> --- a/arch/m68k/kernel/ptrace.c
> +++ b/arch/m68k/kernel/ptrace.c
> @@ -281,7 +281,7 @@ asmlinkage int syscall_trace_enter(void)
>  	if (test_thread_flag(TIF_SYSCALL_TRACE))
>  		ret = ptrace_report_syscall_entry(task_pt_regs(current));
>  
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		return -1;
>  
>  	return ret;
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1328,7 +1328,7 @@ asmlinkage long syscall_trace_enter(stru
>  			return -1;
>  	}
>  
> -	if (secure_computing())
> +	if (!seccomp_permit_syscall())
>  		return -1;
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -351,7 +351,7 @@ long do_syscall_trace_enter(struct pt_re
>  	}
>  
>  	/* Do the secure computing check after ptrace. */
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		return -1;
>  
>  #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
> --- a/arch/sh/kernel/ptrace_32.c
> +++ b/arch/sh/kernel/ptrace_32.c
> @@ -460,7 +460,7 @@ asmlinkage long do_syscall_trace_enter(s
>  		return -1;
>  	}
>  
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		return -1;
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> --- a/arch/um/kernel/skas/syscall.c
> +++ b/arch/um/kernel/skas/syscall.c
> @@ -27,7 +27,7 @@ void handle_syscall(struct uml_pt_regs *
>  		goto out;
>  
>  	/* Do the seccomp check after ptrace; failures should be fast. */
> -	if (secure_computing() == -1)
> +	if (!seccomp_permit_syscall())
>  		goto out;
>  
>  	syscall = UPT_SYSCALL_NR(r);
> --- a/arch/x86/entry/vsyscall/vsyscall_64.c
> +++ b/arch/x86/entry/vsyscall/vsyscall_64.c
> @@ -118,10 +118,10 @@ static bool write_ok_or_segv(unsigned lo
>  
>  static bool __emulate_vsyscall(struct pt_regs *regs, unsigned long address)
>  {
> -	unsigned long caller;
> -	int vsyscall_nr, syscall_nr, tmp;
> +	unsigned long caller, orig_dx;
> +	int vsyscall_nr, syscall_nr;
> +	bool skip;
>  	long ret;
> -	unsigned long orig_dx;
>  
>  	/* Confirm that the fault happened in 64-bit user mode */
>  	if (!user_64bit_mode(regs))
> @@ -197,16 +197,16 @@ static bool __emulate_vsyscall(struct pt
>  	 */
>  	regs->orig_ax = syscall_nr;
>  	regs->ax = -ENOSYS;
> -	tmp = secure_computing();
> -	if ((!tmp && regs->orig_ax != syscall_nr) || regs->ip != address) {
> +	skip = !seccomp_permit_syscall();
> +	if ((!skip && regs->orig_ax != syscall_nr) || regs->ip != address) {
>  		warn_bad_vsyscall(KERN_DEBUG, regs,
>  				  "seccomp tried to change syscall nr or ip");
>  		force_exit_sig(SIGSYS);
>  		return true;
>  	}
>  	regs->orig_ax = -1;
> -	if (tmp)
> -		goto do_ret;  /* skip requested */
> +	if (skip)
> +		goto do_ret;
>  
>  	/*
>  	 * With a real vsyscall, page faults cause SIGSEGV.
> --- a/arch/xtensa/kernel/ptrace.c
> +++ b/arch/xtensa/kernel/ptrace.c
> @@ -553,8 +553,7 @@ int do_syscall_trace_enter(struct pt_reg
>  		return 0;
>  	}
>  
> -	if (regs->syscall == NO_SYSCALL ||
> -	    secure_computing() == -1) {
> +	if (regs->syscall == NO_SYSCALL || !seccomp_permit_syscall()) {
>  		do_syscall_trace_leave(regs);
>  		return 0;
>  	}
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -102,9 +102,8 @@ static __always_inline long syscall_trac
>  
>  	/* Do seccomp after ptrace, to catch any tracer changes. */
>  	if (work & SYSCALL_WORK_SECCOMP) {
> -		ret = __secure_computing();
> -		if (ret == -1L)
> -			return ret;
> +		if (!__seccomp_permit_syscall())
> +			return -1L;
>  	}
>  
>  	/* Either of the above might have changed the syscall number */
> @@ -115,7 +114,7 @@ static __always_inline long syscall_trac
>  
>  	syscall_enter_audit(regs, syscall);
>  
> -	return ret ? : syscall;
> +	return syscall;
>  }
>  
>  /**
> @@ -138,7 +137,7 @@ static __always_inline long syscall_trac
>   * It handles the following work items:
>   *
>   *  1) syscall_work flag dependent invocations of
> - *     ptrace_report_syscall_entry(), __secure_computing(), trace_sys_enter()
> + *     ptrace_report_syscall_entry(), __seccomp_permit_syscall(), trace_sys_enter()
>   *  2) Invocation of audit_syscall_entry()
>   */
>  static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *regs, long syscall)
> --- a/include/linux/seccomp.h
> +++ b/include/linux/seccomp.h
> @@ -22,14 +22,14 @@
>  #include <linux/atomic.h>
>  #include <asm/seccomp.h>
>  
> -extern int __secure_computing(void);
> +extern bool __seccomp_permit_syscall(void);
>  
>  #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
> -static inline int secure_computing(void)
> +static __always_inline bool seccomp_permit_syscall(void)
>  {
>  	if (unlikely(test_syscall_work(SECCOMP)))
> -		return  __secure_computing();
> -	return 0;
> +		return  __seccomp_permit_syscall();
> +	return true;
>  }
>  #else
>  extern void secure_computing_strict(int this_syscall);
> @@ -50,11 +50,11 @@ static inline int seccomp_mode(struct se
>  struct seccomp_data;
>  
>  #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
> -static inline int secure_computing(void) { return 0; }
> +static inline bool seccomp_permit_syscall(void) { return true; }
>  #else
>  static inline void secure_computing_strict(int this_syscall) { return; }
>  #endif
> -static inline int __secure_computing(void) { return 0; }
> +static inline bool __seccomp_permit_syscall(void) { return true; }
>  
>  static inline long prctl_get_seccomp(void)
>  {
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -1100,12 +1100,13 @@ void secure_computing_strict(int this_sy
>  	else
>  		BUG();
>  }
> -int __secure_computing(void)
> +
> +bool __seccomp_permit_syscall(void)
>  {
>  	int this_syscall = syscall_get_nr(current, current_pt_regs());
>  
>  	secure_computing_strict(this_syscall);
> -	return 0;
> +	return true;
>  }
>  #else
>  
> @@ -1256,7 +1257,7 @@ static int seccomp_do_user_notification(
>  	return -1;
>  }
>  
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
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

