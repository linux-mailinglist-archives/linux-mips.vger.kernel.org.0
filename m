Return-Path: <linux-mips+bounces-13034-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG+VNlIGeWk3ugEAu9opvQ
	(envelope-from <linux-mips+bounces-13034-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 19:39:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2B993C2
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 19:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 594323066885
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 18:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2C8326D75;
	Tue, 27 Jan 2026 18:35:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1492EA159;
	Tue, 27 Jan 2026 18:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538950; cv=none; b=uAijtHq85Wyh0Zz2tV1vnQqYUA60HlcXqv1pPLEAbkGpQWos0XJD0po1UPEskcZTyDKFPooc4j9Gff0Ytu5HUeCajAIgDkgd/xJBg0d8KolklOH3L7/t7oR30DZqDqvmXXZyhaMkreBIcd7OyMN1+vuzFuVMnLSmu7FlJJhTLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538950; c=relaxed/simple;
	bh=JVkaCkXEPP9rJREsfqJ+MsShNTr1X42+rnTiGEB+b7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kMNkzANLqN38ZqolvJtCK221PRNsMTjRtSVzILgvjqLMjJMskG6+73pAD4Je2CeaRsWk4q8Z/Yy6Yh8XZEt9c6FMQtlaQ9IwypoB9JqSKCXq1BTNkBnAVparFEDXgoweCF4BKXMgx44TfEB1wSGndZ3yr7XBnufIeMcA2B77vwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B757A92009C; Tue, 27 Jan 2026 19:35:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B37C892009B;
	Tue, 27 Jan 2026 18:35:45 +0000 (GMT)
Date: Tue, 27 Jan 2026 18:35:45 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org, 
    Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
In-Reply-To: <20260127165430.7ui_LGkg@linutronix.de>
Message-ID: <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
References: <20260127135334.qUEaYP9G@linutronix.de> <alpine.DEB.2.21.2601271508160.40317@angie.orcam.me.uk> <20260127165430.7ui_LGkg@linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13034-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DMARC_NA(0.00)[orcam.me.uk];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,orcam.me.uk:email,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 3BD2B993C2
X-Rspamd-Action: no action

On Tue, 27 Jan 2026, Sebastian Andrzej Siewior wrote:

> >  Umm, are they?  It's been a while, but have I missed anything?  As I 
> > recall ->irq_mask() is called exactly so that interrupts can be re-enabled 
> > at the CPU level right way so as not to block other sources which may have 
> > a low latency requirement while a hardirq handler is running.
> 
> A hardirq is always serviced with disabled interrupts from CPU point of
> view. There were exceptions in the IDE department as far as I remember
> where it was possible to enable interrupts from CPUs point of view while
> the interrupt was serviced. That was 2.2/2.4 time frame and edge
> interrupts made it possible.

 Fair enough.

> It is not required to mask the interrupt while the handler is invoked
> unless it is required to properly ACK the interrupt from device's and
> IRQ-chip point of view.
> The sole purpose of IRQF_ONESHOT was to disable the interrupt source
> while the threaded interrupt is running. This driver has none.

 Ack.

> >  Since this is a level-triggered interrupt unmasking it before the EOI 
> > will make it retrigger right away and loop forever.  And as the 
> > description of commit 0fabe1021f8b ("MIPS: DECstation I/O ASIC DMA 
> > interrupt classes") says the interrupt must not be acked before EOI, as 
> > the problematic transfer would restart while the IRQ handler is still 
> > running:
> 
> If it is a level interrupt and MASK/ACK in the irq-chip then the device
> will issue the interrupt again if the source of the interrupt (i.e. the
> error) has not been solved. Since the handler does only a printk() it
> should trigger again.

 It won't retrigger, as a memory read error event is transient, e.g. a bus 
timeout or an uncorrected ECC error, and the resulting interrupt is only 
recorded internally in the IOASIC.  IOW, the interrupt is edge-triggered 
and the interrupt status bit is *the* origin of the outgoing interrupt to 
the CPU.  Once cleared the IRQ is gone until the next error happens.  But 
it cannot be cleared early as with ordinary edge-triggered interrupts, 
because of the dual function of the interrupt status bit, as described in 
the comment referring IRQF_ONESHOT in arch/mips/dec/ioasic-irq.c.

 FWIW it seems at the very least the handler ought to report the offending 
address and rate-limit the message.  Since this is a networking driver the 
resulting data corruption is probably OK as that can happen to transferred 
data anywhere en route and it's up to the high-level receiver to cope with 
that.  Given that it is outgoing data there's little that can be done too.  
Maybe the whole data transfer can be aborted, but I'm not familiar enough 
with LANCE hardware to know off-hand how to do that.  As I say, this is 
exceedingly rare an event, so I guess taking the path of least resistance 
make sense.

> > 16 R/W0C LANCE DMA memory read error
> >          This bit is set to 1 and DMA disabled, when the LANCE DMA
> >          encounters a memory read error. The LANCE then times out and
> >          interrupts the processor, which handles the problem. The LPR can
> >          read the address of the error. The bit may be cleared by writing a 0;
> >          writing a 1 has no effect.
> > 
> > so a combined ACK-EOI is the only correct way to handle it.
> 
> Make sense. So first the driver needs to set this bit and then IRQ-chip
> would need to see the EOI after the handler run. You would still need to
> cancel/ tear down the transfer before that.

 This is R/W0C, that is read/write-zero-to-clear.  Only hardware can set 
the bit to 1 and only software can set the bit to 0; any attempt made by 
software to flip the bit from 0 to 1 is ignored.  This guarantees write 
atomicity: you can ack any DMA interrupt(s) by just a single 32-bit write 
to the register with no need to read it first.

 Upon a DMA error the hardware writes 1, which asserts the IRQ and stops 
DMA.  Only having handled the situation the handler is supposed to write 
0, which deasserts the IRQ and resumes DMA.

 FAOD the IOASIC has IRQ and (third-party) DMA controller features both on 
chip, providing for the double function of the DMA interrupt status bits; 
they are all handled internally.  Non-DMA interrupts work the usual way: 
when the originating external device has deasserted its IRQ line, the 
corresponding interrupt status bit, which is R/O rather than R/W0C, gets 
cleared accordingly, deasserting the IOASIC's IRQ output for the CPU.

> >  Yes, the handler is sort of a placeholder, but the structure of handling 
> > ought to be correct regardless.
> > 
> >  One issue here is this is a recovery handler for an error scenario that 
> > is not supposed to happen with a correctly operating system.  I've never 
> > seen it actually fire, which is also why there's no actual recovery action 
> > implemented.  Perhaps such an error could be induced for verification 
> > purposes, I don't know.  All in all this code may have to rely solely on 
> > hw specs.
> > 
> >  I need more data to conclude whether this is the right change to make I'm 
> > afraid.  Thank you for looking into it though.
> 
> Fair enough. Would it work for you if we scratch this from net-next and
> you route this or something else via the mips tree?

 No need to, I think I understand the situation now.  Surely the comment 
referring IRQF_ONESHOT in arch/mips/dec/ioasic-irq.c needs to be removed, 
but otherwise this is:

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>

Thank you for clarifying this to me, and doing the clean-up in the first 
place!

  Maciej

