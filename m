Return-Path: <linux-mips+bounces-13976-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J5NHB/6x2lMfQUAu9opvQ
	(envelope-from <linux-mips+bounces-13976-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 16:56:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE13B34F0B8
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 16:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B9CB308F3F1
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9026F38A70D;
	Sat, 28 Mar 2026 15:50:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E969A387582;
	Sat, 28 Mar 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713004; cv=none; b=PMaPf/eSTz/I/HICN7VvhfN79rm05ORYnpgjiCaKU+DuAdGr5WhMgdm7UdM3g23qWDANZwC/ObjhALBGS40ecirk4FuKC6cd6xX1VlkeArinhymzzO/ZmX56z3SwbbKRwTLQcpfBZokMQwxhqzv6GWC5e97lNUEECqNJ4pvf+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713004; c=relaxed/simple;
	bh=z43/IEmW/ES6bq+gVhx4qcIV7gcTgXnq2zS0b43QB/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aT+vCTKRptb8fwv5T829X/VDxtX/aBO6BN4jf3y6Sa+0p1jbmD4RbgzRgNF7Cuphw6r0R7YNrmfNu/KtvPbHYBpGru4Gz9a/NK13ixu1o+2/vPkNJgR61LqVJ7LFahGKjN/ODsuNltCIgFICgaI3ttCSFs1lyFxZTHnPLStO5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8630C92009D; Sat, 28 Mar 2026 16:50:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 83CD292009B;
	Sat, 28 Mar 2026 15:50:01 +0000 (GMT)
Date: Sat, 28 Mar 2026 15:50:01 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: DEC: Rate-limit memory errors for KN01 systems
In-Reply-To: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603281514220.60268@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-13976-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,orcam.me.uk:email]
X-Rspamd-Queue-Id: BE13B34F0B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similarly to memory errors in ECC systems also rate-limit memory parity 
errors for KN01 DECstation and DECsystem models.  Unlike with ECC these 
events are always fatal and are less likely to cause a message flood, 
but handle them the same way for consistency.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/kn01-berr.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

linux-mips-dec-berr-ratelimit-kn01.diff
Index: linux-macro/arch/mips/dec/kn01-berr.c
===================================================================
--- linux-macro.orig/arch/mips/dec/kn01-berr.c
+++ linux-macro/arch/mips/dec/kn01-berr.c
@@ -4,7 +4,7 @@
  *	and 2100 (KN01) systems equipped with parity error detection
  *	logic.
  *
- *	Copyright (c) 2005  Maciej W. Rozycki
+ *	Copyright (c) 2005, 2026  Maciej W. Rozycki
  */
 
 #include <linux/init.h>
@@ -134,8 +134,8 @@ static int dec_kn01_be_backend(struct pt
 		action = MIPS_BE_FIXUP;
 
 	if (action != MIPS_BE_FIXUP)
-		printk(KERN_ALERT "Bus error %s: %s %s %s at %#010lx\n",
-			kind, agent, cycle, event, address);
+		pr_alert_ratelimited("Bus error %s: %s %s %s at %#010lx\n",
+				     kind, agent, cycle, event, address);
 
 	return action;
 }

