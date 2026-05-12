Return-Path: <linux-mips+bounces-14560-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJuLMrUtA2qN1QEAu9opvQ
	(envelope-from <linux-mips+bounces-14560-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 15:40:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D452167E
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 15:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323E33113197
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54D9395AFF;
	Tue, 12 May 2026 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DkY5TOOn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE34394EAD;
	Tue, 12 May 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592468; cv=none; b=cKjB8vyQGtbsYF6Fu5CASWzlG9zlbh1LvDGY4uE3AVt6gS6pSIxy0qylSvFT1SUtzy2dHwwOOCg2AqxK31dK3OiQDidu+i7NvLy5gzANgaHEyS0b23lfHlNdGLFAeU+kU8F+uSAzjOC4Q99infJRAQSejAz6jCvch6ujuGawZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592468; c=relaxed/simple;
	bh=NnHp3j6U7+er994uggqYnS6IjvW64ysWBeVeQ92sh3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBdJpEiOLvMKvIa1C44kOJG7sQq0CC+CFEIPNRnJDeEFacidkzkou5Q3DkHJo/6LhSj+qb38gDBn5XLtQslDlfzy7cxA7PAdvrX1VL4K47JWeUiGc42GmU3zrvp8avbWACwjww9GZ6ha3ARFF6D6ZiJLNSM/M+wLHn4GAp3m9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DkY5TOOn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD2774E42C83;
	Tue, 12 May 2026 13:27:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91F0760646;
	Tue, 12 May 2026 13:27:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 407F111AF8CE7;
	Tue, 12 May 2026 15:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778592463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DeS13hXcmS2DQvphDSqzEOVz7CNiRVFzgIx0E3PiCOI=;
	b=DkY5TOOn/L+LhYTzSGwKRTxNevVoMp0DTzo9ennGzVn4HLlonnMCVMiWZGyj5JlY0Iw7TF
	5uXLd7gPWfU63JZwv3us5AyG+1/zMNEFjCjQSf0oDC0iGociwOl1CXSkJDCh4CDqaQoODM
	/k0ElR6thNoiblTzeRDHl44auMM86fdzhX4pqQ0wVailet/soNGWqMt1P8GnSqovS62jQ5
	wN5flnxXjIazIY+drcWlFCHoiT2P8nSvtuvo3REdVDTZkEudWrQPoL3EI3pRmEE7MEi1+i
	S9h/A79t5YqMW/IXmJ4FM0S+E1wTT0BtvjAU+Rmo2pWMO47/isU6rUV52bv3sg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 12 May 2026 15:27:03 +0200
Subject: [PATCH v6 4/9] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-clk-eyeq7-v6-4-0540cce18fb2@bootlin.com>
References: <20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com>
In-Reply-To: <20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 3F0D452167E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14560-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Make the base registration function for fixed-factor clocks public and
re-implement the various registration functions that are a direct call
to __clk_hw_register_fixed_factor() as macros.

This is similar to how the registration functions of divider, mux and
other clocks are implemented.

Add a new macro clk_hw_register_fixed_factor_pdata() to register
a fixed-factor clock with its parent clock passed as a struct
clk_parent_data.

Reviewed-by: Brian Masney <bmasney@redhat.com>
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
index b01a38fef8cf..aba71f5dcc21 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1152,13 +1152,16 @@ struct clk_fixed_factor {
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
@@ -1170,9 +1173,6 @@ struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
-struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
-		const char *name, const char *parent_name, unsigned long flags,
-		unsigned int mult, unsigned int div);
 struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
 		struct device_node *np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div);
@@ -1184,13 +1184,45 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
-		const char *name, const struct clk_hw *parent_hw,
-		unsigned long flags, unsigned int mult, unsigned int div);
+#define clk_hw_register_fixed_factor(dev, name, parent_name,                  \
+				     flags, mult, div)                        \
+	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
+				       NULL,  NULL, (flags), (mult), (div),   \
+				       0, 0, false)
+#define clk_hw_register_fixed_factor_pdata(dev, np, name, pdata,              \
+					   flags, mult, div, acc, fixflags)   \
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
2.54.0


