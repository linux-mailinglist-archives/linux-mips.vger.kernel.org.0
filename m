Return-Path: <linux-mips+bounces-14434-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPUxEmX++Gko4AIAu9opvQ
	(envelope-from <linux-mips+bounces-14434-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 22:15:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BA4C3730
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 22:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C541930265B5
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 20:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89332302756;
	Mon,  4 May 2026 20:14:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8DD286D57;
	Mon,  4 May 2026 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925643; cv=none; b=kSZ5hZwpkDroq78J9BeLpicZgIpEfqMe/26TWwzAH69LOIayufyqD9Ih6ajiqhoAMlao7afgKFkSBL6ujrg2zW+KXTTWDQ8hRVtOfzTtf9E3Ft/k2JzSeY8H7Lo4GTm8Ie2CQaSBqQxR6GwauYCt7bhdahjqRA6ijQf8yWHtP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925643; c=relaxed/simple;
	bh=BAnEYV6ua/2XNaJoeYD8lJHsuofJXEJOWqZqAEm546U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cjI1Q2zUP6kPGKifUvIhfPHSea3jQiLeoC3uPWBXs7aHlOfWB7D9d3ViApKQYyzVvbN0k1SySwU8sBFqKSxxjG06yMJlgOcib9P/9aSsIiY/ko55/rgFXqbSGvTFLMVXG5lbiPbziyuPGtg4J9CK2LY1fdu+U2EHK5GuG/ZrUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6470392009C; Mon,  4 May 2026 22:14:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 60E6292009B;
	Mon,  4 May 2026 21:14:00 +0100 (BST)
Date: Mon, 4 May 2026 21:14:00 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: DEC: Remove do_IRQ() call indirection
In-Reply-To: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605042030580.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8D1BA4C3730
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
	TAGGED_FROM(0.00)[bounces-14434-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.935];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

As from commit 8f99a1626535 ("MIPS: Tracing: Add IRQENTRY_EXIT section 
for MIPS") do_IRQ() is not a macro anymore and can be invoked directly 
from assembly code, as a tail call.  Remove the dec_irq_dispatch() stub 
then and the indirection previously introduced with commit 187933f23679 
("[MIPS] do_IRQ cleanup"), improving performance by reducing the number 
of control flow changes and the overall instruction count, while fixing 
a compiler's complaint about a missing prototype for said stub:

arch/mips/dec/setup.c:780:25: warning: no previous prototype for 'dec_irq_dispatch' [-Wmissing-prototypes]
  780 | asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
      |                         ^~~~~~~~~~~~~~~~

(which gets promoted to a compilation error with CONFIG_WERROR).

Fixes: 8f99a1626535 ("MIPS: Tracing: Add IRQENTRY_EXIT section for MIPS")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/int-handler.S |    2 +-
 arch/mips/dec/setup.c       |    6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

linux-mips-dec-do-irq.diff
Index: linux-macro/arch/mips/dec/int-handler.S
===================================================================
--- linux-macro.orig/arch/mips/dec/int-handler.S
+++ linux-macro/arch/mips/dec/int-handler.S
@@ -277,7 +277,7 @@
 		 srlv	t3,t1,t2
 
 handle_it:
-		j	dec_irq_dispatch
+		j	do_IRQ
 		 nop
 
 #if defined(CONFIG_32BIT) && defined(CONFIG_MIPS_FP_SUPPORT)
Index: linux-macro/arch/mips/dec/setup.c
===================================================================
--- linux-macro.orig/arch/mips/dec/setup.c
+++ linux-macro/arch/mips/dec/setup.c
@@ -776,9 +776,3 @@ void __init arch_init_irq(void)
 			pr_err("Failed to register halt interrupt\n");
 	}
 }
-
-asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
-{
-	do_IRQ(irq);
-	return 0;
-}

