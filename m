Return-Path: <linux-mips+bounces-13973-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IdsIjPmx2kYegUAu9opvQ
	(envelope-from <linux-mips+bounces-13973-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:31:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0942034EAC8
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5230E301015C
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 14:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8524832B99F;
	Sat, 28 Mar 2026 14:29:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CC433A708;
	Sat, 28 Mar 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774708162; cv=none; b=ezrEBe2FCORgnAU4z5N0Fqr1QX3Ij5kE5Q5lH1uYEXzVaxbuTTCBnu5lDKJmCax1NX3u8fn2Tgu+uiqCIWxFIwmza1GOOwhB1CjIUCRwUKprkf2rVfZd5MUi9z/OwqNz7ySUaGFStyjcU2XjL8NaRhZH5TmMKV/2w0DWgP5e168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774708162; c=relaxed/simple;
	bh=FDc1xFUAAjSXJmFK7t/u9KcSPaRNU03niKj21iCVjko=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=BWt+M6BlSctxG/C15fEFJgQ6deuFWtaTKd5Q/w3KAiD+lOkqsSIA4VtabQ8nLtXc6FKqUpX6ycHHmk5Z48mtQtjr2VqQRonF40snDQv6Ia4z7ZIKn4QJ2AQqbOUsdsHi7r67tHdujzRQHRVhXe+cHurvhp6DA+ekk//ft/XS1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E76D692009C; Sat, 28 Mar 2026 15:29:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E4D7392009B;
	Sat, 28 Mar 2026 14:29:10 +0000 (GMT)
Date: Sat, 28 Mar 2026 14:29:10 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: Remove $0 clobber from `mult_sh_align_mod'
Message-ID: <alpine.DEB.2.21.2603281409240.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13973-lists,linux-mips=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,orcam.me.uk:email,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 0942034EAC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove rubbish $0 clobber added to inline asm within `mult_sh_align_mod' 
with the removal of support for GCC versions below 3.4 made with commit 
57810ecb581a ("MIPS: Remove GCC_IMM_ASM & GCC_REG_ACCUM macros").  

Previously a macro was used that, depending on GCC version, expanded to 
either `accum' or $0.  Since the latter choice was only a placeholder to 
keep the syntax consistent and the register referred is hardwired, there 
is no point in having it here as it has no effect on code generation.  

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/kernel/r4k-bugs64.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-cpu-bugs64-gcc-reg-accum-zero.diff
Index: linux-macro/arch/mips/kernel/r4k-bugs64.c
===================================================================
--- linux-macro.orig/arch/mips/kernel/r4k-bugs64.c
+++ linux-macro/arch/mips/kernel/r4k-bugs64.c
@@ -91,7 +91,7 @@ void mult_sh_align_mod(long *v1, long *v
 		".set	pop"
 		: "=&r" (lv1), "=r" (lw)
 		: "r" (m1), "r" (m2), "r" (s), "I" (0)
-		: "hi", "lo", "$0");
+		: "hi", "lo");
 	/* We have to use single integers for m1 and m2 and a double
 	 * one for p to be sure the mulsidi3 gcc's RTL multiplication
 	 * instruction has the workaround applied.  Older versions of

