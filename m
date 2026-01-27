Return-Path: <linux-mips+bounces-13023-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIHhDx3peGmHtwEAu9opvQ
	(envelope-from <linux-mips+bounces-13023-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 17:34:37 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E197D00
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 17:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 736B1307F89D
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8693D35B649;
	Tue, 27 Jan 2026 15:46:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BC735CB76;
	Tue, 27 Jan 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528775; cv=none; b=p7iH4QgF72BZdmHSeH5qRvxvGg7qooIyRbQgNZ/uKSTmQ2J030bkpyC3S4VgqPYSDUp22GjN7kk2MuoyT362oMiqMr0mN3yU0mzGLmbonvv0ARV2XUYdJfEXESnapfDFGA155FMgAzT31UrYm1beACFNUaoX73ejpa2wLtWa6co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528775; c=relaxed/simple;
	bh=YxUtHGJp3rRQoEqVIndKTQ6jCokoIDKpRH+cCW78r2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hbI6++1Zj4QfUHqMWXzf5pWdx7KlhDM4P5WFJW3YiXmku/DW785+Bzq73hwgoFwmoS1a1mISfRM3jVnAJ2WpqfqKei8sxCGXG/am1r4x0xzaVfOL753c4TAInGCq0LWQgsbuVJqbiyXFlZezF61Mlnx7nbPBzEbdtVf1s51liD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EB21992009C; Tue, 27 Jan 2026 16:46:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E4D4092009B;
	Tue, 27 Jan 2026 15:46:10 +0000 (GMT)
Date: Tue, 27 Jan 2026 15:46:10 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org, 
    Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
In-Reply-To: <20260127135334.qUEaYP9G@linutronix.de>
Message-ID: <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk>
References: <20260127135334.qUEaYP9G@linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13023-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DMARC_NA(0.00)[orcam.me.uk];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 813E197D00
X-Rspamd-Action: no action

On Tue, 27 Jan 2026, Sebastian Andrzej Siewior wrote:

> The IRQF_ONESHOT flag was added in commit 0fabe1021f8bc ("MIPS:
> DECstation I/O ASIC DMA interrupt classes"). It moved
> clear_ioasic_dma_irq() from the driver into the irq-chip.
> For EOI interrupts the clear_ioasic_dma_irq() callback is now invoked as
> ->irq_eoi() which is invoked after the IRQ was handled while the
> interrupt is masked due to IRQF_ONESHOT. Without IRQF_ONESHOT it would
> be invoked while interrupt is unmasked (but interrupts are disabled).

 Umm, are they?  It's been a while, but have I missed anything?  As I 
recall ->irq_mask() is called exactly so that interrupts can be re-enabled 
at the CPU level right way so as not to block other sources which may have 
a low latency requirement while a hardirq handler is running.

> If it is *required* to invoke EOI-ack while the interrupt is masked (and
> not a misunderstanding) due to irq-chip cascading/ hierarchical reasons
> then using handle_fasteoi_mask_irq() as flow-handler would be the right
> way to do so.

 Since this is a level-triggered interrupt unmasking it before the EOI 
will make it retrigger right away and loop forever.  And as the 
description of commit 0fabe1021f8b ("MIPS: DECstation I/O ASIC DMA 
interrupt classes") says the interrupt must not be acked before EOI, as 
the problematic transfer would restart while the IRQ handler is still 
running:

16 R/W0C LANCE DMA memory read error
         This bit is set to 1 and DMA disabled, when the LANCE DMA
         encounters a memory read error. The LANCE then times out and
         interrupts the processor, which handles the problem. The LPR can
         read the address of the error. The bit may be cleared by writing a 0;
         writing a 1 has no effect.

so a combined ACK-EOI is the only correct way to handle it.

 Yes, the handler is sort of a placeholder, but the structure of handling 
ought to be correct regardless.

 One issue here is this is a recovery handler for an error scenario that 
is not supposed to happen with a correctly operating system.  I've never 
seen it actually fire, which is also why there's no actual recovery action 
implemented.  Perhaps such an error could be induced for verification 
purposes, I don't know.  All in all this code may have to rely solely on 
hw specs.

 I need more data to conclude whether this is the right change to make I'm 
afraid.  Thank you for looking into it though.

  Maciej

