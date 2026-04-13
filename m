Return-Path: <linux-mips+bounces-14103-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGY1Gcli3GkHQQkAu9opvQ
	(envelope-from <linux-mips+bounces-14103-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F923E6ED2
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FDFB3008784
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 03:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738CE2343BE;
	Mon, 13 Apr 2026 03:28:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEB823B638;
	Mon, 13 Apr 2026 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050886; cv=none; b=IVkKRG2p+mxrywvzJZJhskQrkHclVUBGuCit3juKh0PSUu9l/IAUVioC+erWF7CKrjukWNgU9LTsRsxDs1o0LwdBxL8HecoTwyjXeCiVo3uUtRUTyBure5FI7iKGMolp8yS4/jY+ttVXG+bMOyJ+dVB/we76uFF/sl2M0KC0apk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050886; c=relaxed/simple;
	bh=kbX4RYVW+2tirElf/rekTLbZ3V/3ME6REZGbnTJT+aE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nveq70KvIJfoUZ9wspy/VJEqOl8Rmfb7gfVBHyJjPpB/0hWNKFzsDh97oURaDgjZlLw28Yg5W3t35ZFVHvWjC3BEKty5GqLdVdyj5BFchFB7H2P58jx4TWvFuPGIOWwQLairg74Yx9UR+g7V3vk/MdDphwZm2Dyu3+NqL12JWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 55ADD92009D; Mon, 13 Apr 2026 05:27:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5247A92009B;
	Mon, 13 Apr 2026 04:27:58 +0100 (BST)
Date: Mon, 13 Apr 2026 04:27:58 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH 1/8] serial: dz: Fix bootconsole message clobbering at chip
 reset
In-Reply-To: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2604121508060.29980@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14103-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0F923E6ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In the DZ interface as implemented by the DC7085 gate array the serial 
transmitters are double buffered, meaning that at the time a transmitter 
is ready to accept the next character there is one in the transmit shift 
register still being sent to the line.  Issuing a master clear at this 
time causes this character to be lost, so wait an extra amount of time 
sufficient for the transmit shift register to drain at 9600bps, which is 
the baud rate setting used by the firmware console.

Mind the specified 1.4us TRDY recovery time in the course and continue 
using iob() as the completion barrier, since the platforms involved use 
a write buffer that can delay and combine writes, and reorder them with 
respect to reads regardless of the MMIO locations accessed and we still 
lack a platform-independent handler for that.

When called from dz_serial_console_init() this is too early for fsleep() 
to work and even before lpj has been calculated and therefore the delay 
is actually not sufficient for the transmitter to drain and is merely a 
placeholder now.  This will be addressed in a follow-up change.

Fixes: e6ee512f5a77 ("dz.c: Resource management")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v2.6.25+
---
 drivers/tty/serial/dz.c |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

linux-serial-dz-reset-drain.diff
Index: linux-macro/drivers/tty/serial/dz.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/dz.c
+++ linux-macro/drivers/tty/serial/dz.c
@@ -542,10 +542,31 @@ static int dz_encode_baud_rate(unsigned
 static void dz_reset(struct dz_port *dport)
 {
 	struct dz_mux *mux = dport->mux;
+	unsigned short tcr;
+	int loops = 10000;
 
 	if (mux->initialised)
 		return;
 
+	tcr = dz_in(dport, DZ_TCR);
+
+	/* Do not disturb any ongoing transmissions.  */
+	if (dz_in(dport, DZ_CSR) & DZ_MSE) {
+		unsigned short csr, mask;
+
+		mask = tcr;
+		while ((mask & DZ_LNENB) && loops--) {
+			csr = dz_in(dport, DZ_CSR);
+			if (!(csr & DZ_TRDY))
+				continue;
+			mask &= ~(1 << ((csr & DZ_TLINE) >> 8));
+			dz_out(dport, DZ_TCR, mask);
+			iob();
+			udelay(2);		/* 1.4us TRDY recovery.  */
+		}
+		udelay(1200);			/* Transmitter drain.  */
+	}
+
 	dz_out(dport, DZ_CSR, DZ_CLR);
 	while (dz_in(dport, DZ_CSR) & DZ_CLR);
 	iob();

