Return-Path: <linux-mips+bounces-14115-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNPHGKVj3GkMQQkAu9opvQ
	(envelope-from <linux-mips+bounces-14115-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:31:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C17643E6FAD
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C06C3036D6B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 03:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4EB242D6A;
	Mon, 13 Apr 2026 03:28:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8650242D70;
	Mon, 13 Apr 2026 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050936; cv=none; b=b4PefagP6sFcBRnvu98REHcKvg3rHu8hSvbKeiLT7kA7AhODHVMnFhYwjml7D8OZpRY4oYY31kxfJilSbHsZyYuart5MPOH1Eg0Ww6O+R2ahz09iu1SePkP/swrKKxR6GulmukNnjKTvwBOLpmAkPvhNVM4f9JvLALqqwcNrYxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050936; c=relaxed/simple;
	bh=5EmAR8mcDhPuLz9ZXijmx2sHik2EgbNioPpNFyUHDfg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ukLkBLBThBMPWupoaIwk5ARi6aYH8IJru6KRWgqAdqLgCyOhy5i98DrDhFzoJxT1zyMH6/1diDU+ARL2pZhBeQf3CR3UKe+GmtQJFHZMU47ft64cjrC+Mp5Cnb4JdLxJ5ld8fTjstw5NeNhX14pgoxm1MJMAF8jSsJoqVI5Sqi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0333E92009C; Mon, 13 Apr 2026 05:28:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id F34F992009B;
	Mon, 13 Apr 2026 04:28:53 +0100 (BST)
Date: Mon, 13 Apr 2026 04:28:53 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: Elena Reshetova <elena.reshetova@intel.com>, 
    David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>, 
    Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Revert "drivers: convert sbd_duart.map_guard from atomic_t
 to refcount_t"
In-Reply-To: <alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2604130416440.29980@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604130239560.29980@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14115-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,orcam.me.uk:email,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: C17643E6FAD
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

