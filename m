Return-Path: <linux-mips+bounces-6591-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA249B7F33
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C28B1C21347
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8081B1BDA8D;
	Thu, 31 Oct 2024 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CJxvlrt8"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B41B0105;
	Thu, 31 Oct 2024 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389990; cv=none; b=a3OrDP4lqUgiqF8q8XJppJSR+iAWf1fYFBDR1/kep0xZuw5vR/NxzYSajdHPNmlZA+VOsixLHffpr7HaGqqrfEvU0tvkYhnCLfoRMU6uQXW1t0y3cnXiZh33ELJAmGPF7AQcvNYRWO7lKv3I170zfH1GxdYuzKTWZvh75bByvmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389990; c=relaxed/simple;
	bh=IbL1dIsMDKSWk+juOOze/+/g65R93/+X2wY8wHACvmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOSa/0QKdPy93Ievttk5DnTYwJVuaF9oLD778vbDgwYlM9h3R7VMgDKqpfZeINIIUsJbP76XhhJrYpx0nMBCQiIcAL+GSqTU/RaRhNiVqyWy7hZeWlye/gIAbK5dIkLzpBiIIBw5ISYtI7Fco/k9Tp8Z8zeR92VYBIMvz7yKQNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CJxvlrt8; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87FA41C0010;
	Thu, 31 Oct 2024 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kmyA2fOJCwI24a+4je8+bVYsLftxYiEpbBDgDU16Vo=;
	b=CJxvlrt8Z654I7Xpw0/3qx96DIpeL9MEhmDRSu3L8fvWl+8ABaBPZu4NnCZbeO39RmILVD
	tvff+1uHmpuRWW+8LF0YTnoNeWYnakcNSIEZJaTZ+wfbkvE1Pt54t8+oU3x7vmSFSgYfA5
	zGyXw+2miiUu8Ah8cN5+yZuka3b4PKBhaJ9ZF0v88vYYncBYBThePQlKAPAATIZXHFmNiw
	Qe8WUjl0RPn3rbMzTKXZzXI3IjWFmb0UM9mhdH0ZzNKceCHpVLGsN4krJtogA44+6Sl5JP
	sF/mL5ViuTk43f2aJlOffF49LaC4iWwbcXk+t7LhOebcn1ocxqEMgqxXkbU7ig==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:56 +0100
Subject: [PATCH 06/13] clk: fixed-factor: add
 clk_hw_register_fixed_factor_index() function
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-6-89d8b28e3006@bootlin.com>
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


