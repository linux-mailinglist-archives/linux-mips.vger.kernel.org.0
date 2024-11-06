Return-Path: <linux-mips+bounces-6696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F59BF295
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06FF828429E
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD47F208219;
	Wed,  6 Nov 2024 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fqGJ54zq"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E8204F72;
	Wed,  6 Nov 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909044; cv=none; b=pcL/Pv6r4azOrQV2NBr3sN80wn/PlJgGXaD6CcL6vhA4btsahBSKTmNQzoe8gfeGYqwasMSZ3nKW2cT0gVmbYMuv+oCq1RW6kF2Nt6E7f1fby9sfPtQKaFIIohLNH+9IOErhw1FfD98LL8AlkhwFELWfu2C9s71TY7sRF6I1RPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909044; c=relaxed/simple;
	bh=D2fFO3TvW8pWiiQQhC6srobO+d+pk4Jn1x6UDZRgHZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUUV5XWi/R5NgE6+NmW1iU/xhCSzIJPvpheVT4N/goemVPz0IASIB0E1BDSSbPeL6DRI0BUzM4AdXeg0+FPtR+TFAk9bK1aM82iOy8anSavmIyJyZYAQQaX4X3DKx09fb8srblsRGVeDdjikbL3OJ0qaJdKAbwa62x45+mTtcGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fqGJ54zq; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0F0940010;
	Wed,  6 Nov 2024 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKhRzgiEUNdm1NA9uvOtWIMNNDJizhjx+IFpddS8/Og=;
	b=fqGJ54zqt6XDdIMCkXo2K03xHAkiBbCCrJReJSOOfo8bnJBQspYmxlf7fPvJiDb365ugan
	wcHOyDHBh26onDKBkC1oKEzE4hlV9S2QGJqCczn0ajg53EKvwLy0Yt2bvYHsdJJ3W1TyjC
	z5YfCnPdTxadFPK21sh1sq1EUo86VjA+bx1LsdmV9Zr26eFSquJCEeaxvfQeHIHv0F9kI0
	j2n5HSSzbkXk+0dIYXpfbmu1GVcjXpOTffVGPmngou4AO7wS9JKfbV54zei+Kpwoy66Nu/
	GpJYnWdQ8bYlz0yxatfiENUkoopE8fE7AukUbNbX7pvqH164zUGNwLqkI1UVnA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:55 +0100
Subject: [PATCH v2 04/10] clk: eyeq: require clock index with phandle in
 all cases
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-4-84cfefb3f485@bootlin.com>
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


