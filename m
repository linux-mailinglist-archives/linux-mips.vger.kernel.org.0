Return-Path: <linux-mips+bounces-15088-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AXwgGz/wL2ptJQUAu9opvQ
	(envelope-from <linux-mips+bounces-15088-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 14:29:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C440168636C
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 14:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=cgOIGL66;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15088-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15088-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB62930A38E5
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680013E8322;
	Mon, 15 Jun 2026 12:24:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4440830CD95;
	Mon, 15 Jun 2026 12:24:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526278; cv=none; b=s9yHaf1KX4PEZoGuGgw6iwpDuhay5wssJExF2Du/fZtXjsZqbcloSU0l1ZtuojH11kiwrFNFeDLl1I5pm/eKjqatEt9xYuTcOyQXGFsb04vhk5iydi1nadVkdkMXtTk6Zrs/QQfmfmSINnSSCjyXwLu1ywesmroOPbYo4lwOBZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526278; c=relaxed/simple;
	bh=U/229aDPygbK2f1IV17WG591ys3SZgvnwqf40Huk/S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mNzldLES75E1b8F5IPV3kpEoIkne7+VZ5ABzvv056ppriJFCBx0jrE7CGsFPW6Bt2vxLekHSPRzjaPkN8+O3lD62sfinrYlLX41WgWEuOSvv1HCNCKCsd014XTi2EynwnQvI5tN/j1IJC3aaj0MLGnwZPAyW3Fp1g/FZtEUuk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgOIGL66; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8A06C2BCB4;
	Mon, 15 Jun 2026 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781526277;
	bh=U/229aDPygbK2f1IV17WG591ys3SZgvnwqf40Huk/S4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cgOIGL66GyRBFJh3ulPaHZzu78hTw6TEYU6zpzYlFLH+jneSK4MkPh947qRSB2FGU
	 +WI1F1oaqYUC1AXk75ofb4AqueS8n/7AuTWsiu7Ys+ZgvxhUpo8Q//2m1I2OrzI7Rc
	 dHjMfDCaSvuYsFHQ9OZStUb+IFsXB/ADwF60Cn7OY9MLpESB/VOxfmqXUUQ+ceAVM8
	 7Wie0pC5LqdHPaBp0/jUo3FmOkrpwbCDEbt0cuOokWSzHnA79+6gmC19vmMQ/+eVdv
	 FcWoVe1rY+N7YWSKbM9oSG/AqaQ+BT28p99z23QdNjRa7mm9n3Dg0kCdaUACxRAjs3
	 alhzsG5fgAY+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CC8CD98DE;
	Mon, 15 Jun 2026 12:24:37 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Mon, 15 Jun 2026 20:24:17 +0800
Subject: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPDuL2oC/x3MQQqAIBBA0avIrBPUSKirRIvS0QZKQ6EC8e5Jy
 7f4v0DGRJhhYgUS3pQphgbZMTD7Gjxyss2ghNJCC8Xtc66GHzEGn2OQfEC5jdaZ3mgFrboSOnr
 /47zU+gHKAVm4YQAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526276; l=1168;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=2fl2OBxWH3wOcozENxrt6hZZsu8wzA6vdfleIZixEow=;
 b=/xcmeOq0CIVKL1BbVMNLoT/ceXxJcS0hTcnCvEZ6XK0jr4a/anBT54fyJswBJHk++djVHtRXn
 tJKVWnD0mutDflarcg2J1w0kDRCds4G4jYe4E9akQGFn9N6xspemEK7
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:keguang.zhang@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:keguangzhang@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15088-lists,linux-mips=lfdr.de,keguang.zhang.gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	HAS_REPLYTO(0.00)[keguang.zhang@gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C440168636C

From: Keguang Zhang <keguang.zhang@gmail.com>

Use dev_err_probe() for the missing match data case to simplify
error handling.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index de9aba756aac..ec34adb63f61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -176,10 +176,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 				     "Unable to find syscon\n");
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (!data) {
-		dev_err(&pdev->dev, "No of match data provided\n");
-		return -EINVAL;
-	}
+	if (!data)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No of match data provided\n");
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
 	if (!dwmac)

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260602-dwmac-loongson1-5e1b9dfc3c62

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



