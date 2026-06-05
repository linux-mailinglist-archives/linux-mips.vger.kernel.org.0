Return-Path: <linux-mips+bounces-14918-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k6QvAdaoImqnbgEAu9opvQ
	(envelope-from <linux-mips+bounces-14918-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 12:45:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F292064777A
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 12:45:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=EmzbRT9M;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=vIqlNdMd;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14918-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14918-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 208413083EB9
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 10:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB254183B4;
	Fri,  5 Jun 2026 10:34:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C1641360A;
	Fri,  5 Jun 2026 10:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655662; cv=none; b=iCB2XDjKtHmJG0et7/0gNrzJFimACyWtsBctQl3sRTrvEGInvk84yYkFvDRhQAT+kLfeYmRgBKLmKa8kVGivSE8HlS/OReq5ncJVyHuUyNpu6Y2A26bVFxZx+XJjMVUiJ/MkeUjWfT43XcTfZg/+y8LhbUkeKeCnE1aoxZz7BIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655662; c=relaxed/simple;
	bh=/QBL8Rrtj3/ANIhn2T/9EgMK8vC9kj8pb5ccU6UveZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBfjxtSLLXPclnkPEx1CqVIDu3zSFyGxXIkAAJ2ME0f/Ro0UetVqFZs+5hoGhTV+DZB004TxtC0Oj7AeOwddmoI0EqTuMXhBvdfvHeC428aoxIdDlzaxgV9wV7f4VM6NDpZjLrSIv5K3YJK+nuVqQ0IH+M1F7OYBuPkk5UtQUjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EmzbRT9M; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vIqlNdMd; arc=none smtp.client-ip=193.142.43.55
Date: Fri, 5 Jun 2026 12:34:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780655660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coz5Aq1MFuTl4CmPGM62Pax2a8nLKkK++EZHbMRVyss=;
	b=EmzbRT9Mm4e2ql6Oj5DfMtLB+PFBJu0R8GIq2m6z4Fc2zgC5JYViicPLmY5oMGcfBNzvFl
	F3OWTQs2beg8lC6MCZzzbKpwR3ikf0dI2gXBPqH2m2NWtDuTqaDvjG/qI/b2xIzctc4aAS
	XUudb6NwQq9l3OKaMRUDKUHpeXjLPgCD68eU456QHUmZII+XUQSLDe7pottJ1XfH3U2SaI
	wRpfOmJPMgNTsVbk5qOUXtBkXtvbw+QvHA4C8tEj81/cKRtwkcWFfb39ch0LwYppUpT8A8
	o5zMmY0zVAuGJ+ybqU1Bf3Kdg/jeWSW+0tUYoNg7BRRb1dvB2jpAIslD5h40rQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780655660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coz5Aq1MFuTl4CmPGM62Pax2a8nLKkK++EZHbMRVyss=;
	b=vIqlNdMdL3j6GgLjDN+1ji+hIacjZZSG6YSKCk30pxhEKI2RR8KTjCx++OUY9IidbNu4RX
	GDIxG24sNlBqUmBg==
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
Message-ID: <20260605103418.tH3rlwmO@linutronix.de>
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
 <20260605064250.q0aRKkon@linutronix.de>
 <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14918-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:from_mime,linutronix.de:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F292064777A

On 2026-06-05 09:12:09 [+0200], Jonas Jelonek wrote:
> Hi Sebastian,
Hi,

> >> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
> >> generic CPU-hotplug offline path (and arm64's stop handling), so RCU stops
> >> waiting on the parked CPUs and grace periods can still complete.
> > This is part of cpuhp_report_idle_dead(). Is it now invoked twice? Or is
> > something else missing/ different? 
> 
> Those seem to be two different paths. To be honest I'm not confident
> under which circumstances which of those paths is used to take down
> a CPU. In my case, issuing a reboot command reaches smp_send_stop()
> where the issue explained in the patch message then happens.
> 

Does 
	echo 0 > /sys/devices/system/cpu/cpu1/online

lead to the same problem?

I missed that arm64 has also this but only if the online path fails kind
of early, see
	04e613ded8c26 ("arm64: smp: Tell RCU about CPUs that fail to come online")

so this not the "normal" case but an exception. Mips seems to be doing
something different here. I am not sure if this is the only thing that
is missing.

> Best,
> Jonas

Sebastian

