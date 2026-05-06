Return-Path: <linux-mips+bounces-14498-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOUKMwnE+2keEgAAu9opvQ
	(envelope-from <linux-mips+bounces-14498-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:43:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF24E159C
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 00:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0662300B443
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 22:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BC337C909;
	Wed,  6 May 2026 22:43:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE163B47E6;
	Wed,  6 May 2026 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107387; cv=none; b=gf9yUTcI/VsPKWkkvDs+dt0kk4k/qlPnhsZY32SgNvgNX92TqMljgxAIIitSzyH6wxT+uw6NOewRpdf6i54pBl0H9DSQdGVs3pbelQ3ey6opJBd90/T6QlZ5cW+xqE3MFmjJTspTBc8juD7TptbnetLuzv+8SB/VLbcKkbGYcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107387; c=relaxed/simple;
	bh=RwaMJl7bXPHQnWvjyFeT54TQav5FxHUrDX3wMQmq+KQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gYOvP0i0lgRI5hIuoolUEeAAbwOOeqkji2aunbTbYiQ77oJQD54qAB3No1gUH9YzqmOm6LWKpOQaRAW5J29Xt+M6CMmreom9B05U9cKSTZJ6xWToGCTtKWlJindSms/ktLPmN0swSj17fNEJCxKoDcKLp8ZYh85nDqisP6KW41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 65A219200C3; Thu,  7 May 2026 00:43:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 644A79200BB;
	Wed,  6 May 2026 23:43:00 +0100 (BST)
Date: Wed, 6 May 2026 23:43:00 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: [PATCH v3 10/10] MIPS: DEC: Ensure RTC platform device deregistration
 upon failure
In-Reply-To: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605062333190.46195@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 64AF24E159C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14498-lists,linux-mips=lfdr.de];
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

Switch RTC platform device registration from platform_device_register() 
to platform_add_devices() so as to make sure any failure will result in 
automatic device unregistration.

Fixes: fae67ad43114 ("arch/mips/dec: switch DECstation systems to rtc-cmos")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Change from v2,
<https://lore.kernel.org/r/alpine.DEB.2.21.2605012105320.11074@angie.orcam.me.uk/>:

- Fix a minor style issue in the commit description.

No change from v1 (8/8),
<https://lore.kernel.org/r/alpine.DEB.2.21.2604110042130.29980@angie.orcam.me.uk/>.
---
 arch/mips/dec/platform.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

linux-mips-dec-platform-rtc-unregister.diff
Index: linux-macro/arch/mips/dec/platform.c
===================================================================
--- linux-macro.orig/arch/mips/dec/platform.c
+++ linux-macro/arch/mips/dec/platform.c
@@ -38,6 +38,10 @@ static struct platform_device dec_rtc_de
 	.num_resources = ARRAY_SIZE(dec_rtc_resources),
 };
 
+static struct platform_device *dec_rtc_devices[] __initdata = {
+	&dec_rtc_device,
+};
+
 static struct resource dec_dz_resources[] = {
 	{ .name = "dz", .flags = IORESOURCE_MEM, },
 	{ .name = "dz", .flags = IORESOURCE_IRQ, },
@@ -137,7 +141,7 @@ static int __init dec_add_devices(void)
 	}
 	num_zs = i;
 
-	ret1 = platform_device_register(&dec_rtc_device);
+	ret1 = platform_add_devices(dec_rtc_devices, 1);
 	ret2 = IS_ENABLED(CONFIG_32BIT) ?
 	       platform_add_devices(dec_dz_devices, num_dz) : 0;
 	ret3 = platform_add_devices(dec_zs_devices, num_zs);

