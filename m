Return-Path: <linux-mips+bounces-15657-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +hE3Jo0ZT2ozagIAu9opvQ
	(envelope-from <linux-mips+bounces-15657-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 05:46:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2672C697
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 05:46:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=r6RtRSgk;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15657-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15657-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71E71301FB18
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 03:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF8F38F92D;
	Thu,  9 Jul 2026 03:46:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47942F49FD;
	Thu,  9 Jul 2026 03:46:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568778; cv=none; b=f5ApYc0DcuyPWkNC8JgG+7g/zIJtTAbs8lUs11iRsDaqEH0/eNpd3UCB18GPr6kpXbAOk/SDvyk0zqd+G+10bI7WUjZ0eOORDcnS8fsz88DX0SIyuqBNXLz3be6TE7/K2QJinU6uSenUT9/vrVWibvXFejaKlyD6ZYmFYhFO3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568778; c=relaxed/simple;
	bh=y3xx833U4ww9Cq3u9w34mmvk34+zHYMoUoG7ghGtgRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SZQBEP+zraJVqO8k+hxSTApT3nAdnLnmCU70JMdrWaGZ5fLXFvMNyL/Jlij/bqdUPn0D3JXJ10PXucXtp/IHzprdaLKen9JytYt2IZfu8dJG6r9CYimjK7xo+o/kmqcAwELCR6uXloNXFP3sX9kIwf3ZNGoOekQyqzdCTEq33f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=r6RtRSgk; arc=none smtp.client-ip=113.46.200.218
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S12kfcpDi3n+0LKTkd0ZeOMuD4be+hwO7l/dC6hKERM=;
	b=r6RtRSgklJXTYPLKflO27pyxFSmmCAshlJ9sm0FshpvKL/UlLPYd2FfTNtINKHoCzuTfShLyS
	LkOmzr7xxMEHmA7sCPUPICbnen8w5KxUkRZCWYkkaVaxSOG+7qe1F0UiIFaRZ9FEqLiKzBUVzBQ
	oR/081TML0omCrg301p3De4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gwgdP686WzpSvs;
	Thu,  9 Jul 2026 11:37:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6702240561;
	Thu,  9 Jul 2026 11:46:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 11:46:08 +0800
Message-ID: <5fb7a6bc-2a4b-4e91-b12d-2a1b0d3de88a@huawei.com>
Date: Thu, 9 Jul 2026 11:46:07 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
	<linuxppc-dev@lists.ozlabs.org>, Kees Cook <kees@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, <loongarch@lists.linux.dev>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, Sven Schnelle <svens@linux.ibm.com>,
	<linux-s390@vger.kernel.org>, <x86@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>, Oleg Nesterov
	<oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Russell
 King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
	<richard@nod.at>, Chris Zankel <chris@zankel.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-alpha@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <linux-um@lists.infradead.org>, Arnd Bergmann
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
 <20260707190253.816918647@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260707190253.816918647@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	TAGGED_FROM(0.00)[bounces-15657-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kernel.org
 ,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:from_mime,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74B2672C697



On 7/8/2026 3:06 AM, Thomas Gleixner wrote:
> Randomizing the syscall stack can only happen after state is established
> via enter_from_user_mode() or syscall_enter_from_user_mode(). The earlier
> it happens the better.
> 
> Provide two new macros to consolidate that:
> 
>   - enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode();
> 	add_random_kstack_offset_irqsoff();
> 
>   - syscall_enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode_randomize_stack();
> 	syscall_enter_from_user_mode_work();
>     
> to reduce boiler plate code.
> 
> Those are macros and not inline functions as the latter would limit the
> stack randomization scope to the inline function itself.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |   56 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -6,6 +6,7 @@
>  #include <linux/irq-entry-common.h>
>  #include <linux/livepatch.h>
>  #include <linux/ptrace.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/resume_user_mode.h>
>  #include <linux/seccomp.h>
>  #include <linux/sched.h>
> @@ -150,6 +151,61 @@ static __always_inline long syscall_ente
>  }
>  
>  /**
> + * enter_from_user_mode_randomize_stack - Establish state and add stack randomization
> + *					  before invoking syscall_enter_from_user_mode_work()
> + * @regs:	Pointer to currents pt_regs
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the function
> + * returns all state is correct, interrupts are still disabled and the
> + * subsequent functions can be instrumented.
> + *
> + * Implemented as a macro so that the stack randomization is effective
> + * throughout the function in which it is invoked. An inline would only make it
> + * effective in the scope of the inline function.
> + */
> +#define enter_from_user_mode_randomize_stack(regs)			\
> +do {									\
> +	enter_from_user_mode(regs);					\
> +	instrumentation_begin();					\
> +	add_random_kstack_offset_irqsoff();				\
> +	instrumentation_end();						\
> +} while (0)


Perhaps this new function can also be reused when the ARM64 is switched
to the generic entry as the irq also disabled now.

--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -64,7 +64,7 @@ static void noinstr arm64_exit_to_kernel_mode(struct
pt_regs *regs,

 static __always_inline void arm64_syscall_enter_from_user_mode(struct
pt_regs *regs)
 {
-       enter_from_user_mode(regs);
+       enter_from_user_mode_randomize_stack(regs);
        mte_disable_tco_entry(current);
        sme_enter_from_user_mode();
 }
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index e0a98fac3b85..42ac02573b66 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -6,7 +6,6 @@
 #include <linux/errno.h>
 #include <linux/nospec.h>
 #include <linux/ptrace.h>
-#include <linux/randomize_kstack.h>
 #include <linux/syscalls.h>

 #include <asm/debug-monitors.h>
@@ -42,8 +41,6 @@ static void invoke_syscall(struct pt_regs *regs,
unsigned int scno,
 {
        long ret;

-       add_random_kstack_offset();
-
        if (likely(scno < sc_nr)) {
                syscall_fn_t syscall_fn;
                syscall_fn = syscall_table[array_index_nospec(scno, sc_nr)];


> +
> +/**
> + * syscall_enter_from_user_mode_randomize_stack - Establish state and check and handle work
> + *						  before invoking a syscall
> + * @regs:	Pointer to currents pt_regs
> + * @syscall:	The syscall number
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the
> + * function returns all state is correct, interrupts are enabled and the
> + * subsequent functions can be instrumented.
> + *
> + * This is the combination of enter_from_user_mode_randomize_stack() and
> + * syscall_enter_from_user_mode_work() to be used when there is no
> + * architecture specific work to be done between the two.
> + *
> + * Returns: The original or a modified syscall number. See
> + * syscall_enter_from_user_mode_work() for further explanation.
> + *
> + * Implemented as a macro to make stack randomization effective in the calling
> + * scope.
> + */
> +#define syscall_enter_from_user_mode_randomize_stack(regs, syscall)	\
> +({									\
> +	enter_from_user_mode_randomize_stack(regs);			\
> +									\
> +	instrumentation_begin();					\
> +	local_irq_enable();						\
> +	long _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
> +	instrumentation_end();						\
> +									\
> +	_ret;								\
> +})
> +
> +/**
>   * syscall_enter_from_user_mode - Establish state and check and handle work
>   *				  before invoking a syscall
>   * @regs:	Pointer to currents pt_regs
> 


