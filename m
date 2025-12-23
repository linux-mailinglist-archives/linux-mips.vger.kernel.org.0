Return-Path: <linux-mips+bounces-12568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96611CD8B8B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B368D3076E1B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066AB32E739;
	Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Th8UG8F/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F31327208;
	Tue, 23 Dec 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484167; cv=none; b=SOrpKafSpbRdwijaNtGxbS0If2ZPnMwe8axXxPH2nFWc1JpXDaJL25X5ZJTF7C0khxvnJQsvLG81Bd1hzbHc3k5+VPAdzu4YNVb6sV0n0JZY4s3tp8SQZbqcOxwnvT0yAwJTSz6rNnxq1H06XXIvZUpCwcDfzHHcXmIh+KxgWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484167; c=relaxed/simple;
	bh=UrVZCW5lbAV7kJ6TBwnmGdMgCEBIQ8VniS4vRI8N5LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vnyu+Lt1cFiMAEUNXKc2zJjW4D2V2M0uTzKz87FvNMHN5eszT+LHdpWkyKbk8qygtZkhS1Uvnecl3lM+05mLlAYOgzbJL7dgknnG0k0fzsG3vwNzaRGAc+KbVvl51i/mka1AjRXYGnRflkhRCNpzw8S58idqTSCRe0O3HHNzAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Th8UG8F/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0D2F0C1AE1A;
	Tue, 23 Dec 2025 10:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2077660716;
	Tue, 23 Dec 2025 10:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 214C210AB09BE;
	Tue, 23 Dec 2025 11:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LAlm/ECW4o7ColMRo13P/K3LTb6LJ/lSZfggJLOeA6M=;
	b=Th8UG8F/pMFgTagv9kvVVPuonkRvM/KXJKO11w5tzUJibutxihotzMrodgWznttT2Esoob
	tyqzMPOfRYzQF4x1jAO2AhDrcepwIsa+lybbTGASn/JCCDoLN/MXmEK3leUmOasA5lTEcY
	Q5dHjIwkFrzvWXdv9zJZ1QT6JG9HI/I8fx/6Q4m7z8sy9RMKx5mGTXsVvbtVZzujLbvB65
	PkAdqB/f6MT/xa67gsOaB0aJQhV9kfNEku4sG8R6bT1paPKJAl0WUfmWJuvrM0odlHtgXL
	NdySDrIV7GOPeHa5HJXm0+F0nS3Wnx8gsT8GjDcuZRHWBXGEoP1TOSQnIOGS5w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:23 +0100
Subject: [PATCH v2 08/13] clk: eyeq: Adjust PLL accuracy computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-8-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The spread spectrum of the PLL found in eyeQ OLB is in 1/1024 parts of the
frequency, not in 1/1000, so adjust the computation of the accuracy. Also
correct the downspreading to match.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 182b408b6aa4..8fb32f365f3d 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -163,7 +163,7 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 				   unsigned long *div, unsigned long *acc)
 {
-	u32 spread;
+	unsigned long spread;
 
 	if (r0 & PCSR0_BYPASS) {
 		*mult = 1;
@@ -195,23 +195,23 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 	/*
 	 * Spread spectrum.
 	 *
-	 * Spread is 1/1000 parts of frequency, accuracy is half of
-	 * that. To get accuracy, convert to ppb (parts per billion).
+	 * Spread is in 1/1024 parts of frequency. Clock accuracy
+	 * is half the spread value expressed in parts per billion.
 	 *
-	 * acc = spread * 1e6 / 2
-	 *   with acc in parts per billion and,
-	 *        spread in parts per thousand.
+	 * accuracy = (spread * 1e9) / (1024 * 2)
+	 *
+	 * Care is taken to avoid overflowing or losing precision.
 	 */
 	spread = FIELD_GET(PCSR1_SPREAD, r1);
-	*acc = spread * 500000;
+	*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
 
 	if (r1 & PCSR1_DOWN_SPREAD) {
 		/*
 		 * Downspreading: the central frequency is half a
 		 * spread lower.
 		 */
-		*mult *= 2000 - spread;
-		*div *= 2000;
+		*mult *= 2048 - spread;
+		*div *= 2048;
 
 		/*
 		 * Previous operation might overflow 32 bits. If it

-- 
2.52.0


