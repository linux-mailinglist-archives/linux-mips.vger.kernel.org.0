Return-Path: <linux-mips+bounces-14559-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFFENpkuA2qN1QEAu9opvQ
	(envelope-from <linux-mips+bounces-14559-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 15:43:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC26521810
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 15:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E325E3100AAE
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 13:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE843911C5;
	Tue, 12 May 2026 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0SpwAQU+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680D37DAC1;
	Tue, 12 May 2026 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592464; cv=none; b=fELwUhisD0DWUJ+5irM6E736/Srs8EQQusOlT7d4HW6TeXmhXkMdx4lg2Sd6cx0Q9KFOxfpfeOlh3BnliHCHqZeB9HOBMiI8MhosY/Wm4sRzCSPJxIQuCDnyXapQmzhobUmYM3P9mN5T/SeGObsxKWf349L2ioPqPNeaRXco47I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592464; c=relaxed/simple;
	bh=pF75TB3MDx8IPNzKd7VQ5GEsw5MRqqFZ9NJLxGABgFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUe2AfB0bV2Fed6YDHXoGcq+aUDyl+uTyHG8GsEah8ge0vez29eApdo/+PSILVjwo6VRjPAwNVPR/IG2jqo5Z3bWhrWQhG3g78wnKCTLRXaXDNLVZSiX2UaHAXxgtwf00xd1kSV/hcERjkmM4lUe+J6faXzXUnvPLcBXJhh4BAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0SpwAQU+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E5AF4E42C8B;
	Tue, 12 May 2026 13:27:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0195A60646;
	Tue, 12 May 2026 13:27:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CAC611AF8CDC;
	Tue, 12 May 2026 15:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778592459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BYr8hLWc1z4vC24X6Zcbi5jhHf39DA1phbNVUiIpIGE=;
	b=0SpwAQU+K6j2g6vY6WNjg5wtX/IyfLin7t+rrOJ01PSQXzawetLkKBXQgCQKxDXLCDUQej
	v3Pp7hOy0XtlSA5RfksLnts5uR1NS9EnqQoIg5fOk8Fc2T8IUEzgi6Jsm2Rg8jExznkFjD
	LN3dWEdVvRbeD1ZtTwYqKSsdV3RqhQ1YI7ZNW0vPDrCqxsne7GWbAMAkwF2NJZp7lM6Ms5
	FXdzcoT+fIqVyqWAwwL+CbV2XBpwqYUaO9Iko6b1oYWESI5VBht8Z9hBn0aP8kiOBxyt+v
	UbMmbQE2U2weSmszPtNbcHA0ZOP0hYTYEtTDjO5dzWvbJkW/rP443W5KIfuvEA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 12 May 2026 15:27:02 +0200
Subject: [PATCH v6 3/9] clk: fixed-factor: Rework initialization with
 parent clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-clk-eyeq7-v6-3-0540cce18fb2@bootlin.com>
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
X-Rspamd-Queue-Id: 9CC26521810
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14559-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

Use the same sequence as clk-divider, clk-gate and other to set the
parent_names, parent_hws and parent_data in the init struct when
registering a fixed-factor clock. The number of parent clocks is now
only set to one if a parent clock is provided.

Previously the number of parent clocks was always one, forcing callers
of __clk_hw_register_fixed_factor() to provide a dummy parent_data
struct with an invalid clock index in case they were not provided with
a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
not necessary anymore.

This change only has a small impact on mis-configured fixed-factor. Now a
call to clk_hw_register_fixed_factor() with a NULL parent will register
a fixed-factor with zero parent while previously it was registered with
one invalid parent. In both cases the rate of the fixed-factor is 0Hz
but it is no longer shown as orphaned.

This has no impact on properly configured fixed-factors clocks.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-fixed-factor.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 850e8b95f352..359e91441c74 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -124,13 +124,13 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
 	init.flags = flags;
-	if (parent_name)
-		init.parent_names = &parent_name;
-	else if (parent_hw)
-		init.parent_hws = &parent_hw;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = pdata;
+	if (parent_name || parent_hw || pdata)
+		init.num_parents = 1;
 	else
-		init.parent_data = pdata;
-	init.num_parents = 1;
+		init.num_parents = 0;
 
 	hw = &fix->hw;
 	if (dev)
@@ -190,10 +190,8 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      &pdata, flags, mult, div, 0, 0, true);
+					      NULL, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
 
@@ -201,10 +199,8 @@ struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      &pdata, flags, mult, div, 0, 0, false);
+					      NULL, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
 
@@ -212,10 +208,8 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
-					      &pdata, flags, mult, div, 0, 0, false);
+					      NULL, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
@@ -296,10 +290,8 @@ struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
-	const struct clk_parent_data pdata = { .index = -1 };
-
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
-			&pdata, flags, mult, div, 0, 0, true);
+			NULL, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
 

-- 
2.54.0


