Return-Path: <linux-mips+bounces-14729-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BoFEOmFE2rFCwcAu9opvQ
	(envelope-from <linux-mips+bounces-14729-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:12:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AE5C4B58
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DE093001FBC
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2026 23:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1654E3B3BF4;
	Sun, 24 May 2026 23:12:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7E33B0ADD;
	Sun, 24 May 2026 23:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664352; cv=none; b=SsRQN3r6yXTJxjYmVsSpVwHvWTtsm/gQc4VP4YsW8pR0WBHvSCLag1NOVrWsoR1c35XvGz2IvsuIqfLVbVPiIDXspKPtUWXyrohu3KrGhIYSeFGWu1OjzgI8C4fyPYGreqPaMUvEPS1Ffj9TUJB7ASDCkd3sayZ7Jht+BuFHTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664352; c=relaxed/simple;
	bh=z54peA8XItYsMuM7laktWvaNwWCvsNnEOFJlL/FUf+Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lcGsZDRgCjJgEKQ/KQmmuiopJarXyDGxet7NtcHkkhiaFSAvlOEQ84VuNrGaAq05F+Uhr8lWgrEnZlCHBhb+5APSjaHNN4gAEa+QDHfdsW7fThCCaBbKVp2jRQ97brCD5PmKxBBamtDl81Sud1qCv2vwV6k/0jDrJySuFJFufVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A89BD92009E; Mon, 25 May 2026 01:12:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A213492009D;
	Mon, 25 May 2026 00:12:29 +0100 (BST)
Date: Mon, 25 May 2026 00:12:29 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] serial: sb1250-duart: Switch to spinlock protection
 for shared resource
In-Reply-To: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605241630370.1450@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14729-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,angie.orcam.me.uk:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4A5AE5C4B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The control register block is shared between DUART channels and so its 
resource has to be requested by the first channel claimed and released 
by the last one dropped.

It is currently handled with an atomic counter, which however does not 
protect against a situation where request_mem_region() has failed, but 
another CPU has seen the map guard nonzero and refrained from calling 
this function for another channel where it should have (and likely also 
fail).  This parallel execution scenario can in principle be arranged 
via the TIOCSSERIAL ioctl.

Switch to using an ordinary counter then and spinlock protection for the 
counter updates along with the corresponding resource request/release 
calls, so that the case described above is covered.

Fixes: b45d52797432 ("sb1250-duart.c: SB1250 DUART serial support")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
New change in v2.
---
 drivers/tty/serial/sb1250-duart.c |   28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

linux-serial-sb1250-duart-map-guard-spinlock.diff
Index: linux-macro/drivers/tty/serial/sb1250-duart.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/sb1250-duart.c
+++ linux-macro/drivers/tty/serial/sb1250-duart.c
@@ -86,7 +86,8 @@ struct sbd_port {
 struct sbd_duart {
 	struct sbd_port		sport[2];
 	unsigned long		mapctrl;
-	atomic_t		map_guard;
+	spinlock_t		map_lock;
+	int			map_guard;
 };
 
 #define to_sport(uport) container_of(uport, struct sbd_port, port)
@@ -662,16 +663,18 @@ static void sbd_release_port(struct uart
 {
 	struct sbd_port *sport = to_sport(uport);
 	struct sbd_duart *duart = sport->duart;
-	int map_guard;
+	unsigned long flags;
 
 	iounmap(sport->memctrl);
 	sport->memctrl = NULL;
 	iounmap(uport->membase);
 	uport->membase = NULL;
 
-	map_guard = atomic_add_return(-1, &duart->map_guard);
-	if (!map_guard)
+	spin_lock_irqsave(&duart->map_lock, flags);
+	if (!--duart->map_guard)
 		release_mem_region(duart->mapctrl, DUART_CHANREG_SPACING);
+	spin_unlock_irqrestore(&duart->map_lock, flags);
+
 	release_mem_region(uport->mapbase, DUART_CHANREG_SPACING);
 }
 
@@ -706,7 +709,7 @@ static int sbd_request_port(struct uart_
 {
 	const char *err = KERN_ERR "sbd: Unable to reserve MMIO resource\n";
 	struct sbd_duart *duart = to_sport(uport)->duart;
-	int map_guard;
+	unsigned long flags;
 	int ret = 0;
 
 	if (!request_mem_region(uport->mapbase, DUART_CHANREG_SPACING,
@@ -714,22 +717,26 @@ static int sbd_request_port(struct uart_
 		printk(err);
 		return -EBUSY;
 	}
-	map_guard = atomic_add_return(1, &duart->map_guard);
-	if (map_guard == 1) {
+
+	spin_lock_irqsave(&duart->map_lock, flags);
+	if (!duart->map_guard++) {
 		if (!request_mem_region(duart->mapctrl, DUART_CHANREG_SPACING,
 					"sb1250-duart")) {
-			atomic_add(-1, &duart->map_guard);
+			--duart->map_guard;
 			printk(err);
 			ret = -EBUSY;
 		}
 	}
+	spin_unlock_irqrestore(&duart->map_lock, flags);
+
 	if (!ret) {
 		ret = sbd_map_port(uport);
 		if (ret) {
-			map_guard = atomic_add_return(-1, &duart->map_guard);
-			if (!map_guard)
+			spin_lock_irqsave(&duart->map_lock, flags);
+			if (!--duart->map_guard)
 				release_mem_region(duart->mapctrl,
 						   DUART_CHANREG_SPACING);
+			spin_unlock_irqrestore(&duart->map_lock, flags);
 		}
 	}
 	if (ret) {
@@ -800,6 +807,7 @@ static int __init sbd_probe(struct platf
 	chip = pdev->id;
 	sbd_duarts[chip].mapctrl = mem_resource->start +
 				   DUART_CHANREG_SPACING * 3;
+	spin_lock_init(&sbd_duarts[chip].map_lock);
 	for (side = 0; side < DUART_MAX_SIDE; side++) {
 		struct sbd_port *sport = &sbd_duarts[chip].sport[side];
 		struct uart_port *uport = &sport->port;

