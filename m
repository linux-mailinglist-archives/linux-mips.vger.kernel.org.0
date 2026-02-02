Return-Path: <linux-mips+bounces-13095-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LM4LsszgWlQEwMAu9opvQ
	(envelope-from <linux-mips+bounces-13095-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 00:31:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3FD2A77
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 00:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5597E3012C41
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 23:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3931235FF7A;
	Mon,  2 Feb 2026 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc6Yd/dk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D52E1743;
	Mon,  2 Feb 2026 23:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770074594; cv=none; b=KD29Op9d7YE4DCyFlL/DDDUdUgohsaGBgwGIi+8zHvt1txz1cd9FOrAUE9GkfIzndy1EJnMcttxhj7tlQqRT4BvdMk2me52JwCkYyPY7XWJpH9aoWHX9XjH3qDbMSlMN4lsPQpqZq3509ac72A3+iV75TKsuV1mjB6r/rwlHUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770074594; c=relaxed/simple;
	bh=pJj3uilHcFmYjhffhaNW/o34MHDbJfjpInJy5q6AfY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I01snol4DPNb8KKEjew2+b/YHGYNJQ1atgKDIGu3GFja5YvEGGHqLOKz9BOUWGy4a7QyMR2mkSM478oz84BDEh6WSTA5qFHDpmKHr1UvHA6+13P54m69nLZ9WBaQXI0bsiiCKISOMYYRBAEK9R7Pk09HCCgdnDksDrLID7yGI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc6Yd/dk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D78C116C6;
	Mon,  2 Feb 2026 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770074593;
	bh=pJj3uilHcFmYjhffhaNW/o34MHDbJfjpInJy5q6AfY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc6Yd/dkgb6053lGwRI1bzs1p5tAEzlcFyJ8/80INF9/aCkeVlRv+Oz/lxOWHS9ns
	 EXd2XZ3t1teNTV6Zt54mO/fzQBaN7AgBuseFgK0vqwPwrkG8Gou3zT3yjDzpxB9a9I
	 SGKbbb4W8QpizN5wrnn8VAZnLuqaBT6kfDdm8ZMbasIBIEPOJck0oVoj9qGh2vE/rU
	 zxL3+EhBYj9E59CyYbmO4U3hOzoFNwWMSfJN9/tgF3qfWZTfvSDoMx4e/j87SnJYOY
	 ipM7XklyhKQIb2hpb8dNbkQKDXe54QOQUIFAlqXWI6SqUTafryNYEJHixuz+88z+vE
	 zkpOvlQea323g==
Date: Mon, 2 Feb 2026 16:23:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Work around LLVM bug when gp is used as global
 register variable
Message-ID: <20260202232309.GA1070900@ax162>
References: <20260118090235.60670-1-me@ziyao.cc>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118090235.60670-1-me@ziyao.cc>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.34 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13095-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmail.com,google.com,linutronix.de,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.424];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziyao.cc:email]
X-Rspamd-Queue-Id: 2AF3FD2A77
X-Rspamd-Action: add header
X-Spam: Yes

