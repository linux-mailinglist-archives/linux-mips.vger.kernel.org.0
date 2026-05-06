Return-Path: <linux-mips+bounces-14494-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF20EerD+2keEgAAu9opvQ
	(envelope-from <linux-mips+bounces-14494-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:42:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB94E1548
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DABE3007C85
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 22:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D243837268B;
	Wed,  6 May 2026 22:42:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717AA3783C1;
	Wed,  6 May 2026 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107367; cv=none; b=dydtLgipT+8Cg9XxpxPUBabZEUpaGelXSo/5MwKsDnzUqG2QOp2nvQNo1Sjd/FCjHW082u81VbnOXrAtGvxW/IWX4PlV0QvgCVeNrGotlo9VK2cDIfnHQWhDzfqcSHL1J2Qis/EL0ZjUJr3WOQFDhr+vuN6YwtRD/m83DcCOAnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107367; c=relaxed/simple;
	bh=C4k8h9sh1iziIn880eCvsHdy2O9L0bKeO2juOgSQ0EQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZcCG/yDyTyS6rkvpfqU63vFNLewX+NxlXth3c1l6h4eCfGVwKfhRYGJbmBMxiOB92jXN9a5v/QJPGt9ogO9nqTsfLWdETLvQzEXPry/rdpZSYkobjXC4/Gk34lgF5X86bbXkKwIQQ9iedKj0EDjW0dGp9NgRfyEgsgbhppTDtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1A47E9200BF; Thu,  7 May 2026 00:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 14F9D9200B3;
	Wed,  6 May 2026 23:42:44 +0100 (BST)
Date: Wed, 6 May 2026 23:42:43 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v3 06/10] serial: zs: Switch to using channel reset
In-Reply-To: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605062323430.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 96BB94E1548
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14494-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,orcam.me.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Switch the driver to using the channel reset rather than hardware reset, 
simplifying handling by removing an interference between channels that 
causes the other channel to become uninitialised afterwards.

There is little difference between the two kinds of reset in terms of 
register settings that result, and we initialise the whole register set 
right away anyway.  However this prevents a hang from happening should 
the console output handler in the firmware try to access the other port 
whose transmitter has been disabled and line parameters messed up.

For example this will happen if the keyboard port (port A) is chosen for 
the system console, unusually but not insanely for a headless system, as 
the port is wired to a standard DA-15 connector and an adapter can be 
easily made.  Or with the next change in place this would happen for the 
regular console port (port B), since the keyboard port (port A) will be 
initialised first.

Just remove the unnecessary complication then, a channel reset is good 
enough.  We still need the initialisation marker, now per channel rather 
than per SCC, as for the console port zs_reset() will be called twice: 
once early on via zs_serial_console_init() for the console setup only, 
and then again via zs_config_port() as the port is associated with a TTY 
device.

Fixes: 8b4a40809e53 ("zs: move to the serial subsystem")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v2.6.23+
---
No change from v2,
<https://lore.kernel.org/r/alpine.DEB.2.21.2605012041220.11074@angie.orcam.me.uk/>.

No change from v1 (4/8),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604122134330.29980@angie.orcam.me.uk/>.
---
 drivers/tty/serial/zs.c |    7 ++++---
 drivers/tty/serial/zs.h |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

linux-serial-zs-reset-channel.diff
Index: linux-macro/drivers/tty/serial/zs.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/zs.c
+++ linux-macro/drivers/tty/serial/zs.c
@@ -832,21 +832,22 @@ static void zs_shutdown(struct uart_port
 
 static void zs_reset(struct zs_port *zport)
 {
+	struct zs_port *zport_a = &zport->scc->zport[ZS_CHAN_A];
 	struct zs_scc *scc = zport->scc;
 	int irq;
 	unsigned long flags;
 
 	spin_lock_irqsave(&scc->zlock, flags);
 	irq = !irqs_disabled_flags(flags);
-	if (!scc->initialised) {
+	if (!zport->initialised) {
 		/* Reset the pointer first, just in case...  */
 		read_zsreg(zport, R0);
 		/* And let the current transmission finish.  */
 		zs_line_drain(zport, irq);
-		write_zsreg(zport, R9, FHWRES);
+		write_zsreg(zport, R9, zport == zport_a ? CHRA : CHRB);
 		udelay(10);
 		write_zsreg(zport, R9, 0);
-		scc->initialised = 1;
+		zport->initialised = 1;
 	}
 	load_zsregs(zport, zport->regs, irq);
 	spin_unlock_irqrestore(&scc->zlock, flags);
Index: linux-macro/drivers/tty/serial/zs.h
===================================================================
--- linux-macro.orig/drivers/tty/serial/zs.h
+++ linux-macro/drivers/tty/serial/zs.h
@@ -22,6 +22,7 @@
 struct zs_port {
 	struct zs_scc	*scc;			/* Containing SCC.  */
 	struct uart_port port;			/* Underlying UART.  */
+	int		initialised;		/* For the console port.  */
 
 	int		clk_mode;		/* May be 1, 16, 32, or 64.  */
 
@@ -41,7 +42,6 @@ struct zs_scc {
 	struct zs_port	zport[2];
 	spinlock_t	zlock;
 	atomic_t	irq_guard;
-	int		initialised;
 };
 
 #endif /* __KERNEL__ */

