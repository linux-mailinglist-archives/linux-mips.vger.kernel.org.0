Return-Path: <linux-mips+bounces-14435-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAmbLIz++Gko4AIAu9opvQ
	(envelope-from <linux-mips+bounces-14435-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 22:16:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B284C373F
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 22:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F3BF301725B
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 20:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225052FF170;
	Mon,  4 May 2026 20:14:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF282F2914;
	Mon,  4 May 2026 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925651; cv=none; b=nL5dnppqqQUSI+7D32kZ34xhtQVuPOGGYIcjdCXRBU2vwVVRkMTGoNqMCOKf0S5OSpo1YlX5YJstwfI6iANzxBSJjemInkC+s18j7SouF+VD+dA/+lXCl++JJ1Lw3WC6SLUiyiX96KST7c3dErUtwG8U//oBPdCZryVDtzrdRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925651; c=relaxed/simple;
	bh=PRF5+fkdwIX87mEmUjo1mOwLXCyKvFfzttbdMHJLXQc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TMKSzY6IhV4o8qqKofZW4xg2y1yVgLlyQjKl7RDvSzI2JWW3zDzKrG2S4kXB20pbn9VIwnG6jT1xoy6UFiNJNZwx/qoXtVI17GN2BVsqVAnWn7eexmOCtQslErWMfnz/2xPKy4BB/qKE7RpxtYlSt5+VQ9hm2PoPQ3qz4t2zm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4DC6592009C; Mon,  4 May 2026 22:14:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 479D392009B;
	Mon,  4 May 2026 21:14:08 +0100 (BST)
Date: Mon, 4 May 2026 21:14:08 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: DEC: Fix prototypes for halt/reset handlers
In-Reply-To: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605042103140.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605042005080.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A9B284C373F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14435-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.931];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,angie.orcam.me.uk:mid]

Remove a bunch of compilation warnings for halt/reset handlers:

arch/mips/dec/reset.c:22:17: warning: no previous prototype for 'dec_machine_restart' [-Wmissing-prototypes]
   22 | void __noreturn dec_machine_restart(char *command)
      |                 ^~~~~~~~~~~~~~~~~~~
arch/mips/dec/reset.c:27:17: warning: no previous prototype for 'dec_machine_halt' [-Wmissing-prototypes]
   27 | void __noreturn dec_machine_halt(void)
      |                 ^~~~~~~~~~~~~~~~
arch/mips/dec/reset.c:32:17: warning: no previous prototype for 'dec_machine_power_off' [-Wmissing-prototypes]
   32 | void __noreturn dec_machine_power_off(void)
      |                 ^~~~~~~~~~~~~~~~~~~~~
arch/mips/dec/reset.c:38:13: warning: no previous prototype for 'dec_intr_halt'
[-Wmissing-prototypes]
   38 | irqreturn_t dec_intr_halt(int irq, void *dev_id)
      |             ^~~~~~~~~~~~~

(which get promoted to compilation errors with CONFIG_WERROR), by moving 
the local prototypes from arch/mips/dec/setup.c to a dedicated header 
for arch/mips/dec/reset.c to use as well.  No functional change.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/reset.c             |    2 ++
 arch/mips/dec/setup.c             |    6 +-----
 arch/mips/include/asm/dec/reset.h |   19 +++++++++++++++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

linux-mips-dec-reset.diff
Index: linux-macro/arch/mips/dec/reset.c
===================================================================
--- linux-macro.orig/arch/mips/dec/reset.c
+++ linux-macro/arch/mips/dec/reset.c
@@ -10,6 +10,8 @@
 
 #include <asm/addrspace.h>
 
+#include <asm/dec/reset.h>
+
 typedef void __noreturn (* noret_func_t)(void);
 
 static inline void __noreturn back_to_prom(void)
Index: linux-macro/arch/mips/dec/setup.c
===================================================================
--- linux-macro.orig/arch/mips/dec/setup.c
+++ linux-macro/arch/mips/dec/setup.c
@@ -48,14 +48,10 @@
 #include <asm/dec/kn02ca.h>
 #include <asm/dec/kn03.h>
 #include <asm/dec/kn230.h>
+#include <asm/dec/reset.h>
 #include <asm/dec/system.h>
 
 
-extern void dec_machine_restart(char *command);
-extern void dec_machine_halt(void);
-extern void dec_machine_power_off(void);
-extern irqreturn_t dec_intr_halt(int irq, void *dev_id);
-
 unsigned long dec_kn_slot_base, dec_kn_slot_size;
 
 EXPORT_SYMBOL(dec_kn_slot_base);
Index: linux-macro/arch/mips/include/asm/dec/reset.h
===================================================================
--- /dev/null
+++ linux-macro/arch/mips/include/asm/dec/reset.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *	arch/mips/include/asm/dec/reset.h
+ *
+ *	DECstation/DECsystem halt/reset support.
+ *
+ *	Copyright (C) 2026  Maciej W. Rozycki
+ */
+#ifndef __ASM_DEC_RESET_H
+#define __ASM_DEC_RESET_H
+
+#include <linux/compiler_attributes.h>
+
+void __noreturn dec_machine_restart(char *command);
+void __noreturn dec_machine_halt(void);
+void __noreturn dec_machine_power_off(void);
+irqreturn_t dec_intr_halt(int irq, void *dev_id);
+
+#endif /* __ASM_DEC_RESET_H */

