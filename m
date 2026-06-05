Return-Path: <linux-mips+bounces-14911-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMVxEBtxImpcXQEAu9opvQ
	(envelope-from <linux-mips+bounces-14911-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 08:47:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C968D645A53
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 08:47:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=yNJbjXT2;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=NhqmnaXg;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14911-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14911-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8D143024091
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 06:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AA6408018;
	Fri,  5 Jun 2026 06:42:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F8407CDC;
	Fri,  5 Jun 2026 06:42:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641773; cv=none; b=Jkue0OgELnCFFixVacyxA54xIJc2TTUbzzU/zWYcm1z/8o1ar3kjOjKJoVTCCKl9Tm81ZHaZs54gfltw3mPsRpfEaV0r6ilX1yQdjoXcT1vTwCra0wufeUrIvXLAC1hXrcnA3wRJSCwguCfTdRtMnhJAvCUDepLRQUo1fySObWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641773; c=relaxed/simple;
	bh=eGbh8JQN2INp1KoTkB642uAUvJfBZoDnj6oV23Wz/mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcC1y6V8svnE3Kz8XTQCQw9IUmCcip4YqqV3Otay58opdMKaCwLxG2vLDZZh52LMbzaC0mr/BVk7mCAF79JgnJr7GkqC4+vnyIL5T2Ed8iUi35P63z6+LtF2FamUdCxptPJyEcz/jARjXBW5Dnf6H703i+NRNT4nEf5H5ORDsPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yNJbjXT2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NhqmnaXg; arc=none smtp.client-ip=193.142.43.55
Date: Fri, 5 Jun 2026 08:42:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780641771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGbh8JQN2INp1KoTkB642uAUvJfBZoDnj6oV23Wz/mw=;
	b=yNJbjXT2KsgESaNZCb+ZR0s/7hHIltWbF0OkKmn15qVUId++x7sElixiDzuv6mGIrZWVTE
	6rzA7uETdKlfLHb3WQjPnVbg+jTtMp1VWKytJOXkMMBXnUYbvKxUVZY7Ju+cVAZuoVQ/MG
	4A3Zcei8aelTdjoVRLpSCbAPae5D0INZuMKVcOeImlsOskrfmn73+TDueesY7m9XVLwvU8
	CoxUj4IV+PfBFMgnTfKs6p6jv6I7Ar/r7UhHpSVUNWczjhhp0RtS1yt4wYLYK0jhrVKar0
	RbygPmIhjnAm1Km6lOgw0txN4EQOtfz5UEI70rNU4DPZm7Qlm1Su7jckoyPoHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780641771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGbh8JQN2INp1KoTkB642uAUvJfBZoDnj6oV23Wz/mw=;
	b=NhqmnaXgTEnWRMyqKvCX7hQwuhr1azkjZNHcU7J90WIfcV3m9a1x8jV39S6v5uWz6j0kuG
	0hgLXUIo+RM03nCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Message-ID: <20260605064250.q0aRKkon@linutronix.de>
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14911-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jelonek.jonas@gmail.com,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:from_mime,linutronix.de:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C968D645A53

On 2026-06-04 18:24:07 [+0000], Jonas Jelonek wrote:
=E2=80=A6
> This issue popped up during kernel bump downstream in OpenWrt from
> 6.18.33 to 6.18.34, since the suspected change has been backported to
> 6.18 stable branch [1].

I would avoid the link and simply write after the backport of the patch
or so.

> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
> generic CPU-hotplug offline path (and arm64's stop handling), so RCU stops
> waiting on the parked CPUs and grace periods can still complete.

This is part of cpuhp_report_idle_dead(). Is it now invoked twice? Or is
something else missing/ different?=20

Sebastian

