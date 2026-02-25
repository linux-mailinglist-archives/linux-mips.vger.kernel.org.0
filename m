Return-Path: <linux-mips+bounces-13220-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM+5Ntspn2kRZQQAu9opvQ
	(envelope-from <linux-mips+bounces-13220-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:56:59 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5D19B0FD
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54E813010834
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4042D3E959C;
	Wed, 25 Feb 2026 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MLeemIdo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AA3E8C77;
	Wed, 25 Feb 2026 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038517; cv=none; b=CaELgTh36vMfmSTm38dyVUWmFFYcTJ+HkyG70lXDqP8pnDzKm+e7Gn3IGZ2rnOAuouM0Kn9twchfV83Gua0z7cxx87lVfxbYdc3dn/xQFIZ9Y93ysXQ6eQV1yee7gtD5N5HINQv71vxXjRMOdCDjiLwnwRL1Yl1+9/b3ksa6+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038517; c=relaxed/simple;
	bh=PbGpFBj9qp+Llus0hehY8FLiL5lje6mv6zQ7hxqifSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=deZdUbf/ZqlKedfB3xgNlCAkvpPKOQZqL4KmmZtXENOeo3iZqLsmRf+CxZyHVW9sDGef4sRk5kmDfH/MmqfzIO23RIS5xZjLo9lxqXBHN6ZdL5MVO4lZh+RoVnheEuyb59r7ulNFkT2XbYZJRu4LvqXF3VbtSslqEKghhkrr+Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MLeemIdo; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D040EC406C0;
	Wed, 25 Feb 2026 16:55:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCAF25FDE6;
	Wed, 25 Feb 2026 16:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A8FA103692EE;
	Wed, 25 Feb 2026 17:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M3FVqMMxkPIBexwhcE3EDBfny5EWj2r5T4da/rXsAnk=;
	b=MLeemIdoI3PcLu3FVKeosNH0Mf9kwkMnR9pS/BmtaAK6HlRQMLVAu7ZuyNAxLkOUWoAJZn
	jZmHuX0a9/GZ6LD5ZYE7ZOCTRCMuCMZ6D7VBQ+fUcjiMwUiB/jNU+xQliO57mRG2ij9Kba
	9QeF68w8tfoHlavk2+G9IiencLcI74VI+hdibFx+f7qXmup8ysovhosYv6X5GNydW+BUR4
	YULDKee3wc5etIGMfiieLY7NC1Isu7FEYOzzFIj1zhFNfvAxDMQJ1yEOsytXSBt9Ty0ovb
	/vZndWn8U9bM0kRl3+/68/L0fNNn2Whtd4e9jnF6yTF0BKJCHlA+Kasxvm0wSA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 25 Feb 2026 17:55:06 +0100
Subject: [PATCH v7 2/3] clk: eyeq: add EyeQ5 children auxiliary device for
 generic PHYs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-macb-phy-v7-2-665bd8619d51@bootlin.com>
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
In-Reply-To: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13220-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2D5D19B0FD
X-Rspamd-Action: no action

Grow our clk-eyeq family; it knows how to spawn reset provider and pin
controller children. Expand with a generic PHY driver on EyeQ5.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index b231d6deb209..b17f47fda1da 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -109,6 +109,7 @@ struct eqc_match_data {
 
 	const char		*reset_auxdev_name;
 	const char		*pinctrl_auxdev_name;
+	const char		*eth_phy_auxdev_name;
 
 	unsigned int		early_clk_count;
 };
@@ -361,6 +362,7 @@ static int eqc_probe(struct platform_device *pdev)
 	/* Init optional auxiliary devices. */
 	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
 	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->eth_phy_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */
@@ -521,6 +523,7 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
 
 	.reset_auxdev_name = "reset",
 	.pinctrl_auxdev_name = "pinctrl",
+	.eth_phy_auxdev_name = "phy",
 
 	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_plls) +
 			   ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),

-- 
2.53.0