On Sun, Jan 18, 2026 at 09:02:35AM +0000, Yao Zi wrote:
> On MIPS, __current_thread_info is defined as global register variable
> locating in $gp, and is simply assigned with new address during kernel
> relocation.
> 
> This however is broken with LLVM, which always restores $gp if it finds
> $gp is clobbered in any form, including when intentionally through a
> global register variable. This is against GCC's documentation[1], which
> requires a callee-saved register used as global register variable not to
> be restored if it's clobbered.
> 
> As a result, $gp will continue to point to the unrelocated kernel after
> the epilog of relocate_kernel(), leading to an early crash in init_idle,
> 
> [    0.000000] CPU 0 Unable to handle kernel paging request at virtual address 0000000000000000, epc == ffffffff81afada8, ra == ffffffff81afad90
> [    0.000000] Oops[#1]:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W           6.19.0-rc5-00262-gd3eeb99bbc99-dirty #188 VOLUNTARY
> [    0.000000] Tainted: [W]=WARN
> [    0.000000] Hardware name: loongson,loongson64v-4core-virtio
> [    0.000000] $ 0   : 0000000000000000 0000000000000000 0000000000000001 0000000000000000
> [    0.000000] $ 4   : ffffffff80b80ec0 ffffffff80b53d48 0000000000000000 00000000000f4240
> [    0.000000] $ 8   : 0000000000000100 ffffffff81d82f80 ffffffff81d82f80 0000000000000001
> [    0.000000] $12   : 0000000000000000 ffffffff81776f58 00000000000005da 0000000000000002
> [    0.000000] $16   : ffffffff80b80e40 0000000000000000 ffffffff80b81614 9800000005dfbe80
> [    0.000000] $20   : 00000000540000e0 ffffffff81980000 0000000000000000 ffffffff80f81c80
> [    0.000000] $24   : 0000000000000a26 ffffffff8114fb90
> [    0.000000] $28   : ffffffff80b50000 ffffffff80b53d40 0000000000000000 ffffffff81afad90
> [    0.000000] Hi    : 0000000000000000
> [    0.000000] Lo    : 0000000000000000
> [    0.000000] epc   : ffffffff81afada8 init_idle+0x130/0x270
> [    0.000000] ra    : ffffffff81afad90 init_idle+0x118/0x270
> [    0.000000] Status: 540000e2	KX SX UX KERNEL EXL
> [    0.000000] Cause : 00000008 (ExcCode 02)
> [    0.000000] BadVA : 0000000000000000
> [    0.000000] PrId  : 00006305 (ICT Loongson-3)
> [    0.000000] Process swapper (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
> [    0.000000] Stack : 9800000005dfbf00 ffffffff8178e950 0000000000000000 0000000000000000
> [    0.000000]         0000000000000000 ffffffff81970000 000000000000003f ffffffff810a6528
> [    0.000000]         0000000000000001 9800000005dfbe80 9800000005dfbf00 ffffffff81980000
> [    0.000000]         ffffffff810a6450 ffffffff81afb6c0 0000000000000000 ffffffff810a2258
> [    0.000000]         ffffffff81d82ec8 ffffffff8198d010 ffffffff81b67e80 ffffffff8197dd98
> [    0.000000]         ffffffff81d81c80 ffffffff81930000 0000000000000040 0000000000000000
> [    0.000000]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    0.000000]         0000000000000000 000000000000009e ffffffff9fc01000 0000000000000000
> [    0.000000]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    0.000000]         0000000000000000 ffffffff81ae86dc ffffffff81b3c741 0000000000000002
> [    0.000000]         ...
> [    0.000000] Call Trace:
> [    0.000000] [<ffffffff81afada8>] init_idle+0x130/0x270
> [    0.000000] [<ffffffff81afb6c0>] sched_init+0x5c8/0x6c0
> [    0.000000] [<ffffffff81ae86dc>] start_kernel+0x27c/0x7a8
> 
> This bug has been reported to LLVM[2] and affects version from (at
> least) 18 to 21. Let's work around this by using inline assembly to
> assign $gp before a fix is widely available.
> 
> Cc: stable@vger.kernel.org
> Link: https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Global-Register-Variables.html # [1]
> Link: https://github.com/llvm/llvm-project/issues/176546 # [2]
> Signed-off-by: Yao Zi <me@ziyao.cc>

Acked-by: Nathan Chancellor <nathan@kernel.org>

Hopefully the MIPS LLVM folks can look into this (even though I think
the MIPS backend is one of the less maintained backends in LLVM).

> ---
>  arch/mips/kernel/relocate.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> index 7f1c136ad850..12aa0bbdd65e 100644
> --- a/arch/mips/kernel/relocate.c
> +++ b/arch/mips/kernel/relocate.c
> @@ -420,7 +420,18 @@ void *__init relocate_kernel(void)
>  			goto out;
>  
>  		/* The current thread is now within the relocated image */
> +#ifndef CONFIG_CC_IS_CLANG

I find

  #ifdef FOO
  <FOO block>
  #else
  <!FOO block>
  #endif

to be easier to read and process

  #ifndef FOO
  <!FOO block>
  #else
  <FOO block>
  #endif

but maybe that it is just personal preference.

>  		__current_thread_info = RELOCATED(&init_thread_union);
> +#else
> +		/*
> +		 * LLVM may wrongly restore $gp ($28) in epilog even if it's
> +		 * intentionally modified. Work around this by using inline
> +		 * assembly to assign $gp. $gp couldn't be listed as output or
> +		 * clobber, or LLVM will still restore its original value.

This comment should likely include a link to the LLVM upstream report to
make it easier to version restrict this workaround when fixed in the
future.

> +		 */
> +		asm volatile("move $28, %0" : :
> +			     "r" (RELOCATED(&init_thread_union)));
> +#endif
>  
>  		/* Return the new kernel's entry point */
>  		kernel_entry = RELOCATED(start_kernel);
> -- 
> 2.52.0
> 

