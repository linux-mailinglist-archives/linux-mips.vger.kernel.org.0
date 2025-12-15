Return-Path: <linux-mips+bounces-12471-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EDECBEE3A
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 816EF301CD31
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 16:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4967320CA3;
	Mon, 15 Dec 2025 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GR5PY+dd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D73101AD;
	Mon, 15 Dec 2025 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816027; cv=none; b=Z0wt1S0tkHb38013oI6C1Ol5H2f4QKsE1AZJ9bQVT+JQQ/GVUCmxonZStlK7XDOQKnCv7WSrv2YanXKNgo0VmcKnQXvzREmXat60Q4Oe/1+c4GiXWShwSpKYIq74i8lcwbhnuL9/W+WqV0R7CZ7IoUdwO8k+dBXW3IhFlYBBTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816027; c=relaxed/simple;
	bh=CsMp0CiGqrPmLMVUU4FM9eUsbzrHdW6HV7OsJ0PHpyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdEnhJxauFlcWnC00OgZpDOkscWvkZ3sIArT0o0Z5UamARmk0FRgqxg9GVxVQqbWqLXXujKLX9wwvRKGUR+XC0R733Q3+v4EtNbis3VvlFqZxV1BV3tD5esOpdBraAzGxY/hgKlE4ppyZtmQVBKERw55/54N2EmdtK00sfZB+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GR5PY+dd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22E0D1A21E8;
	Mon, 15 Dec 2025 16:27:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB8E360664;
	Mon, 15 Dec 2025 16:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4598E119427C5;
	Mon, 15 Dec 2025 17:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765816022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k5FHfCu3lXplllIOLz1R5tej0eu2UNbtzmdh0flsAZE=;
	b=GR5PY+dddeOA3dJuR6tiwlLU8mciWm8CPIAZiaCqIOAgvzBl3R/m7Bbr8q+mpoUzC0gLe5
	63NKsEG7lpBLID0FSeujeWByBUT+14asszfMbgoIBgg6C+w/kCNQrmudCh/iSfSqpG9mZp
	bbRkZzhPRnZXSXb2SA8yPCKJdnT3LgzfjQe1Nln5bzi5uFv2XQC1wJCMk2TVseAFxZhDjY
	HYYdDNFTm9ZG3rK5qVJwtKsrY/vyrTRpoTheBckuHiBLLbIhcW+xBhVYSDJxY/4P34tDqM
	TWpyWG2xT3gphCA9S5DZsQ+AqBGBHbteLVqr+lxgavCKwSHd75gPQuAzs/awfg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 15 Dec 2025 17:26:38 +0100
Subject: [PATCH v5 4/7] clk: eyeq: add EyeQ5 children auxiliary device for
 generic PHYs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251215-macb-phy-v5-4-a9dfea39da34@bootlin.com>
References: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
In-Reply-To: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Grow our clk-eyeq family; it knows how to spawn reset provider and pin
controller children. Expand with a generic PHY driver on EyeQ5.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
2.52.0


