Return-Path: <linux-mips+bounces-6592-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE79B7F37
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC64F1F22A1F
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3845E1BFDEC;
	Thu, 31 Oct 2024 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cn6HwxMR"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3545A1BBBDA;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389991; cv=none; b=oWVaw7AhD0/O4/u8ZIGxpvee39JjP+8/hZ+6oxFuFaw9TqK66ll7ZbMSfgorCtfZWY8Bz50BeZiplBbgIo+KKzFKr7ESSRR7jdBI3eZoj0xUiyq9mKmpM4Uw7+F0nAMNcBStxPHMfOgttesIC75pb79X2JYtKiiRadHoxVuIQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389991; c=relaxed/simple;
	bh=VamhRTqa9DTI1GQti9bpMRr8+2GVZTOuU6CSWkQMOc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5nG6hWDjhRZiIt6kvd4uq1t+/d4J4JSnPV6GbLF2b2KYuC/jIz/XoN0SZZ9Mp2aSSfjwSq4eCzQZE51tTNUDE7IiueA/aNTtPqMvHecOBG55/tL+e16GvL+rvgaaVA2zht6VwgQCyzuo1jA6LZz4MPXCKFvTrcrBc5beY8LrxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cn6HwxMR; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2603C1C000D;
	Thu, 31 Oct 2024 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGl0zvxVHy/3JEMiH4QJrzF7cj+Sn8CkYpJlMAQBR0Y=;
	b=cn6HwxMRMhUXxavs/EVhhPbeC3Xc7mfmkKA+GUF6ub5q3ux8iZDYDBgQDUelLZycopPtXw
	kLAo7nvdhANGCfH5Z1OvctbhqUVjAHnJPBtub/hb33vPkBidedg0BkN0h5IqFMcOGR8ocf
	cPdi6ZNisLmM/RPFcgSqrMWjrYWWc+rzFSRuslVsxW24PCeMplSjCPlbHEaZk2uBKR9h6G
	LFV9kAylwd5WpCQgYjH/THURyttTdXwaBD02kVALUqJFYc4jXDPl/lEWdvirTBIs4QR8VR
	uOF6shtiOQ6Rte9Ph4kpxWtOp5pAYYPFpkjhM1/y1auX3LdXwbV4+WObB2qVCw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:53:01 +0100
Subject: [PATCH 11/13] clk: eyeq: add EyeQ6H west fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-11-89d8b28e3006@bootlin.com>
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
index 4f6aa852038cfc4db0fc4473cf5e50c6c254b9ee..f3ef4293b97bd553fbfd74b8dac4811772729458 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -708,12 +708,20 @@ static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data __i
 
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


