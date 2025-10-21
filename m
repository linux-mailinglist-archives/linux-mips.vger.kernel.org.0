Return-Path: <linux-mips+bounces-11827-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C65BF7B51
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F9FA465BD6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE9B347BA7;
	Tue, 21 Oct 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hThFaTb3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3A2FD694
	for <linux-mips@vger.kernel.org>; Tue, 21 Oct 2025 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064416; cv=none; b=FCuj9X8gQuDYGzKA55XN0B3ycwkfwZZWFhtI/o3/Y6vY7BBg+fbUdOuZ7Buaz4iKzLjl6QnnLa7IHmGk2CRgxlW3nYJqpaEkmbBdXcRifWCJm1mFKqexsrlOdrj/Rq9C/lJvfX7YO36IpyWuFiofvMT1YpKkBo4AuK639ni1PU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064416; c=relaxed/simple;
	bh=NYG+ETPj2x0u/ibgpjtgBYkOFUnLc2KAk3q8zgMWzxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmW3kO/xs3/pq1Uf5Rv96OIm0XXkguvVz22a6nX0glxz2W8DjEv9+WRxxsGH21prxL/PLwPpqI7ou5cUmxcFBD2MsuDxK+Tzdso60xt7G8yGQlIidsc+eN9aCcOwmXUzJFd6tgE9WRZe0Oq+xmbnuW1ttCkMhiM4ZvF7rb+BWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hThFaTb3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AFEF2C0B897;
	Tue, 21 Oct 2025 16:33:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 459A960680;
	Tue, 21 Oct 2025 16:33:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67E4F102F2420;
	Tue, 21 Oct 2025 18:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xGfi/wxxIWJSZ/P38qx/iDvGfCPuBRfGoA+hd2Uxo10=;
	b=hThFaTb3NWJ1Rr18az1pUbD8tGPRjn9OEY0gD1T9HI+z0Betw9B4ykRFHjZLzIckB9t36D
	xorv3kPNkGBNMEzyQTc0Hhjv3IQov6rJNR75o67PREuFIjKMPiLd2aTOc9+qHfXj8O+cUf
	+5lkKLiXpnvi4dk7Q7PRMWStLt4R3vmnvcrRya1Bp4117dmxEdmNDMz8e9q5T1plVv3P3l
	7NIsmJ3J5vsFD1o7oJC5agheNM672E18NXrUWBOYaifvpkylmsxG92fdGvoHYkMRaBBaOP
	x9fBM2ZBCvgIH2/fhJ4w9Smj2UI7oTD/5I+mGHFcwUhQqvXiIsRhhkwJX521bg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 21 Oct 2025 18:32:50 +0200
Subject: [PATCH net-next 09/12] clk: eyeq: add EyeQ5 children auxiliary
 device for generic PHYs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-macb-eyeq5-v1-9-3b0b5a9d2f85@bootlin.com>
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
In-Reply-To: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Grow our clk-eyeq family; it knows how to spawn reset provider and pin
controller children. Expand with a generic PHY driver on EyeQ5.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 664ce7d7868d..a9de57315e48 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -109,6 +109,7 @@ struct eqc_match_data {
 
 	const char		*reset_auxdev_name;
 	const char		*pinctrl_auxdev_name;
+	const char		*eth_phy_auxdev_name;
 
 	unsigned int		early_clk_count;
 };
@@ -361,6 +362,7 @@ static int eqc_probe(struct platform_device *pdev)
 	/* Init optional auxiliary devices. */
 	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
 	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->eth_phy_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */
@@ -521,6 +523,7 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
 
 	.reset_auxdev_name = "reset",
 	.pinctrl_auxdev_name = "pinctrl",
+	.eth_phy_auxdev_name = "phy",
 
 	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_plls) +
 			   ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),

-- 
2.51.1


