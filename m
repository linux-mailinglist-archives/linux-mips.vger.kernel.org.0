Return-Path: <linux-mips+bounces-13732-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDP1I0JZuWnYAgIAu9opvQ
	(envelope-from <linux-mips+bounces-13732-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:38:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFFB2AB005
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DF5530996BA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 13:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE98303C97;
	Tue, 17 Mar 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aY0bFTvx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5104227FD4A;
	Tue, 17 Mar 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754422; cv=none; b=nw4OHwC32heVsqwSou0Hsqh5bkdLSnyD8J5W2KdDKyhQHtzz8ZYjb5ldGhRUUUBcOtgfs5Ok5BiNEO78CwgkNlgcGRv81HKGRZ2lnbEnh54jSoYhFyv36N48DNwvwKE+9j+ehE/JYlRfkS9vQL9BcbNl/rsca//7RRa8iCxAWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754422; c=relaxed/simple;
	bh=w2P98RtZ71C/LGhITu+Rj69QooLz3cBmY6xljHzBuc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7jQjwVys75e/QsaqaFHsB+G9XQRGGK4EcqYvhPlpbelQJveHq3B8B/TQvRdHN4NUIVR9eAStPOWjqsw0+mfmIp0RYB32q/TGgidB0WgVw9mK3lYI7VBsW6e2DT2TIz8CUwEWB4SaZqT0jNyern+171A2mVnep7LkuGdgIsJ5sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aY0bFTvx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 087604E426C2;
	Tue, 17 Mar 2026 13:33:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D03BB5FC9A;
	Tue, 17 Mar 2026 13:33:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93175104505EA;
	Tue, 17 Mar 2026 14:33:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773754417; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yOq1d1/feoU9ZacZzbZLoYJ5+TqXp/ks2PPbQyH8Mhg=;
	b=aY0bFTvxHUTjsHbOy7p2URiNRXtO+WW7rfpDcPhxIeZf+28G/tgle7gs0BNdqfxAODAt4s
	ZI2r2+4YbScryLGZaq8fkTTGsV0w+E67NeuP8zrKbtrfaCk9SHAzjDXs9JBjpl+nVo3hsJ
	R1JRgjmcCZDFbN+/E5w/KbC8Oi3Z8kAavCRDdqYi65Fj8q0jh8MtWsjfRaKhDQ8C1QVouq
	p7eus60TCljnVashuqFi3t9VPFqWsI82FOpfJtMUoZahkD76Hl3slm2gYvGoo0noJPO8Ra
	ivi5hKWTuQnTnvJdhr9MM27VsrTuvQwZm3+ZXSlj6Aea81aEd56Mhrrd2D4F9g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 17 Mar 2026 14:33:06 +0100
Subject: [PATCH v5 04/10] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-clk-eyeq7-v5-4-6f6daa2c2367@bootlin.com>
References: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
In-Reply-To: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
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
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13732-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 1EFFB2AB005
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 630705a47129..7a3de1009270 100644
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
2.53.0


