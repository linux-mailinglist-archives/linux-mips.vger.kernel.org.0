Return-Path: <linux-mips+bounces-14461-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN7aFCYM+mlsIgMAu9opvQ
	(envelope-from <linux-mips+bounces-14461-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 17:26:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E64D02DD
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 17:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F17883021981
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 15:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B2F481A9E;
	Tue,  5 May 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dFaMV31s";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L2aw2Zot"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C6481A8A;
	Tue,  5 May 2026 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994694; cv=none; b=jaNR27C4eyW3GsB0PZqwEq1DIg9eJp875wqZP+lyUKPuxNjFOkSJn6qthA6wHekr2kEp0O9XwSEWcYndFWUTl/zxYs9odXBfZI1artLXyugzNhn5IWzIyL8z8xadperuW5LjLZo9RkhpPmNVfzbjgCrxhOor41V8QoI/Apnf9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994694; c=relaxed/simple;
	bh=qyDsF/CYpmZkTHyifHkq1srUgH9LMdjQf1B9zIPZJ/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7TuXOMql9cq48GAkuRKu2eB8b5YH4X4d3ATvgf6W8uraiqAGZ3jPME2UWvjrDiqWYnJLkxv+ZnwW6dMXeubWXynDtT3a5LxfJyjvbABga6p23HPwKcM69J7i2LY7rlTj9sZOrPDBPGd/UYbppoQkTAfZ6vlji0y0JW4v4y63cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dFaMV31s; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L2aw2Zot; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 5 May 2026 17:24:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777994691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8FZBE8TH1/iw3jId7co6nmjfxfUWbo4MAyogmXOk/g=;
	b=dFaMV31s43ygN7aOb2sBx3LMPqs3Dul1jMarSHLN0R4ksmd8hoSfj7jEJbhC7m26sco9Vl
	pR0fJrOCOOT4A88FOgpaPu+5J6GF5NwJYc78zQ4erXdOuGdSy/ElxG4+NAtBbYsokiiSLu
	35JeNR6v3AR++kqkb0tRiqUY4fZwR9MQR48/XK95RCyk9GHI5yc+ixvcS9yI5d5bR0QHpr
	X6Ug00bq4bIhx5xA8DUiRQBmzN597ogFmc/ro0o++ZQByv6p8W4/Ba7HFrEH4msoWpnHcE
	BgAnM4sEEwaMTuJjD1ZwMoXbYXSlZ/usjEWgLlLRfkEc3rKGhF2tfDu2S2bJkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777994691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8FZBE8TH1/iw3jId7co6nmjfxfUWbo4MAyogmXOk/g=;
	b=L2aw2ZotYeeCXBQNqjfqux8BiGSdPWl8iTaEiPstaTjTdESw76GF8cVuZxwqO0eDwgcvOz
	NwEuEiw0W8sWV3Dg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
Message-ID: <20260505152450.1KYVS2pr@linutronix.de>
References: <20260127135334.qUEaYP9G@linutronix.de>
 <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk>
 <20260127165430.7ui_LGkg@linutronix.de>
 <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
 <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk>
 <20260505072954.Ov2t-FGt@linutronix.de>
 <alpine.DEB.2.21.2605051233210.46195@angie.orcam.me.uk>
 <20260505123203.jifiaxEL@linutronix.de>
 <alpine.DEB.2.21.2605051410280.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605051410280.46195@angie.orcam.me.uk>
X-Rspamd-Queue-Id: BA9E64D02DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14461-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]

On 2026-05-05 15:00:56 [+0100], Maciej W. Rozycki wrote:
> 
>  Ah, I missed that IRQF_ONESHOT bit in irq_setup_forced_threading().  So 
> it seems like we're good.  I'll proceed with the original change then to 
> just amend IOASIC DMA IRQ documentation.  Thank you for patience again.

No worries, you are welcome.
I'm not if sure if you may need to change the primary handler if the
interrupt flow is EOI and cascading based on what you wrote. If you have
access to the HW then you it should be easy to test given the
`threadirqs' argument should expose problems.

>   Maciej

Sebastian

