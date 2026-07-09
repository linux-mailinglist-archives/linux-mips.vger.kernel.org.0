Return-Path: <linux-mips+bounces-15732-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id njINAuD7T2oIrgIAu9opvQ
	(envelope-from <linux-mips+bounces-15732-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 21:52:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987D735318
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 21:51:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WYxJw6Hc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15732-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15732-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F51301E94B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 19:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60303793A6;
	Thu,  9 Jul 2026 19:49:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31883C552B
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 19:49:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783626593; cv=none; b=CrucuSfyUyEtOXH/HYl7TnZSVSGnajJbdcLW6pa20Ch6kXOxDG+ekH5eyCZ0o5F5dLswLxx9xvQHwpEMrFADfymUfTkT22YzgHl7mM01jPYkS0yfDMTbfH39Lrx7F3RU8fjAIDML3SrrZuQm5OfoCxIYJHcAWPS53QY4VCWdJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783626593; c=relaxed/simple;
	bh=O3SPqd0FCeHdHAXnIs2zdCH8B3mqG0zpsrqZGFxlKyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0Z5jF6b5hL5mGa5oQoynixM9n0GkEJhtoiybQNGF8BS3xFu/p+2RQ/ULmdo+6WhwYOK3l3dwTY00wDIk/EA17SoZDyHVKAFXdgKh1P2ITCVSIaS85p00MJxQz5nVKbJbQypNvnUfGBR2NIbQnrEOzn5tIUQKWCNSryUgKCBKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYxJw6Hc; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so120255a12.3
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626588; x=1784231388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZIZ82kjBIDu2ZrVW8MGg3L6TnunPhQvQy9pezlSzDk=;
        b=WYxJw6HcCAitSLvAoPRMBNHwW+ITldVYEYwVbun6ncnSFOrNKsELQKcri5qgmxHOkB
         wx4QogG01yDYzDdHkp/mpFkmQCGSfktkvYF8Ar4ZY35orteCaCRNgN2dRnl5A81LFENw
         /sC83P3xh0ItVrrU4HfpPSVp2Du4fdaFlbH+BjRMtpXQPLwbehjpYIeWuv2rw2hKroeh
         xZSB1yaC63igCnNCW8JN7DTFTMZcbY/BFUAs4siWW6cHKuEViOL3j5jDKKjRa3Kt0HZ6
         thrSnh95sdyOsIxKXrIhYY2z3cA31v9pxBmoecM2y9uDvVOsyt04Ofj8nhka26E9dvhq
         ZY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626588; x=1784231388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wZIZ82kjBIDu2ZrVW8MGg3L6TnunPhQvQy9pezlSzDk=;
        b=CmGyrK3cfBlgRI40j5XWnPhbYeJin+r9YX9mqgxfxX0uTquMj3WTsr1UnZM77dkKd3
         uVdXNJirmjuZtneqxXGjpP5bPbncMoAzxjK9jLEhJhCVYkpC7ffGKvgq0ZagH1YzoNZ3
         zKEp5bjEy8bZadnRogHbBKfINKoAZwovZfMfE4MV4zbxRdfk5iEDSlpbApATQIJwFo0R
         OhR9VFHfIVmVLYM+cRR+SxyygZsYY7EXrm1QZMICfq0ASvOrkYMQD2q4HiYVLoPUDtN4
         mKPca5BobRoTbmWa2Z3+ighrKh/Vpyyymaj7MpscmkkybDZe77hQgzoJ8yfNsX8cCnjj
         8kmA==
X-Forwarded-Encrypted: i=1; AHgh+RqRWq0GMgJJZ66vPHhKrNqAmCQFDrDcQYDEJIoPlWcfLXBk96QrKHns/7iGX/2/IcaM/o6GBp1tuGIg@vger.kernel.org
X-Gm-Message-State: AOJu0YwtR/nJqFAcJ4Tr6PoP4uUGf6pKQZlIQPkU3j4kdq/3UjS+Tjvq
	t+imn/+q5OerFrs8W/9Fb3M5IgkdWmR1k1W5WxxB3FeMKcmLIfWGbUfO
X-Gm-Gg: AfdE7cmcX0FqatFE0UbmVCPzvxfNmmt4aFCmf63/OgbgLk+HfZ0NaLaWdfqDnLH+5DF
	9e7aP6RpKlaRH9A/+nv1/FQtVkwaxKBUk4qWZjMB+bbF85XPtBY0MScRN4Hki8OGjwm3Zro0iW/
	u3wri4lpGFOSF5of6BRn5N7axrQ5/mzZHjB0PGTbelr0SrixEnJ3r5OT2jSDtIxPTfEOfQoLJ1h
	tikbRfglukMLqRREurCpGUkpZxqx+J3R9F10waXLJlVh4BtUlONtIptFlVRgA6p3L4TP50rANOm
	hcwJ1YBFiKuMTAeYEz+xbnDL7uGFyIyeCXNhiiTNZ8psowcIhGQZHHDI8rSWXKUP3w0YnUWzfZA
	EZgIUNat0WE6Y/LjPjbgf3PxDcWaU0qqcFnQF5KZAkrlJMwblCvsy5pnO2GOSdgoI+G0qQtfa9L
	Nl5q/r6jy3DFHoXXbNWK3MEp69S8vW3BAZ0KvQgEctuqiBXdKdpEVWaILB0Oyb
X-Received: by 2002:a05:6a21:512:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c0bcfab03dmr10300238637.22.1783626587867;
        Thu, 09 Jul 2026 12:49:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34548981eec.16.2026.07.09.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:49:47 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:19:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org
Subject: Re: [patch 18/18] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
Message-ID: <ak_63WGVz28C2dc0@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.603111179@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707190254.603111179@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15732-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,suse.de,lwn.net,arndb.de,arm.com,kernel.org,ellerman.id.au,linux.ibm.com,dabbelt.com,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,monstr.eu,davemloft.net,gaisler.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:arnd@arndb.de,m:mark.rutland@arm.com,m:chenhuacai@kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:svens@linux.ibm.com,m:linux-doc@vger.kernel.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:kees@kernel.org,m:x86@kernel.org,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.or
 g,m:linux-um@lists.infradead.org,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7987D735318

On Tue, Jul 07, 2026 at 09:07:09PM +0200, Thomas Gleixner wrote:
> From: Michal Suchánek <msuchanek@suse.de>
> 
> The return values of syscall_enter_from_user_mode[_work]() are
> non-intuitive. Both functions return the syscall number which should be
> invoked by the architecture specific syscall entry code. The returned
> number can be:
> 
>   - the unmodified syscall number which was handed in by the caller
> 
>   - a modified syscall number (ptrace, seccomp, trace/probe/bpf)
> 
> That has an additional twist. If the return value is -1L then the caller is
> not allowed to modify the return value as that indicates that the modifying
> entity requests to abort the syscall and set the return value already. That
> can obviously not be differentiated from a syscall which handed in -1 as
> syscall number.
> 
> The established way to deal with that is:
> 
>     set_return_value(regs, -ENOSYS);
>     nr = syscall_enter_from_user_mode(regs, nr);
>     if ((unsigned)nr < SYSCALLNR_MAX)
>     	handle_syscall(regs, nr);
>     else if (nr != -1)
>     	set_return_value(regs, -ENOSYS);
> 
> The latter is obviously redundant, but that's just a leftover of the
> historical evolution of this code. S390 has some special requirements here,
> which can be avoided when the return value is not ambiguous.
> 
> Now that the functions which modify the syscall number and want to abort
> are converted to indicate that with a boolean return value, it's obvious to
> hand this through to the callers.
> 
> Rework syscall_enter_from_user_mode[_work]) so they take a pointer to the
> syscall number and return a boolean, which indicates whether the syscall
> should be handled or not.
> 
> That's not only more intuitive, it also results in slightly denser
> executable code on x86 at least, but perf results are neutral and within
> the noise.
> 
> [ tglx: Adopted it to the changes in the generic entry code, fixed up the
>   	32-bit fallout and rewrote change log ]
> 
> Signed-off-by: Michal Suchánek <msuchanek@suse.de>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> ---
>  Documentation/core-api/entry.rst |   18 +++++++++++-------
>  arch/loongarch/kernel/syscall.c  |   14 +++++++-------
>  arch/powerpc/kernel/syscall.c    |    3 ++-
>  arch/riscv/kernel/traps.c        |   11 +++++------
>  arch/s390/kernel/syscall.c       |    7 +++++--
>  arch/x86/entry/syscall_32.c      |   25 ++++++++++++-------------
>  arch/x86/entry/syscall_64.c      |   12 ++++++------
>  include/linux/entry-common.h     |   12 +++++-------
>  8 files changed, 53 insertions(+), 49 deletions(-)
> 
>  
[...]
>  	syscall_exit_to_user_mode(regs);
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -18,7 +18,8 @@ notrace long system_call_exception(struc
>  	long ret;
>  	syscall_fn f;
>  
> -	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
Missing one closing ')'.

> +		return syscall_get_error(current, regs);
>  
>  	if (unlikely(r0 >= NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {

Apart from this.


Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

