Return-Path: <linux-mips+bounces-6699-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6C9BF2A2
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3482B284128
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2005D209F38;
	Wed,  6 Nov 2024 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VTn2Q+iv"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D95206E92;
	Wed,  6 Nov 2024 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909047; cv=none; b=s64RDX9kWWQXJia+gYEfA6shxr6oFlXpSeLlegBScoHXqH5+02esp3Wcv8gtkUPPKjLJ1VToR8BEVCnLGmRibsYBezov0h8Kcv9FChevgEFiFsMoXaQ5HFSHyGnOsUK98OT1oqsK5Iz/S4gQS4OWoaKmnvu2zu8XJvyhfxBSmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909047; c=relaxed/simple;
	bh=ZZsH//t/Fsi+Vqhh1cN881tXvVhi7wuAWI4UvPOVtAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngl3H8RY+5o6GvAZ143Ush8mbeV70YEu8ecopkqudQiRiUfAl9kj6rYELohDZ/G2c9m+OoU9NEaY/lh/AcUMft8KNUZGsS/q0ShMPU2LEsGvF2hGxnv3PR8prXLfKCOlt/2mGMMPyNJTR33pPeykd/vfoAMzVv8IPEJwzpzK/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VTn2Q+iv; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B431F40003;
	Wed,  6 Nov 2024 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XazLFxEo9IWiQOl5eAorhjqPNi1XrTqdIgPa4icG4b0=;
	b=VTn2Q+ivLAXpz5OACWcRFgmERlNW/tu81gQ30zXrOdMFeNUjDZUGIfW645IWG8glSgYF9d
	/7cIKJbAeadmacBJ1gGR19yqimGARIZmGkTUX4K85lKTE9xzUcCocCVG7jLggY1N+NBtXE
	OibL6Tk6sPWy/pILZJYEbHe7qRFZdbXHObY5pf+9TrOnkAIKeC/BJqo7ga7b8g0Cf/RjDF
	+T2gXP7dROqIAt/4gqH2hqhPQySSdroG7G3a5Z/wrwzbaodBnW+Fxhm2ehVxon2zBmzX6/
	COc9lo6k7Rv8Rx/GdmxDuGyk17PD6wsfJ2TIOgN4epZfvD+YRUiF8J+yJSPqbg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:58 +0100
Subject: [PATCH v2 07/10] clk: eyeq: add EyeQ6H central fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-7-84cfefb3f485@bootlin.com>
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
 - pll-cpu clock registered from driver at of_clk_init();
 - occ-cpu clock registered from DT using fixed-factor-clock compatible.

Now that drivers/clk/clk-eyeq.c supports registering fixed factors, use
that capability to register occ-cpu.

Also switch from hard-coded index 0 for pll-cpu to using the
EQ6HC_CENTRAL_PLL_CPU constant by exposed dt-bindings headers.

occ-cpu is exposed at of_clk_init() because it gets used by both the DT
CPU nodes and the GIC timer.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 542909085bcedb0f6b5b3cffbdb5761da9981cbc..a042e9735b68f85c1ad79ec963b0268410b87ad4 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -695,12 +695,19 @@ builtin_platform_driver(eqc_driver);
 
 /* Required early for GIC timer. */
 static const struct eqc_pll eqc_eyeq6h_central_early_plls[] = {
-	{ .index = 0, .name = "pll-cpu", .reg64 = 0x02C },
+	{ .index = EQ6HC_CENTRAL_PLL_CPU, .name = "pll-cpu", .reg64 = 0x02C },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq6h_central_early_fixed_factors[] = {
+	{ EQ6HC_CENTRAL_CPU_OCC, "occ-cpu", 1, 1, EQ6HC_CENTRAL_PLL_CPU },
 };
 
 static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data __initconst = {
 	.early_pll_count	= ARRAY_SIZE(eqc_eyeq6h_central_early_plls),
 	.early_plls		= eqc_eyeq6h_central_early_plls,
+
+	.early_fixed_factor_count = ARRAY_SIZE(eqc_eyeq6h_central_early_fixed_factors),
+	.early_fixed_factors = eqc_eyeq6h_central_early_fixed_factors,
 };
 
 /* Required early for UART. */

-- 
2.47.0


