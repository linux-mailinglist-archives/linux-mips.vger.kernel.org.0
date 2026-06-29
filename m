Return-Path: <linux-mips+bounces-15318-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TKr0GvGvQmrm/gkAu9opvQ
	(envelope-from <linux-mips+bounces-15318-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:48:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9C6DDDEB
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:48:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15318-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15318-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBF06303303E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 17:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264F1381AE0;
	Mon, 29 Jun 2026 17:39:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1673DA7CA;
	Mon, 29 Jun 2026 17:39:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754797; cv=none; b=h7idcP9YiiKl8TV9zBfzFU8UqlSqWxZhfytAJ6m9EtwMTJ0VSfRjzm154SGw9ZhdnJBLn7G4lzcf/ps07mN9RhkRAxFocaI5wbvEZSF9qEIlcyPepTrwlC4GOv7xgiLdAmzBLkKsDToF6vydFa7I/oVjCeYX6MP7FMEZU4E8asY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754797; c=relaxed/simple;
	bh=nX2pdBsexUM5hf5OHrK8Sn34uutzOiniDpVtW0nTXNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJsWtZr/Q0iD0YwvlnRaRvjwWYadBfeiCBW6lO72RodciV3scE2B28X+sCdJNVsylstc1p7YlT13RDCM4tVqv4ATGsCSB2wdC1618CXVNLrEq/x3LQe5aFL1x2KVmEFcY0PqXkXn0hwsJZiifdDghtINiRllN2MBF3huLEIEOKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005iX-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B4A74C013E; Mon, 29 Jun 2026 19:14:22 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:14:22 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Mingcong Bai <jeffbai@aosc.io>, Henry Chen <chenx97@aosc.io>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] MIPS: loongson64: add IRQ work based on self-IPI
Message-ID: <akKn7hHZF3wi4OLC@alpha.franken.de>
References: <20260623172728.191557-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623172728.191557-1-xry111@xry111.site>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15318-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:xry111@xry111.site,m:chenhuacai@kernel.org,m:jiaxun.yang@flygoat.com,m:jeffbai@aosc.io,m:chenx97@aosc.io,m:jiayuan.chen@linux.dev,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,xry111.site:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,alpha.franken.de:mid,alpha.franken.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62B9C6DDDEB

On Wed, Jun 24, 2026 at 01:27:21AM +0800, Xi Ruoyao wrote:
> Since the commit 91840be8f710 ("irq_work: Fix use-after-free in
> irq_work_single() on PREEMPT_RT"), we observed the performance of
> execve() is significantly impacted on MIPS.
> 
> While we are unsure how that commit caused the impact or how to improve
> it (or even if it can be improved at all), implementing IRQ work with
> self-IPI seems able to mitigate the impaction.
> 
> Perhaps this can/should be implemented for other MIPS architecture
> processors as well, but we don't have the enough knowledge of them, nor
> access to the hardware.  So only implement it for loongson64 here.
> 
> Link: https://lore.kernel.org/6be1cdd5f91dd7418a32ff372a6f3ae259b19195.camel@xry111.site/
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/include/asm/irq_work.h |  9 +++++++++
>  arch/mips/include/asm/smp.h      |  2 ++
>  arch/mips/loongson64/smp.c       | 10 ++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 arch/mips/include/asm/irq_work.h

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

