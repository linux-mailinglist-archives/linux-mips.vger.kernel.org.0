Return-Path: <linux-mips+bounces-13098-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sj9fAdZzgWnLGQMAu9opvQ
	(envelope-from <linux-mips+bounces-13098-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 05:04:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72599D4463
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 05:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49AB830234E3
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 04:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E61239E65;
	Tue,  3 Feb 2026 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Y5SfD9i1"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293632A1B2;
	Tue,  3 Feb 2026 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770091474; cv=pass; b=p/tyWII1B/3a/jU/VV/zEgC8ue2Ia8AdIwmlPFJN5q6eb7qt/60kq+/UIZwBX5vgFaPwmxcm5sos95H0kFL33VfTNkYQ4cwCrSiqvJnoPdsoX0e3Dp3Dwhu2O5QZYE8N/VxglJ5mqD1/QNyqwmGld3eHd4EWzW4pP/0CPjZ1dTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770091474; c=relaxed/simple;
	bh=1eIJCnwpG3fEI13IN5/UWVlQu67xDoqAtLU5dZDOjCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxSKPQM0EvVqg92LO7om8LmvZSDbjJ5YZZZb736z+xPb3n6uLs6O2VGNpepODjvJySaEfrkpiJ923CDuGOWdCsxlT29R6h7CDs80yY1jC1A03b7h4oGCjIoS5nhPmYuvNYxSSSoaYrYsIHyQLxt2LIc79vg27URZWL1bPr90vPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Y5SfD9i1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1770091447; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LH2Oa70oPB3xIqfvi7hmqNWuxhnkznFdqMVeQB1orN6rMax+y1hFv/mg0ZEogV8+JiBSw/OV4hXyeuSUw+s9FPCZHp0j4xiHScTkJLdTROmZ6nQ8mU2rJ8Us65y/g1BOfnTzhpk6d4dvDrMk1MdJ87Voua9+TALlFSGBv2pXCYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770091447; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HqjrzV9VLiYP7Os7B9pW1XVgOX/Y/ejuRgPMFQPKpl8=; 
	b=bGZubk6kvoGkz2yLVxBcd6FG0IKMSsEGCsfb/x5LnecdSjM15qP43T4ig2c7gwXxNySQaf6O1qqh0LUzj9MLz04WiR7cenKEnogdQ2msWcGRP8Yg4R6bCrLplV7TWsBcQqCNtcBPiQBSL3L7LnoYsFGjMNbP3MWjXwedppL/Apo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770091447;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=HqjrzV9VLiYP7Os7B9pW1XVgOX/Y/ejuRgPMFQPKpl8=;
	b=Y5SfD9i1OhbW0ZTJJ+R8k4OHsd5pFP/6fvSFNmttGkKvVx8FhKeUHxyacpB5S4aX
	SF/naeMZEd4nXTEE2xe/YpfuZphA+ZiqPCvNm1i6DyRsxGxanS6xh6JQAGUiANJ2LJi
	ynKAn4bM79qtueYKAxmsCU1c+Z8k5rm+JMetkKC4=
Received: by mx.zohomail.com with SMTPS id 1770091444163640.562144038487;
	Mon, 2 Feb 2026 20:04:04 -0800 (PST)
Date: Tue, 3 Feb 2026 04:03:58 +0000
From: Yao Zi <me@ziyao.cc>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Work around LLVM bug when gp is used as global
 register variable
Message-ID: <aYFzrjOV91rBUEB4@pie>
References: <20260118090235.60670-1-me@ziyao.cc>
 <20260202232309.GA1070900@ax162>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202232309.GA1070900@ax162>
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.34 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email,ziyao.cc:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13098-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmail.com,google.com,linutronix.de,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.577];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gnu.org:url,ziyao.cc:email,ziyao.cc:dkim]
X-Rspamd-Queue-Id: 72599D4463
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 02, 2026 at 04:23:09PM -0700, Nathan Chancellor wrote:
> On Sun, Jan 18, 2026 at 09:02:35AM +0000, Yao Zi wrote:
> > On MIPS, __current_thread_info is defined as global register variable
> > locating in $gp, and is simply assigned with new address during kernel
> > relocation.
> > 
> > This however is broken with LLVM, which always restores $gp if it finds
> > $gp is clobbered in any form, including when intentionally through a
> > global register variable. This is against GCC's documentation[1], which
> > requires a callee-saved register used as global register variable not to
> > be restored if it's clobbered.
> > 
> > As a result, $gp will continue to point to the unrelocated kernel after
> > the epilog of relocate_kernel(), leading to an early crash in init_idle,
> > 
> > [    0.000000] CPU 0 Unable to handle kernel paging request at virtual address 0000000000000000, epc == ffffffff81afada8, ra == ffffffff81afad90
> > [    0.000000] Oops[#1]:
> > [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W           6.19.0-rc5-00262-gd3eeb99bbc99-dirty #188 VOLUNTARY
> > [    0.000000] Tainted: [W]=WARN
> > [    0.000000] Hardware name: loongson,loongson64v-4core-virtio
> > [    0.000000] $ 0   : 0000000000000000 0000000000000000 0000000000000001 0000000000000000
> > [    0.000000] $ 4   : ffffffff80b80ec0 ffffffff80b53d48 0000000000000000 00000000000f4240
> > [    0.000000] $ 8   : 0000000000000100 ffffffff81d82f80 ffffffff81d82f80 0000000000000001
> > [    0.000000] $12   : 0000000000000000 ffffffff81776f58 00000000000005da 0000000000000002
> > [    0.000000] $16   : ffffffff80b80e40 0000000000000000 ffffffff80b81614 9800000005dfbe80
> > [    0.000000] $20   : 00000000540000e0 ffffffff81980000 0000000000000000 ffffffff80f81c80
> > [    0.000000] $24   : 0000000000000a26 ffffffff8114fb90
> > [    0.000000] $28   : ffffffff80b50000 ffffffff80b53d40 0000000000000000 ffffffff81afad90
> > [    0.000000] Hi    : 0000000000000000
> > [    0.000000] Lo    : 0000000000000000
> > [    0.000000] epc   : ffffffff81afada8 init_idle+0x130/0x270
> > [    0.000000] ra    : ffffffff81afad90 init_idle+0x118/0x270
> > [    0.000000] Status: 540000e2	KX SX UX KERNEL EXL
> > [    0.000000] Cause : 00000008 (ExcCode 02)
> > [    0.000000] BadVA : 0000000000000000
> > [    0.000000] PrId  : 00006305 (ICT Loongson-3)
> > [    0.000000] Process swapper (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
> > [    0.000000] Stack : 9800000005dfbf00 ffffffff8178e950 0000000000000000 0000000000000000
> > [    0.000000]         0000000000000000 ffffffff81970000 000000000000003f ffffffff810a6528
> > [    0.000000]         0000000000000001 9800000005dfbe80 9800000005dfbf00 ffffffff81980000
> > [    0.000000]         ffffffff810a6450 ffffffff81afb6c0 0000000000000000 ffffffff810a2258
> > [    0.000000]         ffffffff81d82ec8 ffffffff8198d010 ffffffff81b67e80 ffffffff8197dd98
> > [    0.000000]         ffffffff81d81c80 ffffffff81930000 0000000000000040 0000000000000000
> > [    0.000000]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [    0.000000]         0000000000000000 000000000000009e ffffffff9fc01000 0000000000000000
> > [    0.000000]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [    0.000000]         0000000000000000 ffffffff81ae86dc ffffffff81b3c741 0000000000000002
> > [    0.000000]         ...
> > [    0.000000] Call Trace:
> > [    0.000000] [<ffffffff81afada8>] init_idle+0x130/0x270
> > [    0.000000] [<ffffffff81afb6c0>] sched_init+0x5c8/0x6c0
> > [    0.000000] [<ffffffff81ae86dc>] start_kernel+0x27c/0x7a8
> > 
> > This bug has been reported to LLVM[2] and affects version from (at
> > least) 18 to 21. Let's work around this by using inline assembly to
> > assign $gp before a fix is widely available.
> > 
> > Cc: stable@vger.kernel.org
> > Link: https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Global-Register-Variables.html # [1]
> > Link: https://github.com/llvm/llvm-project/issues/176546 # [2]
> > Signed-off-by: Yao Zi <me@ziyao.cc>
> 
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> 
> Hopefully the MIPS LLVM folks can look into this (even though I think
> the MIPS backend is one of the less maintained backends in LLVM).

Sigh...

> > ---
> >  arch/mips/kernel/relocate.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> > index 7f1c136ad850..12aa0bbdd65e 100644
> > --- a/arch/mips/kernel/relocate.c
> > +++ b/arch/mips/kernel/relocate.c
> > @@ -420,7 +420,18 @@ void *__init relocate_kernel(void)
> >  			goto out;
> >  
> >  		/* The current thread is now within the relocated image */
> > +#ifndef CONFIG_CC_IS_CLANG
> 
> I find
> 
>   #ifdef FOO
>   <FOO block>
>   #else
>   <!FOO block>
>   #endif
> 
> to be easier to read and process
> 
>   #ifndef FOO
>   <!FOO block>
>   #else
>   <FOO block>
>   #endif
> 
> but maybe that it is just personal preference.

I preferred to put Clang's workaround later, since

> >  		__current_thread_info = RELOCATED(&init_thread_union);

this simple assignment is easier to read and more clear than the inline
assembly, and matching the comment

	/* The current thread is now within the relocated image */

better. But yes, this is basically a personal preference, and I'm happy
with both. Please tell me if you do prefer the other.

> > +#else
> > +		/*
> > +		 * LLVM may wrongly restore $gp ($28) in epilog even if it's
> > +		 * intentionally modified. Work around this by using inline
> > +		 * assembly to assign $gp. $gp couldn't be listed as output or
> > +		 * clobber, or LLVM will still restore its original value.
> 
> This comment should likely include a link to the LLVM upstream report to
> make it easier to version restrict this workaround when fixed in the
> future.

Sure, will do it in v2. Thanks for the feedback!

Best regards,
Yao Zi

