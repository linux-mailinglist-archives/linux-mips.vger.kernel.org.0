Return-Path: <linux-mips+bounces-7749-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82CA328DE
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 15:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E67667A2CE2
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 14:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DBE210F4B;
	Wed, 12 Feb 2025 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GvBu9t56"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8491210191;
	Wed, 12 Feb 2025 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371308; cv=none; b=Jb0nqIdAVx43AzbXW2rn3BQlIv0sQk+0X72/c9TATCz75foH7lujikGthIssUYSDIQ2Z2lh6bZ0enCN7Cg7l8lgawgC4lLc154DdeOJTz0RO8Ka23Z2JPNw5JHQ7zbK7vPq9xDB/PPM/Eg1wv6kIsWVosJ7ql5SU+Q4413JGiZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371308; c=relaxed/simple;
	bh=6VsvBgPqBd5Zqef3iWLEMJWJApBWl49CoJqvuwZAeiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbzMgA6HDIsrUztWrvqnRq4YSPBCn86U3VjlsqhmYl2g5q0ZD2e1DvSfK5LpwM7QR86/RHgXCVGne9FBqOYdxHQEyVKtZYdM+/0V08V05NZTsr+H4Ob9f1vLn7MAF6Ei7pCqdlpgUbba7orFD1GKdr9ZNlXHKrgCrmUiQKryVdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GvBu9t56; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FDCF204A5;
	Wed, 12 Feb 2025 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739371303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hV58UJrNiafKUEEBYyT5622rc4906GKqOPPegyEjpJc=;
	b=GvBu9t563kxnFl8vpKqJnl1NlFNwRhwgqpgwrV/WKHt+P/P2VyItdyvSR8e7YpylVkrJFh
	ZambmdwrU19UQNsfxlqJs00qmG1mJgRSWTe8ObzqtbHpk8slTgRKlELpQzT2avGKq6lyJb
	LL8HprxNBtH1BHLc61viq/yj9L1DFSAe2WWN2RQe9dFql+ICrfKfp8CUe3mO2pCCPgX8tS
	TP6aR8s3Mrn/9Z42s8BUVceDzlUrOyyDuDl6gLHzqZEXHOkCL7Q/nrgv8UdwGzqRqtay8e
	1kA/qjLYuimHcatcpaPr75L+A1gxNamRx4P/B6fzdeCUHAvX/o80W0TZ2LG1gg==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: jbrunet@baylibre.com
Cc: Laurent.pinchart@ideasonboard.com,
	abelvesa@kernel.org,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	bryan.odonoghue@linaro.org,
	conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	dakr@kernel.org,
	david.m.ertman@intel.com,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	gregory.clement@bootlin.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	ira.weiny@intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	martin.blumenstingl@googlemail.com,
	mripard@kernel.org,
	mturquette@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	peng.fan@nxp.com,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	rfoss@kernel.org,
	s.hauer@pengutronix.de,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	simona@ffwll.ch,
	theo.lebrun@bootlin.com,
	tzimmermann@suse.de,
	vladimir.kondratiev@mobileye.com
Subject: [PATCH] reset: eyeq: drop device_set_of_node_from_dev() done by parent
Date: Wed, 12 Feb 2025 15:41:26 +0100
Message-ID: <20250212144126.120231-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfejhfdviefftedvieetfedugeefvedtfedujefhhedvhefggfduhfefueektdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghlohepthhlvggsqdgsohhothhlihhnqdhffidqtddvrddrpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeejpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrsggvlhhvvghsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmr
 ghilhdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegsrhihrghnrdhoughonhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b..8018fa895427 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)
-- 
2.48.1


