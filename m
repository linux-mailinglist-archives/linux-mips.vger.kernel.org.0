Return-Path: <linux-mips+bounces-6700-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEF9BF2A5
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0DC8282CDC
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC8B209F5F;
	Wed,  6 Nov 2024 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WFEVXRYR"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A304207A3D;
	Wed,  6 Nov 2024 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909047; cv=none; b=uQKqbEVuWLIT7nlLpr2Ds9gjK9ZuZEP3cVg0w/Lev82htaReSqSI9P8Q9Gtb6/ZzUyJ82IRWGzDtEGjTKOU5YWj2/QLTNS3vjAhQTv8s5rjPgbFv7NfY9YvbgnGEuJDP9Uc7K+ASSRbQqCaGj5HpIFgBC//C05yE911TOm0DLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909047; c=relaxed/simple;
	bh=nyUodiUE5Z3VtI1jwRsUMURI24XLiUYhr19zHvPlfFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJ2fMwldmE9eOUIDjMrcMuwIAJzjX3utYuW6uaGXNLqY3OuMYfqZ43CNuTBzgh6jivINNJ4TXE0zAyJ+NfpboAgdL99io+lNUESUlgu6Fkf51sxbO464HosUwCIWbOXwqs8Sq8T8WW/aicoFI4A7CUZaIiu2xK1gJo98YvbK0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WFEVXRYR; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C0224000A;
	Wed,  6 Nov 2024 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7FqLocYcFog0SorrKtPjnpXfi49tIFlcAwi+Odxh3g=;
	b=WFEVXRYR6DSw5pMBPJcTDVEZSAHF11ffiELMiMoTwIo1dK0lT+PQ2I+rOg8feaqdr6UfSy
	8XDqZNezlrX4VDZejHrGZxK7MQ/NTKkfbCQyOqKAP047nJtmAcFr0iedNYIyEbeKHbW5Z1
	nNrrVYNSxIB+t1kryBi94w/6GykOEcJWULhfQLt0Qtw2NeSxZawg9hkBUcFpwVPhMVNvl9
	X3OBY1YI+nUPij6iu2WmGX5vqpmR/470++XHsxmCYZsPqQj4XBSybnivBfjBarG2h5vmoD
	3c+AvSnIL1SbsIcQO2As+rDYHv8A1dDwYOOz59pAIpxhZmAayt2lag4VlDjSZw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:59 +0100
Subject: [PATCH v2 08/10] clk: eyeq: add EyeQ6H west fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-8-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
In-Reply-To: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Previous setup was:
 - pll-west clock registered from driver at of_clk_init();
 - Both OCC and UART clocks registered from DT using fixed-factor-clock
   compatible.

Now that drivers/clk/clk-eyeq.c supports registering fixed factors, use
that capability to register west-per-occ and west-per-uart (giving them
proper names at the same time).

Also switch from hard-coded index 0 for pll-west to using the
EQ6HC_WEST_PLL_PER constant by exposed dt-bindings headers.

All get exposed at of_clk_init() because they get used by the AMBA PL011
serial ports. Those are instantiated before platform bus infrastructure.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index a042e9735b68f85c1ad79ec963b0268410b87ad4..640c25788487f8cf6fb4431ed6fb612cf099f114 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -712,12 +712,20 @@ static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data __i
 
 /* Required early for UART. */
 static const struct eqc_pll eqc_eyeq6h_west_early_plls[] = {
-	{ .index = 0, .name = "pll-west", .reg64 = 0x074 },
+	{ .index = EQ6HC_WEST_PLL_PER, .name = "pll-west", .reg64 = 0x074 },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq6h_west_early_fixed_factors[] = {
+	{ EQ6HC_WEST_PER_OCC,  "west-per-occ",  1, 10, EQ6HC_WEST_PLL_PER },
+	{ EQ6HC_WEST_PER_UART, "west-per-uart", 1, 1,  EQ6HC_WEST_PER_OCC },
 };
 
 static const struct eqc_early_match_data eqc_eyeq6h_west_early_match_data __initconst = {
 	.early_pll_count	= ARRAY_SIZE(eqc_eyeq6h_west_early_plls),
 	.early_plls		= eqc_eyeq6h_west_early_plls,
+
+	.early_fixed_factor_count = ARRAY_SIZE(eqc_eyeq6h_west_early_fixed_factors),
+	.early_fixed_factors = eqc_eyeq6h_west_early_fixed_factors,
 };
 
 static void __init eqc_early_init(struct device_node *np,

-- 
2.47.0


