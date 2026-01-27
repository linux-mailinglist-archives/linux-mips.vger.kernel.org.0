Return-Path: <linux-mips+bounces-13024-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHc2GdLteGk6uAEAu9opvQ
	(envelope-from <linux-mips+bounces-13024-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 17:54:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762098072
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 17:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9EDC301D076
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 16:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590BB362135;
	Tue, 27 Jan 2026 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H6dCryx1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="blUgooW0"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00AE31328C;
	Tue, 27 Jan 2026 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532875; cv=none; b=Uz5GZ5Pc91g0eoHlRwJw12wAU7vJk8lUHSKHrp5eDx3V5ckPKHAz8c7jC9dWWH8Z4j0Opp4GVTSxWFvz6ywQ5NaYn9mTWZkinQ+Z/rwQuRfCjsfIbYhcPnKupJIdKXmgnt4Cc+oZ882T8YQ4TwY/l22yoMNq+xo+s7EbC2reNtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532875; c=relaxed/simple;
	bh=jJeGr3AEZZLhwBUcqwXf18TUbomahmCrVv+XKeQ1/JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWu9B/tSgUCDNU6p4oZE+brufMDWhig7y3zkp+oaB9CvivWW3PQexM6Ij28jZCyVd/ZWPq2uXqH0s9RARMsxDAxXHWhiOUvQicJkrGwcDUgcfPr/4/mTnIdklZERbRAvoRMUNQPN/IEs2A2TKBZceCps3dhDq+RgM7SYGZZH3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H6dCryx1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=blUgooW0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 27 Jan 2026 17:54:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769532871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7fcR1AvKm3ql6k8caDYfB9Iq3Onn9HmlZ0agYF2W0A=;
	b=H6dCryx16kkd3zKXDMGtnq6nmXV7yCGqVJjtlsMV9TXay0d8Fwb7GARB6kbHyNVubcva2M
	+FMj3hPSgDIKSwc8WL+6sKQ4ver6KHsAsxxG1Gvag+8011S5Bh9KtJPOM96h91CyjH5rUa
	lHCILMOO9McLVwTuVGlY/myP6f/Dj6ezNhwR5mY4Pi7AR0Cw9GJUnQGAf85CLCXSduGqS6
	Ao9Rs2nCHd5mKDiuhaKqn4YoYtTuxbFOreWlqKCOentGqLV//SbWD3YQz7BAjsLO3dgWV7
	ujQh6rkwUU8/5idc05hlVoJ5exVcReIU7dvUOmRsLBDi0TFccbu9Pl3nYMn4qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769532871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7fcR1AvKm3ql6k8caDYfB9Iq3Onn9HmlZ0agYF2W0A=;
	b=blUgooW0SrS3sXg0n7sBI1McAfFwdRJ6Ox8O+sCzjZSrJa6u7jUbHZUiYT6oP7XzcEImxL
	GZbKgeJLFgPQM3Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
Message-ID: <20260127165430.7ui_LGkg@linutronix.de>
References: <20260127135334.qUEaYP9G@linutronix.de>
 <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk>
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
	TAGGED_FROM(0.00)[bounces-13024-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5762098072
X-Rspamd-Action: no action

On 2026-01-27 15:46:10 [+0000], Maciej W. Rozycki wrote:
> On Tue, 27 Jan 2026, Sebastian Andrzej Siewior wrote:
> 
> > The IRQF_ONESHOT flag was added in commit 0fabe1021f8bc ("MIPS:
> > DECstation I/O ASIC DMA interrupt classes"). It moved
> > clear_ioasic_dma_irq() from the driver into the irq-chip.
> > For EOI interrupts the clear_ioasic_dma_irq() callback is now invoked as
> > ->irq_eoi() which is invoked after the IRQ was handled while the
> > interrupt is masked due to IRQF_ONESHOT. Without IRQF_ONESHOT it would
> > be invoked while interrupt is unmasked (but interrupts are disabled).
> 
>  Umm, are they?  It's been a while, but have I missed anything?  As I 
> recall ->irq_mask() is called exactly so that interrupts can be re-enabled 
> at the CPU level right way so as not to block other sources which may have 
> a low latency requirement while a hardirq handler is running.

A hardirq is always serviced with disabled interrupts from CPU point of
view. There were exceptions in the IDE department as far as I remember
where it was possible to enable interrupts from CPUs point of view while
the interrupt was serviced. That was 2.2/2.4 time frame and edge
interrupts made it possible.

It is not required to mask the interrupt while the handler is invoked
unless it is required to properly ACK the interrupt from device's and
IRQ-chip point of view.
The sole purpose of IRQF_ONESHOT was to disable the interrupt source
while the threaded interrupt is running. This driver has none.

> > If it is *required* to invoke EOI-ack while the interrupt is masked (and
> > not a misunderstanding) due to irq-chip cascading/ hierarchical reasons
> > then using handle_fasteoi_mask_irq() as flow-handler would be the right
> > way to do so.
> 
>  Since this is a level-triggered interrupt unmasking it before the EOI 
> will make it retrigger right away and loop forever.  And as the 
> description of commit 0fabe1021f8b ("MIPS: DECstation I/O ASIC DMA 
> interrupt classes") says the interrupt must not be acked before EOI, as 
> the problematic transfer would restart while the IRQ handler is still 
> running:

If it is a level interrupt and MASK/ACK in the irq-chip then the device
will issue the interrupt again if the source of the interrupt (i.e. the
error) has not been solved. Since the handler does only a printk() it
should trigger again.

> 16 R/W0C LANCE DMA memory read error
>          This bit is set to 1 and DMA disabled, when the LANCE DMA
>          encounters a memory read error. The LANCE then times out and
>          interrupts the processor, which handles the problem. The LPR can
>          read the address of the error. The bit may be cleared by writing a 0;
>          writing a 1 has no effect.
> 
> so a combined ACK-EOI is the only correct way to handle it.

Make sense. So first the driver needs to set this bit and then IRQ-chip
would need to see the EOI after the handler run. You would still need to
cancel/ tear down the transfer before that.

Again, with the interrupt handler setup as-is lance_dma_merr_int() will
run with disabled interrupts.

>  Yes, the handler is sort of a placeholder, but the structure of handling 
> ought to be correct regardless.
> 
>  One issue here is this is a recovery handler for an error scenario that 
> is not supposed to happen with a correctly operating system.  I've never 
> seen it actually fire, which is also why there's no actual recovery action 
> implemented.  Perhaps such an error could be induced for verification 
> purposes, I don't know.  All in all this code may have to rely solely on 
> hw specs.
> 
>  I need more data to conclude whether this is the right change to make I'm 
> afraid.  Thank you for looking into it though.

Fair enough. Would it work for you if we scratch this from net-next and
you route this or something else via the mips tree?

>   Maciej

Sebastian

