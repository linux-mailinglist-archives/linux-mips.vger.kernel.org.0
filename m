Return-Path: <linux-mips+bounces-13977-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJC6AuH4x2lMfQUAu9opvQ
	(envelope-from <linux-mips+bounces-13977-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 16:50:57 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA334F001
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 16:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70A503042D5C
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63430377ECF;
	Sat, 28 Mar 2026 15:50:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D94E34889C;
	Sat, 28 Mar 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713009; cv=none; b=nveKZZxnvzmGJT3pWVmaYOTJ87JxRG5Gmpl0KrpVSsD3VOQl7PFoCk2xnJOs00LrHqs+CoUbm3yFZ5e6aZhdWUkvO5diUmAOl977y+ez6ePXAuodharSqohYHGdPXjYzeVkY630GifHCylWgO8QJxjDMpk+5jhQ0IQpccs3ntgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713009; c=relaxed/simple;
	bh=7QqrdrR9mDzQY48hShkFWod0E5CztNim8nORaozBYNE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H+uH9nbYKZkcC+rpu0I52SjyOwW/9/Z4Z91CbC8SANlJuljLnHbV4Iw+UbUQ2tr/+JG+sYE6pipOnVkQlIOR9tdyJNQL8m7lMYRRSb334gGdQCh+9jCX6U7HvfWjg69KbluQ5++GpHI2mESL7zeuQSpuIwp7kYgxrl+3F0vnSr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 166B592009D; Sat, 28 Mar 2026 16:50:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1017292009C;
	Sat, 28 Mar 2026 15:50:06 +0000 (GMT)
Date: Sat, 28 Mar 2026 15:50:05 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: DEC: Rate-limit memory errors for non-KN01 parity
 systems
In-Reply-To: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603281522221.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-13977-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 70EA334F001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similarly to memory errors in ECC systems also rate-limit memory parity 
errors for KN02-BA, KN02-CA, KN04-BA, KN04-CA DECstation and DECsystem 
models.  Unlike with ECC these events are always fatal and are less 
likely to cause a message flood, but handle them the same way for 
consistency.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/kn02xa-berr.c |   26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

linux-mips-dec-berr-ratelimit-kn02xa.diff
Index: linux-macro/arch/mips/dec/kn02xa-berr.c
===================================================================
--- linux-macro.orig/arch/mips/dec/kn02xa-berr.c
+++ linux-macro/arch/mips/dec/kn02xa-berr.c
@@ -6,12 +6,13 @@
  *	DECstation/DECsystem 5000/20, /25, /33 (KN02-CA), 5000/50
  *	(KN04-CA) systems.
  *
- *	Copyright (c) 2005  Maciej W. Rozycki
+ *	Copyright (c) 2005, 2026  Maciej W. Rozycki
  */
 
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/ratelimit.h>
 #include <linux/types.h>
 
 #include <asm/addrspace.h>
@@ -50,6 +51,10 @@ static int dec_kn02xa_be_backend(struct
 	static const char paritystr[] = "parity error";
 	static const char lanestat[][4] = { " OK", "BAD" };
 
+	static DEFINE_RATELIMIT_STATE(rs,
+				      DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
+
 	const char *kind, *agent, *cycle, *event;
 	unsigned long address;
 
@@ -79,18 +84,19 @@ static int dec_kn02xa_be_backend(struct
 	if (is_fixup)
 		action = MIPS_BE_FIXUP;
 
-	if (action != MIPS_BE_FIXUP)
+	if (action != MIPS_BE_FIXUP && __ratelimit(&rs)) {
 		printk(KERN_ALERT "Bus error %s: %s %s %s at %#010lx\n",
 			kind, agent, cycle, event, address);
 
-	if (action != MIPS_BE_FIXUP && address < 0x10000000)
-		printk(KERN_ALERT "  Byte lane status %#3x -- "
-		       "#3: %s, #2: %s, #1: %s, #0: %s\n",
-		       (mer & KN02XA_MER_BYTERR) >> 8,
-		       lanestat[(mer & KN02XA_MER_BYTERR_3) != 0],
-		       lanestat[(mer & KN02XA_MER_BYTERR_2) != 0],
-		       lanestat[(mer & KN02XA_MER_BYTERR_1) != 0],
-		       lanestat[(mer & KN02XA_MER_BYTERR_0) != 0]);
+		if (address < 0x10000000)
+			printk(KERN_ALERT "  Byte lane status %#3x -- "
+			       "#3: %s, #2: %s, #1: %s, #0: %s\n",
+			       (mer & KN02XA_MER_BYTERR) >> 8,
+			       lanestat[(mer & KN02XA_MER_BYTERR_3) != 0],
+			       lanestat[(mer & KN02XA_MER_BYTERR_2) != 0],
+			       lanestat[(mer & KN02XA_MER_BYTERR_1) != 0],
+			       lanestat[(mer & KN02XA_MER_BYTERR_0) != 0]);
+	}
 
 	return action;
 }

