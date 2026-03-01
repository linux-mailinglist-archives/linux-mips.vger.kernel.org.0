Return-Path: <linux-mips+bounces-13299-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLiiJZ2eo2lzIgUAu9opvQ
	(envelope-from <linux-mips+bounces-13299-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Mar 2026 03:04:13 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B411E1CCCBA
	for <lists+linux-mips@lfdr.de>; Sun, 01 Mar 2026 03:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4204F303A255
	for <lists+linux-mips@lfdr.de>; Sun,  1 Mar 2026 01:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FC376026;
	Sun,  1 Mar 2026 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FteGoBYC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714C12673AA;
	Sun,  1 Mar 2026 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330095; cv=none; b=qt2qpw21RlLFjKWzK3lhDd0Epa9bL9P7pE8poaV2E/zqmBPntvFax9PjYGI6yYBUcZmkoZIv5NN1xXM6Ejy8xXhOjwPHVgm9p5Yf9A82tCiFYgJtfEUERf/EEP5y3oym2Y94t485RPvXl27uRKubcJ0uQK2Ip566oUyDGQ3P/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330095; c=relaxed/simple;
	bh=I2HPxVqL/24mv875Z8LhKLtcrUl4X1yyrzU0DBGKjH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNbtbWCsc7sCi/6LK0K0PD1Hm0LVmuoyDYvjL+xpYFocttIz8JOJN45PC7zclEzRNHPLXxvEssduXwoyGpdTZ3f7NtjqVhh1kUatbFgjTwKoqAuyVz7X3AWl1NgXdXtmPwoyAG0wXEV1b3Mi+rKQrIPpCIhGbj7mXHpbmj7kDg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FteGoBYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A0BC19421;
	Sun,  1 Mar 2026 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330095;
	bh=I2HPxVqL/24mv875Z8LhKLtcrUl4X1yyrzU0DBGKjH4=;
	h=From:To:Cc:Subject:Date:From;
	b=FteGoBYC0xdJ9sECy4dBPsHYJqMkVqsmynqoGytaqFYLyvF9hu9yLh2wCsU1sz9T3
	 DwyQCHQJ/3PO3TT90Dn2GUtPmqneHCYsotn3jOw4M2l/Ez7e+/kIFI7cmIi9et5zlj
	 1vr+LgqZMNi7VTZQCrSf/HhhYLxrlVZEnU6mgQAc1+cjCfe5jbdFjukkuHHFmoUduV
	 QSxABJywyDEruvCCfPpPaijm07dpgRxDLq2w8HZPht2Ayt+dmivE8ogMkaMsf4OrvG
	 1ZLkWj0KkFF5GYydpKl83WSRzeJO9xk68Ay+hWuonEW0ZJtAts2GeOg8cpZ20HGit7
	 tUVMBvNa9wg4A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jiaxun.yang@flygoat.com
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: FAILED: Patch "MIPS: rb532: Fix MMIO UART resource registration" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:54:53 -0500
Message-ID: <20260301015453.1721961-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13299-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[franken.de:email,openadk.org:email,flygoat.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B411E1CCCBA
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
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





