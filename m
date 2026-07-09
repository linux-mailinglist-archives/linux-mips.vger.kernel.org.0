Return-Path: <linux-mips+bounces-15733-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CL2VG3YBUGoPrwIAu9opvQ
	(envelope-from <linux-mips+bounces-15733-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 22:15:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E505735492
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 22:15:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pPcGO3ki;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15733-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15733-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CF1F301F6DB
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 20:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B47271468;
	Thu,  9 Jul 2026 20:15:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CA33711D
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 20:15:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628143; cv=none; b=gY76XNXt57l1hqk+WYr6ikaShDB7r7faBf+K/XZjqIBVxao3JoI8KjekRCvWZZCchP4R7ZaPYqXGq/uijkdxe9pcQaRv/N4r8vTPrTdVAxg0u03oiaX2OejTh4IZrEfSJs4WYK4bogGLLkXCLLdxEdad3eK+cwMgYyjX1Qxy6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628143; c=relaxed/simple;
	bh=vDHDpmX/SHzXbqc6X1TB+shIwLpdQz10EZJe4LqT6ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c67vcyZbgKj7zgnEgz2cBuL6fILryHIDk3TqhMpEezBchaNf5hHkFTC8C6oTxDAlB23r0QZszNYam34dAw2sPmScb9t/K4lGFlSyLoEtDSkQgn8YhdBuZknGPjcJAORExYv/lEAsbEdkCnkVYZztwH7Use3PWFnvbl2vHolTP+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPcGO3ki; arc=none smtp.client-ip=209.85.215.181
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso170383a12.0
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783628139; x=1784232939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4V4fuwVKw9a+buqSTfOSwTO6Zlt+2k8vx+/ObUQlSos=;
        b=pPcGO3ki8aiA3GFmYvP3IhvWe6YILhYaUEBulmCKeZ+r2KJTGiKNjkWuBhmMdrAZCr
         bIN7si8+TB3Ko4eJJBOKEUm8ErKb3XWJWpBzeB+6uED6h7M5VC7NlQqFytg1IEnbHB6Y
         Tl4YVmDV/pGjBpyr6T22sGOsT93E1DQEu5bjWpEGM/XwbNLQsHu8pYLedW0pJWFjS1BK
         SJcfmUZpOC+qL9SrkwA3m+w1jy7R+wzwPnNl0VlGkQLBg6LqNq90l/CPGNzTtLwvzpaL
         ebSDYixhMSQx0osVC70xVd9HGap9GELh7qdrjHRvv4rlAJdmpNB106P8JEU0ydkpnt6T
         74iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783628139; x=1784232939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4V4fuwVKw9a+buqSTfOSwTO6Zlt+2k8vx+/ObUQlSos=;
        b=QOUpmjMWW8djqd7AOBVdXqSuR6q3iR6sWJyTmPjWZQqOBKCgeRqiw4lD2b4OWZm8aX
         tIqZxrJFFPNimDThV0xAERZKo7I7UTyPsjKhyNWq3tKGSV2skDnq9PicYPZwP/pEuGD8
         zG8cdrgOZ/BCbJiSjTwtSJRpb4bHsESp0Tsw+QITIwn719tKu3qfopbGWWbb10a7oJKy
         CoEV6YiGaEjoH5jFHbrbqksnycMwhgWUEY3K0t9ZDYLmeFQN9O+cfHnea6NogMyfbH6K
         071KBxwFKGDHENgdHI/cSeVbCTe6LeKr1gLZS+rwIIwbv095H1TBZk1d1AENM0WncHTZ
         BekQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxcFdmqzmahpU8FjclCjC0B2NP5S/N0kfLJM3lk4U9A7sfrNVsCFeJ2G7ndVOCAZsDTwuYBclX+Q8x@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXhDdHJ4uiRIW8v19J+CTgVMsTXlwj5+4o0Rm2FaWL27yuRtc
	NxBm7Qr1Z7iRFYiBrmEI6DnXERgq3yi93MOGVeILJ85Ja5yuSIjoURDJ
X-Gm-Gg: AfdE7cmBj/iLSfDP3bqBt8f9nszib0WVdLxbxFEnae0ZhTR1ERMr1hLfBDHheJeE2QN
	kfBugajiMbJhytSQZ0kFDec0citPHoOVqwB3Ug7n41hI+22i5qDqV07NR3xJ6bARcQJvmp2cInA
	ShsrTnoATOQYV1VU4skYZ5vueWfMH7IK14wgEqZPDG04UY8trfdTV8dhtxJxIWC+I0tAWQ/d7xx
	2cpMQ+766QA2yMOf5Yu6WP3t8xyHX1YQyGf4xdQwmixx0yw+GKza8k7udgaB93MKab9oIJ3jo92
	yzBER9RwSw7e4yRQBjZiW1jLcW/0CHNqcAs7/1lNDaezOrlJS4+9QXAkE+XWc1Uy4OWa2IKT72E
	lop7E6Cuij/ANX9x/SVUjgVu37hLjrxtc+BrEcOQvWa9tfgndO5X+zpmUi1QS77ZQuPDJ1l1G61
	kOeTp+U9+YsGzLcUcer51MBT2JaXBUOFrHQDjtcfrgPir5zMVm40HNWqyL9yQnvSrJUKJvCUY=
X-Received: by 2002:a05:6a21:32a2:b0:398:8870:b58f with SMTP id adf61e73a8af0-3c0bcbe77a5mr11679805637.14.1783628138627;
        Thu, 09 Jul 2026 13:15:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm2908315eec.15.2026.07.09.13.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:15:38 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:45:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry
 handling
Message-ID: <ak_7lawD_OujooyZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707181957.433213175@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15733-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:url,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E505735492

On Tue, Jul 07, 2026 at 09:05:53PM +0200, Thomas Gleixner wrote:
> Sorry for the long CC list, but this is a treewide change.
> 
> Michal recently posted a RFC patch to separate the potential syscall number
> modifications in syscall_enter_user_mode_work() from the information
> whether the syscall should be processed and the return value modified:
> 
>   https://lore.kernel.org/lkml/CE1qW@kunlun.suse.cz
> 
> The existing logic is:
> 
> arch_syscall()
> 	regs->result = -ENOSYS;
> 
> 	syscallnr = syscall_enter_from_user_mode(regs, syscall);
> 
> 	if (syscallnr != -1L)
> 		regs->result = invoke_syscall(regs, syscall;
> 
> syscall_enter_from_user_mode() invokes ptrace, seccomp and
> tracing/BPF/Probes. All of them can modify the syscall number.
> 
> ptrace and seccomp explicitly set the syscall number to -1L to indicate
> that the syscall invocation needs to be skipped and the result has not to
> be modified as it might have been modified by ptrace or seccomp. The
> tracer/BPF/Probes mechanism can modify the syscall number as well and
> relies implicitly on the -1L logic.
> 
> This can obviously not be differentiated from a syscall invocation where
> userspace provided -1 as syscall number.
> 
> The general agreement of the discussion was that the current mechanism,
> while functionally correct is non-intuitive and something like Michals
> proposal would make that code clearer and easier to handle on the
> architecture side:
> 
> arch_syscall()
> 	regs->result = -ENOSYS;
> 
> 	if (syscall_enter_from_user_mode(regs, &syscall)) 
> 		regs->result = invoke_syscall(regs, syscall;
> 
> That discussion made me look deeper into the related code and as usual
> there were a lot of other things to discover.
> 
>   1) Stack randomization
> 
>      add_random_kstack_offset() can only be invoked after
>      enter_from_user_mode() established proper state as it calls into
>      instrumentable code.
> 
>      PowerPC got that wrong and the other architectures either invoke it
>      after enter_from_user_mode() or after syscall_enter_from_user_mode().
> 
>      The latter is suboptimal as the randomization takes place after all
>      the user mode entry work. Aside of that add_random_kstack_offset()
>      uses get/put_cpu_var(), which makes it usable in preemptible code, but
>      when invoked in the interrupt disabled region that's pointless
>      overhead.
> 
>   2) As discussed in the above thread just changing the function signature
>      of syscall_enter_from_user_mode[_work]() so they take a pointer
>      argument for the syscall and then return 0 on success is not really
>      intuitive either. Aside of that this breaks the implicit assumption of
>      the tracer when setting the syscall number to -1.
> 
>   3) The x86 entry code has some historically accumulated oddities
> 
> The following series addresses this by:
> 
>   1) Providing new [syscall_]enter_from_user_mode() variants, which include
>      stack randomization and utilize a new add_random_kstack_offset_irqsoff()
>      variant, which avoids the get/put_cpu_var() overhead and converting all
>      usage sites over
> 
>   2) Picking up Jinjie's seccomp patch from:
> 
>      https://lore.kernel.org/lkml/20260629130616.642022-2-ruanjinjie@huawei.com
> 
>      and addressing the feedback (renaming the seccomp functions)
> 
>   3) Making the ptrace and tracer related functions return a boolean value
>      to indicate syscall permission
> 
>   4) Addressing the x86 oddities
> 
>   5) Converting the tree over to the new scheme
> 
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
> 
> There should be no functional changes, at least there are none intended.
> 
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
> 
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
> 
> The series applies on Linus tree and is also available from git:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
> 
> Thanks,
> 
> 	tglx
> ---
>  Documentation/core-api/entry.rst      |   33 +++++---
>  arch/alpha/kernel/ptrace.c            |    4 -
>  arch/arc/kernel/ptrace.c              |    2 
>  arch/arm/kernel/ptrace.c              |    4 -
>  arch/arm64/kernel/ptrace.c            |    4 -
>  arch/csky/kernel/ptrace.c             |    4 -
>  arch/hexagon/kernel/traps.c           |    2 
>  arch/loongarch/kernel/syscall.c       |   17 +---
>  arch/m68k/kernel/ptrace.c             |    4 -
>  arch/microblaze/kernel/ptrace.c       |    2 
>  arch/mips/kernel/ptrace.c             |    4 -
>  arch/nios2/kernel/ptrace.c            |    2 
>  arch/openrisc/kernel/ptrace.c         |    2 
>  arch/parisc/kernel/ptrace.c           |   12 +--
>  arch/powerpc/kernel/syscall.c         |    5 -
>  arch/riscv/kernel/traps.c             |   14 +--
>  arch/s390/kernel/syscall.c            |   11 +-
>  arch/sh/kernel/ptrace_32.c            |    4 -
>  arch/sparc/kernel/ptrace_32.c         |    2 
>  arch/sparc/kernel/ptrace_64.c         |    2 
>  arch/um/kernel/ptrace.c               |    2 
>  arch/um/kernel/skas/syscall.c         |    2 
>  arch/x86/entry/syscall_32.c           |   70 +++++++------------
>  arch/x86/entry/syscall_64.c           |   61 ++++++----------
>  arch/x86/entry/vsyscall/vsyscall_64.c |   14 +--
>  arch/x86/include/asm/entry-common.h   |    1 
>  arch/x86/include/asm/syscall.h        |   10 --
>  arch/xtensa/kernel/ptrace.c           |    5 -
>  include/asm-generic/syscall.h         |    4 -
>  include/linux/entry-common.h          |  125 ++++++++++++++++++++--------------
>  include/linux/irq-entry-common.h      |    6 -
>  include/linux/ptrace.h                |   13 +--
>  include/linux/randomize_kstack.h      |   19 +++++
>  include/linux/seccomp.h               |   12 +--
>  kernel/entry/syscall-common.c         |    7 +
>  kernel/seccomp.c                      |   35 ++++-----
>  36 files changed, 264 insertions(+), 256 deletions(-)
> 
> 
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

Boot tested this on P11 LPAR and P9 powernv system.
Tested-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

