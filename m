Return-Path: <linux-mips+bounces-12922-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB3D1DD1C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 11:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93F06305BD36
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF9538A9CF;
	Wed, 14 Jan 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JUXY9aCs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4086338A9D6;
	Wed, 14 Jan 2026 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385147; cv=none; b=goaQQnQVjay1SP8z4FSkVtHEF0Mjj6fG1Wd3JFsDSAlFCkqwLaVgL+/bR1/oJ4Kb5ILiKePXQvQ0sf3JPI+Z+NdNQwAJ+bN7iyifFTqS5367+N4cqcwQoR4ay71tsnPig3TLbYryOXl4j3muCPe8/nBJfNvnmXCOAQb3EU5CBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385147; c=relaxed/simple;
	bh=rShCcThCOnPkCF9UW4uNpzfDIPm15l/NaCNH52W57hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgYIVYsJ7CZJa/uE9M+oyB6bHwObpQw9GOsHE4rdoUOt0tKniUBEiGKFicQcrOpdoNlUM0HY7PME0i6RBTwYPdQGiZlWmJ6Rz3xXN40BJ3qZUF2lzQkzoN6Y3ZntPh9+7ftatC2kDa5IE6bhdFLNIi7YC2+fKXgK9brfCuF8824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JUXY9aCs; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C83294E420D4;
	Wed, 14 Jan 2026 10:05:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E7E56074A;
	Wed, 14 Jan 2026 10:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4F13103C89BA;
	Wed, 14 Jan 2026 11:05:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p7abIbbRvpSqMhCGCTKHWciu/aq461NaY7BaEGPYWZw=;
	b=JUXY9aCs90AdyX6Is0xNF1/yP02QqSQmJVxkOV1++9oOAy9fbfc8V859IANFMJTndljA+c
	BZ3xPNOx4h84QB5vUcUD43964Z35IDCKOycTRjDOLj6rwfGIoFK+z4AwC7LxTLyT91uzPm
	CU66iocPh/9H7AIMlcJFEpbyVNg7wenLBjpGAyhXBG0/FRFTerSuU/AcqUCMw/h62AfA3k
	ozNAhRZuIiDoMlVcMJ2oanrfvANtfQ+zOKjORZkn07uaOaaJ+sfzX5wiP8XqcRCozAXvxR
	6Tu40A8vsIchIL7j7YnkGGuTwOta/46Z2dfz9NZzNLZcccVNflCLSWQL97s92w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 14 Jan 2026 11:05:08 +0100
Subject: [PATCH v3 04/10] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-clk-eyeq7-v3-4-8ebdba7b0133@bootlin.com>
References: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
In-Reply-To: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Make the base registration function for fixed-factor clocks public and
re-implement the various registration functions that are a direct call
to __clk_hw_register_fixed_factor() as macros.

This is similar to how the registration functions of divider, mux and
other clocks are implemented.

Add a new macro clk_hw_register_fixed_factor_pdata() to register
a fixed-factor clock with its parent clock passed as a struct
clk_parent_data.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-fixed-factor.c | 52 ++-------------------------------------
 include/linux/clk-provider.h   | 56 +++++++++++++++++++++++++++++++++---------
 2 files changed, 46 insertions(+), 62 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 63082115fd25..f70378fa807a 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -90,7 +90,7 @@ static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *
 	clk_hw_unregister(&fix->hw);
 }
 
-static struct clk_hw *
+struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name,
 		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
