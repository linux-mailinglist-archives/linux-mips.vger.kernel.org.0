Return-Path: <linux-mips+bounces-7595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE108A1A5CA
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 15:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777B83AA9A6
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 14:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871D620E6F6;
	Thu, 23 Jan 2025 14:34:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BA01CA8D;
	Thu, 23 Jan 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737642877; cv=none; b=Sczn0ppb6UavyytlLPhuLmql2W7jThuS8YQtX8um8nwZi9YfKpH+xpBSVc0TT1DJjP6pTISqem30nsOu6FQNtYoNPvjjH1kPSUkx4DrtSuU6nWZEbqyX/ygq64a/7omGkI6WGtudmBb/UhXaxdXMClRlsfmz3hfIXg9kmsPw/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737642877; c=relaxed/simple;
	bh=GbmH5Ehcr9uWJ0i3LVZDcN9X6fjZ+WhVrryobOaXQCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgLgY4zyfO/0BcmvcjFcxs9bsyn+/5nmiGVHD9pVIQ66Hdd3HECxXkyt22VBjYbqgTt/v/9HsVVQaCXtGdUXm0nS+at446+lz6HsR4NZYsOs5STFbFHvgZC8aiTfYCRpXYatTHMVejfHQDxXtduJlK369BvkHA0FUpJDOS3V+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tayHM-0003Jh-00; Thu, 23 Jan 2025 15:33:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AD776C0147; Thu, 23 Jan 2025 15:33:32 +0100 (CET)
Date: Thu, 23 Jan 2025 15:33:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <Z5JTPJXcL8J4B2mD@alpha.franken.de>
References: <20250120134409.GA21241@redhat.com>
 <20250120134445.GA21268@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134445.GA21268@redhat.com>

On Mon, Jan 20, 2025 at 02:44:45PM +0100, Oleg Nesterov wrote:
> arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
> can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
> and "sd == NULL" checks in __secure_computing(sd) paths.
> 
> With the change above syscall_trace_enter() can just use secure_computing()
> and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
> not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/mips/kernel/ptrace.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 61503a36067e..f7107479c7fa 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1326,24 +1326,8 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  			return -1;
>  	}
>  
> -#ifdef CONFIG_SECCOMP
> -	if (unlikely(test_thread_flag(TIF_SECCOMP))) {
> -		int ret, i;
> -		struct seccomp_data sd;
> -		unsigned long args[6];
> -
> -		sd.nr = current_thread_info()->syscall;
> -		sd.arch = syscall_get_arch(current);
> -		syscall_get_arguments(current, regs, args);
> -		for (i = 0; i < 6; i++)
> -			sd.args[i] = args[i];
> -		sd.instruction_pointer = KSTK_EIP(current);
> -
> -		ret = __secure_computing(&sd);
> -		if (ret == -1)
> -			return ret;
> -	}
> -#endif
> +	if (secure_computing())
> +		return -1;
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->regs[2]);
> -- 
> 2.25.1.362.g51ebf55

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

