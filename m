Return-Path: <linux-mips+bounces-14489-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPaHDNrD+2kPEgAAu9opvQ
	(envelope-from <linux-mips+bounces-14489-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:42:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472E4E14F6
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 484B13008220
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 22:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE70371D00;
	Wed,  6 May 2026 22:42:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436F3361DDC;
	Wed,  6 May 2026 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107351; cv=none; b=QKR+AvAD1/WliVRxnN2MPwBo8TvvgXjzHzsd2ij+Os8M1tJgQ4/cEVF2GVZ13F9+PNmvbfSorH8EnfiiK1n7h/6cq3J+cz9MMZzyuX+6M+V8098tALGylPv3QYe6HVJFWnmypA+IYNVgIRjdwm0OsLNInBu55KKebMITfoWU0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107351; c=relaxed/simple;
	bh=amUZJWReVasLJGK8c8tLFrgBtVIIu30nyPri4vhxOrU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mk5v4jBPg1SHyLBqwa8OPdbfxOT+EwbQEYVODxuPyh99EqU3S/lLDpz92M7+8uguF5jFececZQjs2XUf3qwkUZml4/+TFHXwGtwCiITrO8IIZ5mAQG3htNiE4JN+THn+2Z4Jz5lERMCRCfIPa5QNAG9HBkdYfxoampEjrB74BEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A20919200B3; Thu,  7 May 2026 00:42:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9C07992009B;
	Wed,  6 May 2026 23:42:27 +0100 (BST)
Date: Wed, 6 May 2026 23:42:27 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v3 02/10] MIPS: DEC: Prevent initial console buffer from
 landing in XKPHYS
In-Reply-To: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605062253010.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8472E4E14F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14489-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In 64-bit configurations calling the initial console output handler from 
a kernel thread other than the initial one will result in a situation 
where the stack has been placed in the XKPHYS 64-bit memory segment and 
consequently so has been the buffer allocated there that is used as the 
argument corresponding to the `%s' output conversion specifier for the 
firmware's printf() entry point.

This 64-bit address will then be truncated by 32-bit firmware, resulting 
in an attempt to access the wrong memory location, which in turn will 
cause all kinds of unpredictable behaviour, such as a kernel crash:

  Console: colour dummy device 160x64
  Calibrating delay loop... 49.36 BogoMIPS (lpj=192512)
  pid_max: default: 32768 minimum: 301
  CPU 0 Unable to handle kernel paging request at virtual address 000000000203bd00, epc == ffffffffbfc08364, ra == ffffffffbfc08800
  Oops[#1]:
  CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc2-00254-gfb649bda6f56-dirty #121
  $ 0   : 0000000000000000 0000000000000001 0000000000000023 ffffffff80684ba0
  $ 4   : 000000000203bd00 ffffffffbfc0f3b4 ffffffffffffffff 0000000000000073
  $ 8   : 0a303d7469000000 0000000000000000 0000000000000073 ffffffffbfc0f473
  $12   : 0000000000000002 0000000000000000 ffffffff80684c1c 0000000000000000
  $16   : 0000000000000000 ffffffff80596dc9 0000000000000000 ffffffffbfc09240
  $20   : ffffffff80684c40 ffffffffbfc0f400 000000000000002d 000000000000002b
  $24   : ffffffffffffffbf 000000000203bd00                                  
  $28   : ffffffff805f0000 ffffffff80684b58 0000000000000030 ffffffffbfc08800
  Hi    : 0000000000000000
  Lo    : 0000000000000aa8
  epc   : ffffffffbfc08364 0xffffffffbfc08364
  ra    : ffffffffbfc08800 0xffffffffbfc08800
  Status: 140120e2        KX SX UX KERNEL EXL 
  Cause : 00000008 (ExcCode 02)
  BadVA : 000000000203bd00
  PrId  : 00000430 (R4000SC)
  Modules linked in:
  Process swapper (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
  Stack : 0000000000000000 0000000000000000 0000000000000000 0000004d0000004d
          80684cc0806a2a40 80596dc80000004d 8061000000000000 bfc0850c80684c38
          0000000000000000 000000000203bd00 0000000000000000 0000000000000000
          0000000000000000 00000000bfc0f3b4 0000000000000000 0000000000000000
          0000000000000000 0000000000000000 0000000000000000 0000000000000000
          0000000000000000 0000000000000000 0000000000000000 0000000000000000
          0000002500000000 0000000000000000 0000000000000000 802c1a7400000000
          0203bd0080596dc8 0203bd4d69000000 6c61632000000018 5f746567646e6172
          6c616320625f6d6f 5f736e5f6d6f7266 206361323778302b 303d74696e726320
          806a0a38806b0000 806a0a38806b0000 00000000806b0000 80683c58806b0000
          ...
  Call Trace:
  
  
  Code: a082ffff  03e00008  00601021 <80820000> 00001821  10400005  24840001  80820000  24630001 
  
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: Fatal exception in interrupt
  
  KN04 V2.1k    (PC: 0xa0026768, SP: 0x806848e8)
  >>

In this case the pointer in $4 was truncated from 0x980000000203bd00 to 
0x000000000203bd00.

This may happen when no final console driver has been enabled in the 
configuration and consequently the initial console continues being used 
late into bootstrap or with an upcoming change that will switch the zs 
driver to use a platform device, which in turn will make the console 
handover happen only after other kernel threads have already been 
started.

Fix the issue by making the buffer static and initdata, and therefore 
placed in the CKSEG0 32-bit compatibility segment, observing that the 
console output handler is called with the console lock held, implying 
no need for this code to be reentrant.  Add an assertion to verify the 
buffer actually has been placed in a compatibility segment.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: stable@vger.kernel.org # v2.6.12+
---
Changes from v2, 
<https://lore.kernel.org/r/alpine.DEB.2.21.2605010059310.38805@angie.orcam.me.uk/>:

- Cast `buf' to `long' before casting to `int', fixing:

  In file included from ./include/linux/bug.h:5,
                   from arch/mips/dec/prom/console.c:7:
  arch/mips/dec/prom/console.c: In function 'prom_console_write':
  arch/mips/dec/prom/console.c:21:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     21 |         BUG_ON((long)buf != (int)buf);
        |                             ^
  ./arch/mips/include/asm/bug.h:34:44: note: in definition of macro 'BUG_ON'
     34 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
        |                                            ^

New change in v2.
---
 arch/mips/dec/prom/console.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

linux-mips-dec-prom-console-xkphys.diff
Index: linux-macro/arch/mips/dec/prom/console.c
===================================================================
--- linux-macro.orig/arch/mips/dec/prom/console.c
+++ linux-macro/arch/mips/dec/prom/console.c
@@ -2,8 +2,9 @@
 /*
  *	DECstation PROM-based early console support.
  *
- *	Copyright (C) 2004, 2007  Maciej W. Rozycki
+ *	Copyright (C) 2004, 2007, 2026  Maciej W. Rozycki
  */
+#include <linux/bug.h>
 #include <linux/console.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -14,9 +15,11 @@
 static void __init prom_console_write(struct console *con, const char *s,
 				      unsigned int c)
 {
-	char buf[81];
+	static char buf[81] __initdata = { 0 };
 	unsigned int chunk = sizeof(buf) - 1;
 
+	BUG_ON((long)buf != (int)(long)buf);
+
 	while (c > 0) {
 		if (chunk > c)
 			chunk = c;

