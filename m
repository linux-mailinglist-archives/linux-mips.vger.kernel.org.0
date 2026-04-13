Return-Path: <linux-mips+bounces-14109-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG8bCeNi3GkMQQkAu9opvQ
	(envelope-from <linux-mips+bounces-14109-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A613E6F35
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 05:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E04D300CBF8
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 03:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0797F23EA84;
	Mon, 13 Apr 2026 03:28:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82532E3FE;
	Mon, 13 Apr 2026 03:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050905; cv=none; b=VbnNm/D/Xm2WiV54LhsklNp0Qc1/jb0psDcWa+8Sytc2rMDwSUE/qoixc0ERKiG2jeCMYhvgcmO6cAGgFcBwTyXoRwViT1qsrp/JKTqxFBYvZmHFcvaiLmJRK0/SIH/+9JlkfmvW7y8MGI1S/9BX4H3sUxs9IIzJufPGlZyF2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050905; c=relaxed/simple;
	bh=kzFTt3RGSm/NFkEZa37Z1XBEbCivSsLNbeX2FLbW8gM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U4pYV3ykC4bngacVRnwy3UREFeSmpjkanRs9rwJmIZABZKiiKYRVYcId875BwxufG9lb98eAfEPunri0ngnm3eygFgg4/RxrxSIyMj/dS1RlxMx9uZXRMya9X8Y5HsnlVgKWITiwtYV9+vI+AZgvjt8Bx+69vmuZMLo6F+/2sdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D9D559200B3; Mon, 13 Apr 2026 05:28:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D6CB992009D;
	Mon, 13 Apr 2026 04:28:23 +0100 (BST)
Date: Mon, 13 Apr 2026 04:28:23 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH 7/8] serial: dz: Enable modular build
In-Reply-To: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2604130133470.29980@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14109-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,orcam.me.uk:email,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: E0A613E6F35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable modular build since the driver now has a proper module_exit() 
handler.  There's nothing specific to DZ hardware to prevent driver 
unloading and reloading from working.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
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

