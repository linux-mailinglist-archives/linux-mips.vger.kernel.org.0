Return-Path: <linux-mips+bounces-14433-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK8bFT/++Gk14AIAu9opvQ
	(envelope-from <linux-mips+bounces-14433-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 22:14:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D304C3728
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 22:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC05A3024CBD
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 20:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E5F2F3621;
	Mon,  4 May 2026 20:13:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9890B3016E0;
	Mon,  4 May 2026 20:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925638; cv=none; b=g2J6f3U93C32A6pV2H8imL9SJcZpwsGP12kwGnFA+JH7Trke6wFfKIgKq+E8ojDlu6IFtW6mFafkPUIIenqMa3X9gXybnWvtD6+NlPOFLDimfKyZh6cW2bK2rUwAKZR3DyV6jpEcfTlGD6OWBINYwEtIVGeBczYdb1qaW4X0o4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925638; c=relaxed/simple;
	bh=A2XQd80Q47uTkFppBLqJ1O5tKATTgRqjha1HHpmAyfE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MmsaBzAiutkP4Dhhvj0+tEEPn5GdBcBsEYmPMvLq4kmQL1+b5GM+JxKRtY+bciOniD0QoxaoBrquZSdWbFL8e+E1ryHRcZjtn8UvZcN6rTI14ftMig2gTBcr+QonpgpHGPyP2BrDSGaByXOeoZm0OheQjulVbR5zcbfKBJJ+UWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A316F92009D; Mon,  4 May 2026 22:13:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 98BA492009B;
	Mon,  4 May 2026 21:13:55 +0100 (BST)
Date: Mon, 4 May 2026 21:13:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: Make do_IRQ() available for assembly callers
In-Reply-To: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605042053450.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A3D304C3728
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
	TAGGED_FROM(0.00)[bounces-14433-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.934];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

As from commit 8f99a1626535 ("MIPS: Tracing: Add IRQENTRY_EXIT section 
for MIPS") do_IRQ() is not a macro anymore and can be invoked directly 
from assembly code again, however its `asmlinkage' annotation has never 
been brought back from the previous removal of the function with commit 
187933f23679 ("[MIPS] do_IRQ cleanup").

Since calling the function directly from assembly code has a performance 
advantage, add the annotation back so that the DEC platform can make use 
of this again.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/include/asm/irq.h |    2 +-
 arch/mips/kernel/irq.c      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

linux-mips-do-irq-asmlinkage.diff
Index: linux-macro/arch/mips/include/asm/irq.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/irq.h
+++ linux-macro/arch/mips/include/asm/irq.h
@@ -54,7 +54,7 @@ static inline int irq_canonicalize(int i
 
 asmlinkage void plat_irq_dispatch(void);
 
-extern void do_IRQ(unsigned int irq);
+asmlinkage void do_IRQ(unsigned int irq);
 
 struct irq_domain;
 extern void do_domain_IRQ(struct irq_domain *domain, unsigned int irq);
Index: linux-macro/arch/mips/kernel/irq.c
===================================================================
--- linux-macro.orig/arch/mips/kernel/irq.c
+++ linux-macro/arch/mips/kernel/irq.c
@@ -100,7 +100,7 @@ static inline void check_stack_overflow(
  * SMP cross-CPU interrupts have their own specific
  * handlers).
  */
-void __irq_entry do_IRQ(unsigned int irq)
+asmlinkage void __irq_entry do_IRQ(unsigned int irq)
 {
 	irq_enter();
 	check_stack_overflow();

