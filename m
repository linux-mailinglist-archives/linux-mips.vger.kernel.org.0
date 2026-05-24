Return-Path: <linux-mips+bounces-14728-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yId2JeGFE2rFCwcAu9opvQ
	(envelope-from <linux-mips+bounces-14728-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:12:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F15C4B4F
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 01:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BC8F300440C
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2026 23:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9B93B3BE5;
	Sun, 24 May 2026 23:12:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DFA3B3BF0;
	Sun, 24 May 2026 23:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664348; cv=none; b=XmE4MKImacPQ3PZNpSdTVOl+arSIGsoMdoZdjGu1TOsUhCwWyOJm4FDgtXDl13r1cOMiwWufb1Mn/6cVv/k5/Dbyyw6HJ2fa45glI45AetDktdPv7KoEzWXOXE48cq474eNd3dm/irFSEQoqR7UAvJifuK58jUqz0Ol+KL5shJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664348; c=relaxed/simple;
	bh=zZ3NDP9gal7k+hEf6zlir6KCHnEXv34AglStD6PZ2qc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GjN11YGmrz5+N8vOIRpTsXy6hch/3syY0waHD2c0+nHpi1OazjclKTbPwUynYHSoIiLDk25l5zzwZB+rP/PS/9nsU0/IE+nS5BkukRsfXZZ1i/LmVmwBezgyrRVAnTR9Z+akVSe9vJLkScZlYu+YcbI3Ezk30vIZn9OSBH/qksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0C9379200B4; Mon, 25 May 2026 01:12:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0572592009E;
	Mon, 25 May 2026 00:12:24 +0100 (BST)
Date: Mon, 25 May 2026 00:12:24 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] Revert "drivers: convert sbd_duart.map_guard from
 atomic_t to refcount_t"
