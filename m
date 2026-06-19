Return-Path: <linux-mips+bounces-15147-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qHYjKl7zNGrwkwYAu9opvQ
	(envelope-from <linux-mips+bounces-15147-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 09:44:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 151976A46A6
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 09:44:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=zSb2XjRC;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=7KO1kUXw;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15147-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15147-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30DFA30297A9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 07:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EB2335BDB;
	Fri, 19 Jun 2026 07:43:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2889340A6C;
	Fri, 19 Jun 2026 07:43:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855008; cv=none; b=pps1gzGVbtBki1kAmDzebHvO3dvbmmSnLuWcESUfZE87OqV5hZYrL3dVjIgph5YL5G+ULRkzryZDoCM/YfcRngIlxFRmQ6fRJ/fmlF97df2yv2tAXrm/6MVLn3Ohwc+X5vh0BOFXzGKBeUDeyPxr0KJ/yrZXHtVyHKF7oH6g1QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855008; c=relaxed/simple;
	bh=iMrkouWV4Vkl5zyDFKwkEBcCpHxqGEkF4SfZCqIiz6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B891EIYBWRxLb96ZqKGIJb/ujEplANYYqDZswCAl6GK7tBSW92mbpgGgm+KN7WAeowCEYGOi4uAu/ft2bg3v5EEf2edcsDtlrko6OcfgKWy3XCfUZDr+Q6G8QwGMTjlQxBzjLpr/jXqdmt/N3lChdpd3FUGEovU1fr28NAHZINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zSb2XjRC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7KO1kUXw; arc=none smtp.client-ip=193.142.43.55
Date: Fri, 19 Jun 2026 09:43:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781855005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMrkouWV4Vkl5zyDFKwkEBcCpHxqGEkF4SfZCqIiz6c=;
	b=zSb2XjRCgbH/Jvy1eAV3AaNMiMOMOq9MV/+YaZgDCddUMPYIYyC+2+qpKYhPp9Wjb4nY50
	EbB3HkZIhMWa0/rXyfHjs8rySUW5Bx0NabApnV2t37hXdqFlBwrV47aN2kfTS1PdZcUHkh
	4kMepEnFgTC2JCYvF2q/cqimoaHK5wmDutGQuBIchlKHlsV5c5Y2fZjJBSkfOBnmsP7bes
	r5Uh8oXqynz7ckhCW0Dx+HABNhz2LCaGHHjO/Gx83eIX+mJTKpSvixKEGSi8xJluNElNBE
	9nIYMAcrx613bo1pAcd6TkPNz2QZTtA4o4yxy/W9h8RF2bjR4MXI40w/bsL/NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781855005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMrkouWV4Vkl5zyDFKwkEBcCpHxqGEkF4SfZCqIiz6c=;
	b=7KO1kUXwKqKRgLgQiQzVdKOoirGupUKLzI3yJv6pyDAwiJbgAaOXkJ4lmoSlpDdtTJZahB
	3ugjQufabERtVNDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Message-ID: <20260619074323.IIq-0qan@linutronix.de>
References: <20260608093729.12111-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260608093729.12111-1-jelonek.jonas@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15147-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jelonek.jonas@gmail.com,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,linutronix.de:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 151976A46A6

On 2026-06-08 09:37:29 [+0000], Jonas Jelonek wrote:
> smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
> marks the CPU offline for the scheduler via set_cpu_online(false) but
> never informs RCU, so RCU keeps expecting a quiescent state from CPUs
> that are now spinning forever with interrupts disabled.
=E2=80=A6
>=20
> Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() o=
n PREEMPT_RT")
> CC: stable@vger.kernel.org
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

Sorry for being late.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

