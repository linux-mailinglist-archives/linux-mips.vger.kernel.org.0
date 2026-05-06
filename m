Return-Path: <linux-mips+bounces-14482-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOnnNdEi+2lvWwMAu9opvQ
	(envelope-from <linux-mips+bounces-14482-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 13:15:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0674D9A51
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 13:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1FF8301369E
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09239317141;
	Wed,  6 May 2026 11:15:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F1C1DED5C;
	Wed,  6 May 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066126; cv=none; b=p2TtvLSAZ7a0/HJ0n7OZeOPVDOkd3FPVHMv4U1sQkLpmcdW8H8cmgN+qVEYeHcX8Ap/u5mh8ml5DtmcgRptRz1aVJhvLCguJsAoKjDkIYS9+AAy1eBJ8xJ95ETw7rp5vyWYN7/Q2zrd5u7foGJoaVOEKGmc62oVw5VX9FhkehRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066126; c=relaxed/simple;
	bh=v6VeViMA/SQM5sY8jpftJH3uArXwjYY0C3+i59VfwfM=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fmo+rW9tqBTMUilodMhGIqOJD2s8TbIQlq1K3cwZDejiI7/r+ZFb3uDmj8SemNapxXrFFGv5NbNwRInzXA44kY6IIP3ReIqPbBl0uBk0Ki3HrDt7OKE7qKhE5PQR1tOkVzgsHlbYYUPe6EUD+miUSqwnKaYdzN7aTuDBeh1M6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 798A192009C; Wed,  6 May 2026 13:15:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7358092009B;
	Wed,  6 May 2026 12:15:21 +0100 (BST)
Date: Wed, 6 May 2026 12:15:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: DEC: Remove IRQF_ONESHOT reference for IOASIC DMA
 error IRQs
Message-ID: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2F0674D9A51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14482-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,angie.orcam.me.uk:mid,orcam.me.uk:email]

There is no need for IOASIC DMA error interrupts to use the IRQF_ONESHOT 
flag, because while they do need to have the source cleared only at the 
conclusion of handling, the action handler supplied is either run in the 
hardirq context with interrupts disabled at the CPU level or, where IRQ 
threading has been forced, the primary handler has the IRQF_ONESHOT flag 
implicitly added and therefore the original action handler, now run as 
the thread handler and with interrupts enabled in the CPU, is executed 
with the originating interrupt line masked.  Therefore no interrupt will 
retrigger regardless until the original request has been handled.

Link: https://lore.kernel.org/r/20260127135334.qUEaYP9G@linutronix.de/
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/ioasic-irq.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

linux-dec-ioasic-irq-irqf-oneshot.diff
Index: linux-macro/arch/mips/dec/ioasic-irq.c
===================================================================
--- linux-macro.orig/arch/mips/dec/ioasic-irq.c
+++ linux-macro/arch/mips/dec/ioasic-irq.c
@@ -78,10 +78,7 @@ static struct irq_chip ioasic_dma_irq_ty
  * cleared.  This cannot be done until after a corrective action has been
  * taken and this also means they will not retrigger.  Therefore they use
  * the `handle_fasteoi_irq' handler that only clears the request on the
- * way out.  Because MIPS processor interrupt inputs, one of which the I/O
- * ASIC is cascaded to, are level-triggered it is recommended that error
- * DMA interrupt action handlers are registered with the IRQF_ONESHOT flag
- * set so that they are run with the interrupt line masked.
+ * way out.
  *
  * This mask has `1' bits in the positions of informational interrupts.
  */

