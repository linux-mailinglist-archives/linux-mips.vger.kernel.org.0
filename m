Return-Path: <linux-mips+bounces-13138-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KArFDfLeiWnGCwAAu9opvQ
	(envelope-from <linux-mips+bounces-13138-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 09 Feb 2026 14:19:46 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F39710F920
	for <lists+linux-mips@lfdr.de>; Mon, 09 Feb 2026 14:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97ABE3002E3E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Feb 2026 11:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF07372B4F;
	Mon,  9 Feb 2026 11:59:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F05126C03;
	Mon,  9 Feb 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638397; cv=none; b=mYaDynrE6ULtM6TOeVn+4bvq7rYsaZDNrTCTSYwAB1mkKamyC1GMdW+GxNyGpHmbdlPYd3jo8KBY7l/U8DSdnFmVd6a9yDGPPQjdUZdd/eqP2snKxElTNhgIKxME1JVNhgCMaIRoxDHD9O8NbvUmsVZ5jXPVqNI2B2vdXcJb/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638397; c=relaxed/simple;
	bh=THx9QLDF/GuC2A68C+XYDjXLd4w3dDHsu4Q3mjHNMUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaclSeELmdQg4Js5VEIu3e+RQHdnAEg3bjZgZIXFgFqUeNwsMfLfQ1FX9At2QBauNzfa41O3m9zCUA11lhWjgPb/DlZJE2J5b4wL19ZPOO6yKAmsZ5aXOzlDjgalw0OnrXXIj0xLU72emTfEfMGqHFN8gemHr4T3PRbGBGOWGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vpPvg-0007A0-00; Mon, 09 Feb 2026 12:59:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F316DC0113; Mon,  9 Feb 2026 12:58:50 +0100 (CET)
Date: Mon, 9 Feb 2026 12:58:50 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yao Zi <me@ziyao.cc>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Work around LLVM bug when gp is used as global
 register variable
Message-ID: <aYnL-pRhrfqO0X5x@alpha.franken.de>
References: <20260205155644.34421-1-me@ziyao.cc>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205155644.34421-1-me@ziyao.cc>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13138-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,ziyao.cc:email,gnu.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F39710F920
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 03:56:44PM +0000, Yao Zi wrote:
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
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changed from v1:
> - Include a link to LLVM upstream issue in comment
> - Collect tags
> - Link to v1: https://lore.kernel.org/linux-mips/20260118090235.60670-1-me@ziyao.cc/
> 
>  arch/mips/kernel/relocate.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

