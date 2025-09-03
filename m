Return-Path: <linux-mips+bounces-10999-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E55B41FC8
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4C85E6B11
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51738305071;
	Wed,  3 Sep 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VaKRUXVN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE96303CA0;
	Wed,  3 Sep 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903672; cv=none; b=dLkA2sc7iYV/CPj+M6NDR+KGHSNTNC0rpvDw6qEWbiAwXhuGxUs2KQHDCNyhS1TO+jsa/gyRC07kvl3ZXRmpulFYVG91xmuAwAx68Ivo4BXxd0fTgh/Otiv8gv1MYyq82BRgaorrxMlxNXr4zrTXZKTKenUf1Nh95wF4mipRmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903672; c=relaxed/simple;
	bh=xi/o5kWUDoeVTEz8CVGVlsZgn5M7wM6SPz+7rGGvINI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCbIn+vTgR9W9qzZF7fUMQKZmi61dKsJy8MrQNASqVzZhU0INJWC+kh9CbTTuAAVeCTpqBoe2P/AG0EOpYqbKR4xenNdFjoSVTQlPWZfK/wEdTNJ01+cVIH5LFiPGXZYwFNdh14+g6UMaAsukPRFB5k21oBBF3JI0dbu4iapo5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VaKRUXVN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6FE64E40C0A;
	Wed,  3 Sep 2025 12:47:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE967606C3;
	Wed,  3 Sep 2025 12:47:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 632151C22A4EA;
	Wed,  3 Sep 2025 14:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PLsxsB1U7iOyjFs0v18bA/rl5OjxWvCZDmHawmPZZz0=;
	b=VaKRUXVNW1hH2ngZ83GKCpeYB71UlbdWGaAnVXDR6khs42dk+ZPVba9/Y+r3fgSRKxbBYr
	V1KZEsQkM9iULoJifNqozKspb9vrDKKuKwf/3Rf51tKzGcWRD0hU98KDekM5CsAnxpXE95
	0Kez+MQ4EhbINEUu8XDeNi96rVwghLEoBSgQSzpeCW3+/yuQPpeidT5E+zJry4aHRVXffY
	AkQu/7JsyotXaA4LwPsaXXy8znrBfwVg7F/yLWNyS3evOQDPqymZRijzPVPR9SRFU88ztP
	RIWqVXpJwZRoHl5ECISm+ikzziNt51naM8pYgPyChfOfQlclXjamCQw7gZgLmw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:14 +0200
Subject: [PATCH 07/19] clk: fixed-factor: add
 clk_hw_register_fixed_factor_with_accuracy
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-7-3f5024b5d6e2@bootlin.com>
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

Add a variant of clk_hw_register_fixed_factor allowing to set the
accuracy of the fixed factor clock.

This function allows declaring a fixed factor with a known accuracy
and a parent clock by name.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-fixed-factor.c | 12 ++++++++++++
 include/linux/clk-provider.h   |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index e62ae8794d445f685156276d5135448f340fca3f..7c76658a725f9b268da2485769979e5ba213d25b 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -217,6 +217,18 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
+struct clk_hw *clk_hw_register_fixed_factor_with_accuracy(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div, unsigned long acc)
+{
+	const struct clk_parent_data pdata = { .index = -1 };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
+					      &pdata, flags, mult, div, acc,
+					      CLK_FIXED_FACTOR_FIXED_ACCURACY, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_with_accuracy);
+
 struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..6b3e426f5754bfae4af89765bf5abd2954ca49dc 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1153,6 +1153,9 @@ void clk_unregister_fixed_factor(struct clk *clk);
 struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
+struct clk_hw *clk_hw_register_fixed_factor_with_accuracy(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div, unsigned long acc);
 struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div);

-- 
2.51.0


