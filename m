Return-Path: <linux-mips+bounces-6594-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AB9B7F42
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CABCB226C3
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6A11C3F14;
	Thu, 31 Oct 2024 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kRAQeOcI"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0D1BC061;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389991; cv=none; b=gccVxH2UHfPjRmtxV4vbGGyJoU1h4uDW2+PBgscEvmHwScW5VIf5knag87U+qSN+GQd5Fk3bz358I/bTgUEIVB2J4iBKEXDQskB2Um+Yqc8QcpQkIRUBUFyoSNggfnCJW4MT1byA5yKCWNHTwhNd0mLX5WY/CTBdwrj3lJpg0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389991; c=relaxed/simple;
	bh=D2fFO3TvW8pWiiQQhC6srobO+d+pk4Jn1x6UDZRgHZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CV+OzgCUfUR6+cCyPgFgOEk3zNUigmCmxH3WJO0HgpOP/qC0XytIFf8X0qqpmbbNb0CCm1ji2QxnRrbN88ka0euif6vWzx4kR39vslJKZi8DvTkyvtRp9UxU7KDP50Bi2RC6gVL9GAAOZObhDPedap3g4N8WP75YFa6bvWfQ8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kRAQeOcI; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C35B1C0009;
	Thu, 31 Oct 2024 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKhRzgiEUNdm1NA9uvOtWIMNNDJizhjx+IFpddS8/Og=;
	b=kRAQeOcIWRGHq5nIUyXifU4JrfAHkrgWUGMJ/NaGezTX03Mhpz1LYmY8CLcrfSJncnppUF
	H/LtCjQQ5nmtMtcFHkiuZf3FNbP4q96Vdm5GSSQc2ejUBbFvyQn5T0oRZhmABVIfPPACFs
	nCmYP+o0UDdTT4BDpIfBKrXJ6A8UwMwDDlwkk+GN6+WUV/LrIrKeN1znvefaRKyFKa5TMg
	2sY4sHql5u+lkH+yeM2uP3jazwMRvnc8teW7e/8+Achk1KrWYZuxAlGzthFjjKpYz5P27e
	ClPVwrg27SVaa0P56GWCmDuj01MK/3OYT/lCccQbtVNq7NdGRpYfzS5v/sqyWA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:57 +0100
Subject: [PATCH 07/13] clk: eyeq: require clock index with phandle in all
 cases
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-7-89d8b28e3006@bootlin.com>
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

We used to let compatibles with a single clock exposed to not have
a cell. Switch away from that and enforce a cell in all cases.

This is done at the same time as some compatibles
(mobileye,eyeq6h-{central,west}-olb) go from one to more clocks
exposed. Let's do the same switch and avoid future devicetree
work if/when others follow.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 77f1afb020a0247b9d73b59a88845b21a0d83b5e..ed4dab303d9121cd8bf453448b4c86547ea9244c 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -367,11 +367,7 @@ static int eqc_probe(struct platform_device *pdev)
 
 	eqc_probe_init_divs(dev, data, base, cells);
 
-	/* When providing a single clock, require no cell. */
-	if (clk_count == 1)
-		return of_clk_add_hw_provider(np, of_clk_hw_simple_get, cells->hws[0]);
-	else
-		return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
 }
 
 /* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
@@ -637,11 +633,7 @@ static void __init eqc_early_init(struct device_node *np,
 		}
 	}
 
-	/* When providing a single clock, require no cell. */
-	if (clk_count == 1)
-		ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, cells->hws[0]);
-	else
-		ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
 	if (ret) {
 		pr_err("failed registering clk provider: %d\n", ret);
 		goto err;

-- 
2.47.0