@@ -148,6 +148,7 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_factor);
 
 /**
  * devm_clk_hw_register_fixed_factor_index - Register a fixed factor clock with
@@ -173,46 +174,6 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
 
-/**
- * devm_clk_hw_register_fixed_factor_parent_hw - Register a fixed factor clock with
- * pointer to parent clock
- * @dev: device that is registering this clock
- * @name: name of this clock
- * @parent_hw: pointer to parent clk
- * @flags: fixed factor flags
- * @mult: multiplier
- * @div: divider
- *
- * Return: Pointer to fixed factor clk_hw structure that was registered or
- * an error pointer.
- */
-struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
-		const char *name, const struct clk_hw *parent_hw,
-		unsigned long flags, unsigned int mult, unsigned int div)
-{
-	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      NULL, flags, mult, div, 0, 0, true);
-}
-EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
-
-struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
-		const char *name, const struct clk_hw *parent_hw,
-		unsigned long flags, unsigned int mult, unsigned int div)
-{
-	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      NULL, flags, mult, div, 0, 0, false);
-}
-EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
-
-struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
-		const char *name, const char *parent_name, unsigned long flags,
-		unsigned int mult, unsigned int div)
-{
-	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
-					      NULL, flags, mult, div, 0, 0, false);
-}
-EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
-
 struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div)
@@ -286,15 +247,6 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
-		const char *name, const char *parent_name, unsigned long flags,
-		unsigned int mult, unsigned int div)
-{
-	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
-			NULL, flags, mult, div, 0, 0, true);
-}
-EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
-
 struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129..614abb396a6e 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1146,13 +1146,16 @@ struct clk_fixed_factor {
 #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor, hw)
 
 extern const struct clk_ops clk_fixed_factor_ops;
+struct clk_hw *
+__clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
+		const char *name, const char *parent_name,
+		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		unsigned long acc, unsigned int fixflags, bool devm);
 struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_unregister_fixed_factor(struct clk *clk);
-struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
-		const char *name, const char *parent_name, unsigned long flags,
-		unsigned int mult, unsigned int div);
 struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div);
@@ -1164,9 +1167,6 @@ struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
-struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
-		const char *name, const char *parent_name, unsigned long flags,
-		unsigned int mult, unsigned int div);
 struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div);
@@ -1178,13 +1178,45 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
-		const char *name, const struct clk_hw *parent_hw,
-		unsigned long flags, unsigned int mult, unsigned int div);
+# define clk_hw_register_fixed_factor(dev, name, parent_name,                 \
+				      flags, mult, div)                       \
+	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
+				       NULL,  NULL, (flags), (mult), (div),   \
+				       0, 0, false)
+#define clk_hw_register_fixed_factor_pdata(dev, np, name, pdata,              \
+				      flags, mult, div, acc, fixflags)        \
+	__clk_hw_register_fixed_factor((dev), (np), (name), NULL, NULL,       \
+				       (pdata), (flags), (mult), (div),       \
+				       (acc), (fixflags), false)
+#define devm_clk_hw_register_fixed_factor(dev, name, parent_name, flags,      \
+					  mult, div)                          \
+	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
+				       NULL, NULL, (flags), (mult), (div), 0, \
+				       0, true)
+/**
+ * devm_clk_hw_register_fixed_factor_parent_hw - Register a fixed factor clock with
+ * pointer to parent clock
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: fixed factor flags
+ * @mult: multiplier
+ * @div: divider
+ *
+ * Return: Pointer to fixed factor clk_hw structure that was registered or
+ * an error pointer.
+ */
+#define devm_clk_hw_register_fixed_factor_parent_hw(dev, name, parent_hw,     \
+						    flags, mult, div)         \
+	__clk_hw_register_fixed_factor((dev), NULL, (name), NULL,             \
+				       (parent_hw), NULL, (flags), (mult),    \
+				       (div), 0, 0, true)
 
-struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
-		const char *name, const struct clk_hw *parent_hw,
-		unsigned long flags, unsigned int mult, unsigned int div);
+#define clk_hw_register_fixed_factor_parent_hw(dev, name, parent_hw, flags,   \
+					       mult, div)                     \
+	__clk_hw_register_fixed_factor((dev), NULL, (name), NULL,             \
+				       (parent_hw), NULL, (flags), (mult),    \
+				       (div), 0, 0, false)
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
  *

-- 
2.52.0