In-Reply-To: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605241628110.1450@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14728-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,orcam.me.uk:email,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: A22F15C4B4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Revert commit 22a33651a56f ("drivers: convert sbd_duart.map_guard from
atomic_t to refcount_t"), which broke perfectly valid code:

  ------------[ cut here ]------------
  WARNING: CPU: 1 PID: 1 at lib/refcount.c:114 sbd_request_port+0x54/0x140
  refcount_t: increment on 0; use-after-free.
  CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc2+ #34
  Stack : 0000000014001fe0 0000000000000000 ffffffff80830000 0000000000000000
          ffffffff8127bc7a ffffffff8016fe08 ffffffff808d0000 ffffffff808d0000
          ffffffff807aa828 ffffffff80822337 ffffffff808ce188 a8000001860b0000
          0000000000000001 0000000000000001 00000000000001c8 ffffffff808a3090
          00000000000000bb ffffffff801b09d4 a80000018609bb68 ffffffff801231cc
          ffffffff812a0000 ffffffff80171388 0000000000001000 ffffffff807aa828
          0000000000000001 0000000000000001 0000000000000000 0000000000000000
          0000000000000000 a80000018609bab0 0000000000000000 ffffffff803c47cc
          0000000000000000 0000000000000000 0000000000000000 0000000000000000
          ffffffff807cb648 ffffffff8010bff8 0000000014001fe1 ffffffff803c47cc
          ...
  Call Trace:
  [<ffffffff8010bff8>] show_stack+0x28/0x88
  [<ffffffff803c47cc>] dump_stack+0x8c/0xc0
  [<ffffffff801aff5c>] __warn+0xe0/0x114
  [<ffffffff801233f0>] warn_slowpath_fmt+0x40/0x50
  [<ffffffff80455bcc>] sbd_request_port+0x54/0x140
  [<ffffffff804563a4>] sbd_config_port+0x2c/0x68
  ---[ end trace f666d696412caa3e ]---

(report at the offending commit) -- sbd_request_port() is called twice
per DUART instance, to reserve a resource holding the control register
block shared between the two channels, so there's no slightest chance
for an overflow.  Also this doesn't stop the driver from working and
it's just the reservation that is missing as a result, i.e.:

10060100-100601ff : sb1250-duart
10060200-100602ff : sb1250-duart

as from the offending change, vs:

10060100-100601ff : sb1250-duart
10060200-100602ff : sb1250-duart
10060300-100603ff : sb1250-duart

beforehand, which is surely why the breakage has gone so long unnoticed.

"If it ain't broke, don't fix it," so just revert the broken commit.

Fixes: 22a33651a56f ("drivers: convert sbd_duart.map_guard from atomic_t to refcount_t")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
No change from v1 (4/4),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk/>.
---
 drivers/tty/serial/sb1250-duart.c |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

linux-serial-sb1250-duart-map-guard-atomic.diff
Index: linux-macro/drivers/tty/serial/sb1250-duart.c
===================================================================
--- linux-macro.orig/drivers/tty/serial/sb1250-duart.c
+++ linux-macro/drivers/tty/serial/sb1250-duart.c
@@ -34,8 +34,8 @@
 #include <linux/tty_flip.h>
 #include <linux/types.h>
 
-#include <linux/refcount.h>
-#include <linux/io.h>
+#include <linux/atomic.h>
+#include <asm/io.h>
 
 #include <asm/sibyte/sb1250.h>
 #include <asm/sibyte/sb1250_uart.h>
@@ -86,7 +86,7 @@ struct sbd_port {
 struct sbd_duart {
 	struct sbd_port		sport[2];
 	unsigned long		mapctrl;
-	refcount_t		map_guard;
+	atomic_t		map_guard;
 };
 
 #define to_sport(uport) container_of(uport, struct sbd_port, port)
@@ -662,13 +662,15 @@ static void sbd_release_port(struct uart
 {
 	struct sbd_port *sport = to_sport(uport);
 	struct sbd_duart *duart = sport->duart;
+	int map_guard;
 
 	iounmap(sport->memctrl);
 	sport->memctrl = NULL;
 	iounmap(uport->membase);
 	uport->membase = NULL;
 
-	if(refcount_dec_and_test(&duart->map_guard))
+	map_guard = atomic_add_return(-1, &duart->map_guard);
+	if (!map_guard)
 		release_mem_region(duart->mapctrl, DUART_CHANREG_SPACING);
 	release_mem_region(uport->mapbase, DUART_CHANREG_SPACING);
 }
@@ -704,6 +706,7 @@ static int sbd_request_port(struct uart_
 {
 	const char *err = KERN_ERR "sbd: Unable to reserve MMIO resource\n";
 	struct sbd_duart *duart = to_sport(uport)->duart;
+	int map_guard;
 	int ret = 0;
 
 	if (!request_mem_region(uport->mapbase, DUART_CHANREG_SPACING,
@@ -711,11 +714,11 @@ static int sbd_request_port(struct uart_
 		printk(err);
 		return -EBUSY;
 	}
-	refcount_inc(&duart->map_guard);
-	if (refcount_read(&duart->map_guard) == 1) {
+	map_guard = atomic_add_return(1, &duart->map_guard);
+	if (map_guard == 1) {
 		if (!request_mem_region(duart->mapctrl, DUART_CHANREG_SPACING,
 					"sb1250-duart")) {
-			refcount_dec(&duart->map_guard);
+			atomic_add(-1, &duart->map_guard);
 			printk(err);
 			ret = -EBUSY;
 		}
@@ -723,7 +726,8 @@ static int sbd_request_port(struct uart_
 	if (!ret) {
 		ret = sbd_map_port(uport);
 		if (ret) {
-			if (refcount_dec_and_test(&duart->map_guard))
+			map_guard = atomic_add_return(-1, &duart->map_guard);
+			if (!map_guard)
 				release_mem_region(duart->mapctrl,
 						   DUART_CHANREG_SPACING);
 		}

