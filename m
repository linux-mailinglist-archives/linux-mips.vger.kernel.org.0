Return-Path: <linux-mips+bounces-15793-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SG+8IFMCU2r9VwMAu9opvQ
	(envelope-from <linux-mips+bounces-15793-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jul 2026 04:56:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FF7439A8
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jul 2026 04:56:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=JFwgsxk+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15793-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15793-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 950C9300A113
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jul 2026 02:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AE62C3268;
	Sun, 12 Jul 2026 02:56:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1311AF4E9;
	Sun, 12 Jul 2026 02:56:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783824977; cv=none; b=Z/KCbFMBA4pLYGfKJ+EZpMEU5TMB6w7ObC7Xgt6DOtjzOAO5UbiIaMkZwua8VpNdDLLP/67Ln9Kr6LAcWg1IcUUVhmPICQE9JteoHLNhuzQphd2Z6fZ+h7gX2uNJ0ghsJ9iWH3vwQEdKKgP+qS5ep8QPKW9JQAIikNE92MiaTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783824977; c=relaxed/simple;
	bh=tRLasxGtarCDZZPimPl4cIw90cNB8efUVXsdzvBZ+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=er4SpHCPeA2M9JIhGTsmCguDivxPZkF3qqBrOH8tuxpfLLYnspgtFCsWCZNter/tFWzFXQy6IDxquQqWbN1Ilfv+nlccqF1w0waA8dN69AOiy1JdPpBcEyclrKR14JDNwd6u2deD+q8FaiPRSPY+tvQ3ow82dsSr2nd6o3RevlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFwgsxk+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C02CC2BCB3;
	Sun, 12 Jul 2026 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783824976;
	bh=tRLasxGtarCDZZPimPl4cIw90cNB8efUVXsdzvBZ+is=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JFwgsxk+7wHb6fjqJTjoJvQrHyh8V0OQmBbu8MWYW/6ahJifD65cm4EOB8JWIwMCH
	 hQbZveFfjex/yAQv6MviumTgkhYEpKSORAS8LeoGG4ojVHDoDsZoFF8I/Ek8n3YUH2
	 U8Gz6jfOUogPpIucTKBixFwBApLnFgL+lEZ/37W6n4foM/oLaj3FbOBqps6IGL3qoe
	 DrOC4YQP3wxxBrs5XD2Zk9bgla9v3wqJoLd0YfFU8uhSe07J04sQMyXbeEZ17+JmGv
	 57zZ0bwV0iciFAc+Fgzo/5NaJc2eCnPX06/Swkys+ohkm4GVhkzKDTeVBkrTmfFok/
	 bS8d/KIg+745g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7EDC43458;
	Sun, 12 Jul 2026 02:56:16 +0000 (UTC)
From: Miles Krause via B4 Relay <devnull+mileskrause5200.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 22:56:14 -0400
Subject: [PATCH] memory: jz4780-nemc: Use dev_err_probe() for clock error
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-jz4780-nemc-dev-err-probe-v1-1-afb6f6a82752@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE0CU2oC/yXMQQ6CMBBG4auQWTtJS0TQqxgXTPurQ2IhUyRGw
 t2tuvwW762UYYpMp2olw6JZx1TgdxWFe59uYI3FVLv64FrveXjv285xwiNwxMIw48lGAccYmuY
 onUjvqfST4aqv3/t8+Ts/ZUCYv0Patg9fu3LBfQAAAA==
X-Change-ID: 20260711-jz4780-nemc-dev-err-probe-ddc559b8bba1
To: Paul Cercueil <paul@crapouillou.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783824975; l=1329;
 i=mileskrause5200@gmail.com; s=20260710; h=from:subject:message-id;
 bh=AGXKyAp8ExZItIFAOU025OlxKNPfZ4JXCxmTSMbLIcw=;
 b=SDDaywFXq9ZUBuE9d/dzRpi6j2R3tWaDdqA5QU+YnuLmwC3kKXNmSMh86RV1486tDk+AV38ra
 UYpwCdm8frkDyAv7nMmDfrl/I5oeINAZDoBm41DRXcT/Nrv7fHubaU2
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=QNhNjcQarqig3ColJBIEr3DYfWM1PHpP7z+6thxWXaU=
X-Endpoint-Received: by B4 Relay for mileskrause5200@gmail.com/20260710
 with auth_id=861
X-Original-From: Miles Krause <mileskrause5200@gmail.com>
Reply-To: mileskrause5200@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:paul@crapouillou.net,m:krzk@kernel.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mileskrause5200@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15793-lists,linux-mips=lfdr.de,mileskrause5200.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,crapouillou.net:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-mips@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[mileskrause5200@gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C25FF7439A8

From: Miles Krause <mileskrause5200@gmail.com>

Use dev_err_probe() to simplify clock acquisition error handling and
avoid logging probe deferral as an error.

No functional change.

Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
Built with:

make O=out W=1 drivers/memory/jz4780-nemc.o

To: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/memory/jz4780-nemc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index 1a8161514d03..1bf17057cbf5 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -313,10 +313,9 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	writel(0, nemc->base + NEMC_NFCSR);
 
 	nemc->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(nemc->clk)) {
-		dev_err(dev, "failed to get clock\n");
-		return PTR_ERR(nemc->clk);
-	}
+	if (IS_ERR(nemc->clk))
+		return dev_err_probe(dev, PTR_ERR(nemc->clk),
+				     "failed to get clock\n");
 
 	ret = clk_prepare_enable(nemc->clk);
 	if (ret) {

---
base-commit: 8111c7f3723f414b7f655a3880775cbbd0e9de8e
change-id: 20260711-jz4780-nemc-dev-err-probe-ddc559b8bba1

Best regards,
--  
Miles Krause <mileskrause5200@gmail.com>



