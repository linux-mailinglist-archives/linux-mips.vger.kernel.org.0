Return-Path: <linux-mips+bounces-11000-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37570B41FBF
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5E91896A79
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA06302CD9;
	Wed,  3 Sep 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vUQbL9qa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6D3002AF;
	Wed,  3 Sep 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903676; cv=none; b=fQYT86SHsKy69SmuULzP1JD3HgiqUPdwuovodj3ex5iU49V3kAgJZLAj1zI62HdhYE6t6xytaiCX76rI5LcD9HO15PPtUrvwF7RYYMLqPFdE+nSIL22KK+f7BWoTap4y4HhKLGrAAGw4CGphkR6WKD5DsdeWXVbFR5Ic7Ra1/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903676; c=relaxed/simple;
	bh=DrpsGRl2lWVxg8jgfjmuky3LsdH9Ow5e5tUE+I/Ksys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNkPFBGIl0fPhBS2wdNoeiM+rs+b9e957VUpN/8NKJhdtOs+5NZc4nPTcOwGOhrWgYoe5r45Q3EHl2gc6/7zuS6O6hRB0l1OzIYRbaU26tsfjKhr/ftFy/HqdMtUCVHbsko2iXePpD5H+ou+HpM8tRVCqWdhOhSICs6U5unSOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vUQbL9qa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D6091A08CE;
	Wed,  3 Sep 2025 12:47:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0617D606C3;
	Wed,  3 Sep 2025 12:47:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 211331C22C3F8;
	Wed,  3 Sep 2025 14:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C+XaOZ1nGya7Ny+Ft3/Ooh9qVsU2Acl6gHch2FC2Uvc=;
	b=vUQbL9qadf+K5EOnSVLM4F2NxWru936xLq7zTMYAAxatsuc39EeLWE7eX5Lvq49R2IoFyn
	+kL+tT1B7Xvf/4YdVRKCGUmBdaiXQwaDzsXbj4nTV9XbYvFXLqUGfWPa8HH0bZiBzR5wQQ
	GXLe1xhVumhVUvMhdgkEOm07hL9M2f8JAq5Rnd5IbjmYVyqDft5S5JXcN7x0G37XCvBPKS
	XcnLYcDPWZkyxhifUR7cYrDbh3BG1xeMSsv/D6WFGlixRBtxTUSCOnqGl8cOg8cWsED29v
	HovHa0+AlQYhzEW2lJ5kJ9I7vcWKSK1y8q2tVtqFE0Who3wwdD/+jKPFE/L3nQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:15 +0200
Subject: [PATCH 08/19] clk: divider: check divider validity for
 CLK_DIVIDER_EVEN_INTEGERS
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-8-3f5024b5d6e2@bootlin.com>
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

Ensure that the divider is even when the flag CLK_DIVIDER_EVEN_INTEGERS
is set, similar to the power of two check for CLK_DIVIDER_POWER_OF_TWO.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-divider.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c1f426b8a5043cb5a1de08e1da385928ec54a2ed..8e8f87024e76625f348f1d66c15a7a938fa0c4db 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -181,6 +181,8 @@ static bool _is_valid_div(const struct clk_div_table *table, unsigned int div,
 {
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		return is_power_of_2(div);
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
+		return (div % 2) == 0;
 	if (table)
 		return _is_valid_table_div(table, div);
 	return true;

-- 
2.51.0


