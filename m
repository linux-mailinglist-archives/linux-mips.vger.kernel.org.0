Return-Path: <linux-mips+bounces-14492-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMkuDeLD+2kREgAAu9opvQ
	(envelope-from <linux-mips+bounces-14492-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:42:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D43664E1529
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98BE930097C2
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 22:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557803793B0;
	Wed,  6 May 2026 22:42:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE6737268B;
	Wed,  6 May 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107358; cv=none; b=YpoX0Yiof0DL2bvejbhR6tpc1qc9y3NpEmzMaHjgq3qGM8xxv2mobwHEqLhzUXdMWyMmZVpmpXdkdQQM6fsaZmnVLxEtSDLWLADOlnJfwtMj20tp5Lq2RN460OMAUHJGXp9/V4hlS9qn07UxqL3SS5ikv6rg8DiOzD2pw91cHNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107358; c=relaxed/simple;
	bh=uBY0ucS+WIrfpnuujUcvFCRYQChJMsGRGQ1jtmlHK9s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MWsU0hpw6wjUhcskyjZucSIbwkuklzhW5Y5B9Nrmp7clkQj9f8cjEGY38zk/mbj1z1QXGXWAMvvWWPwIckWmFlsRoTwld5pLnE3P6wxR4Hk2j1fa8iG9jTZcn9TbcAH7ijXjK/sBMUVvVIRbbcD2mttgArJnE4huM11yynhGtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5FF1D92009D; Thu,  7 May 2026 00:42:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5B06192009C;
	Wed,  6 May 2026 23:42:35 +0100 (BST)
Date: Wed, 6 May 2026 23:42:35 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v3 04/10] serial: dz: Fix bootconsole handover lockup
In-Reply-To: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605062302010.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D43664E1529
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14492-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Calling dz_reset() in the course of setting up the serial device causes 
line parameters to be reset and the transmitter disabled.  We've been 
lucky in that no message is usually produced to the kernel log between 
this call and the later call to uart_set_options() in the course of 
console setup done by dz_serial_console_init(), or the system would hang 
as the console output handler in the firmware tried to access a port the 
transmitter of which has been disabled and line parameters messed up.

This will change with the next change to the driver, so fix dz_reset() 
such that line parameters are set for 9600n8 console operation as with 
the system firmware and the transmitter re-enabled after reset.  This 
also means dz_pm() serves no purpose anymore, so drop it.

Fixes: e6ee512f5a77 ("dz.c: Resource management")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v2.6.25+
---
Changes from v2,
<https://lore.kernel.org/r/alpine.DEB.2.21.2605012013410.11074@angie.orcam.me.uk/>:

- Make a minor style improvement to the commit description.

No change from v1 (2/8),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604102338300.29980@angie.orcam.me.uk/>.
---
 drivers/tty/serial/dz.c |   36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

linux-serial-dz-prom-console.diff
Index: linux-macro/drivers/tty/serial/dz.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/dz.c
+++ linux-macro/drivers/tty/serial/dz.c
@@ -571,6 +571,18 @@ static void dz_reset(struct dz_port *dpo
 	while (dz_in(dport, DZ_CSR) & DZ_CLR);
 	iob();
 
+	/*
+	 * Set parameters across all lines such as not to interfere
+	 * with the initial PROM-based console.  Otherwise any output
+	 * produced before the console handover would cause the system
+	 * firmware to produce rubbish.
+	 */
+	for (int line = 0; line < DZ_NB_PORT; line++)
+		dz_out(dport, DZ_LPR, DZ_B9600 | DZ_CS8 | line);
+
+	/* Re-enable transmission for the initial PROM-based console.  */
+	dz_out(dport, DZ_TCR, tcr);
+
 	/* Enable scanning.  */
 	dz_out(dport, DZ_CSR, DZ_MSE);
 
@@ -654,26 +666,6 @@ static void dz_set_termios(struct uart_p
 	uart_port_unlock_irqrestore(&dport->port, flags);
 }
 
-/*
- * Hack alert!
- * Required solely so that the initial PROM-based console
- * works undisturbed in parallel with this one.
- */
-static void dz_pm(struct uart_port *uport, unsigned int state,
-		  unsigned int oldstate)
-{
-	struct dz_port *dport = to_dport(uport);
-	unsigned long flags;
-
-	uart_port_lock_irqsave(&dport->port, &flags);
-	if (state < 3)
-		dz_start_tx(&dport->port);
-	else
-		dz_stop_tx(&dport->port);
-	uart_port_unlock_irqrestore(&dport->port, flags);
-}
-
-
 static const char *dz_type(struct uart_port *uport)
 {
 	return "DZ";
@@ -769,7 +761,6 @@ static const struct uart_ops dz_ops = {
 	.startup	= dz_startup,
 	.shutdown	= dz_shutdown,
 	.set_termios	= dz_set_termios,
-	.pm		= dz_pm,
 	.type		= dz_type,
 	.release_port	= dz_release_port,
 	.request_port	= dz_request_port,
@@ -894,10 +885,7 @@ static int __init dz_console_setup(struc
 	if (ret)
 		return ret;
 
-	spin_lock_init(&dport->port.lock);	/* For dz_pm().  */
-
 	dz_reset(dport);
-	dz_pm(uport, 0, -1);
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);

