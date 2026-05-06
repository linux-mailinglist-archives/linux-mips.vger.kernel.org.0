Return-Path: <linux-mips+bounces-14497-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDj+MAXE+2keEgAAu9opvQ
	(envelope-from <linux-mips+bounces-14497-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:43:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549524E158C
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6538E300A775
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 22:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969E63B2FD1;
	Wed,  6 May 2026 22:43:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB9D3B38AD;
	Wed,  6 May 2026 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107382; cv=none; b=rcOVuZ4tm0ZDi1ppYGzR0yDD/adEpnpiqxbkW686JKCMq9DZKV5Oh75uO8JlvM8NtNkH3c09N26RrjZi5Z8/RPvWUD0LYT3rqJ1/dg5hgHeDZO6MzaGTLeBgU+kQAHKRNjXXAQxCvaRFgMdQqFHYs7vQX/OC+o+DgZXzv/7H3Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107382; c=relaxed/simple;
	bh=O0gvqeHkUEtW2z4BjFkJKfc/kiKXZGkIl+n4sc4U31o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O+hTOm8XL4UL5JIaI+H3eMWEH+tXuI0aBn8hKag2O8RYXIarFhNN/ecyRgld6sOheHL1Bw8bT0Duj8JA+zx1d3w4OXZhxDXkF2W3KBjm83TYaSbLl5+Ci4OS4a11pG/oJQ6YUcs46ITes9xbGyyfhiZq41fyoggI2p0rUo6iUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DD6569200C1; Thu,  7 May 2026 00:42:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id DAA0A9200C0;
	Wed,  6 May 2026 23:42:56 +0100 (BST)
Date: Wed, 6 May 2026 23:42:56 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v3 09/10] serial: dz: Enable modular build
In-Reply-To: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605062331420.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 549524E158C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14497-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,orcam.me.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Enable modular build since the driver now has a proper module_exit() 
handler.  There's nothing specific to DZ hardware to prevent driver 
unloading and reloading from working.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
No change from v2,
<https://lore.kernel.org/r/alpine.DEB.2.21.2605012103360.11074@angie.orcam.me.uk/>.

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

