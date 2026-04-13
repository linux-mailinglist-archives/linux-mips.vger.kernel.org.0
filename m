Return-Path: <linux-mips+bounces-14105-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDNJA89i3GkHQQkAu9opvQ
	(envelope-from <linux-mips+bounces-14105-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A90653E6EEF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1FB13008774
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 03:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96AA23ABA8;
	Mon, 13 Apr 2026 03:28:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E222E3FE;
	Mon, 13 Apr 2026 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050889; cv=none; b=RGaBR8rtvNJOnAtyGuY1ZYStudF5zpppUExANExcAyd/Th/DrWSEEjf1ujkoRHDfl8BWWQRi6T2+K/veDYmuIDf9DBFyi4EK9PIuPBASe2rWoEU4Wz7PPxuNl6p03jkoHiXFJUjzteKBnuu89+hP60gJIyW5usbARj6Z9Fc5M6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050889; c=relaxed/simple;
	bh=K+gE2g+I6iZCj/MIcj8ghflTj614mmS74N2MHRqMlvU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eExUsv29s9K93JPqdGSUOlfZw/s4XpBRoe3Dof8TQSYIMnzoDz+/c8uK5JyJ9TPl2u7NBTW6ZCEBXtFkne+4eBn9TQVNyVZU/XgH5kSme2tgpnoFQoviVjAcfJtYsuDzgiFt1a0AT+2YESQ8im2a3fHYE0GuN/wQvqjpiFUdaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 978AC92009D; Mon, 13 Apr 2026 05:28:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 89CD992009C;
	Mon, 13 Apr 2026 04:28:07 +0100 (BST)
Date: Mon, 13 Apr 2026 04:28:07 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH 3/8] serial: zs: Fix bootconsole handover lockup
In-Reply-To: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2604102346290.29980@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14105-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A90653E6EEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Calling zs_reset() in the course of setting up the serial device causes 
line parameters to be reset and the transmitter disabled.  We've been 
lucky in that no message is usually produced to the kernel log between 
this call and the later call to uart_set_options() in the course of 
console setup done by zs_serial_console_init(), or the system would hang 
as the console output handler in the firmware tried to access a port 
whose transmitter has been disabled and line parameters messed up.

This will change with the next change to the driver, so fix zs_reset() 
such that line parameters are set for 9600n8 console operation as with 
the system firmware and the transmitter re-enabled after reset.  This 
also means zs_pm() serves no purpose anymore, so drop it.

Switch to using the channel reset rather than the hardware reset, since 
this simplifies handling by removing the interfere

Fixes: 8b4a40809e53 ("zs: move to the serial subsystem")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v2.6.23+
---
 drivers/tty/serial/zs.c |   29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

linux-serial-zs-prom-console.diff
Index: linux-macro/drivers/tty/serial/zs.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/zs.c
+++ linux-macro/drivers/tty/serial/zs.c
@@ -105,18 +105,24 @@ struct zs_parms {
 
 static struct zs_scc zs_sccs[ZS_NUM_SCCS];
 
+/*
+ * Set parameters in WR5, WR12, WR13 such as not to interfere
+ * with the initial PROM-based console.  Otherwise any output
+ * produced before the console handover would cause the system
+ * firmware to hang (TxENAB) or produce rubbish (Tx8, B9600).
+ */
 static u8 zs_init_regs[ZS_NUM_REGS] __initdata = {
 	0,				/* write 0 */
 	PAR_SPEC,			/* write 1 */
 	0,				/* write 2 */
 	0,				/* write 3 */
 	X16CLK | SB1,			/* write 4 */
-	0,				/* write 5 */
+	Tx8 | TxENAB,			/* write 5 */
 	0, 0, 0,			/* write 6, 7, 8 */
 	MIE | DLC | NV,			/* write 9 */
 	NRZ,				/* write 10 */
 	TCBR | RCBR,			/* write 11 */
-	0, 0,				/* BRG time constant, write 12 + 13 */
+	0x16, 0x00,			/* BRG time constant, write 12 + 13 */
 	BRSRC | BRENABL,		/* write 14 */
 	0,				/* write 15 */
 };
@@ -956,23 +962,6 @@ static void zs_set_termios(struct uart_p
 	spin_unlock_irqrestore(&scc->zlock, flags);
 }
 
-/*
- * Hack alert!
- * Required solely so that the initial PROM-based console
- * works undisturbed in parallel with this one.
- */
-static void zs_pm(struct uart_port *uport, unsigned int state,
-		  unsigned int oldstate)
-{
-	struct zs_port *zport = to_zport(uport);
-
-	if (state < 3)
-		zport->regs[5] |= TxENAB;
-	else
-		zport->regs[5] &= ~TxENAB;
-	write_zsreg(zport, R5, zport->regs[5]);
-}
-
 
 static const char *zs_type(struct uart_port *uport)
 {
@@ -1055,7 +1044,6 @@ static const struct uart_ops zs_ops = {
 	.startup	= zs_startup,
 	.shutdown	= zs_shutdown,
 	.set_termios	= zs_set_termios,
-	.pm		= zs_pm,
 	.type		= zs_type,
 	.release_port	= zs_release_port,
 	.request_port	= zs_request_port,
@@ -1210,7 +1198,6 @@ static int __init zs_console_setup(struc
 		return ret;
 
 	zs_reset(zport);
-	zs_pm(uport, 0, -1);
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);

