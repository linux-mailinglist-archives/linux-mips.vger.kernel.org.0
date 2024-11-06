Return-Path: <linux-mips+bounces-6695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA89BF291
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19CC1F21028
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EEE2076A4;
	Wed,  6 Nov 2024 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G/ir37kB"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDD1DE8BA;
	Wed,  6 Nov 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909044; cv=none; b=UM7BJgi3IpdGpRjLj7xDHVqMcq0GADDuV3031pKtE3rtG6V1RnPZTJjYO0JigGrupNNiYzT+bNMCIU68vrTVKHXwErsWoffBq5q8WyBj6xnx4G14D53rSYsbkjeMXtueDc9hu562V3qA9uGoQiqJqGxgQ8ZOc42ozKxOlrSlim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909044; c=relaxed/simple;
	bh=IbL1dIsMDKSWk+juOOze/+/g65R93/+X2wY8wHACvmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4ZPIEMTavdlPOJ+rx4c9NqU1X3WDcX6oF8DqhHsNFnoBAwBLJ5Hd6aDihyUxQXm9FPPVcK2YjBQirXN3blL1ulmolYBgEo2ZKPwuO+zyJXIuDZ3KjUhpYihj4ASWFJ6OZRS1lHi6Dd92AU5nhIu9Knm85FLaJeURqEA38GK/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G/ir37kB; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CD1240008;
	Wed,  6 Nov 2024 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kmyA2fOJCwI24a+4je8+bVYsLftxYiEpbBDgDU16Vo=;
	b=G/ir37kBGTvaZGJ0gPqyaKBMyktO21l8P6dLhFieA6QHGnl/fZtG//NjAvaoR0E+gGE4iL
	08fIRSHfXl/0On86fLQtClQWAc+aKQuF3kE4mmSZG7kpZVqsf4Pe9Y+OXJxuuh4KOlwI+d
	NoimqrOqheX91I26Rh3RkHPgIl8yo/z2RsFyEDx3cYtiV0BpOONIz6IMubDkpFoZMb+pz2
	ZyPLtmdfpbRnP2BLN/M+Faj1dJleZPCN7SGDCV5rKUuFPAQ2WSlsfmtz+87niLp3QkYZXs
	3OSeKoY9hBrJtNFYDVZ4KJgX7xcZZ5Shr4T+W5pYUr2HGwmEXvEn0IV+01B6TA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:54 +0100
Subject: [PATCH v2 03/10] clk: fixed-factor: add
 clk_hw_register_fixed_factor_index() function
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-3-84cfefb3f485@bootlin.com>
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

Add non-devres version of clk_hw_register_fixed_factor(), with parent
targeted using its index.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-fixed-factor.c | 11 +++++++++++
 include/linux/clk-provider.h   |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 8fba63fc70c554df0d646dba75c5d70d0b184319..e62ae8794d445f685156276d5135448f340fca3f 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -241,6 +241,17 @@ struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_with_accuracy_fwname);
 
+struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = index };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL, &pdata,
+					      flags, mult, div, 0, 0, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_index);
+
 struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 75444e250a7875a4fa90c9dea7a90b198f6be2b8..99ae3ffb94bc5ce2b8493509cf3548b03209852b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1142,6 +1142,9 @@ struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div,
 		unsigned long acc);
+struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
 struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,

-- 
2.47.0


