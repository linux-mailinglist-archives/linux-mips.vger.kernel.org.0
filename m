Return-Path: <linux-mips+bounces-14928-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v6QZCnJ8JmoYXQIAu9opvQ
	(envelope-from <linux-mips+bounces-14928-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 10:25:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A0654007
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 10:25:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=EGexjZ46;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=JoiMHfx9;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14928-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14928-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 356203000FC5
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 08:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E143AC0D4;
	Mon,  8 Jun 2026 08:25:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8080B2E5B2D;
	Mon,  8 Jun 2026 08:25:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907118; cv=none; b=u25F5BO18SJ3MscjGwpOpa52aTfXQoRoP2DH3vYgN04t66t6iYzcwkqazaCCQR+E8QG2dx1UB++3pV+Z7ZZdD94MOs+g9RMVxq7WpZQ7JwHxBvnv91Hx5O4kGsR+qh5TI+GkrGe61+VXI//dqp8v1gLRqNBzCW6jgFQ/CLLQwFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907118; c=relaxed/simple;
	bh=A+O6qCuhd2dO2TuKCDVzscURivdWFZIdJnQ0Tm/1R7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwVro9db5HjK5Lh7ulWrQqliVrDoYE472h774FcPGUAB2Q0bs2CiGmL7x0pdB98YgPVm8L4bcV2IG3Qg2DiqDS0jNzZc0pN6Pqk1Wv080JX3AXIFbFipmtlxFX0awFM5upw2nmFC3DwLt+ekLcfAzlds82/0Ay9V/h7cYaPiBXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EGexjZ46; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JoiMHfx9; arc=none smtp.client-ip=193.142.43.55
Date: Mon, 8 Jun 2026 10:25:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780907116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WH9gzniCtxu8RDwqTZCqbiuSRBOLX0cJ+6PjtD5RWwA=;
	b=EGexjZ46tL7eNL95pi/HJI2tXDS5BMsEGvdKKslEMuuPcq00inG2Af5eC9CN2X0WK6MLBo
	cJdB+mZGfkkrVhq2k+RArVBQnP3Z1EjK9MSpfsMG1DrH+cW3g6ewQvvosf4F2FnR5k96T7
	uFp2cDi9sE1ne887rvjquRlezTvS7DMv+vD70FO5B0Zh1cc3S32n92Tw72lL786keuHTN7
	nLh+o8q7yMzjg0a4L+O3z3sbL3uZrCFNfnOxHV6/RSY2sqJecwhMH9vBU4/Wu9Ob12BxFP
	abCPbVoLURfSIDnDzIjsetOtQlgCxiUEz/SksA7lSipPom2fJRs1XWotOdJxCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780907116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WH9gzniCtxu8RDwqTZCqbiuSRBOLX0cJ+6PjtD5RWwA=;
	b=JoiMHfx9QMO083997MzTR2FvUKQCS1y1YIG8RP6jN9cYOoaUO7u2ohLOdlff2cIwpYPsvX
	hL/oz0/IreaEtFDg==
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
Message-ID: <20260608082512.IZvuH3hJ@linutronix.de>
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
 <20260605064250.q0aRKkon@linutronix.de>
 <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
 <20260605103418.tH3rlwmO@linutronix.de>
 <153b976e-ce36-44fe-899a-01fc5877e573@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <153b976e-ce36-44fe-899a-01fc5877e573@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-14928-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:from_mime,linutronix.de:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B69A0654007

On 2026-06-05 13:12:38 [+0200], Jonas Jelonek wrote:
> Hi,
Hi,

> On 05.06.26 12:34, Sebastian Andrzej Siewior wrote:
> > Does 
> > 	echo 0 > /sys/devices/system/cpu/cpu1/online
> >
> > lead to the same problem?
> 
> Funny, my device doesn't have this 'online' file, neither for the
> other CPUs. So it seems this CPU hotplug isn't supported/used here?
> Or am I missing a Kconfig option for that?
> 
> I'm working on a Realtek RTL931x SoC here, it has MIPS interAptiv
> cores. I can provide more information if needed.

looking at this again it sort of makes sense. The arm64 case is an
exception - not the default. It appears on mips it is the default
shutdown action and probably reboot.
I would have to take another look if mips is really the only arch doing
this or if other are affected, too.
No objections from my side. If you could update the commit message
noting that arm64 is not the default but an exception (the CPU was
going online and is aborting) and that MIPS shutdowns all CPUs but does
not use CPU-hotplug mechanism for doing so.

> Best,
> Jonas

Sebastian

