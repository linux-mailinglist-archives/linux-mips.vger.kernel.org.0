Return-Path: <linux-mips+bounces-14425-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAJTKTA09Wm4JQIAu9opvQ
	(envelope-from <linux-mips+bounces-14425-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:16:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 088624B0392
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 01:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A75C30147AD
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2026 23:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E9637F75A;
	Fri,  1 May 2026 23:15:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E7D375F99;
	Fri,  1 May 2026 23:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677323; cv=none; b=O27aTP4CR2SMJORqyfdnfLngiRwxoGedPEGi37VrqBkvxdBC5dBBFQSbkbDaGmTgSh5PIYOmQSGxqBm9lcxg32L02sFi6xroaudE11nqAnjrzgu8Hld+YrBpcuBGrp/vwXHci/tgzejSnmgUvUHJfo8CUlWvU8/vaMqCjddp2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677323; c=relaxed/simple;
	bh=lTRG6Xg/JXBzZvEp9RfK/Dlcu7NxQzX0qVvYVae+Boc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KKxL8VUopcvCudRxlefQdrvzwj8kUITY2oUf0EQcgDpyc2o7fS0q1L6korcsqa+YZacRmp0uJkayfogUfkg15Rlf6FaufqSOLhEUtxo7+qA3vuxnm8PbzDa5/BhR8EB5I8s6cOeznMZQB6K4lSgBdiOgOf3O3RBhg3G8JrPBvww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 29B8F92009D; Sat,  2 May 2026 01:15:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2473792009C;
	Sat,  2 May 2026 00:15:21 +0100 (BST)
Date: Sat, 2 May 2026 00:15:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v2 09/10] serial: dz: Enable modular build
In-Reply-To: <alpine.DEB.2.21.2604302336260.38805@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605012103360.11074@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604302336260.38805@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 088624B0392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14425-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,angie.orcam.me.uk:mid]

Enable modular build since the driver now has a proper module_exit() 
handler.  There's nothing specific to DZ hardware to prevent driver 
unloading and reloading from working.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
No change from v1 (7/8),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604130133470.29980@angie.orcam.me.uk/>.
---
 drivers/tty/serial/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-serial-dz-module.diff
Index: linux-macro/drivers/tty/serial/Kconfig
===================================================================
--- linux-macro.orig/drivers/tty/serial/Kconfig
+++ linux-macro/drivers/tty/serial/Kconfig
@@ -335,7 +335,7 @@ config SERIAL_MAX310X
 	  Say Y here if you want to support this ICs.
 
 config SERIAL_DZ
-	bool "DECstation DZ serial driver"
+	tristate "DECstation DZ serial driver"
 	depends on MACH_DECSTATION && 32BIT
 	select SERIAL_CORE
 	default y

