Return-Path: <linux-mips+bounces-13370-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPRQB6ZRqGnUtAAAu9opvQ
	(envelope-from <linux-mips+bounces-13370-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:37:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37C202E7E
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDAAB304353A
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 15:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3A9342507;
	Wed,  4 Mar 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GRFx+N7C"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C5340D90;
	Wed,  4 Mar 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637969; cv=none; b=SUiVvmNKoxMzQJwZjr3QHmAKTpj7LEn61Yq6NLQUSaPAeq2+C9BF2iUDrbf4LvNYzik2fI2MQvkCk0x5ocqQ116bO0gtZ7sp5LLVg6RzNxOPv2JxFPW8pFtMrhFYlKfRYmhmqrtCwbO7WLd9I2oO1h/8m4wGtWX+qHg90YhVY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637969; c=relaxed/simple;
	bh=QdQvk6IJm8IygcSkwWyXL1m+vX6W4+Itk+gvL401Y/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEgaT2M1XT6tI3jCigaAweFSUvoKNOkKnLzASy06r2nlXCyVygLWT6mmL6NDqL85AKneXMJMaiwj2Ly/2ItTAPeUXLNbopFcOeMSrur10HOoBU8gu0NmLlu+syD8TS9DuGgCBHQ0DIXKdGCPGDZleuSFS8msoHWDuQzQryq6jEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GRFx+N7C; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8AE834E42543;
	Wed,  4 Mar 2026 15:26:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A1085FF5C;
	Wed,  4 Mar 2026 15:26:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C9C2103697AE;
	Wed,  4 Mar 2026 16:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637965; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MR43nDNvlmmSH9HUTJwjRyaSHhYhM5eMt4s4Ppb4Di0=;
	b=GRFx+N7CAksRyxXDzEI1MojUtmKYaJnDLg7YpmrHx3BzBT4A2seM79dLIO3dGn2IWjG5TG
	doP5eE/CA0OZnZtmJpklaICynJFz6rhkNYnC7ml/dXBc+fqDfStF0iJn6mlxhcglL0RYKk
	ArKiC2MmCnl+AnVA0mdbi6HWs9BvaVzmRiiJmYiaAOAVxW2Lcm9bX5bZkoNBqhF2bH6hau
	pCmhi5w+iTOFnZEgUXMaUTdzd3/Y4WdqYGuQ3DXwvIKLkHzoRjlpoiPHRLQSQDf7a7J+F6
	hxdZeXDdnQjKx5l7Ib7wkDVDy48yY5RQFA9RZgo0O3MVgizviowHzZfwyDvO6w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:18 +0100
Subject: [PATCH v4 04/10] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-clk-eyeq7-v4-4-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
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
X-Rspamd-Queue-Id: 3C37C202E7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13370-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

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
index 359e91441c74..6116f878fc8f 100644
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
2.53.0


