Return-Path: <linux-mips+bounces-15177-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +uTCGtZ2O2pVYQgAu9opvQ
	(envelope-from <linux-mips+bounces-15177-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 08:19:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D15096BBB89
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 08:19:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=RbqnWZGg;
	dkim=pass header.d=linutronix.de header.s=2020e header.b="A3o/2qr5";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15177-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15177-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7123301B4EC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 06:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842F431F998;
	Wed, 24 Jun 2026 06:18:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2331C5F27;
	Wed, 24 Jun 2026 06:18:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281939; cv=none; b=nL6Oi/2r8Rx7ra/9wXdj8F+3Fv65RI/5FJ+S5foHqsXitnlJHZuU8A5M3hNXDmzijz5tb1No7LQ4wmVFcIV8XSr1dOIdHmnmq78JrunBtrXl2VJPp07VBdFn1WoLjVlRWO0R9LoPvLmmuRVhBnfJf2ApTVjZyo8g0w2Rco0aSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281939; c=relaxed/simple;
	bh=eC4lfErW+pR+pmA2pRiyG8E+5zceic1+1XV2r3gfocI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN4Z0HZc3GbKD+4mHcfjJ/CvJhK9YWIAtOcbJXvOZfAks6iCx1BhGIWBrG+ZhUua2E0evKWafZKzDmenli7WIkmdOmSdBbx2GF4Lyy+G/Dqy7Qd5Wy960iQITCGzBZs8GzQ4FIPIeEc6NcODe2k9F+trDQS1EBhGHH2C0wfM93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RbqnWZGg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A3o/2qr5; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 24 Jun 2026 08:18:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782281930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uadqRAI2LngWZ5a6Pld4O97ztBIDaJnPvhfMToZjyag=;
	b=RbqnWZGgDz7b37XGb/YS6kRSATRZUMu7oEpxmNoY/LTxohVvqTa2jkGFZnmtyRi7da6L+D
	byIh800LSqoL8xEgGgi3Ds/ICvQL6zBXXcXlb9ZSJegftALReg4SoNajutV9Qs6aRGRcmz
	iIeKkGplXcAh4/usUSH+NNCvkWWWAZLLAisqRMevxdIqUepH8Nz3FfpdblNavtnU8Bme30
	WsQcQEr0DhAH13dY8eCYhnLlWBKkbDC0KGrD7PnqSnOroEkR3KnEIdOD8hiMWxcZTqtJNY
	LfTjuJDYD6zywanjTuiQpXVhRk9VEsp2ZzJ9iuePRMwP3fyZZLuJS9CM02gxYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782281930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uadqRAI2LngWZ5a6Pld4O97ztBIDaJnPvhfMToZjyag=;
	b=A3o/2qr517AlyeH6REsGBIwqETSY6/6SB36VagU0oYlAPV8fcYkDm+4iL7qCCJqZhNDqlM
	J8j7QUV5fq5RjYBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Mingcong Bai <jeffbai@aosc.io>, Henry Chen <chenx97@aosc.io>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] MIPS: loongson64: add IRQ work based on self-IPI
Message-ID: <20260624061848.DKue8khU@linutronix.de>
References: <20260623172728.191557-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260623172728.191557-1-xry111@xry111.site>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xry111@xry111.site,m:tsbogend@alpha.franken.de,m:chenhuacai@kernel.org,m:jiaxun.yang@flygoat.com,m:jeffbai@aosc.io,m:chenx97@aosc.io,m:jiayuan.chen@linux.dev,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-15177-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,linutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D15096BBB89

On 2026-06-24 01:27:21 [+0800], Xi Ruoyao wrote:
> Since the commit 91840be8f710 ("irq_work: Fix use-after-free in
> irq_work_single() on PREEMPT_RT"), we observed the performance of
> execve() is significantly impacted on MIPS.
>=20
> While we are unsure how that commit caused the impact or how to improve
> it (or even if it can be improved at all), implementing IRQ work with
> self-IPI seems able to mitigate the impaction.

I suspect mm_struct::mm_cid.irq_work.
That IPI ensures that after irq_work_sync() returns the enqueued
irq_work can be freed.=20

> Perhaps this can/should be implemented for other MIPS architecture
> processors as well, but we don't have the enough knowledge of them, nor
> access to the hardware.  So only implement it for loongson64 here.

I have half done bits for cavium and need to finish it=E2=80=A6

> Link: https://lore.kernel.org/6be1cdd5f91dd7418a32ff372a6f3ae259b19195.ca=
mel@xry111.site/
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

