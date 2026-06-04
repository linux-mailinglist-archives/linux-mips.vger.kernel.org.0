Return-Path: <linux-mips+bounces-14888-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sNtSCgl/IWrXHQEAu9opvQ
	(envelope-from <linux-mips+bounces-14888-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:35:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7388164060A
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:35:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=1XpsFCbp;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14888-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14888-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2DEC3145142
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 13:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A6D480329;
	Thu,  4 Jun 2026 13:26:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4747F2CE;
	Thu,  4 Jun 2026 13:26:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579604; cv=none; b=Il/OZXS0eg0I4CqmqcFWLjUa9uLy5F1cIKDsFm252rKA0ikj74kW1UOjiz9bm281xN+Ba4iqxwa1WHum62pzFQjwcYwo98XZ0uZtX7wvsUlFcgfsdB95j79EGMeooiTBdXH7xwz0wcETwEDvcV5XTOngqtBnMGQoRhTwN8anLLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579604; c=relaxed/simple;
	bh=H0tYZvWu/kFbvf1yCQKkNc09uNP5U4t9m6Ni+iRVScs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcTegqWpSUK5/Xv0IAjJk8fJFFRjuDT+rnYs7W7/abOpNzXAh4gm3C7R9tsuevqdqOlrHFwtnoUDjh4bviZkYfRBYjvjlXGFyGR/vfjVXoxhkgVpLw39G/WW8pJvikeEj0ntyzNQhP281xXnuANYM4PPKe6xU8dk3fEhnxhkOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1XpsFCbp; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 752C51A0656;
	Thu,  4 Jun 2026 13:26:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4986F5FEF7;
	Thu,  4 Jun 2026 13:26:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E63C3106A1B0D;
	Thu,  4 Jun 2026 15:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780579597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Wm8Y9HZlyA8AIclPeNH4UhbBAkUmpW9OpuwkC5TxRE4=;
	b=1XpsFCbpUiNrRIhmLNZbI5iSZHgbgsrmaQFEJE5w3C8ybE/Y9RppeQudzXn8YOCVON7sFw
	nE4epg9HR0zUDmyyJNcVPVM7fucR/OEJ9SLgGRO0N2E//b3nFn9NzKplzvAq4/6waekSVU
	y5tgxTdWQ2PFjFxeKq99SJrYkgHmTO+sOuoNE9IDxCSL2MpFtj2ZL9HO0wQKPDxFAy60Qw
	lPCxO7D3JaN6RxccAS4yxXPLBk5jPo1Cv73CLMteEf85A6boYU3suzZ2N2l2WegS/Ioj6w
	T/QfLsXbL0px8Wy3fsGIDfB9X9iatwn3P2vV63O4CI0HY9DdfsPLOQY32GOsAQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 04 Jun 2026 15:26:12 +0200
Subject: [PATCH v8 4/9] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-clk-eyeq7-v8-4-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
In-Reply-To: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14888-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:theo.lebrun@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:benoit.monin@bootlin.com,m:thomas.petazzoni@bootlin.com,m:linux-mips@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7388164060A

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
index 60e32482d347..ae473e0af903 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -94,7 +94,7 @@ static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *
 	clk_hw_unregister(&fix->hw);
 }
 
-static struct clk_hw *
+struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name,
 		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
@@ -152,6 +152,7 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_factor);
 
 /**
  * devm_clk_hw_register_fixed_factor_index - Register a fixed factor clock with
@@ -177,46 +178,6 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
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
@@ -290,15 +251,6 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
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


