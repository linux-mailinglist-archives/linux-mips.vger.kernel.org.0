Return-Path: <linux-mips+bounces-14417-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMVgM+sz9Wm4JQIAu9opvQ
	(envelope-from <linux-mips+bounces-14417-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:14:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E49AA4B0328
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D82D630069B1
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2026 23:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF2378D93;
	Fri,  1 May 2026 23:14:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55778372684;
	Fri,  1 May 2026 23:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677286; cv=none; b=D27aZgvEA32Un34d8pBrnOXi73h/dCuabdT1+r13fPXMpcg1a318ruv3e7c/pdBWT46mubKhPvGbq/krDnAOGFAbytPFJMXaBzNAAN+Y/+HS6r3rB74pgEHETBW3EV1iTRM1OMMc7aWIla0xie1SDMpTH+ZZQcKoAB0jC0YI2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677286; c=relaxed/simple;
	bh=sC/yL1DQTGdP2j2upw95QM5CtWeb/e+qem3uDlE/pRg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FTAn0ioIV/atqJSNHksmEkJvyaIaBZit67AYwTgQOqc59Wy8uJlkCY1xNo7nXNH9yB4LA4WehL8YHDPNLraDm/8cIxkMdiARWOPcAqLrJ/1gsGhjbt4RWzYpgnA9oBeCDJuOFK4SMq4wOifp+OH4w5F9xGs3kxaihE+tEJHI1pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CCE5492009E; Sat,  2 May 2026 01:14:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C82E892009C;
	Sat,  2 May 2026 00:14:43 +0100 (BST)
Date: Sat, 2 May 2026 00:14:43 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v2 01/10] MIPS: DEC: Ensure 32-bit stack location for o32
 prom_printf()
In-Reply-To: <alpine.DEB.2.21.2604302336260.38805@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605010132340.38805@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604302336260.38805@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E49AA4B0328
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.997];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14417-lists,linux-mips=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6]

In 64-bit configurations calling any firmware entry points from a kernel 
thread other than the initial one will result in a situation where the 
stack has been placed in the XKPHYS 64-bit memory segment.

Consequently the stack pointer is no longer a 32-bit value and when the 
32-bit firmware code called uses 32-bit ALU operations to manipulate the 
stack pointer, the calculated result is incorrect (in fact in the 64-bit 
MIPS ISA almost all 32-bit ALU operations will produce an unpredictable 
result when executed on 64-bit data) and control goes astray.

This may happen when no final console driver has been enabled in the
configuration and consequently the initial console continues being used
late into bootstrap, or with an upcoming change that will switch the zs
driver to use a platform device, which in turn will make the console
handover happen only after other kernel threads have already been
started, and the kernel will hang at:

  pid_max: default: 32768 minimum: 301

or somewhat later, but always before:

  cblist_init_generic: Setting adjustable number of callback queues.

has been printed.

It seems that only the prom_printf() entry point is affected.  Of all 
the other entry points wired only rex_slot_address() and rex_gettcinfo() 
are called from a kernel thread other than the initial one, specifically 
kernel_init(), and they are leaf functions that do no business with the 
stack, having worked with no issue ever since 64-bit support was added 
for the platform back in 2002.

To address this issue then, arrange for the stack to be switched in the 
o32 wrapper as required for prom_printf() only, by supplying call_o32() 
with a pointer to a chunk of initdata space, which is placed in the 
CKSEG0 32-bit compatibility segment, observing that prom_printf() is 
only called from console output handler and therefore with the console 
lock held, implying no need for this code to be reentrant.

Other firmware entry points may be called with interrupts enabled and no 
lock held, and may therefore require that call_o32() be reentrant.  They 
trigger no issue at this point and "if it ain't broke, don't fix it," so 
just leave them alone.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v2.6.12+
---
New change in v2.
---
 arch/mips/dec/prom/init.c        |    6 +++++-
 arch/mips/include/asm/dec/prom.h |   15 +++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

linux-mips-dec-call-o32-stack.diff
Index: linux-macro/arch/mips/dec/prom/init.c
===================================================================
--- linux-macro.orig/arch/mips/dec/prom/init.c
+++ linux-macro/arch/mips/dec/prom/init.c
@@ -3,7 +3,7 @@
  * init.c: PROM library initialisation code.
  *
  * Copyright (C) 1998 Harald Koerfgen
- * Copyright (C) 2002, 2004  Maciej W. Rozycki
+ * Copyright (C) 2002, 2004, 2026  Maciej W. Rozycki
  */
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -20,6 +20,10 @@
 #include <asm/dec/prom.h>
 
 
+#ifdef CONFIG_64BIT
+unsigned long o32_stk[O32_STK_SIZE] __initdata = { 0 };
+#endif
+
 int (*__rex_bootinit)(void);
 int (*__rex_bootread)(void);
 int (*__rex_getbitmap)(memmap *);
Index: linux-macro/arch/mips/include/asm/dec/prom.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/dec/prom.h
+++ linux-macro/arch/mips/include/asm/dec/prom.h
@@ -4,7 +4,7 @@
  *
  *	DECstation PROM interface.
  *
- *	Copyright (C) 2002  Maciej W. Rozycki
+ *	Copyright (C) 2002, 2026  Maciej W. Rozycki
  *
  *	Based on arch/mips/dec/prom/prom.h by the Anonymous.
  */
@@ -97,6 +97,17 @@ extern int (*__pmax_close)(int);
 
 #ifdef CONFIG_64BIT
 
+#define O32_STK_SIZE 512
+extern unsigned long o32_stk[];
+
+/* Switch the stack if outside the 32-bit address space.  */
+static inline unsigned long *o32_get_stk(void)
+{
+	long fp = (long)__builtin_frame_address(0);
+
+	return fp != (int)fp ? o32_stk + O32_STK_SIZE : NULL;
+}
+
 /*
  * On MIPS64 we have to call PROM functions via a helper
  * dispatcher to accommodate ABI incompatibilities.
@@ -128,7 +139,7 @@ int __DEC_PROM_O32(_prom_printf, (int (*
 
 #define prom_getchar()		_prom_getchar(__prom_getchar, NULL)
 #define prom_getenv(x)		_prom_getenv(__prom_getenv, NULL, x)
-#define prom_printf(x...)	_prom_printf(__prom_printf, NULL, x)
+#define prom_printf(x...)	_prom_printf(__prom_printf, o32_get_stk(), x)
 
 #else /* !CONFIG_64BIT */
 

