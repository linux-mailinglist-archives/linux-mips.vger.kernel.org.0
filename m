Return-Path: <linux-mips+bounces-14731-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VIXFA9KHE2o0DAcAu9opvQ
	(envelope-from <linux-mips+bounces-14731-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:20:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5299F5C4C1E
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47BAB30067B5
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2026 23:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6FA37B3F1;
	Sun, 24 May 2026 23:20:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645322F8E81;
	Sun, 24 May 2026 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664846; cv=none; b=YUZ0t5jwmxMoC6aHwZx6WOmZ1aQ60XSZmFsSWqXyx2pDnaulaBv9Mxz74cOX/84cOk7E+dEAhHpg6w5j6uzRJ2W1CFSbgFksly5rj4BhDRVMfUeC35raGV9yMhiDWbjQHolxhRroBd0SnjfaQXohmbN5B1qIae7zaAG9EYHfKwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664846; c=relaxed/simple;
	bh=dSpqvWLcenTGsHm74xZ1Rh/tXi1MqGz3aSfLvUUxsjE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WcDFhd1d+6N9gkboKcKYNgb1SC4cgIJdbXwPAUjablBryckcYJxwXMzQ2A5nllJE1go9HiRWvhLZIsKa003L5Iqq15miJ7/+DHs4QiLV256RbDdqtJ7TCI8Z8fP1Y9XS0QMw8AF+ViOLi8b9KR0IlQopQehi2Gij0ACoCQAbzq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0EC649200B3; Mon, 25 May 2026 01:12:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 07D7992009E;
	Mon, 25 May 2026 00:12:06 +0100 (BST)
Date: Mon, 25 May 2026 00:12:05 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] serial: sb1250-duart: Fix console message clobbering
 at channel resets
In-Reply-To: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605241620470.1450@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14731-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 5299F5C4C1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure any characters outstanding have been sent before issuing channel 
resets so as to prevent messages issued to the bootconsole from getting 
clobbered.

Contrary to device documentation at the time the transmitter empty bit 
is set only the transmit FIFO has been drained and there is still data 
outstanding in the transmitter shift register, so wait an extra amount 
of time for that register to drain too.  This also prevents subsequent 
messages produced to the console from getting clobbered, owing to what
seems a transmitter synchronisation issue.

When called from sbd_serial_console_init() it is too early for fsleep() 
to work and even before lpj has been calculated and therefore the delay 
is actually not sufficient for the transmitter to drain and is merely a 
placeholder now.  This will be addressed in a follow-up change.

Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v6.5+
---
Changes from v1 (1/4),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604130321540.29980@angie.orcam.me.uk/>:

- Sanitise the change heading.
---
 drivers/tty/serial/sb1250-duart.c |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

linux-serial-sb1250-duart-reset-drain.diff
Index: linux-macro/drivers/tty/serial/sb1250-duart.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/sb1250-duart.c
+++ linux-macro/drivers/tty/serial/sb1250-duart.c
@@ -516,6 +516,28 @@ static void sbd_init_port(struct sbd_por
 
 	if (sport->initialised)
 		return;
+	/*
+	 * Contrary to documentation, which says that the transmitter
+	 * empty bit is set when "there are no characters to send and
+	 * the transmitter is idle," the bit is already set by hardware
+	 * once the transmit FIFO has been drained only and while the
+	 * transmitter shift register still holds data being supplied
+	 * to the line.  Consequently issuing a transmitter reset at
+	 * this point causes the final character outstanding to be lost.
+	 *
+	 * Moreover, resetting the transmitter while transmission is
+	 * in progress appears to make the transmitter go out of sync
+	 * and subsequent characters issued after the transmitter has
+	 * been reprogrammed and re-enabled are sent corrupted or with
+	 * their bit patterns shifted.
+	 *
+	 * So once the transmitter empty bit has been set wait an extra
+	 * amount of time, sufficient for the transmitter shift register
+	 * to drain at 115200bps, which is the baud rate setting used by
+	 * a standard CFE firmware compilation.
+	 */
+	sbd_line_drain(sport);
+	udelay(100);
 
 	/* There is no DUART reset feature, so just set some sane defaults.  */
 	write_sbdchn(sport, R_DUART_CMD, V_DUART_MISC_CMD_RESET_TX);

