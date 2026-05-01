Return-Path: <linux-mips+bounces-14415-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIWuEZA09Wm4JQIAu9opvQ
	(envelope-from <linux-mips+bounces-14415-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:17:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A430C4B03C9
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E4E43013495
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2026 23:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7458323416;
	Fri,  1 May 2026 23:14:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEEC3603FC;
	Fri,  1 May 2026 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677270; cv=none; b=BINWeJWwLeQ/DAvoqpfZI1Ma6SqhU0TO3zae4ZghRUUizE63/0VrGgfikD29I3rnZ7CVmY+vcJa7R/6rk67QLzVZF7f+Uy/3F1IBCZ8v2dZYFpm7NM2K2QZPqds/BfLtomTFXm9Y+OmZcf0T0BmtPRBODyIJHfTibisWxvpSe+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677270; c=relaxed/simple;
	bh=tCWOcQ533B7x5m/vluI5paFFtXWAJfoAerA609/jWnI=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZI04DP+6/JYtVjh65vfOad45hj0BlgBc+DB9bV6jPtQ9fGDz0fLDoiN2uy6Fdo7Yo3hbV51jIdVPNuJvhCqoxWcwgXxKeuTKU1JHRQnNRN26mirpU731Q85+zZCpoSQWn2lRcYD30RyugA3NRuyA2IyLfOn2OwmayYBz73NDq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E83CA92009D; Sat,  2 May 2026 01:14:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E511992009C;
	Sat,  2 May 2026 00:14:20 +0100 (BST)
Date: Sat, 2 May 2026 00:14:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix big-endian stack argument fetching in o32
 wrapper
Message-ID: <alpine.DEB.2.21.2604302350440.38805@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A430C4B03C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14415-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,orcam.me.uk:email,angie.orcam.me.uk:mid]

Fix an issue in call_o32() where the upper 32-bit half of incoming n64 
stack arguments is fetched and used for outgoing o32 stack arguments on 
big-endian platforms.

This code was adapted from arch/mips/dec/prom/call_o32.S which was meant 
for a little-endian platform only and therefore using 32-bit loads from 
64-bit stack slot locations holding incoming stack arguments resulted in 
correct values being retrieved for data that is expected to be 32-bit.  

This works on little-endian platforms where the lower 32-bit half of the 
64-bit value is located at every 64-bit stack slot location.  However on 
big-endian platforms the lower 32-bit half is instead located at offset 
4 from every 64-bit stack slot location.

So to fix the issue the offset of 4 would have to be used on big-endian 
platforms only, or alternatively a 64-bit load from the 64-bit stack 
slot location can be used across the board, as the subsequent 32-bit 
store to the corresponding outgoing stack argument slot will correctly 
truncate the value and cause no unpredictable result.  We already take 
advantage of this architectural feature for the incoming arguments held 
in $a6 and $a7 registers, since the o32 wrapper does not know how many 
incoming arguments there are and consequently propagates incoming data 
which may not be 32-bit.

Since this code is generally supposed to be used with the stack located 
in cached memory there is no extra overhead expected for 64-bit loads as 
opposed to 32-bit ones, so pick this variant for code simplicity.

Fixes: 231a35d37293 ("[MIPS] RM: Collected changes")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/fw/lib/call_o32.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-call-o32-endian.diff
Index: linux-macro/arch/mips/fw/lib/call_o32.S
===================================================================
--- linux-macro.orig/arch/mips/fw/lib/call_o32.S
+++ linux-macro/arch/mips/fw/lib/call_o32.S
@@ -74,7 +74,7 @@ NESTED(call_o32, O32_FRAMESZ, ra)
 		PTR_LA		t1,6*O32_SZREG(fp)
 		li		t2,O32_ARGC-6
 1:
-		lw		t3,(t0)
+		ld		t3,(t0)
 		REG_ADDU	t0,SZREG
 		sw		t3,(t1)
 		REG_SUBU	t2,1

