Return-Path: <linux-mips+bounces-12306-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1AC6FFCA
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 17:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 572F35041FA
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6663A9C06;
	Wed, 19 Nov 2025 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QDljzvxt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966E3A9C08;
	Wed, 19 Nov 2025 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567491; cv=none; b=IPWqmzkFmpXlKYaVhUvBmHPS8Umm69DOJPQ77ZTUVUxIL/gSMvkpyf0k0KWcPYSrANMbm6Dg26e9tFtFsoYso5BNHGVfBdOe5OzC5KpaCSAjDqrdpjLG2M8DTBN2vBHFbrTcQTsr4JQL8q8RLnPmtBh7yia4iySbYqh2swa+iIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567491; c=relaxed/simple;
	bh=u7WHbCq+A9ZPz9uty8ilGxI8CD4zGA5iY19dCDG1ULY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfoRZco/YLHDOrlMgQARoTQw3JRavbrx12YInFLzWOOLEODA2X6IDCPpVdmR3uLxepoMtckK7i0uBYQP9k00pbOIwx+fcz3CVyua2KwBdq18aZiXa+Bg3CkVutS+nc4sZ+Dp2t8KyOC/awbrExDYgguRUa5+ibR6RPXEJjHwG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QDljzvxt; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33A79C1118D;
	Wed, 19 Nov 2025 15:51:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F96660699;
	Wed, 19 Nov 2025 15:51:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E398C103719E4;
	Wed, 19 Nov 2025 16:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763567486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n9ugHQUamTXVnl8BX59S+YCRTdmSd34Rjsc+/50EYuQ=;
	b=QDljzvxtISH/CyfK+D2FJjGAx0+WCSkIp+Pi2ufPJzWX17iIABieopqX7GcjUlsSoRXmmn
	T1T33uCQ0qt1KuhyB3OurBXuxhPaLRDr5gOhrZfnsaUdclnosP8PfmFjOOAXPgz7Hlt/eJ
	DVJpIn8zQzd2ag2n0N3sGQlk8r7cyKTKCbbOS7Qxh4NoZ8JCQZcymV28bgg0CsYyX+vfZo
	1x/Pj75KyET6zQ7pgSFK/pwo1BARwzOhugNFbHBJJCtPRG0qOEiT3pYGD4TpKOpNkBmq7H
	dMwxV7Ur1y0HbetHrqrT78B2rDOCq2tKYsuOB++zORHJ7OmwfluLhakRhALydw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 19 Nov 2025 16:51:13 +0100
Subject: [PATCH v3 5/7] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-macb-phy-v3-5-e9a7be186a33@bootlin.com>
References: <20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com>
In-Reply-To: <20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com>
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

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
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
2.51.2


