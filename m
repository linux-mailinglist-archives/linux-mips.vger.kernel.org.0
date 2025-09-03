Return-Path: <linux-mips+bounces-11010-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33513B41FFD
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD013B94E6
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5081230DD09;
	Wed,  3 Sep 2025 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mXE9+74b"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E230BF5D
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903695; cv=none; b=ZCI7J8iwv1KmJ38EDoa35aX7nQH1WL8pSLZGHQIPI0CjfmIzabXQqwojjhgMfuJAkNX8nRQecZk16igZePmJCfB4ff8vQ4SyTY69H3TJGKF0rrwOhoDHhK8+GpYfeB7jNFEEteqVBJJ9J2vPamYem69O6tyybboNks1REuJBi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903695; c=relaxed/simple;
	bh=R0IpjP48mGbApyiDHDBOompW3i7L72XuTjLgRVkraEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZFuEMu9Hr2tbuoR/wLEXzJp2JsnTbXO+e1uTvpcBkuzEsygIF4Ag4nvIwFG9RsGh2OlAcbeBrtMnJdZTb2ASv26f/YAlC5iNWpLyO/eIXzetDxPmas/3Q05lIxWkllCCaK0qOzhVFDZbPopbUuXEvi7bF4R+/QgK7IS+msRVqIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mXE9+74b; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EDCE51A08EC;
	Wed,  3 Sep 2025 12:48:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5735606C3;
	Wed,  3 Sep 2025 12:48:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9A0D1C22CF52;
	Wed,  3 Sep 2025 14:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903690; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ik7BcMqE7IJwAhNylRviJShBX6EjkWH4eM1xXqILmgs=;
	b=mXE9+74bgFgeFgGidMG2360hnt7QuME+h4vj0zDzRYIogZDDC/g0wKX/VyLYZ7DBviBbwi
	EAfQnsqF3epghJJTx21bcmvv8pC9MJbfy1qKcTyF7zucMZx5dbJAEIXmgfiwqW0N/j7gwG
	r1lOPDsMNUkC/hvRTOln45fKyCesongZf7mtd19XL/BdoDLitefj9K6VcF9AWg5YBmtCC6
	U8ZeBQBHR9zeWmnXw7OuHNtkSBuwL6HSdkYIH/40QsT+ZMcvMZ5A3lfiPNP6eD/Bq2WjIn
	S/ztB04o11JxsiFR6PdGI6Xo1CT4sP3GazObaEoH8XwMvszO/4c0uRiUSR6pVw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:25 +0200
Subject: [PATCH 18/19] clk: eyeq: add an optional clk_div_table to divider
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-18-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
In-Reply-To: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

The new type of divider in eyeQ7H OLB are table-based, use it if
present. Make sure we don't pass CLK_DIVIDER_EVEN_INTEGERS in the flags
when registerting a table based divider as it has priority over the
table.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index a6260c38393776afab60e994c99008cfeecf6bc3..8d5e194215e9d3d13b334a5ebf004499050e84b9 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -119,17 +119,20 @@ struct eqc_pll {
 };
 
 /*
- * Divider clock. Divider is 2*(v+1), with v the register value.
+ * Divider clock.
+ * If the table is NULL, divider is 2*(v+1), with v the register value.
  * Min divider is 2, max is 2*(2^width).
+ * Otherwise the divider values are looked up in the table.
  */
 struct eqc_div {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	parent_idx;
-	const char	*parent_name;
-	unsigned int	reg;
-	u8		shift;
-	u8		width;
+	unsigned int			index;
+	const char			*name;
+	unsigned int			parent_idx;
+	const char			*parent_name;
+	unsigned int			reg;
+	u8				shift;
+	u8				width;
+	const struct clk_div_table	*table;
 };
 
 struct eqc_fixed_factor {
@@ -433,7 +436,7 @@ static void eqc_probe_init_divs(struct device *dev, const struct eqc_match_data
 
 		hw = clk_hw_register_divider_table_parent_data(dev, div->name,
 				&parent_data, 0, reg, div->shift, div->width,
-				CLK_DIVIDER_EVEN_INTEGERS, NULL, NULL);
+				div->table ? 0 : CLK_DIVIDER_EVEN_INTEGERS, div->table, NULL);
 		cells->hws[div->index] = hw;
 		if (IS_ERR(hw))
 			dev_warn(dev, "failed registering %s: %pe\n",

-- 
2.51.0


