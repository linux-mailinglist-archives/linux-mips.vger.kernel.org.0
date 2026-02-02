Return-Path: <linux-mips+bounces-13093-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI60AD/AgGl3AgMAu9opvQ
	(envelope-from <linux-mips+bounces-13093-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 16:18:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5ACE140
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 16:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03FD6301372E
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 15:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E16037475A;
	Mon,  2 Feb 2026 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="UcsB6VLP"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A913369979;
	Mon,  2 Feb 2026 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044898; cv=pass; b=a6cBmqPBQ5uN8Ka8hprJ9NrNo8rJVBVGKD8NQ6w1SfA4oQC1s55mO8RJc3++sjAK0d4tTxIS6tPBfYYN0aKT47mxDIPDuIjtN8tGWVBQVMlgRxiNjpK35V6LBslUvGfKtr2AhBtZJ1Q+tdg7XXgHMJck6y9C6J2rh9dei09s9fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044898; c=relaxed/simple;
	bh=OHwglCci930h0BPeoKnfBXI07YfnmYvkYhe1czCXm5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mB9BRlBBmS3apJpzU57zYdvoLejHXqwCAXWmdglySn9I5irv4Z2hqIu2iEBnFL6beNPRJpVd0ODY7fIC3tGW5SLnBXWscBLQJg+we6jbP90Uhmrqivg6qatFBnwjMmgxDy8cHqpIwW6o8sPmn+Q7R+PhBvXfZ/12O5C7vSJeS6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=UcsB6VLP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1770044866; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O1nsTu0Nm32KmUJcysdnX55vXY+nYlZU7sQyjU6a9F3DauNQDj5CMigQQjzvgBSMI7thc1O3L8ebT15IWw8HdV11S6fB4IzgJW2d34ZMqOq6CzZIuXEkzKU4rgIx4w9VCyK0ba//QqqlIypHPvB2GIhN7P1GoHNkiNEL58nqRlc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770044866; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dwVKuZddl4r/mV4Cr5AKUVYl+TwlSGWfy8J+FStd4oE=; 
	b=mOXtWJt14DhbwjFFy0c8WGyLFmYcsPYaTWrhOySy3mFcXQ0byxP8hleo67JuQuGF9UezmLuy8fZh8fTIE/WznemS5FoEZ4h9RHS/EEBCrQGcRAyTXZWRdzgBD5j4FB+dqTu8oqkvkm9MMc0nyxRWkTglLo71BCFvYj5W050c2fI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770044866;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=dwVKuZddl4r/mV4Cr5AKUVYl+TwlSGWfy8J+FStd4oE=;
	b=UcsB6VLPIEf1abuUYSf6DiHKcwlu9vYf7bQdmpWemlpcN0982Z971L0f6CElyGuk
	2iqGWjF95CmTb6wQAV0Fxj/KT4XUwbiO8NzZYytcAbqoRX4M40C65y3jd3XR63/UOIc
	tve2HWHJVOIxARWTGcdWj7ZlDi4NqW/S/w4VZgVA=
Received: by mx.zohomail.com with SMTPS id 1770044863450508.49955181658333;
	Mon, 2 Feb 2026 07:07:43 -0800 (PST)
Date: Mon, 2 Feb 2026 15:07:22 +0000
From: Yao Zi <me@ziyao.cc>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Work around LLVM bug when gp is used as global
 register variable
Message-ID: <aYC9qgTdhnrWQ1zg@pie>
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
	TAGGED_FROM(0.00)[bounces-13093-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	FREEMAIL_TO(0.00)[alpha.franken.de,kernel.org,gmail.com,google.com,linutronix.de];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.990];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ziyao.cc:email,ziyao.cc:dkim]
X-Rspamd-Queue-Id: 7CF5ACE140
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

Gently ping on this patch. Thanks for your time and review.

Regards,
Yao Zi

