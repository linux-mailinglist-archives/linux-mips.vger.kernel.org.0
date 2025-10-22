Return-Path: <linux-mips+bounces-11857-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84337BFCF04
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 17:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 737EC4E2AEE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 15:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AEF34E74E;
	Wed, 22 Oct 2025 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dRsEDB8N"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520D34321A
	for <linux-mips@vger.kernel.org>; Wed, 22 Oct 2025 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147579; cv=none; b=QhVTZEBHgE7ZVFAGNxHHAdSu/tP0LyIl2Ju+7EauzdWzgeB8Zxsi1fO+Nh+Czlej+H7ejmI6gva3cLX+mMw+qGhY0jx8bQoB2nLsLp6+PEk2eOqgk//IMTbiczosd5GZ7JMSTK0yOKq6PJ+lPMeKxg7vMte+xUavE7Qzz9CrCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147579; c=relaxed/simple;
	bh=rgtM81TJHrWSLfa7vgXN8x+VRWEr3crk3rI32ufCnI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hV+vLKha1MRZLYYQW0oZtS2yIw48CzVzW49hBkdYpfxYIZBbyPFKK4pc4NZI0emhphNIYYOYK8SaZYccINeocSO4NamMoN77sjw1DYERz7/L4rJJRx84D2sAMHvRKADg11Zc9WWK+iY0yr2XobFjZEQ+CqSdRbz1ryTAzMdnKQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dRsEDB8N; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B8494E4127B;
	Wed, 22 Oct 2025 15:39:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43A38606DC;
	Wed, 22 Oct 2025 15:39:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F02FB102F2446;
	Wed, 22 Oct 2025 17:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761147571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rXG4FkA1j+W5VMPKCg2jc3dsIgNY9MiT6EY2h7XkH50=;
	b=dRsEDB8N5JneNQn7hxvFvYDTFZXB94M8drF7Nw3EldISxvI7QUOhni5q7rJ8sLYL+9bS9j
	fOJ4ihmj+2MHrAhbXPZP78MGYclF8pjtLvu+ko5sS3Vq77w9xCmxjoTI/tZTCx4RHV3Ex6
	1AXI4kYPfiT0WhNGCCGFdGftCH7AY4Ma5H4HCpS5u/kReA31cOBCAqVWVKoYD6b352KjhQ
	lvGNBohNxwRbt4UBSQ9SyIp81sFejQaL2wTcaBFMlEc4rZY0g25/JNyE5gFiAWlfpNbN/O
	RzQpjSrGunvinQEMl453OqYRMRJW2uEQLB2VyzT6uylU2QUIqUFnHwjK9CkQtw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 22 Oct 2025 17:39:07 +0200
Subject: [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done
 by parent
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251022-macb-phy-v1-5-f29f28fae721@bootlin.com>
References: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
In-Reply-To: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 2d3998368a1c..8018fa895427 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -410,13 +410,6 @@ static int eqr_of_xlate_twocells(struct reset_controller_dev *rcdev,
 	return eqr_of_xlate_internal(rcdev, reset_spec->args[0], reset_spec->args[1]);
 }
 
-static void eqr_of_node_put(void *_dev)
-{
-	struct device *dev = _dev;
-
-	of_node_put(dev->of_node);
-}
-
 static int eqr_probe(struct auxiliary_device *adev,
 		     const struct auxiliary_device_id *id)
 {
@@ -427,21 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	ret = devm_add_action_or_reset(dev, eqr_of_node_put, dev);
-	if (ret)
-		return ret;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.51.1


