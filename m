Return-Path: <linux-mips+bounces-14458-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCBzM3bk+Wn2EwMAu9opvQ
	(envelope-from <linux-mips+bounces-14458-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 14:37:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF94CDA4D
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 14:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6770B30071E4
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 12:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E4B3AD50A;
	Tue,  5 May 2026 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lM3sUzcO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AVCQ9Tjh"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9E3A785E;
	Tue,  5 May 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984328; cv=none; b=Xj+dDLsJhXtzKYkwfshj+qBnrsIPMIoM/+VRoYFLix1v+W/djjnAqtWA2UcpHcllDvKbFfDZuGJ5fU+6bJzhItzTBWKOsTKK0r1PtXkd0Yiv2R7bzfKvJnY1u1jMZhhCbDXGbCViPDxVLJR5wn1crHaRJWdE3Vp0ZL7ge2mgChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984328; c=relaxed/simple;
	bh=ixrCirkHCWcbA3vA+OCiYapGYSGHNRT0+KBV081M154=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oeqa/fMK/+x9XAiwmEMkYWJhSrYjmyBqlj6P9yIlJgv2f1drxWKOGLJBJBSXHB15oJhIK7CU1pEw8hVlyHMxmVdpU1C1SendNqGI7hkofOV6seh72l922nStUHnNAG+LFyjHYWAxDa3+NWYFa94kgP+1KGLXccP1xx9AK8//3OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lM3sUzcO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AVCQ9Tjh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 5 May 2026 14:32:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777984325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KHknitU2Jx05TiJG7B+qQQxESaR0TkmepU2IxA6SdBA=;
	b=lM3sUzcOniGmy2QsJwR1VzZaYTS/em1RYhL68VuZwJluP7Hlc/SHyeZ9hCsJgLGkpiRefC
	D6ICrMovAIoLte06jsFKFX5JeQMJSdWCjDOURJnbnl6etxuvOK0MJrKZI1457FvJFqr47C
	oYFJm0jM0kA/nv7jqGQZp85VmzitBdNwXWAtGuRTjvG1h3AQ9cGnKvyTH6UimfSOnFUwVe
	UkxFW9eVGrs7sjPtADpwy8ZXRfDTrifo3vU173R2MqFLej8miB8R8sLjpIpvl4FrYOMtt3
	wz2J3Cn6KBhNnRBvTXtQ4Hy1HdptJ7c0vYyRgfpOM7JlvyUel+dYQ82kckZJ6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777984325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KHknitU2Jx05TiJG7B+qQQxESaR0TkmepU2IxA6SdBA=;
	b=AVCQ9TjhC8Dal4v/JYxb66YPGbOcvWvIQ/Vd2l7Xg4dIJF4P/11bsf3c4n1FK6DQh/QZ/Y
	f2ePpnpcMjnPLrBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
Message-ID: <20260505123203.jifiaxEL@linutronix.de>
References: <20260127135334.qUEaYP9G@linutronix.de>
 <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk>
 <20260127165430.7ui_LGkg@linutronix.de>
 <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
 <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk>
 <20260505072954.Ov2t-FGt@linutronix.de>
 <alpine.DEB.2.21.2605051233210.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605051233210.46195@angie.orcam.me.uk>
X-Rspamd-Queue-Id: 2DAF94CDA4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14458-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]

On 2026-05-05 13:02:16 [+0100], Maciej W. Rozycki wrote:
> > With force-threading enabled, the interrupt handler is masked in the
> > IRQ-chip until after the threaded-handler run. See the cond_unmask_irq()
> > in handle_level_irq() or the mask_irq() & cond_unmask_eoi_irq() in
> > handle_fasteoi_ack_irq(). That means the hw-IRQ is done, the thread is
> > running with interrupts enabled but the hw-IRQ will not trigger again.
> > The cited commit 5a4a4ad851dd8 ("MIPS: Mark cascade and low level
> > interrupts IRQF_NO_THREAD") is different as it acts on cascading
> > interrupts which is not what we have here.
> 
>  Not with the current handle_fasteoi_irq() handler.

Why? There is a mask_irq() in the ONESHOT case.

>  And actually not with handle_fasteoi_ack_irq() either, which doesn't call 
> mask_irq() unless IRQF_ONESHOT has been requested (but ->irq_ack() could 
> be repurposed to do masking), however handle_fasteoi_mask_irq() seems a 
> matching candidate.  To use that handler the platform would have to select 
> IRQ_DOMAIN_HIERARCHY and IRQ_FASTEOI_HIERARCHY_HANDLERS, although none of 
> the stuff beyond just handle_fasteoi_mask_irq() appears relevant, so it 
> seems like a waste of memory.  Note that the handlers are much more recent 
> than the driver and back in the time IRQF_ONESHOT seemed a reasonable 
> approach.

If there is a chain and you have multiple controllers then the different
low-lever handler might be the way to go.
But IRQF_ONESHOT servers a different purpose. If you use request_irq()
then there is no threaded-handler and as such IRQF_ONESHOT does nothing
except avoiding force-threading the primary handler. But that is a
side-effet. If you want to avoid to force-threading the irq-handler then
IRQF_NO_THREAD would be the right flag.

>  The handle_level_irq() handler is irrelevant, because we do need to issue 
> the EOI for deassertion.
> 
> > If you request a threaded interrupt you must either provide two handler
> > and the primary must mask the interrupt so it does not fire again or you
> > pass a flag such as IRQF_ONESHOT and which point the IRQ subsystem will
> > mask the IRQ within the irqchip so it does not fire again.
> 
>  Well, yes, but you've just removed the flag from this driver, so either 
> the flag has to reinstated or the driver adjusted differently for the 
> threaded case to be handled correctly.

But there is a plain request_irq() so the handler is invoked directly in
hardirq context with disabled interrupts. In forced-threaded context,
such as on PREEMPT_RT, the IRQF_ONESHOT is added.

>   Maciej

Sebastian

