Return-Path: <linux-mips+bounces-13296-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dh0HVWZo2ksIAUAu9opvQ
	(envelope-from <linux-mips+bounces-13296-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Mar 2026 02:41:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1411CB5EF
	for <lists+linux-mips@lfdr.de>; Sun, 01 Mar 2026 02:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E5283025E31
	for <lists+linux-mips@lfdr.de>; Sun,  1 Mar 2026 01:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBA42E7657;
	Sun,  1 Mar 2026 01:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0f68K2f"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991B2D9798;
	Sun,  1 Mar 2026 01:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329081; cv=none; b=IgeoyHDVtZJio8ld0jATSN6ZxGRcNQ+bDF/nFLbp1pOPUtRcJ1knFYyeOIfb4Hl/FSOnHuQPzfafG1jy/FVsFUj6kH9zx81nMM6YUHL1Gbemuk6Og9hUwMZ/sm4JDv8dKjLA6tElGYb/G7w65gHzH+Z6aWdFpXHGKMoErzBtUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329081; c=relaxed/simple;
	bh=EPbM9DxZVolYFdbCWoX8rpqwv6N7lv9JH+vsk4wikks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ONMXA/Gd1WRLgLZR0/nGcka/1WVXcY0+VO8UnmNWAVpOnTTQY2zy1WM7cKadr9PY6o8GuZ2xUrYfpR6G+WaJy1AIlqDq98iGY53qy3fMvKZiZbEVtbW8RqEnAAsasx3Bf3/v3xrSI3il7DzEAaV0ZSx5GShLGIvndXMeTYL0TB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0f68K2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD2C19421;
	Sun,  1 Mar 2026 01:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329081;
	bh=EPbM9DxZVolYFdbCWoX8rpqwv6N7lv9JH+vsk4wikks=;
	h=From:To:Cc:Subject:Date:From;
	b=n0f68K2fCBNWYhmta0iOzU05mwNgZ9zYB6dSPC5N8Ix+uX6hUt+2rXrWpkOUNOYay
	 Dc2hij+SVkh3VYJsh8K5vCU1XiQ33emVxIGIz545bVi7DwGST2bCdRD8OQM9UfpX2A
	 ATXYLrKHw/COvejU0hSy45rRia87i2JhDNChRBOewQ3SqAY2+d3f+j5RjNTnHBQd8k
	 988kyjv9H0aa2jod/5oiH3kOsyvtVQ/rZVw08sApoefAfO75+8t/RDIMUKA6BR8fHU
	 SmyN8dDN94hlMc9AhsqOcAhI8aFfiDIaei/6NZ64RTc2YrEa6RbCXh6fMQPskdLN+h
	 dA+AsPCnjPV6A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jiaxun.yang@flygoat.com
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: FAILED: Patch "MIPS: rb532: Fix MMIO UART resource registration" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:37:59 -0500
Message-ID: <20260301013759.1698288-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13296-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[franken.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,openadk.org:email,flygoat.com:email]
X-Rspamd-Queue-Id: 3E1411CB5EF
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e93bb4b76cfefb302534246e892c7667491cb8cc Mon Sep 17 00:00:00 2001
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 5 Feb 2026 10:08:42 +0000
Subject: [PATCH] MIPS: rb532: Fix MMIO UART resource registration

Since commit 6e690d54cfa8 ("serial: 8250: fix return error code in
serial8250_request_std_resource()"), registering an 8250 MMIO port
without mapbase no longer works, as the resource range is derived from
mapbase/mapsize.

Populate mapbase and mapsize accordingly. Also drop ugly membase KSEG1
pointer and set UPF_IOREMAP instead, letting the 8250 core perform the
ioremap.

Fixes: 6e690d54cfa8 ("serial: 8250: fix return error code in serial8250_request_std_resource()")
Cc: stable@vger.kernel.org
Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Link: https://lore.kernel.org/linux-mips/aX-d0ShTplHKZT33@waldemar-brodkorb.de/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/rb532/devices.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index b7f6f782d9a13..ffa4d38ca95df 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -212,11 +212,12 @@ static struct platform_device rb532_wdt = {
 static struct plat_serial8250_port rb532_uart_res[] = {
 	{
 		.type           = PORT_16550A,
-		.membase	= (char *)KSEG1ADDR(REGBASE + UART0BASE),
+		.mapbase        = REGBASE + UART0BASE,
+		.mapsize        = 0x1000,
 		.irq		= UART0_IRQ,
 		.regshift	= 2,
 		.iotype		= UPIO_MEM,
-		.flags		= UPF_BOOT_AUTOCONF,
+		.flags		= UPF_BOOT_AUTOCONF | UPF_IOREMAP,
 	},
 	{
 		.flags		= 0,
-- 
2.51.0





