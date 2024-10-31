Return-Path: <linux-mips+bounces-6593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265CF9B7F3D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96C37B21F9C
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF901C2307;
	Thu, 31 Oct 2024 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QIZNWRjB"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680631BBBFC;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389991; cv=none; b=YK2T0gybnWPv0H1mIe68rlypAyp/hPJ1/mlHYuyP5s72WphbuVFEUt+OwhnhY/M/KsLSvQxaFuXUvS1k+T2X6FEWu5ri4ImMxtXMVLIz+RN8uqPtpBr9dKeeaOn7IuuhyQZKTt9wISFYpJX3dOdOlEf3rSpZP5MQp+qL4NThn/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389991; c=relaxed/simple;
	bh=mubpwWm3QFkqioFijcDhodrfP3j1pOhKigFEYlLfcmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXaJMB+FrIV2fRrYW3SXFLtHH/VwpqihC+P3+Ex/QjT90Z3tpxi30crlD1Ka7pWf49rHXosxiEEb9KX7Fb8ikVlBPGLRcbJbt4Q7/RbLyzucLnMeSks6OIEFuoXqT5e5V9SDJB/Gi379V/LbrvKHk+sXQToWuf0uYd+9Jlc/RTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QIZNWRjB; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74AA91C0014;
	Thu, 31 Oct 2024 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J19GmzKLXmjkbRnHLjyLOvsgcp8S/EXdBpiEt0g1I0w=;
	b=QIZNWRjBWV78EFHS+GkZbyLEb5bmOc92ZgheQim7616vvhlmi3g+tfe4YZy1JwMIwwt8Mm
	G7BMNS5RXRWSyjuEQdxOmcR8SbXar9fdttJCKzO0e85FOT4BZDf7V3W6DbIJwz0g6oD+uP
	V74oxsVa0MVQ/2hZyQLOKil4wEhZgaVhrc76HsnbRhNoSjWtSpcx9aBriIsFrJ6iZyksKs
	e968ERt09gJfn3XOAUc6Nz9+H2sQrLbUaClUypKtRyjVPVxGHEh1ZmfXsokcGJjZZoram6
	H4MU1z2a3jsLx4uZmU/635fv8ysnN7UVhrspq3IyQXMa/hinDxK2BJ1Uu/Mffg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:53:00 +0100
Subject: [PATCH 10/13] clk: eyeq: add EyeQ6H central fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-10-89d8b28e3006@bootlin.com>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
In-Reply-To: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
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
index 6337736ef0ccb963fc16f66b1c78c33fdff0f99f..4f6aa852038cfc4db0fc4473cf5e50c6c254b9ee 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -691,12 +691,19 @@ builtin_platform_driver(eqc_driver);
 
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


