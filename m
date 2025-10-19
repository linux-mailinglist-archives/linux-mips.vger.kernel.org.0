Return-Path: <linux-mips+bounces-11780-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9AFBEE3CF
	for <lists+linux-mips@lfdr.de>; Sun, 19 Oct 2025 13:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6029F400296
	for <lists+linux-mips@lfdr.de>; Sun, 19 Oct 2025 11:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA952E03E3;
	Sun, 19 Oct 2025 11:49:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4533C0C;
	Sun, 19 Oct 2025 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760874550; cv=none; b=GYSY0Ct7vHXUWuBvV2fo+h9plzyLHt9ddYMNfpKVOCtA9ZtQi0EkZ4MHRhSw+c13Wt5qlnoNiLnRHw8cTXDZy6ZZ1u3y0ROrB0Od2Ui71XkaqbLB+p4Lm7qzQCHDy51VJi+/oXUsUJKP0w8eX3B7LhQanQp1NVQlQFNDK0cpnOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760874550; c=relaxed/simple;
	bh=fgxfdA2VOsxH4LmxpL2Sqq2FCHp4vCTvZ0akuFgZbdk=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=gv2uL+S7JWpH0u8GiQOr++cZvNpaetVbFL3XYIqZGKNtoJCeHPN1fnZK2qGiVQ2/+oiZM7WXDZmKkACV2L5PHyLTwVM0V8Vw8lwZPqJQj4XggzPs1X583yjvQqiymqXyO9AEdnMCtxPk3WbYcfVJ7uJpMYfk68E5b4m9XVzyPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C82B392009C; Sun, 19 Oct 2025 13:49:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B87D192009B;
	Sun, 19 Oct 2025 12:49:02 +0100 (BST)
Date: Sun, 19 Oct 2025 12:49:02 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Marco Crivellari <marco.crivellari@suse.com>, 
    Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix whitespace damage in r4k_wait from VS timer fix
Message-ID: <alpine.DEB.2.21.2510191229030.39634@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Remove stray spaces/tabs introduced with commit 56651128e2fb ("MIPS: Fix 
idle VS timer enqueue") and add missing indentation for a branch delay 
slot.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
It would have been caught, for the most issues, with:

whitespace = indent-with-non-tab,space-before-tab,trailing-space

in git configuration.  Is there a way to get it propagated with checkouts?
---
 arch/mips/kernel/genex.S |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

linux-mips-idle-vs-timer-format.diff
Index: linux-macro/arch/mips/kernel/genex.S
===================================================================
--- linux-macro.orig/arch/mips/kernel/genex.S
+++ linux-macro/arch/mips/kernel/genex.S
@@ -109,7 +109,7 @@ NESTED(except_vec3_r4000, 0, sp)
 	.align	5
 LEAF(r4k_wait)
 	/* Keep the ISA bit clear for calculations on local labels here. */
-0:	.fill 	0
+0:	.fill	0
 	/* Start of idle interrupt region. */
 	local_irq_enable
 	/*
@@ -121,7 +121,7 @@ LEAF(r4k_wait)
 	 */
 1:	.fill	0
 	/* The R2 EI/EHB sequence takes 8 bytes, otherwise pad up.  */
-	.if		1b - 0b > 32
+	.if	1b - 0b > 32
 	.error	"overlong idle interrupt region"
 	.elseif	1b - 0b > 8
 	.align	4
@@ -146,10 +146,10 @@ LEAF(r4k_wait)
 	MFC0	k0, CP0_EPC
 	/* Subtract/add 2 to let the ISA bit propagate through the mask.  */
 	PTR_LA	k1, r4k_wait_insn - 2
-	ori 	k0, r4k_wait_idle_size - 2
+	ori	k0, r4k_wait_idle_size - 2
 	.set	noreorder
 	bne	k0, k1, \handler
-	PTR_ADDIU 	k0, r4k_wait_exit - r4k_wait_insn + 2
+	 PTR_ADDIU	k0, r4k_wait_exit - r4k_wait_insn + 2
 	.set	reorder
 	MTC0	k0, CP0_EPC
 	.set pop

